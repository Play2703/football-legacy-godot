extends Ceremony
const SELECTOR_COLECCION = preload("res://ui/house/selector_coleccion.gd")






















const STICK_R: float = 130.0










const CAM_BACK: float = 9.3
const CAM_UP: float = 9.6
const CAM_LERP: float = 6.0
const CAM_FOV: float = 48.0


const CAM_AHEAD: float = 1.2








const CAM_EDIT_UP: float = 8.4
const CAM_EDIT_BACK: float = 4.2
const CAM_EDIT_AHEAD: float = 0.35
















const CAM_ZOOM_EDIT: float = 1.35




const CAM_ZOOM_EDIT_MAX: float = 2.6



const CASA_PIE_APAISADO_W: float = 900.0










const ZOOM_USER_STEP: float = 0.15



const ZOOM_USER_MIN: float = 0.7
const ZOOM_USER_MAX: float = 1.9


const BTN_ZOOM: float = 76.0





const BTN_EDIT_W: float = 296.0
const BTN_EDIT_H: float = 76.0




const BAG_CARD_H: int = 168




const VENDER_HOLD_S: float = 1.0


const BAG_CARD_W_TUMBADA: float = 580.0


const THUMB_W: float = 168.0
const THUMB_H: float = 132.0






const PAGE_ROWS: int = 3















const PROP_LOOK: Dictionary = {
	"tapete_ovalado": {"col": Color("859697")},
	"tapete_hexagonal": {"col": Color("b9925d")},
	"tapete_organico": {"col": Color("9a9b86")},
	"tapete_pasillo": {"col": Color("69796b")},
	"tapete_redondo": {"col": Color("c9af82")},
	"tapete_tejido": {"col": Color("aa6549")},
	"bocinas_torre": {"col": Color("71563e")},
	"bocinas_estante": {"col": Color("80664b")},
	"librero_abierto": {"col": Color("80664b")},
	"librero_modular": {"col": Color("73513b")},
	"alberca_surf": {"col": Color("ddd7c6")},
	"mesa_holografica": {"col": Color("313840")},
	"espejo_inteligente": {"col": Color("313840")},
	"robot_aspirador": {"col": Color("313840")},
	"cama_penthouse": {"col": Color("45362e")},
	"comedor_penthouse": {"col": Color("45362e")},
	"sofa_penthouse": {"col": Color("d8ccb5")},
	"canasta_basket": {"col": Color("404a55")},
	"reloj_pie": {"col": Color("67462e")},
	"pingpong": {"col": Color("315c82")},



	"pared_reflejos": {"col": Color("1f2328")},
	"memorama": {"col": Color("7a5236")},
	"brazalete_capitan": {"col": Color("7a6046")},
	"posadero_loro": {"col": Color("aa9673")},
	"cochera": {"col": Color("667680")},
	"camilla_fisio": {"col": Color("728f8b")},
	"pizarra_tactica": {"col": Color("546e69")},
	"bici_estatica": {"col": Color("566779")},
	"muro_records": {"col": Color("8a6e4b")},
	"rincon_lectura": {"col": Color("776579")},
	"mesa_recuerdos": {"col": Color("836343")},
	"colchon_estiramientos": {"col": Color("6f8f88")},
	"maquina_respiracion": {"col": Color("6c778c")},
	"vision_board": {"col": Color("8b7b58")},
	"vinoteca_saludable": {"col": Color("70845d")},
	"lampara_sol": {"col": Color("d0a85c")},


	"consultorio_nutri": {"col": Color("8fb3a6")},
	"sofa": {"col": Color("7a4a32")},



	"silla": {"col": Color("8a6a45")},
	"silla_alta": {"col": Color("7d6440")},
	"sillon": {"col": Color("6a5a72")},
	"mesa": {"col": Color("8a6a45")},
	"repisa": {"col": Color("5d4a36")},
	"cama": {"col": Color("6b5a7a")},







	"tocador": {"col": Color("7a6046")},
	"cama_perro": {"col": Color("76918b")},
	"rascador_gato": {"col": Color("aa9673")},
	"lavanderia": {"col": Color("bac5c8")},
	"recibidor": {"col": Color("7a6046")},
	"vestidor": {"col": Color("7a6046")},
	"telescopio": {"col": Color("566b7d")},





	"cabina_podcast": {"col": Color("3b4148")},
	"tina_hielo": {"col": Color("a9b4ba")},
	"banco_botas": {"col": Color("7a6046")},
	"toallero": {"col": Color("6f8fa6")},
	"espejo_cuerpo": {"col": Color("cfd6db")},
	"mesa_centro": {"col": Color("7a6046")},
	"rincon_cafe": {"col": Color("7a6046")},
	"aparador": {"col": Color("7a6046")},
	"gallinero": {"col": Color("a4553f")},






	"despacho": {"col": Color("5c4632")},









	"barbero": {"col": Color("6b2f33")},




	"vitrina": {"top": 0.72, "col": Color("4a5d6b")},




	"balones": {"top": 0.52, "col": Color("6b4f36")},


	"balones_museo": {"top": 0.42, "col": Color("4a3a2c")},






	"playera": {"col": Color("2b2f36")},






	"vitrina_torre": {"top": 0.55, "col": Color("4a5d6b")},
	"vitrina_galeria": {"top": 0.62, "col": Color("4a5d6b")},
	"vitrina_premios": {"top": 0.72, "col": Color("5b5068")},












	"vitrina_isla": {"top": 0.55, "col": Color("4a5d6b")},
	"camisetas": {"col": Color("52443a")},

	"perchero_tienda": {"col": Color("b8c0c8")},



	"urna_playeras": {"col": Color("4a5d6b")},
	"mural_playeras": {"col": Color("52443a")},
	"vitrina_especiales": {"col": Color("2e2620")},
	"banca": {"col": Color("6b5d4a")},
	"alfombra": {"col": Color("8a4a4a")},
	"tele": {"col": Color("3a3630")},
	"cocina": {"col": Color("9a9086")},









	"cocina_isla": {"col": Color("6e6258")},
	"cocina_dieta": {"col": Color("8e9aa2")},
	"librero": {"col": Color("6a4f38")},
	"planta": {"col": Color("4f6b3a")},
	"lampara": {"col": Color("d9c9a8")},

	"momentos": {"col": Color("52443a")},
	"maqueta": {"col": Color("8a6a45")},
	"arcade": {"col": Color("2e3440")},
	"simulador": {"col": Color("252d3b")},
	"piscina": {"col": Color("8fb8c9")},

	"jacuzzi": {"col": Color("7a5a3e")},
	"moto": {"col": Color("30414f")},



	"inodoro": {"col": Color("eceff1")},
	"lavabo": {"col": Color("eceff1")},
	"ducha": {"col": Color("cfe0e6")},
	"tina": {"col": Color("f0f3f4")},




	"sauna": {"col": Color("b08654")},







	"gorras_seleccion": {"col": Color("46525e")},




	"balon_debut": {"top": 0.62, "col": Color("4e535a")},










	"estatua_bronce": {"top": 0.6, "col": Color("6b655c")},


	"poker": {"col": Color("1f5c3a")},


	"piano": {"col": Color("16161c")},



	"billar": {"col": Color("5a3f28")},



	"dardos": {"col": Color("4a3324")},
	"futbolin": {"col": Color("47372b")},
	"escultura": {"col": Color("bcb5a6")},

	"acuario": {"col": Color("39414a")},


	"mesa_jardin": {"col": Color("cdbb98")},
	"fuente": {"col": Color("b7b3a8")},
	"pergola": {"col": Color("8a6a45")},












	"camastro": {"col": Color("d8cbb0")},
	"sombrilla": {"col": Color("c05545")},
	"hamaca": {"col": Color("c9a961")},
	"arbusto": {"col": Color("4a6b38")},
	"arbol": {"col": Color("3f6033")},
	"farol": {"col": Color("e8d8b4")},
	"fogata": {"col": Color("8a7f74")},
	"huerto": {"col": Color("6b4a2f")},
	"columpio": {"col": Color("8a6a44")},
	"porteria": {"col": Color("e8e4dc")},
	"estanque": {"col": Color("6f7d6a")},
	"cocina_ext": {"col": Color("8e9298")},
	"helipuerto": {"col": Color("3c4148")},





	"gimnasio": {"col": Color("3a4048")},
	"pesas": {"col": Color("3a4048")},
	"cinta": {"col": Color("2e3440")},
	"espejo": {"col": Color("cfd6db")},

	"reloj": {"col": Color("c9a961")},

	"ventana": {"col": Color("a8c4d8")},



	"ventanal": {"col": Color("a8c4d8")},
	"ojo_buey": {"col": Color("a8c4d8")},


	"repisa_pared": {"top": 1.41, "col": Color("6a4f38")},







	"cuadro": {"col": Color("9d7f5e")},
	"banderines": {"col": Color("c9a961")},
	"bufandas": {"col": Color("5d4a36")},
	"botines_muro": {"col": Color("5d4a36")},
	"tapiz": {"col": Color("7a4a4a")},
	"panel_madera": {"col": Color("6a4f38")},
	"mapa_giras": {"col": Color("3f5a6b")},
	"tv_muro": {"col": Color("22242a")},









	"escudo_muro": {"col": Color("1c1f26")},
	"banderin_vitrina": {"col": Color("5d4a36")},
	"tifo_enmarcado": {"col": Color("2a2622")},
	"balones_temporada": {"col": Color("6a4f38")},
	"butaca_estadio": {"col": Color("3a3f47")},
	"alfombra_circulo": {"col": Color("2f6b3a")},
	"casillero": {"col": Color("8d9298")},
	"cartel_partido": {"col": Color("26313d")},
	"portada_prensa": {"col": Color("6b5a44")},
	"placa_fichaje": {"col": Color("8a6f3a")},

	"chimenea": {"col": Color("9b958a")},



	"plafon": {"col": Color("efe3c8")},
	"arana": {"col": Color("d9c9a8")},
	"aplique": {"col": Color("e8d8b4")},
	"lampara_mesa": {"col": Color("d9c9a8")},
	"neon": {"col": Color("ff5fa2")},
	"tira_led": {"col": Color("58c8e8")},



	"macetero": {"col": Color("4f6b3a")},
	"pecera_pie": {"col": Color("2f363d")},
	"bar_carrito": {"col": Color("8a8f95")},
	"puf": {"col": Color("7a6a5a")},
	"baul": {"col": Color("6a4f38")},




	"maletas": {"col": Color("77543a")},
	"percha": {"col": Color("6a4f38")},
	"vinoteca": {"col": Color("2b2f34")},
	"tocadiscos": {"col": Color("6a4f38")},
}















const JUGABLES: Dictionary = {
	"espejo_inteligente": "CONSULTAR ESPEJO", "mesa_holografica": "EXPLORAR TÁCTICA",
	"canasta_basket": "JUGAR BASKET",
	"pingpong": "JUGAR PING-PONG",

	"pared_reflejos": "JUGAR REFLEJOS",
	"memorama": "JUGAR MEMORAMA",

	"piano": "TOCAR EL PIANO",
	"brazalete_capitan": "VER BRAZALETES",
	"muro_records": "VER RÉCORDS",
	"mesa_recuerdos": "ABRIR RECUERDOS",
	"arcade": "JUGAR",
	"simulador": "CONDUCIR",
	"poker": "JUGAR PÓQUER",
	"dardos": "TIRAR DARDOS",
	"billar": "JUGAR BILLAR",
	"vestidor": "CAMBIAR DE ROPA",
}







const MINIJUEGO_KINDS: Array[String] = ["arcade", "canasta_basket", "pingpong", "simulador",
	"poker", "dardos", "billar", "espejo_inteligente", "mesa_holografica", "piano",
	"pared_reflejos", "memorama"]


const ICONO_JUGAR: Dictionary = {"piano": "piano", "pared_reflejos": "pared_reflejos",
	"memorama": "memorama"}

const PROP_MAT: Dictionary = {
	"tapete_ovalado": "rug",
	"tapete_hexagonal": "rug",
	"tapete_organico": "rug",
	"tapete_pasillo": "rug",
	"tapete_redondo": "rug",
	"tapete_tejido": "rug",
	"bocinas_torre": "wood",
	"bocinas_estante": "wood",
	"librero_abierto": "wood",
	"librero_modular": "wood",
	"alberca_surf": "sport",
	"mesa_holografica": "metal",
	"espejo_inteligente": "metal",
	"robot_aspirador": "metal",
	"cama_penthouse": "wood",
	"comedor_penthouse": "wood",
	"sofa_penthouse": "fabric",
	"canasta_basket": "metal", "reloj_pie": "wood",
	"pingpong": "sport", "brazalete_capitan": "wood", "posadero_loro": "wood",
	"memorama": "wood",
	"cochera": "metal",
	"camilla_fisio": "fabric", "pizarra_tactica": "metal", "bici_estatica": "metal",
	"muro_records": "wood", "rincon_lectura": "fabric", "mesa_recuerdos": "wood",
	"colchon_estiramientos": "fabric", "maquina_respiracion": "metal",
	"vision_board": "wood", "vinoteca_saludable": "wood", "lampara_sol": "metal",
	"consultorio_nutri": "wood",
	"sofa": "fabric", "mesa": "wood", "repisa": "wood", "cama": "fabric",
	"silla": "wood", "silla_alta": "wood", "sillon": "fabric",
	"vitrina": "wood", "camisetas": "wood", "banca": "wood", "balones": "wood",
	"balones_museo": "wood",
	"playera": "wood",
	"perchero_tienda": "metal",
	"urna_playeras": "wood", "mural_playeras": "wood", "vitrina_especiales": "wood",
	"vitrina_torre": "wood", "vitrina_galeria": "wood", "vitrina_premios": "wood",


	"vitrina_isla": "wood",
	"tele": "metal", "cocina": "metal", "librero": "wood",



	"cocina_dieta": "metal",
	"lampara": "fabric", "alfombra": "rug",
	"momentos": "wood", "maqueta": "wood", "arcade": "metal", "moto": "metal",
	"simulador": "metal",
	"gimnasio": "metal", "pesas": "metal", "cinta": "metal",



	"ventana": "trim", "ventanal": "trim", "ojo_buey": "trim",
	"repisa_pared": "wood",







	"tapiz": "fabric", "panel_madera": "wood",


	"dardos": "wood",
	"bufandas": "wood", "botines_muro": "wood", "tv_muro": "metal",


	"portada_prensa": "wood",
	"puf": "fabric", "baul": "wood", "percha": "wood", "tocadiscos": "wood",




	"maletas": "wood",







	"tocador": "wood",
	"cama_perro": "fabric", "rascador_gato": "wood",
	"lavanderia": "metal", "recibidor": "wood",
	"vestidor": "wood", "telescopio": "metal",
	"banco_botas": "wood", "mesa_centro": "wood", "rincon_cafe": "wood",
	"aparador": "wood", "toallero": "fabric",



	"despacho": "wood",
	"bar_carrito": "metal",
}



func _prop_col(kind: String, fallback: Color) -> Color:
	var fam: String = String(PROP_MAT.get(kind, ""))
	if fam.is_empty() or not _pal.has(fam):
		return fallback
	return _pal[fam]






const TRIM_COL: Color = Color("6f5a44")
const TRIM_H: float = 0.12



const SKY_COL: Color = Color("6d93b8")


const BOOK_COLS: Array[Color] = [
	Color("7b4a3a"), Color("46566b"), Color("6d6242"), Color("5c4560"),
]










const WALL_GHOST: float = 0.16




const EDIT_GHOST: float = 0.55

const BLOCK_MIN_H: float = 0.9
const WALL_FADE: float = 9.0

const TROPHY_H: float = 0.5












const TROPHY_AIR: Dictionary = {







	"champions": 0.031, "europa": 0.019, "conference": 0.031, "clubes": 0.019,
	"copa": 0.019, "liga": 0.2, "ascenso": 0.05, "mundial": 0.031,
	"continental": 0.019,



	"libertadores": 0.031, "sudamericana": 0.031, "concacaf": 0.037,
	"bota_lib": 0.025, "asist_lib": 0.025, "mvp_lib": 0.025,
	"bota_sud": 0.013, "asist_sud": 0.013, "mvp_sud": 0.013,
	"bota_cca": 0.056, "asist_cca": 0.056, "mvp_cca": 0.056,


	"oriente": 0.031, "sol": 0.037,
	"bota_ace": 0.025, "asist_ace": 0.025, "mvp_ace": 0.025,
	"bota_ac2": 0.025, "asist_ac2": 0.025, "mvp_ac2": 0.025,


	"atlas": 0.031, "baobab": 0.037,
	"bota_caf": 0.025, "asist_caf": 0.025, "mvp_caf": 0.025,
	"bota_cf2": 0.025, "asist_cf2": 0.025, "mvp_cf2": 0.025,


	"coral": 0.037,
	"bota_ofc": 0.025, "asist_ofc": 0.025, "mvp_ofc": 0.025,



	"bota": 0.013, "asist": 0.013, "mvp": 0.1,
	"bota_ucl": 0.025, "asist_ucl": 0.025, "mvp_ucl": 0.025,
	"bota_cup": 0.087, "asist_cup": 0.087, "mvp_cup": 0.087,
	"bota_cwc": 0.119, "asist_cwc": 0.119, "mvp_cwc": 0.188,
	"balon_oro": 0.05, "balon_historia": 0.05, "partido": 0.125, "mes": 0.138,
	"poker": 0.081, "club_mejor": 0.013, "club_def": 0.0, "club_med": 0.0,
	"club_del": 0.0,

	"aficion": 0.0,




	"supereuropa": 0.037, "supercopa": 0.037, "copa_liga": 0.037, "campeones": 0.037,
	"recopa": 0.037, "superafrica": 0.044, "finalissima": 0.037, "naciones": 0.037,
	"olimpico": 0.062, "chico_oro": 0.05, "premio_mundo": 0.037, "gol_ano": 0.037,
	"bota_eur": 0.037,

	"ligas": 0.037,
	"bota_wc": 0.044, "asist_wc": 0.044, "mvp_wc": 0.044,
	"bota_cont": 0.019, "asist_cont": 0.019, "mvp_cont": 0.019,
}
const TROPHY_AIR_DEF: float = 0.1




















const TROPHY_TALLEST: float = 0.494
const TROPHY_WIDEST_SEMI: float = 0.25
const WALL_H: float = 2.3












const WALL_T: float = 0.25








const PIEL: float = 0.04
const PIEL_ZOCALO_H: float = 0.36
const PIEL_ZOCALO_SALE: float = 0.03


const FENCE_H: float = 0.9




const DOOR_NEAR: float = 1.15
const DOOR_SWING_SPEED: float = 4.0



const DOOR_LEAF_DEG: float = 92.0
const WALL_COL: Color = Color("8d8578")
const FLOOR_COL: Color = Color("b3a188")






const OUTDOOR_ROOMS: Array[String] = ["patio", "jardin", "alberca", "terraza"]









const OUTDOOR_COL: Color = Color("47603c")



const GRID_Y: float = 0.004




var _pal: Dictionary = {}


var _perimetro: Dictionary = {}



var _jardin: Dictionary = {}


var _cancela: Dictionary = {}

var _jardin_sitios: Dictionary = {}



var _estacion: String = ""
var _jardin_alt: Dictionary = {}
var _columpio: Dictionary = {}
var _llegada: Dictionary = {}
var _paseo: Dictionary = {}
var _guest_ruta: Array = []
var _guest_atasco: float = 0.0
var _level: int = 0
var _pos: Vector2 = Vector2.ZERO



var _grids: Array[MeshInstance3D] = []




var _huellas: Array[MeshInstance3D] = []



var _hud_top: Control = null

var _comeback_btn: Button = null
var _hud_bottom: Control = null
var _grid_btn: Button = null
var _grid_on: bool = false






var _zoom_user: float = 1.0
var _zoom_in_btn: Button = null
var _zoom_out_btn: Button = null
var _cam_zoom: float = 1.0

var _muebles: Node3D = null





const CREST_PX: int = 128
var _crest_vp: SubViewport = null
var _crest_tex_mem: Texture2D = null


var _crest_pool: Dictionary = {}
var _crest_key: String = ""





var _muros: Node3D = null





var _planta: Node3D = null

var _box_parent: Node3D = null




var _puertas: Array = []








var _carry: String = ""
var _carry_face: int = 0
var _carry_pos: Vector2 = Vector2.ZERO
var _carry_ok: bool = false
var _carry_why: String = ""
var _ghost: Node3D = null




var _ghost_sig: String = ""
var _bag_btn: Button = null


var _bag_cat: String = ""


var _bag_box: VBoxContainer = null




var _bag_detalle: VBoxContainer = null








var _vaciar_btn: Button = null



var _planos_btn: Button = null
var _vaciar_antes: Dictionary = {}


var _vaciar_pintura_antes: Dictionary = {}
var _vaciar_hay: bool = false

















const UNDO_MAX: int = 24
var _undo: Array = []



var _undo_grupo: String = ""


const PETS_DEBOUNCE_S: float = 0.1
var _pets_debounce: Timer = null
var _pets_pend: bool = false
var _undo_btn: Button = null
var _move_btn: Button = null
var _spin_btn: Button = null
var _drop_btn: Button = null
var _stash_btn: Button = null
var _cancel_btn: Button = null
var _other_btn: Button = null
var _wall_btn: Button = null
var _wall_do_btn: Button = null
var _door_btn: Button = null



var _slide_btn: Button = null



var _win_btn: Button = null
var _mat_btn: Button = null










var _wall_brocha: String = ""
var _wall_brocha_on: bool = false

var _corner_btn: Button = null





var _wall_on: bool = false







var _brocha_on: bool = false


var _brocha_id: String = ""








var _brocha_celdas: int = 1



var _pintura: Node3D = null
var _brocha_btn: Button









var _use_kind: String = ""

var _juego_prop: Dictionary = {}
var _cocheras: Array = []
var _cubierta_casa: Node3D = null
var _cubierta_casa_sucia := true
var _wall_from: Vector2 = Vector2.INF




var _reach_antes: int = -1

var _wall_a: Vector2 = Vector2.ZERO
var _wall_b: Vector2 = Vector2.ZERO
var _wall_ok: bool = false
var _wall_why: String = ""


var _wall_sig: String = ""



var _wall_flip: bool = false
var _wall_ghost: MeshInstance3D = null



var _layout_dirty: bool = false









var _cursor: Vector2 = Vector2.ZERO
var _cursor_node: Node3D = null

var _cursor_shadow: MeshInstance3D = null

var _cursor_stem: MeshInstance3D = null



var _cursor_t: float = 0.0



const CURSOR_SPEED: float = 1.6
const CURSOR_BOB: float = 0.06
const CURSOR_Y: float = 0.9


var _mode_last: String = ""

var _row_libre: HBoxContainer = null
var _row_carga: HBoxContainer = null

var _pick_i: int = 0
var _aura: MeshInstance3D = null


var _finger: int = -1
var _stick_from: Vector2 = Vector2.ZERO
var _stick: Vector2 = Vector2.ZERO








var _done_btn: Button = null
var _room_lbl: Label
var _prop_lbl: Label





var _prop_card: PanelContainer = null





var _why_card: PanelContainer = null
var _why_lbl: Label = null


var _plan: Array = []








var _pets: Array = []




var _noche: bool = false
var _invierno: bool = false


var _tiempo: Dictionary = {}
const Clima = preload("res://ui/house/calle_clima.gd")

var _jerseys: Array = []

var _walls: Array = []














const MAX_LUCES: int = 6



const LUZ_TICK: float = 0.25



var _luces: Array = []
var _luz_t: float = 0.0

var _shelf_card: PanelContainer
var _shelf_box: VBoxContainer

var _page: int = 0
var _pages: int = 1


var _repage: bool = true










var _keeps_prop: bool = false






var _focus_halo: MeshInstance3D = null
var _shelf_for: String = ""
var _exit_btn: Button

var _calle_btn: Button = null
var _train_btn: Button

var _play_btn: Button

var _jersey_btn: Button

var _jersey_prop: String = ""


var _use_btn: Button
var _use_msg: Label
var _use_now: Dictionary = {}
var _use_msg_left: float = 0.0

var _snake_on: Control = null

var _guest: AnimatedSprite3D = null


var _guest_socio: String = ""











var solo_retratos: bool = false

















var solo_foto: bool = false
static var _foto_mem: Dictionary = {}



var _foto_k: String = ""










const FOTO_MEM_MAX: int = 2


static func _foto_guarda(k: String, tex: Texture2D) -> void:
	_foto_mem[k] = tex
	while _foto_mem.size() > FOTO_MEM_MAX:
		_foto_mem.erase(_foto_mem.keys()[0])








var foto_acabados: Dictionary = {}



func _acabados() -> Dictionary:
	if foto_acabados.is_empty():
		return Career.house_finish
	var d: Dictionary = Career.house_finish.duplicate()
	d.merge(foto_acabados, true)
	return d




func _acabados_tuyos() -> Array:
	if foto_acabados.is_empty():
		return Career.house_finishes
	var a: Array = Career.house_finishes.duplicate()
	a.append_array(foto_acabados.values())
	return a






func _acabados_puestos() -> Dictionary:
	var d: Dictionary = {}
	if not museo:
		var fid: String = HouseScape.fachada_activa(_level, Career.house_extras)
		if fid != "":
			d = HouseScape.acabados_de(fid).duplicate()
	d.merge(_acabados(), true)
	return d




func _acabados_puestos_ids() -> Array:
	var a: Array = _acabados_tuyos().duplicate()
	a.append_array(_acabados_puestos().values())
	return a










func _carga_perimetro(finish: Dictionary, finishes: Array) -> void:
	_perimetro = {}
	_jardin = {}
	if museo:
		return
	var fid: String = HouseScape.fachada_activa(_level, Career.house_extras)
	if fid == "":
		return
	var tuya: Dictionary = House.paleta_tuya(Career.house_extras, CareerTheme.accent(), finish, finishes)
	_perimetro = HouseScape.perimetro_de(fid, _pal, tuya)

	_jardin = HouseScape.jardin_de(fid, _pal, tuya)














var museo: bool = false





var visita: bool = false





var destino_salida: String = "res://ui/career_page.tscn"



const FOTO_YAW: float = 35.0
const FOTO_ELEV: float = 38.0
const FOTO_DIST: float = 1.72
const FOTO_FOV: float = 40.0


func _ready() -> void:


	Telemetry.marca_pantalla(4, self)
	_level = House.clamp_level(Career.house_level)





	_pal = Museo.PALETA.duplicate() if museo \
			else House.palette_for(_level, Career.house_extras, CareerTheme.accent(),
			_acabados_puestos(), _acabados_puestos_ids())
	_carga_perimetro(_acabados(), _acabados_tuyos())
	if solo_retratos:
		set_process(false)
		return
	if solo_foto:
		_foto_ready()
		return
	set_anchors_preset(Control.PRESET_FULL_RECT)
	_build_viewport()
	_build_world()




	_pos = House.plan_spawn(_plano())
















	make_player(KitRecolor.casual_of(GameState.team_custom), "south")
	_add_casual_walk()
	_place_player()


	if museo:
		_build_fans()
	else:
		_build_pets()
	cam = Camera3D.new()
	cam.fov = CAM_FOV
	cam.current = true
	viewport.add_child(cam)


	if not museo and not visita and House.colocar_al_entrar.is_empty() \
			and get_tree().current_scene == self:
		_llegada_empieza()
	_snap_cam()
	_build_hud()

	if visita:
		pass
	elif not museo:
		_maybe_surprise_guest()
		if not House.colocar_al_entrar.is_empty():
			_colocar_al_entrar.call_deferred()
	else:





		if not museo_archivo:
			Career.visita_museo()
			Achievements.ingest_museo()
	CareerUi.normalize_caps(self)


func _process(delta: float) -> void:
	if cam == null or player == null:
		return
	preload("res://ui/house/cochera_props.gd").actualizar(self, delta)
	var dir3: Vector3 = _move_dir()


	var guiado: bool = false
	if not _llegada.is_empty():
		dir3 = _tick_llegada(delta, dir3)
		guiado = true
	elif not _paseo.is_empty():
		dir3 = _tick_paseo(delta, dir3)
		guiado = true
	var step: Vector2 = Vector2.ZERO if guiado else House.step_delta(Vector2(dir3.x, dir3.z), delta)





	if _grid_on:
		if step != Vector2.ZERO:
			_cursor_move(step * CURSOR_SPEED)
		_tick_cursor(delta)
		if player != null:
			player.speed_scale = 1.0
	elif step != Vector2.ZERO:
		var _prev_pos: Vector2 = _pos
		_pos = House.plan_move(_plano(), _pos, step, House.BODY_R, Career.house_extras)
		_place_player()


		if not _grids.is_empty() and _grids[0].visible:
			_grid_focus()


		if not _carry.is_empty():
			_carry_step()
		elif _wall_on:
			_wall_aim()





		if player != null:
			var _moved: float = _pos.distance_to(_prev_pos)
			player.speed_scale = clampf(_moved / maxf(delta * House.WALK_SPEED,
				0.0001), 0.35, 1.25)
	elif player != null:
		player.speed_scale = 1.0
	walk_play(player, dir3)
	_tick_pets(delta)
	_tick_cancela(delta)
	_tick_guest(delta)
	_tick_columpio(delta)
	_tick_chef(delta)


	if museo:
		_tick_fans(delta)


	if _spot_left > 0.0:
		_spot_left -= delta
		if _spot_left <= 0.0:
			_spot_clear()

	if _use_msg_left > 0.0:
		_use_msg_left -= delta
		if _use_msg_left <= 0.0:
			_use_msg.visible = false
	_follow_cam(delta)
	_fade_walls(delta)
	_tick_luces(delta)
	_tick_puertas(delta)
	_refresh_labels()





func _foto_ready() -> void:
	set_process(false)
	set_anchors_preset(Control.PRESET_FULL_RECT)
	clip_contents = true
	mouse_filter = Control.MOUSE_FILTER_IGNORE


	if DisplayServer.get_name() == "headless":
		return
	var k: String = _foto_key()
	_foto_k = k
	if _foto_mem.has(k):
		_foto_show(_foto_mem[k])
		return
	_build_viewport()
	_build_world()
	cam = Camera3D.new()
	cam.fov = FOTO_FOV
	cam.current = true
	viewport.add_child(cam)
	_foto_cam()
	viewport.render_target_update_mode = SubViewport.UPDATE_ONCE
	_foto_grab.call_deferred()






func _foto_key() -> String:
	var lvl: int = House.clamp_level(Career.house_level)
	return "%d|%d|%d|%d|%d|%s|%s|%d" % [lvl, Career.land_tier,
		hash(House.plan_of(lvl)), hash(Career.house_extras),
		hash(_acabados_puestos()), CareerTheme.accent().to_html(),
		_rato_key(Clima.de_casa()), int(House.is_winter(GameState.season_progress()))]



static func _rato_key(t: Dictionary) -> String:
	return "%s/%s" % [t.get("franja", "day"), t.get("clima", "despejado")]





func _foto_cam() -> void:






	var caja: Rect2 = House.plan_bounds(_plano())











	var lado: float = maxf(maxf(caja.size.x * 1.3, caja.size.y),
		House.lado_of(Career.land_tier))
	var dist: float = lado * FOTO_DIST
	var yaw: float = deg_to_rad(FOTO_YAW)
	var elev: float = deg_to_rad(FOTO_ELEV)


	var foco: Vector3 = Vector3(caja.get_center().x, 0.6, caja.get_center().y)
	var pos: Vector3 = foco + Vector3(
		sin(yaw) * cos(elev) * dist,
		sin(elev) * dist,
		cos(yaw) * cos(elev) * dist)
	cam.look_at_from_position(pos, foco, Vector3.UP)





func _foto_grab() -> void:
	await get_tree().process_frame
	await get_tree().process_frame
	await RenderingServer.frame_post_draw
	if not is_instance_valid(viewport):
		return


	var foto: Image = SceneFade.imagen(viewport.get_texture())
	if foto == null:
		return
	var tex: ImageTexture = ImageTexture.create_from_image(foto)


	if foto_acabados.is_empty():
		_foto_guarda(_foto_k, tex)
	_foto_show(tex)
	if is_instance_valid(viewport_box):
		viewport_box.queue_free()
	viewport = null
	viewport_box = null
	cam = null


func _foto_show(tex: Texture2D) -> void:
	var tr: TextureRect = TextureRect.new()
	tr.set_anchors_preset(Control.PRESET_FULL_RECT)
	tr.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	tr.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_COVERED
	tr.texture = tex
	tr.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(tr)




func _build_world() -> void:
	var env: WorldEnvironment = WorldEnvironment.new()
	var e: Environment = Environment.new()
	e.background_mode = Environment.BG_COLOR





	var lit: Dictionary = Museo.LUZ if museo \
			else (House.level_data(_level).get("light", {}) as Dictionary)








	_tiempo = {} if museo else Clima.de_casa()
	preload("res://ui/house/casa_barrio.gd").tiempo = _tiempo
	_noche = String(_tiempo.get("franja", "day")) == "night"

	_invierno = Clima.nevado(_tiempo)
	_estacion = House.estacion(GameState.season_progress())


	if _invierno:
		_estacion = "invierno"
	var bg: Color = lit.get("bg", Color("1d1a16"))
	var amb: Color = lit.get("amb", Color("d8c6a8"))
	var amb_e: float = float(lit.get("amb_e", 0.55))
	if _noche:
		bg = bg.darkened(0.55)
		amb = amb.lerp(Color("8fa0c4"), 0.25)
		amb_e *= 0.55






	e.background_mode = Environment.BG_SKY

	if museo:
		var sky: Sky = Sky.new()
		var sky_mat: ProceduralSkyMaterial = ProceduralSkyMaterial.new()
		sky_mat.sky_top_color = Color("2c4a72")
		sky_mat.sky_horizon_color = Color("a8adae")
		sky_mat.ground_bottom_color = Color("2c3226")
		sky_mat.ground_horizon_color = Color("a8adae")
		sky_mat.energy_multiplier = 0.9
		sky.sky_material = sky_mat
		e.sky = sky
	else:
		e.sky = Clima.cielo(Clima.paleta(_tiempo))
	e.background_color = bg
	e.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	e.ambient_light_color = amb
	e.ambient_light_energy = amb_e
	viewport.add_child(env)
	env.environment = e



	var sun: DirectionalLight3D = DirectionalLight3D.new()
	if _noche:
		sun.rotation_degrees = Vector3(-38.0, -28.0, 0.0)
		sun.light_energy = float(lit.get("sun_e", 0.9)) * 0.3
		sun.light_color = Color("b9c6de")
	else:
		sun.rotation_degrees = Vector3(-52.0, 34.0, 0.0)
		sun.light_energy = float(lit.get("sun_e", 0.9))
		sun.light_color = lit.get("sun", Color("ffe9c9"))
	viewport.add_child(sun)




	_rebuild_planta()


	_build_furniture()













func _rebuild_planta() -> void:
	if _planta != null and is_instance_valid(_planta):
		_purge_walls(_planta)
		_planta.queue_free()




	_grids.clear()
	_huellas.clear()
	_planta = Node3D.new()
	_planta.name = "Planta"
	viewport.add_child(_planta)
	var antes: Node3D = _box_parent











	if not museo:
		_rebuild_entorno()
	_box_parent = _planta
	var i: int = 0
	for room in _cuartos():
		_add_floor(room, float(i) * 0.002)

		if not museo:
			_add_grid(room, float(i) * 0.002)
		i += 1
	_box_parent = antes


	if museo:
		_add_museo_escudos()
	_rebuild_walls()
	var antes2: Node3D = _box_parent
	_box_parent = _planta
	_add_door()
	_add_back_door()
	_box_parent = antes2




















var _pl_mem: Dictionary = {}
var _pl_frame: int = -1


func _plano() -> Dictionary:
	var f: int = Engine.get_process_frames()
	if f != _pl_frame or _pl_mem.is_empty():
		_pl_frame = f




		_pl_mem = _plano_museo() if museo else House.plan_of(_level)
	return _pl_mem







var _museo_pl: Dictionary = {}
var museo_archivo: bool = false


func _plano_museo() -> Dictionary:
	if _museo_pl.is_empty():
		_museo_pl = Museo.planta(Trophies.cabinet(Career.awards),
			Career.keepsakes.size())
	return _museo_pl





func _pl_dirty() -> void:
	_pl_frame = -1
	_pl_mem = {}




func _cuartos() -> Array:
	return _plano()["rooms"] as Array













func _build_furniture() -> void:


	_pl_dirty()
	if _muebles != null and is_instance_valid(_muebles):


		_purge_walls(_muebles)
		_muebles.queue_free()


	_puertas.clear()
	_muebles = Node3D.new()
	_muebles.name = "Muebles"
	viewport.add_child(_muebles)


	_tv_vivas = 0
	var antes: Node3D = _box_parent
	_box_parent = _muebles





	_plan = House.plan_display(_plano(), Trophies.cabinet(Career.awards),
		Career.trophy_pins, Career.vitrina_picks)







	for prop in (_plano()["props"] as Array):
		_add_prop(prop)
	_add_trophies()
	_add_jerseys()



	_add_tabiques()
	_box_parent = antes
	preload("res://ui/house/robot_casa.gd").activar_casa(self)
	_pet_homes = PetHomeLib.destinos(self)




	if not museo and not visita:
		_sync_chef()
		_sync_staff()





	if not museo:
		_rebuild_pintura()
	_grid_rebake()









func _add_trophies() -> void:
	var props: Dictionary = {}
	for prop in (_plano()["props"] as Array):
		props[String(prop["id"])] = prop
	for p in _plan:
		var pos: Vector2 = p["pos"]
		var prop: Dictionary = props.get(String(p["prop_id"]), {})
		var trophy_h: float = float(p.get("trophy_h", TROPHY_H))



		var air: float = float(TROPHY_AIR.get(String(p["type"]), TROPHY_AIR_DEF))
		var apoyo: float = trophy_support_y(prop, int(p.get("tier", 0)))










		make_trophy(String(p["type"]),
			Vector3(pos.x, apoyo + trophy_h *(0.5 - air), pos.y),
			trophy_h, 160, _muebles, true, 0.0, _trophy_logo(p), _trophy_pais(p))





		if museo:
			_add_trophy_crest(p, Vector3(pos.x, apoyo, pos.y), prop)




static func trophy_support_y(prop: Dictionary, tier: int) -> float:
	var kind: String = String(prop.get("kind", ""))
	var top: float = float(PROP_LOOK.get(kind, {}).get("top", House.prop_alto(kind)))
	return top + float(tier) * House.TIER_H \
			+(0.03 if bool(prop.get("exhibicion_museo", false)) and tier == 0 else 0.0)











func _trophy_logo(p: Dictionary) -> String:
	if String(p.get("type", "")) != "liga":
		return ""
	var pais: String = _trophy_pais(p)
	return "" if pais.is_empty() else Competitions.league_logo(pais)





func _trophy_pais(p: Dictionary) -> String:
	var club_id: String = _trophy_club(p, true)
	return "" if club_id.is_empty() else Teams.country_of(club_id)








func _trophy_club(p: Dictionary, ultimo: bool = false) -> String:
	var prov: Array = Trophies.provenance(String(p.get("name", "")),
		Career.season_history, Career.current_season_awards(),
		GameState.player_team_id, GameState.season_num, GameState.player_div())
	if prov.is_empty():
		return ""
	var i: int = prov.size() - 1
	if not ultimo:




		var visibles: int = mini(prov.size(), int(p.get("count", 1)))
		var copia: int = clampi(int(p.get("copia", 0)), 0, maxi(visibles - 1, 0))
		i = clampi(prov.size() - visibles + copia, 0, prov.size() - 1)
	return String((prov[i] as Dictionary).get("club", ""))







func _add_trophy_crest(p: Dictionary, base: Vector3, prop: Dictionary) -> void:
	var club: String = _trophy_club(p)
	if club.is_empty():
		return
	var tex: Texture2D = _crest_tex_de(club)
	if tex == null:
		return
	var chapa: Sprite3D = Sprite3D.new()
	chapa.texture = tex
	chapa.pixel_size = TROPHY_CREST / float(CREST_PX)
	chapa.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	chapa.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	chapa.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD


	chapa.position = trophy_crest_at(base, prop)
	_muebles.add_child(chapa)



static func trophy_crest_at(base: Vector3, prop: Dictionary) -> Vector3:
	var face: int = int(prop.get("face", House.base_face(prop)))&3
	var dir: Vector2 = House.FACE_DIR[face]
	var r: Rect2 = prop["rect"]
	var fondo: float = r.size.y if House.face_axis(face) == 0 else r.size.x
	var frente: Vector2 = Vector2(base.x, base.z) + dir *(fondo * 0.5 + 0.015)
	return Vector3(frente.x, base.y - 0.22, frente.y)




static func trophy_mullion_offsets(span: float, copias: int) -> Array[float]:
	var out: Array[float] = []
	if copias < 2:
		return out
	var inicio: float =(span - House.MUSEO_COPY_GAP * float(copias - 1)) * 0.5
	var bays: int = maxi(1, int(round(span / 1.4)))
	for b in range(1, bays):
		var objetivo: float = span * float(b) / float(bays)
		var mejor: float = -1.0
		var distancia: float = INF
		for i in copias - 1:
			var hueco: float = inicio + House.MUSEO_COPY_GAP *(float(i) + 0.5)
			if not out.has(hueco) and absf(hueco - objetivo) < distancia:
				mejor = hueco
				distancia = absf(hueco - objetivo)
		if mejor >= 0.0:
			out.append(mejor)
	return out



const TROPHY_CREST: float = 0.14















var _entorno: Node3D = null
var _entorno_sig: String = ""


func _rebuild_entorno() -> void:
	var sig: String = "%s|%d|%s|%s|%d|%s" % [House.plan_bounds(_plano()), _level,
		_noche, _invierno, hash(_jardin), _rato_key(_tiempo)]
	if sig == _entorno_sig and _entorno != null and is_instance_valid(_entorno):
		return
	_entorno_sig = sig
	if _entorno != null and is_instance_valid(_entorno):
		_purge_walls(_entorno)
		_entorno.queue_free()
	_entorno = Node3D.new()
	_entorno.name = "Entorno"
	viewport.add_child(_entorno)
	var antes: Node3D = _box_parent
	_box_parent = _entorno
	_add_surroundings()
	_box_parent = antes





const ORLA_PAD: float = 1.2

const CAE_MARGEN: float = 12.0





func _orla_z0() -> float:
	return preload("res://features/career/cochera.gd").limites_solar(_plano()).position.y - ORLA_PAD - 1.5


func _add_surroundings() -> void:





	var b: Rect2 = preload("res://features/career/cochera.gd").limites_solar(_plano())
	var entradas: Array[Rect2] = []
	for cuarto in _cuartos():
		if cuarto.get("acceso_calle", false):
			entradas.append(cuarto["rect"])
	var pad: float = ORLA_PAD
	var dim: float = 0.34 if _noche else 0.0
	_cancela = {}
	_jardin_sitios = {}
	var grass: Color = Color("aeb6bd") if _invierno else OUTDOOR_COL
	grass = grass.darkened(dim)



















	var barrio = preload("res://ui/house/casa_barrio.gd")
	var fuera: Color = barrio.terreno(_invierno, _level, dim, grass)
	_grano_suelo(_add_box(Vector3(b.get_center().x, -0.22, b.get_center().y - 10.0),
		Vector3(b.size.x + 280.0, 0.16, b.size.y + 280.0), fuera, 2),
		fuera, House.floor_grano(House.PISO_PASTO))









	var orla: Array = _suelo_orla()
	_grano_suelo(_add_box(Vector3(b.get_center().x, -0.1, b.get_center().y),
		Vector3(b.size.x + pad * 2.0 + 3.0, 0.1, b.size.y + pad * 2.0 + 3.0),
		orla[0], 2), orla[0], orla[1])




	var cer: Dictionary = _jardin.get("cerca", {"tipo": "seto", "col": Color("2f5b33")})



	if String(cer.get("tipo", "seto")) == "seto":
		var hoja: Color = Color("dfe4e8") if _invierno else cer.get("col", Color("2f5b33"))
		cer = cer.duplicate()
		cer["calle"] = barrio.a_la_calle(hoja, _level, dim, hoja.darkened(dim))











	var retiro: float = 2.5
	var x0: float = snappedf(b.position.x - retiro, House.CELDA)
	var x1: float = snappedf(b.end.x + retiro, House.CELDA)
	var z0: float = snappedf(b.position.y - retiro, House.CELDA)
	var z1: float = snappedf(b.end.y + retiro, House.CELDA)
	var step: float = House.CELDA * 3.0
	var x: float = x0


	var hueco: Array[float] = []
	var hueco_libre: bool = true
	while x <= x1:

		var ante_porton: bool = false
		for entrada in entradas:
			if x + step * 0.46 > entrada.position.x - 0.15 and x - step * 0.46 < entrada.end.x + 0.15:
				ante_porton = true
		if absf(x) > 1.6 and not ante_porton:
			_add_cerca(cer, Vector3(x, 0.0, z0), step * 0.92, true, dim)
		elif absf(x) <= 1.6:
			hueco.append(x)
			hueco_libre = hueco_libre and not ante_porton
		_add_cerca(cer, Vector3(x, 0.0, z1), step * 0.92, true, dim)
		x += step
	var z: float = z0 + step
	while z <= z1 - step:
		_add_cerca(cer, Vector3(x0, 0.0, z), step * 0.92, false, dim)
		_add_cerca(cer, Vector3(x1, 0.0, z), step * 0.92, false, dim)
		z += step
	if not _jardin.is_empty():
		_add_jardin(x0, x1, z0, z1, step, dim)
		if hueco_libre and not hueco.is_empty():
			_add_cancela(cer, hueco.min() - step * 0.5, hueco.max() + step * 0.5, z0, dim)





	barrio.monta_casa(_entorno, b, x0, x1, z0, z1, entradas, dim, visita, _invierno, _level,
		_orla_z0())



	Clima.cae_fuera(_entorno, Clima.paleta(_tiempo), Settings.calidad_baja,
		Rect2(x0, z0, x1 - x0, z1 - z0).grow(CAE_MARGEN), House.plan_bounds(_plano()).grow(0.3))





func _toggle_brocha() -> void:
	_brocha_on = not _brocha_on
	if _brocha_on:


		if not _carry.is_empty():
			_cancel_carry()
		_wall_on = false
		_paleta_suelo()
	_refresh_mode()













func _cerrar_tumbado(col: VBoxContainer) -> void:
	if not UiKit.es_horizontal():
		return
	var cerrar: Button = _bag_selector(I18n.t("CERRAR"), false,
		func() -> void: CareerUi.close_modal(col))
	cerrar.custom_minimum_size.y = 88
	cerrar.set_meta("atras", true)
	col.add_child(cerrar)










func _cerrar_playeras(col: VBoxContainer) -> void:
	if UiKit.es_horizontal():
		_cerrar_tumbado(col)
		return
	var cerrar: Button = Button.new()
	cerrar.custom_minimum_size = Vector2(0, CareerTheme.BTN_SECONDARY_H)
	cerrar.text = I18n.t("CERRAR")
	CareerTheme.apply_button(cerrar, CareerTheme.Kind.GHOST, 24)
	cerrar.pressed.connect(func() -> void: CareerUi.close_modal(cerrar))
	col.add_child(cerrar)







func _atras_tumbado(b: BaseButton) -> void:
	if UiKit.es_horizontal():
		b.set_meta("atras", true)






func _paleta_suelo() -> void:
	if CareerUi.modal_open(self):
		return
	var col: VBoxContainer = CareerUi.modal(self)
	if col == null:
		return
	CareerUi.head(col, I18n.t("PINTAR SUELO"))
	var rejilla: HFlowContainer = HFlowContainer.new()
	rejilla.add_theme_constant_override("h_separation", 8)
	rejilla.add_theme_constant_override("v_separation", 8)
	col.add_child(rejilla)
	for a in House.PISOS:
		var id: String = String(a["id"])
		var mio: bool = House.acabado_owned(id, Career.house_finishes)
		var precio: int = int(a.get("price", 0))
		var b: Button = Button.new()
		b.custom_minimum_size = Vector2(0, 92)
		b.text = I18n.t(String(a["name"])) if mio \
				else "%s · %s" % [I18n.t(String(a["name"])),
				CareerUi.money(precio)]


		CareerTheme.apply_button_accent(b, a["color"] as Color, 18)
		b.disabled = not mio and not Career.can_afford(precio)
		b.pressed.connect(func() -> void:
			if not mio:
				if not Career.buy_finish(id):
					return

				_undo.clear()
			_brocha_id = id
			CareerUi.close_top_modal(self)
			_refresh_mode())
		rejilla.add_child(b)















	CareerUi.line(col, I18n.t("Ancho de la brocha, en casillas."))
	var anchos: HBoxContainer = HBoxContainer.new()
	anchos.add_theme_constant_override("separation", 8)
	col.add_child(anchos)
	for n in [1, 3, 5]:
		var ab: Button = Button.new()
		ab.custom_minimum_size = Vector2(0, 84)
		ab.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		ab.text = "%d x %d" % [n, n]
		if int(n) == _brocha_celdas:
			CareerTheme.apply_button(ab, CareerTheme.Kind.PRIMARY, 20)
		else:
			CareerTheme.apply_button(ab, CareerTheme.Kind.NEUTRAL, 20)
		var cuantas: int = int(n)
		ab.pressed.connect(func() -> void:
			_brocha_celdas = cuantas


			CareerUi.close_top_modal(self)
			_paleta_suelo())
		anchos.add_child(ab)



	if not _brocha_id.is_empty():
		CareerUi.line(col, I18n.t("Se pinta el cuarto donde tengas la mano."))
		var cuarto: Button = Button.new()
		cuarto.custom_minimum_size = Vector2(0, 96)
		cuarto.text = I18n.t("PINTAR ESTE CUARTO")
		CareerTheme.apply_button(cuarto, CareerTheme.Kind.PRIMARY, 22)
		cuarto.pressed.connect(func() -> void:
			CareerUi.close_top_modal(self)
			_brocha_cuarto()
			_refresh_mode())
		col.add_child(cuarto)

	var quitar: Button = CareerUi.accion("escoba", I18n.t("QUITAR PISO"), CareerTheme.DANGER)
	quitar.custom_minimum_size = Vector2(0, 88)
	quitar.pressed.connect(func() -> void:
		_brocha_id = House.PISO_PASTO
		CareerUi.close_top_modal(self)
		_refresh_mode())
	col.add_child(quitar)
	_cerrar_tumbado(col)





func _brocha_pinta(p: Vector2) -> void:
	var base: String = String(_acabados_puestos().get("floor",
		House.ACABADO_BASE["floor"]))



	var capa: Dictionary = Career.floor_paint_of()



	if _brocha_celdas <= 1:
		if House.floor_finish_at(p, capa, base) == \
				(_brocha_id if not _brocha_id.is_empty() else base):
			return
		_pinta_capa(House.floor_paint(capa, p, _brocha_id, base), capa)
		return



	var esq: Vector2 = Vector2(floorf(p.x / House.CELDA),
		floorf(p.y / House.CELDA)) * House.CELDA
	var radio: float = float(_brocha_celdas / 2) * House.CELDA
	var lado: float = float(_brocha_celdas) * House.CELDA
	_pinta_capa(House.floor_paint_rect(capa,
		Rect2(esq - Vector2(radio, radio), Vector2(lado, lado)),
		_brocha_id, base), capa)







func _brocha_cuarto() -> void:
	var base: String = String(_acabados_puestos().get("floor",
		House.ACABADO_BASE["floor"]))
	var capa: Dictionary = Career.floor_paint_of()
	for room in _cuartos():
		var r: Rect2 =(room as Dictionary)["rect"]
		if not r.has_point(_cursor):
			continue
		_pinta_capa(House.floor_paint_rect(capa, r, _brocha_id, base), capa)
		return
	UiAudio.deny()






func _pinta_capa(nueva: Dictionary, antes: Dictionary) -> void:
	if nueva.hash() == antes.hash():
		return
	_undo_push("brocha")
	Career.set_floor_paint(nueva)






	_layout_dirty = true
	_rebuild_pintura()





func _rebuild_pintura() -> void:
	_cubierta_casa_sucia = true
	if _pintura != null and is_instance_valid(_pintura):
		_purge_walls(_pintura)
		_pintura.queue_free()
	_pintura = Node3D.new()
	_pintura.name = "Pintura"
	viewport.add_child(_pintura)
	var antes: Node3D = _box_parent
	_box_parent = _pintura
	var base: String = String(_acabados_puestos().get("floor",
		House.ACABADO_BASE["floor"]))


	for m in House.floor_patches(House.plan_bounds(_plano()),
			Career.floor_paint_of(), base):
		var r: Rect2 = m["rect"]
		var ac: Dictionary = House.acabado_by_id(String(m["id"]))
		var col: Color = ac.get("color", _pal.get("floor", FLOOR_COL))



		if String(m["id"]) == House.PISO_PASTO:
			col = _pasto_dentro()





		_grano_suelo(_add_box(Vector3(r.get_center().x, 0.004, r.get_center().y),
			Vector3(r.size.x, 0.008, r.size.y), col),
			col, House.floor_grano(String(m["id"])))
	_box_parent = antes

















func _grano_suelo(m: MeshInstance3D, col: Color, tipo: int) -> void:
	var sm: ShaderMaterial = ShaderMaterial.new()
	sm.shader = load("res://ui/house/house_floor.gdshader")
	sm.set_shader_parameter("base", col)
	sm.set_shader_parameter("tipo", tipo)
	m.material_override = sm







func _grano_muro(m: MeshInstance3D, col: Color, tipo: int) -> void:
	var sm: ShaderMaterial = ShaderMaterial.new()
	sm.shader = load("res://ui/house/house_wall.gdshader")
	sm.set_shader_parameter("base", col)
	sm.set_shader_parameter("tipo", tipo)
	m.material_override = sm



func _grano_muro_casa() -> int:
	return House.wall_grano(String(_acabados_puestos().get("wall",
		House.ACABADO_BASE["wall"])))



func _grano_muro_de(t: Array) -> int:
	var id: String = House.wall_finish(t)
	return _grano_muro_casa() if id.is_empty() else House.wall_grano(id)


func _grano_actual() -> int:





	if museo:
		return House.floor_grano("piso_marmol")
	return House.floor_grano(String(_acabados_puestos().get("floor",
		House.ACABADO_BASE["floor"])))





func _orla_es_jardin() -> bool:
	return not _jardin.is_empty() and not _invierno








func _suelo_orla() -> Array:
	var dim: float = 0.34 if _noche else 0.0
	if _orla_es_jardin():
		return [(_jardin["suelo"] as Color).darkened(dim),
			House.floor_grano(String(_jardin.get("grano", House.PISO_PASTO)))]
	var grass: Color =(Color("aeb6bd") if _invierno else OUTDOOR_COL).darkened(dim)
	return [preload("res://ui/house/casa_barrio.gd").terreno(_invierno, _level, dim, grass),
		House.floor_grano(House.PISO_PASTO)]






func _pasto_dentro() -> Color:
	if museo or _orla_es_jardin():
		return Color("aeb6bd") if _invierno else OUTDOOR_COL
	return _suelo_orla()[0]


func _add_floor(room: Dictionary, sink: float = 0.0) -> void:
	var r: Rect2 = room["rect"]
	if room.get("pavimento_cochera", false):







		var calle: Callable = Callable()
		var corte: float = - INF
		if room.get("acceso_calle", false) and not museo:
			var barrio = preload("res://ui/house/casa_barrio.gd")
			var nivel: int = _level
			var dim: float = 0.34 if _noche else 0.0
			calle = func(c: Color) -> Color: return barrio.a_la_calle(c, nivel, dim, c)
			corte = _orla_z0() if _orla_es_jardin() else r.end.y
		preload("res://ui/house/cochera_props.gd").pavimento(self, r, room.get("paso_cochera", false),
			calle, corte)
		return



	var fuera: bool = String(room["id"]) in OUTDOOR_ROOMS
	var col: Color = _pasto_dentro() if fuera else _pal.get("floor", FLOOR_COL)
	var grano: int = House.floor_grano(House.PISO_PASTO) if fuera else _grano_actual()


	if fuera and room.get("anexo_cochera", false) and not museo:
		var orla: Array = _suelo_orla()
		col = orla[0]
		grano = orla[1]
	var losa: MeshInstance3D = _add_box(
		Vector3(r.get_center().x, -0.05 - sink, r.get_center().y),
		Vector3(r.size.x, 0.1, r.size.y), col)
	_grano_suelo(losa, col, grano)














func _add_grid(room: Dictionary, sink: float = 0.0) -> void:
	var r: Rect2 = room["rect"]
	var q: MeshInstance3D = MeshInstance3D.new()
	var qm: QuadMesh = QuadMesh.new()
	qm.size = r.size
	q.mesh = qm
	var mat: ShaderMaterial = ShaderMaterial.new()
	mat.shader = load("res://ui/house/house_grid.gdshader")
	mat.set_shader_parameter("celda", House.CELDA)











	mat.set_shader_parameter("color_raya", CareerTheme.GOOD)









	mat.set_shader_parameter("alfa", 0.72)
	mat.set_shader_parameter("lejos_a", 16.0)
	mat.set_shader_parameter("lejos_b", 24.0)



	var mapa: ImageTexture = _grid_mask(r)
	mat.set_shader_parameter("origen", r.position)
	mat.set_shader_parameter("tam", r.size)
	mat.set_shader_parameter("mapa", mapa)
	q.material_override = mat









	q.position = Vector3(r.get_center().x, GRID_Y - sink, r.get_center().y)
	q.rotation_degrees = Vector3(-90.0, 0.0, 0.0)
	q.visible = false
	_grids.append(q)
	(_planta if _planta != null else viewport).add_child(q)






	var hq: MeshInstance3D = MeshInstance3D.new()
	var hqm: QuadMesh = QuadMesh.new()
	hqm.size = r.size
	hq.mesh = hqm
	var hmat: ShaderMaterial = ShaderMaterial.new()
	hmat.shader = load("res://ui/house/house_huella.gdshader")
	hmat.set_shader_parameter("celda", House.CELDA)



	hmat.set_shader_parameter("color", CareerTheme.DANGER)



	hmat.set_shader_parameter("lejos_a", 18.0)
	hmat.set_shader_parameter("lejos_b", 26.0)
	hmat.set_shader_parameter("origen", r.position)
	hmat.set_shader_parameter("tam", r.size)
	hmat.set_shader_parameter("mapa", mapa)
	hq.material_override = hmat
	hq.position = Vector3(r.get_center().x, GRID_Y - sink + 0.001, r.get_center().y)
	hq.rotation_degrees = Vector3(-90.0, 0.0, 0.0)
	hq.visible = false
	hq.set_meta("rect", r)
	_huellas.append(hq)
	(_planta if _planta != null else viewport).add_child(hq)






func _grid_rebake() -> void:
	var i: int = 0
	for room in _cuartos():
		if i >= _grids.size() or i >= _huellas.size():
			break
		var mapa: ImageTexture = _grid_mask(room["rect"])
		(_grids[i].material_override as ShaderMaterial).set_shader_parameter("mapa", mapa)
		(_huellas[i].material_override as ShaderMaterial).set_shader_parameter("mapa", mapa)
		i += 1


















func _grid_mask(r: Rect2) -> ImageTexture:
	var w: int = maxi(1, int(round(r.size.x / House.CELDA)))
	var h: int = maxi(1, int(round(r.size.y / House.CELDA)))
	var img: Image = Image.create(w, h, false, Image.FORMAT_R8)
	img.fill(Color(0, 0, 0))
	for prop in (_plano()["props"] as Array):
		if not _prop_visible(prop):
			continue
		var pr: Rect2 = prop["rect"]
		var blando: bool = House.SOFT_KINDS.has(String(prop.get("kind", "")))
		var v: float = 0.5 if blando else 1.0







		var lo_x: int = maxi(0, ceili((pr.position.x - r.position.x) / House.CELDA - 0.5))
		var hi_x: int = mini(w, ceili((pr.end.x - r.position.x) / House.CELDA - 0.5))
		var lo_z: int = maxi(0, ceili((pr.position.y - r.position.y) / House.CELDA - 0.5))
		var hi_z: int = mini(h, ceili((pr.end.y - r.position.y) / House.CELDA - 0.5))
		for ix in range(lo_x, hi_x):
			for iz in range(lo_z, hi_z):
				var c: Vector2 = r.position + Vector2(
					(float(ix) + 0.5) * House.CELDA,(float(iz) + 0.5) * House.CELDA)
				if not pr.has_point(c):
					continue


				if img.get_pixel(ix, iz).r < v:
					img.set_pixel(ix, iz, Color(v, v, v))
	return ImageTexture.create_from_image(img)









func _prop_visible(prop: Dictionary) -> bool:



	if bool(prop.get("guardado", false)):
		return false
	var req: String = String(prop.get("req", ""))
	if not req.is_empty() and not Career.house_extras.has(req):
		return false
	var life: String = String(prop.get("req_life", ""))
	if not life.is_empty() and not Career.lifestyle.has(life):
		return false
	return true
























func _edit_btn_look() -> void:
	CareerTheme.apply_button_accent(_grid_btn,
		CareerTheme.GOOD.darkened(0.32) if _grid_on else CareerTheme.GOOD, 20)





func _prop_set(txt: String) -> void:
	_prop_lbl.text = txt
	_prop_card.visible = not txt.is_empty()












func _why_set(txt: String) -> void:
	_why_lbl.text = "" if txt.is_empty() else I18n.t(txt)
	_why_card.visible = not txt.is_empty()




func _mode_btn(txt: String, kind: CareerTheme.Kind, cb: Callable,
		alto: int = 104) -> Button:
	var b: Button = Button.new()
	b.custom_minimum_size = Vector2(0, alto)
	b.text = I18n.t(txt)
	b.clip_text = true
	CareerTheme.apply_button(b, kind, 26 if alto > 90 else 20)
	b.visible = false
	b.pressed.connect(cb)
	return b













func _icon_btn(icono: String, kind: CareerTheme.Kind, cb: Callable,
		etiqueta: String = "") -> Button:
	var b: Button = Button.new()
	b.custom_minimum_size = Vector2(0, 84)


	_tool_style(b, kind)
	b.visible = false
	b.pressed.connect(cb)
	var ic: MenuIcon = MenuIcon.new()
	ic.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	ic.offset_left = 18.0
	ic.offset_right = -18.0
	ic.offset_top = 10.0


	ic.offset_bottom = -32.0
	ic.mouse_filter = Control.MOUSE_FILTER_IGNORE
	ic.setup(icono, _glyph_tint(kind))
	ic.name = "glifo"
	b.add_child(ic)












	var rot: Label = CareerUi.plain(CareerTheme.T_CAPTION, _rot_ink(kind))
	rot.name = "rotulo"
	rot.set_anchors_and_offsets_preset(Control.PRESET_BOTTOM_WIDE)
	rot.offset_left = 4.0
	rot.offset_right = -4.0
	rot.offset_top = -30.0
	rot.offset_bottom = -6.0
	rot.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	rot.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	rot.clip_text = true
	rot.mouse_filter = Control.MOUSE_FILTER_IGNORE
	b.add_child(rot)
	_icon_cap(b, etiqueta)
	return b












const ROTULO_CORTO: Dictionary = {
	"INVENTARIO": "CAJA", "OTRO": "OTRO", "PAREDES": "PARED", "MUEBLES": "MUEBLE",
	"GIRAR": "GIRAR", "GUARDAR": "GUARDA", "CANCELAR": "ANULAR",
	"MOVER ESTO": "MOVER", "PONER AQUI": "AQUI",
	"LEVANTAR PARED": "ALZAR", "INICIAR PARED": "TRAZAR",
	"TIRAR ESTA PARED": "TIRAR", "FIN DE PARED": "FIN",
	"CANCELAR TRAZO": "ANULAR", "PONER PUERTA": "PUERTA",
	"QUITAR PUERTA": "CERRAR", "DEJARIA SIN PASO": "TAPONA",

	"MATERIAL": "PINTAR", "AQUI GIRA": "GIRO",
	"PINTAR SUELO": "SUELO", "DEJAR DE PINTAR": "BASTA",
	"VACIAR": "VACIAR",
	"PONER VENTANA": "VENTAN", "QUITAR VENTANA": "TAPIAR",


	"PUERTA DOBLE": "DOBLE", "PONER ARCO": "ARCADA",
	"PONER VENTANAL": "VENTNL", "PONER OJO DE BUEY": "OJO",




	"PONER CORREDIZA": "CORRED", "QUITAR CORREDIZA": "QUITAR",
	"PARED CORTA": "CORTA",
	"HAY UNA PARED AHI": "CRUCE",




	"TIRAR TODO EL TRAMO": "TRAMO", "REHACER ESTA PARED": "TAPAR",



	"DESHACER": "DESHAZ",
}






func _icon_cap(b: Button, etiqueta: String) -> void:
	if b == null or not is_instance_valid(b):
		return
	b.tooltip_text = I18n.t(etiqueta) if not etiqueta.is_empty() else ""
	var rot: Label = b.get_node_or_null("rotulo") as Label
	if rot != null:












		rot.text = I18n.t(String(ROTULO_CORTO.get(etiqueta, etiqueta)), "rot") \
				if not etiqueta.is_empty() else ""





const CAP_TIPO: Dictionary = {
	"puerta": "PONER PUERTA", "doble": "PUERTA DOBLE", "arco": "PONER ARCO",
	"ventana": "PONER VENTANA", "ventanal": "PONER VENTANAL",
	"ojo_buey": "PONER OJO DE BUEY",
}





func _cap_ciclo(ciclo: Array, actual: String, quitar: String) -> String:
	var sig: String = House.next_kind(ciclo, actual)
	return quitar if sig.is_empty() else String(CAP_TIPO.get(sig, quitar))





























func _glyph_tint(kind: CareerTheme.Kind) -> Color:
	match kind:
		CareerTheme.Kind.PRIMARY:
			return CareerTheme.on_accent()
		CareerTheme.Kind.WARN:
			return CareerTheme.DANGER
		_:
			return CareerTheme.TEXT
















static func _rot_ink(kind: CareerTheme.Kind) -> Color:
	return CareerTheme.on_accent() if kind == CareerTheme.Kind.PRIMARY \
			else CareerTheme.TEXT








func _tool_style(b: Button, kind: CareerTheme.Kind) -> void:
	if kind == CareerTheme.Kind.PRIMARY:
		CareerTheme.apply_button(b, kind, 20)
		return
	CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, 20)
	CareerTheme.apply_button_tinted(b, CareerTheme.NAV_CASA, 20, CareerTheme.PELDANO_TINTE)


func _icon_btn_look(b: Button, kind: CareerTheme.Kind, icono: String = "") -> void:
	_tool_style(b, kind)



	var rot: Label = b.get_node_or_null("rotulo") as Label
	if rot != null:
		rot.add_theme_color_override("font_color", _rot_ink(kind))
	var ic: MenuIcon = b.get_node_or_null("glifo") as MenuIcon
	if ic == null:
		return
	if not icono.is_empty():
		ic.set_type(icono)
	ic.color = _glyph_tint(kind)





















func _open_bag() -> void:
	if CareerUi.modal_open(self):
		return



	if _bag_cat.is_empty() or _bag_items(_bag_cat).is_empty():
		_bag_cat = ""
		for cat in House.CATEGORIA_ORDEN:
			if not _bag_items(String(cat)).is_empty():
				_bag_cat = String(cat)
				break

	_bag_box = CareerUi.modal_pantalla(self) if UiKit.es_horizontal() else CareerUi.modal(self)
	if _bag_box == null:
		return
	_bag_fill()





func _bag_fill() -> void:
	var col: VBoxContainer = _bag_box
	if col == null or not is_instance_valid(col):
		return

	thumbs_batch()
	for c in col.get_children():
		c.queue_free()
		col.remove_child(c)
	var head: HBoxContainer = HBoxContainer.new()
	head.add_theme_constant_override("separation", 12)
	col.add_child(head)
	var title: Label = CareerUi.plain(28, CareerTheme.TEXT)
	title.text = I18n.t("TUS COSAS")
	head.add_child(title)





	var en_cajas: int = 0









	var valen: int = 0
	for prop in (_plano()["props"] as Array):
		if _en_inventario(prop) and bool(prop.get("guardado", false)):
			en_cajas += 1
			valen += Career.house_sell_value(String(prop.get("id", "")))
	if en_cajas > 0:
		var cnt: Label = CareerUi.plain(18, CareerTheme.MONEY)
		cnt.text = I18n.tf("{0} EN CAJAS", [str(en_cajas)]) if valen <= 0 \
				else I18n.tf("{0} EN CAJAS · VALEN {1}",
				[str(en_cajas), CareerUi.money(valen)])
		cnt.clip_text = true




		cnt.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		cnt.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
		head.add_child(cnt)







	var cats: Array = []
	var rotulos: Array = []
	for cat in House.CATEGORIA_ORDEN:
		var items: Array = _bag_items(String(cat))
		if items.is_empty():
			continue
		cats.append(String(cat))
		rotulos.append("%s %d" % [I18n.t(String(cat)), items.size()])
	if UiKit.es_horizontal():
		_bag_rejilla(col, head, cats)
		return







	CareerUi.tab_chips(col, rotulos, cats.find(_bag_cat),
		func(i: int) -> void:
			_bag_cat = String(cats[i])
			_bag_fill())

	var items2: Array = _bag_items(_bag_cat)

	var scroll: ScrollContainer = ScrollContainer.new()
	scroll.custom_minimum_size = Vector2(0,
		mini(maxi(items2.size(), 1) *(BAG_CARD_H + 12), 640))
	scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED


	scroll.vertical_scroll_mode = ScrollContainer.SCROLL_MODE_SHOW_NEVER




	scroll.scroll_deadzone = 12
	col.add_child(scroll)
	var lista: VBoxContainer = VBoxContainer.new()
	lista.add_theme_constant_override("separation", 12)
	lista.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	scroll.add_child(lista)
	if items2.is_empty():



		var vacio: Label = CareerUi.plain(20, Color(1, 1, 1, 0.6))
		vacio.text = I18n.t("No te sobra nada: todo lo que compraste está puesto en la casa.")
		vacio.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		lista.add_child(vacio)
	for item in items2:
		if item is Dictionary:
			lista.add_child(_bag_card(item))
		else:
			lista.add_child(_bag_pet_card(String(item)))

	var cerrar: Button = Button.new()
	cerrar.custom_minimum_size = Vector2(0, 96)
	cerrar.text = I18n.t("CERRAR")
	CareerTheme.apply_button(cerrar, CareerTheme.Kind.GHOST, 24)
	cerrar.pressed.connect(func() -> void: CareerUi.close_modal(cerrar))
	col.add_child(cerrar)





func _bag_rejilla(col: VBoxContainer, head: HBoxContainer, cats: Array) -> void:
	var cerrar: Button = _bag_selector(I18n.t("CERRAR"), false,
		func() -> void: CareerUi.close_modal(col))
	cerrar.custom_minimum_size = Vector2(260, 72)
	head.add_child(cerrar)
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 20)
	fila.size_flags_vertical = Control.SIZE_EXPAND_FILL
	col.add_child(fila)
	var categorias: VBoxContainer = VBoxContainer.new()
	categorias.custom_minimum_size.x = 328.0
	categorias.add_theme_constant_override("separation", 6)
	fila.add_child(categorias)
	for cat in cats:
		var clave: String = String(cat)
		var b: Button = _bag_selector(I18n.t(clave), clave == _bag_cat,
			func() -> void:
				_bag_cat = clave
				_bag_fill())
		b.custom_minimum_size.x = 328.0
		categorias.add_child(b)
	var grupos: Dictionary = {}
	for item in _bag_items(_bag_cat):
		var clave: String = str(item)
		if item is Dictionary:
			var p: Dictionary = item as Dictionary
			clave = str([p.get("kind", ""), p.get("col", ""),
				(p.get("rect", Rect2()) as Rect2).size, p.get("tiers", 0)])
		if grupos.has(clave):
			grupos[clave]["n"] += 1
		else:
			grupos[clave] = {"item": item, "n": 1}
	var entradas: Array = grupos.values()
	var nombres: Array = []
	for g in entradas:
		var item: Variant = g["item"]
		nombres.append(I18n.t(House.kind_name(item as Dictionary)) if item is Dictionary else House.pet_name(String(item), Career.pet_names))
	var columnas: int = SELECTOR_COLECCION.columnas(self, 436.0, 220.0)
	var rejilla: GridContainer = SELECTOR_COLECCION.crear(fila, nombres,
		func(i: int, filtrada: bool) -> Control:
			var g: Dictionary = entradas[i]
			var ficha: Button = _bag_ficha_compacta(g["item"], int(g["n"]))
			if filtrada:
				var cantidad: Label = ficha.get_meta("cantidad_label") as Label
				cantidad.text = "#%d · %s" % [i + 1, cantidad.text]
			return ficha,
		columnas, 9, Vector2(220, 84), thumbs_batch, false)
	if grupos.is_empty():
		var vacio: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT_DIM)
		vacio.text = I18n.t("No te sobra nada: todo lo que compraste está puesto en la casa.")
		vacio.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		rejilla.add_child(vacio)


func _bag_selector(texto: String, activo: bool, accion: Callable) -> Button:
	var b: Button = Button.new()
	b.text = texto
	b.clip_text = true
	b.custom_minimum_size = Vector2(0, 56)
	CareerTheme.apply_button(b, CareerTheme.Kind.PRIMARY if activo else CareerTheme.Kind.NEUTRAL, CareerTheme.T_CAPTION)
	b.pressed.connect(accion)
	return b


func _bag_ficha_compacta(item: Variant, cantidad: int) -> Button:
	var b: Button = Button.new()
	b.custom_minimum_size = Vector2(220, 84)
	b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, CareerTheme.T_DIM)
	var pad: MarginContainer = MarginContainer.new()
	pad.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	pad.mouse_filter = Control.MOUSE_FILTER_IGNORE
	for lado in ["left", "right", "top", "bottom"]:
		pad.add_theme_constant_override("margin_" + lado, 8)
	b.add_child(pad)
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 8)
	fila.mouse_filter = Control.MOUSE_FILTER_IGNORE
	pad.add_child(fila)
	var foto: Control = _prop_preview(item as Dictionary, true) if item is Dictionary else pet_portrait(String(item), Career.house_pets_off.has(String(item)))
	foto.custom_minimum_size = Vector2(68, 64)
	foto.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	fila.add_child(foto)
	var texto: VBoxContainer = VBoxContainer.new()
	texto.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	texto.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	texto.mouse_filter = Control.MOUSE_FILTER_IGNORE
	fila.add_child(texto)
	var nombre: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT)
	nombre.text = I18n.t(House.kind_name(item as Dictionary)) if item is Dictionary else House.pet_name(String(item), Career.pet_names)
	nombre.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	nombre.max_lines_visible = 2
	nombre.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	nombre.custom_minimum_size.y = 36
	texto.add_child(nombre)
	var numero: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.MONEY)
	numero.text = "×%d" % cantidad
	texto.add_child(numero)
	b.set_meta("cantidad_label", numero)
	b.pressed.connect(func() -> void:
		if not (item is Dictionary):
			_pet_modal(String(item))
			return
		var detalle: VBoxContainer = CareerUi.modal(self, false)
		if detalle == null:
			return
		_bag_detalle = detalle
		CareerUi.head(detalle, I18n.t(House.kind_name(item as Dictionary)))
		thumbs_batch()
		var ficha: Button = _bag_card(item as Dictionary)
		ficha.custom_minimum_size.x = 1120.0


		ficha.pressed.connect(func() -> void:
			if is_instance_valid(_bag_box):
				CareerUi.close_modal(_bag_box))
		detalle.add_child(ficha)
		var salir: Button = _bag_selector(I18n.t("CERRAR"), false,
			func() -> void: CareerUi.close_modal(detalle))
		detalle.add_child(salir))
	return b




func _bag_items(cat: String) -> Array:
	var out: Array = []
	if cat.is_empty():
		return out





	if cat == House.CAT_MASCOTAS:
		out.append_array(House.pets_owned(Career.house_extras))




	for prop in (_plano()["props"] as Array):
		if not _en_inventario(prop):
			continue
		if not bool(prop.get("guardado", false)):
			continue
		if House.categoria_of(String(prop.get("kind", ""))) == cat:
			out.append(prop)
	return out








func _bag_kind_count(kind: String) -> int:
	var n: int = 0
	for prop in (_plano()["props"] as Array):
		if _en_inventario(prop) and String((prop as Dictionary).get("kind", "")) == kind:
			n += 1
	return n


func _bag_card(prop: Dictionary) -> Button:
	var id: String = String(prop["id"])
	var kind: String = String(prop.get("kind", ""))
	var b: Button = Button.new()







	b.mouse_filter = Control.MOUSE_FILTER_PASS
	b.custom_minimum_size = Vector2(BAG_CARD_W_TUMBADA if UiKit.es_horizontal() else 0.0,
		BAG_CARD_H)


	CareerTheme.apply_button(b, CareerTheme.Kind.GHOST, 18)
	b.pressed.connect(func() -> void:
		CareerUi.close_modal(b)
		_bag_take(id))




	var pad: MarginContainer = MarginContainer.new()
	pad.set_anchors_preset(Control.PRESET_FULL_RECT)
	pad.mouse_filter = Control.MOUSE_FILTER_IGNORE
	for side in ["left", "right", "top", "bottom"]:
		pad.add_theme_constant_override("margin_" + side, 14)
	b.add_child(pad)
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 16)
	fila.mouse_filter = Control.MOUSE_FILTER_IGNORE
	pad.add_child(fila)

	fila.add_child(_prop_preview(prop, true))

	var txt: VBoxContainer = VBoxContainer.new()
	txt.add_theme_constant_override("separation", 4)
	txt.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	txt.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	txt.mouse_filter = Control.MOUSE_FILTER_IGNORE
	fila.add_child(txt)

	var nom: Label = CareerUi.plain(22, CareerTheme.TEXT)
	nom.text = I18n.t(House.kind_name(prop))


	nom.clip_text = true
	nom.size_flags_horizontal = Control.SIZE_EXPAND_FILL
















	var cuantas: int = _bag_kind_count(kind)
	var linea1: HBoxContainer = HBoxContainer.new()
	linea1.add_theme_constant_override("separation", 10)
	linea1.mouse_filter = Control.MOUSE_FILTER_IGNORE
	txt.add_child(linea1)
	linea1.add_child(nom)
	if cuantas > 1:
		var mult: Label = CareerUi.plain(22, CareerTheme.MONEY)
		mult.text = I18n.tf("TIENES {0}", [str(cuantas)])
		mult.clip_text = true
		mult.mouse_filter = Control.MOUSE_FILTER_IGNORE
		linea1.add_child(mult)

	var r: Rect2 = prop["rect"]
	var med: Label = CareerUi.plain(16, Color(1, 1, 1, 0.55))
	med.text = I18n.tf("{0} x {1} celdas  ·  {2} m de alto", [
		str(int(round(r.size.x / House.CELDA))),
		str(int(round(r.size.y / House.CELDA))),
		String.num(House.prop_alto(kind), 2)])
	med.clip_text = true
	txt.add_child(med)

	var desc: Label = CareerUi.plain(16, Color(1, 1, 1, 0.75))
	desc.text = I18n.t(House.kind_desc(kind))
	desc.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART




	desc.custom_minimum_size = Vector2(0, 44)
	desc.vertical_alignment = VERTICAL_ALIGNMENT_TOP



	if UiKit.es_horizontal():
		desc.max_lines_visible = 2
		desc.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	txt.add_child(desc)

	var pie: Label = CareerUi.plain(16, CareerTheme.MONEY)
	pie.text = I18n.t("EN CAJAS · TOCA PARA SACARLO")
	pie.clip_text = true
	txt.add_child(pie)









	var vale: int = Career.house_sell_value(id)
	if vale > 0:
		fila.add_child(_bag_sell_button(id, vale))
	return b





















func _bag_sell_button(iid: String, vale: int) -> Button:



	var v: Button = CareerUi.accion("moneda", I18n.tf("VENDER {0}", [CareerUi.money(vale)]),
		CareerTheme.DANGER)
	v.size_flags_horizontal = Control.SIZE_FILL
	v.custom_minimum_size = Vector2(220, 84)
	v.size_flags_vertical = Control.SIZE_SHRINK_CENTER



	v.mouse_filter = Control.MOUSE_FILTER_STOP


	var armado: Array = [false]


	var vende: Callable = func() -> void:
		if Career.sell_house_item(iid) <= 0:


			UiAudio.deny()
			_cierra_bag_detalle()
			_bag_fill()
			return

		_undo.clear()
		UiAudio.click()


		_build_furniture()
		_cierra_bag_detalle()
		_bag_fill()



	CareerUi.hold_gesture(v, VENDER_HOLD_S, vende,
		func() -> bool: return bool(armado[0]) and _vende_manteniendo())
	v.pressed.connect(func() -> void:
		if not armado[0]:
			armado[0] = true
			UiAudio.click()
			var piezas: int = Career.house_sell_pieces(iid)
			CareerUi.pinta_accion(v, "moneda", _vender_armado_texto(piezas),
				CareerTheme.DANGER, true)





			var t: SceneTreeTimer = SceneFade.timer(4.0)
			t.timeout.connect(_desarma_vender.bind(v, armado, vale))
			return


		if _vende_manteniendo():
			return
		vende.call())






	var repinta: Callable = func(_m: int) -> void:
		if is_instance_valid(v) and bool(armado[0]):
			CareerUi.pinta_accion(v, "moneda",
				_vender_armado_texto(Career.house_sell_pieces(iid)), CareerTheme.DANGER, true)
	Entrada.modo_cambiado.connect(repinta)
	v.tree_exiting.connect(func() -> void:
		if Entrada.modo_cambiado.is_connected(repinta):
			Entrada.modo_cambiado.disconnect(repinta))
	return v








func _cierra_bag_detalle() -> void:
	if _bag_detalle != null and is_instance_valid(_bag_detalle):
		CareerUi.close_modal(_bag_detalle)
	_bag_detalle = null








func _vende_manteniendo() -> bool:
	return Entrada.modo != Entrada.Modo.TACTIL






func _vender_armado_texto(piezas: int) -> String:
	if _vende_manteniendo():
		return I18n.t("MANTÉN PARA VENDER") if piezas <= 1 \
				else I18n.tf("MANTÉN · SE VAN {0} PIEZAS", [piezas])
	return I18n.t("¿SEGURO? TOCA OTRA VEZ") if piezas <= 1 \
			else I18n.tf("¿SEGURO? SE VAN {0} PIEZAS", [piezas])

















func extra_thumb(extra_id: String, lvl: int = -1) -> Control:
	if PET_SPECIES.has(extra_id):
		return _pet_thumb(extra_id)
	var prop: Dictionary = House.extra_hero_prop(
		lvl if lvl >= 0 else _level, extra_id)
	if prop.is_empty():
		prop = preload("res://ui/house/extra_retratos.gd").prop(extra_id)
	if prop.is_empty():
		return null
	return _prop_preview(prop, false)












func acabado_thumb(zona: String, id: String) -> Control:
	return _prop_preview({"retrato_acabado": zona, "acabado": id, "face": 0,
		"fin": _acabados_puestos().duplicate(),
		"rect": Rect2(Vector2(-1.2, -1.2), Vector2(2.4, 2.4))}, false)










func _rincon_acabado(zona: String, id: String) -> void:
	var fin: Dictionary = _acabados_puestos()
	var piso_id: String = String(fin.get("floor", House.ACABADO_BASE["floor"]))
	var muro_id: String = String(fin.get("wall", House.ACABADO_BASE["wall"]))
	var trim: Color = _pal.get("trim", TRIM_COL)
	match zona:
		"floor":
			piso_id = id
		"wall":
			muro_id = id
		"trim":
			trim = House.acabado_by_id(id).get("color", TRIM_COL)
	var piso_col: Color = House.acabado_by_id(piso_id).get("color", FLOOR_COL)
	var muro_col: Color = House.acabado_by_id(muro_id).get("color", WALL_COL)
	var gr_muro: int = House.wall_grano(muro_id)


	var lado: float = 1.6 if zona == "floor" else 2.4
	var med: float = lado * 0.5


	var alto: float = WALL_H if zona == "trim" else 1.5
	_grano_suelo(_add_box(Vector3(0.0, -0.04, 0.0), Vector3(lado, 0.08, lado), piso_col),
		piso_col, House.floor_grano(piso_id))
	if zona == "floor":
		return
	var t: float = 0.12
	if zona == "trim":
		var r: Rect2 = Rect2(Vector2(- med, med - t * 0.5), Vector2(lado, t))
		_add_window_tabique(r, r.get_center(), muro_col, trim, gr_muro)
	else:
		_grano_muro(_add_box(Vector3(0.0, alto * 0.5, med), Vector3(lado, alto, t),
			muro_col), muro_col, gr_muro)
	_grano_muro(_add_box(Vector3(- med, alto * 0.5, 0.0), Vector3(t, alto, lado),
		muro_col), muro_col, gr_muro)

	_add_box(Vector3(0.0, 0.05, med - t * 0.5 - 0.01), Vector3(lado, 0.1, 0.02), trim)
	_add_box(Vector3(- med + t * 0.5 + 0.01, 0.05, 0.0), Vector3(0.02, 0.1, lado), trim)





static var _pet_thumb_cache: Dictionary = {}

func _pet_thumb(extra_id: String) -> TextureRect:
	if not _pet_thumb_cache.has(extra_id):
		var cfg: Dictionary = PET_SPECIES[extra_id]
		var tex: Texture2D
		if cfg.has("proc"):
			tex = PetSpritesLib.build(String(cfg["proc"])).get_frame_texture("idle_east", 0)
		else:
			tex = load(String(cfg["sheet"]) + "idle_east_01.png")


		var atlas := AtlasTexture.new()
		atlas.atlas = tex


		atlas.region = Rect2(SceneFade.caja_usada(tex,
			Rect2i(Vector2i.ZERO, Vector2i(tex.get_size())) if tex != null else Rect2i()))
		_pet_thumb_cache[extra_id] = atlas
	var retrato := TextureRect.new()
	retrato.texture = _pet_thumb_cache[extra_id]
	retrato.custom_minimum_size = Vector2(THUMB_W, THUMB_H)
	retrato.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	retrato.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	retrato.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	retrato.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	retrato.mouse_filter = Control.MOUSE_FILTER_IGNORE
	retrato.set_meta("mascota", extra_id)
	return retrato















static var _thumb_tex: Dictionary = {}


func _prop_preview(prop: Dictionary, guardado: bool) -> Control:
	var llave: int = hash([prop, _pal, _noche])
	if _thumb_tex.has(llave):
		var hecho: TextureRect = TextureRect.new()
		hecho.texture = _thumb_tex[llave]
		hecho.custom_minimum_size = Vector2(THUMB_W, THUMB_H)
		hecho.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
		hecho.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		hecho.mouse_filter = Control.MOUSE_FILTER_IGNORE
		if guardado:
			hecho.modulate = Color(1, 1, 1, 0.42)
		return hecho
	var caja: SubViewportContainer = SubViewportContainer.new()
	caja.custom_minimum_size = Vector2(THUMB_W, THUMB_H)
	caja.stretch = true
	caja.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var vp: SubViewport = SubViewport.new()
	vp.size = Vector2i(int(THUMB_W), int(THUMB_H))
	vp.transparent_bg = true
	vp.own_world_3d = true








	vp.render_target_update_mode = SubViewport.UPDATE_DISABLED
	caja.add_child(vp)








	if guardado:
		caja.modulate = Color(1, 1, 1, 0.42)
	_thumb_freeze(vp, _thumb_turno, prop, llave)
	_thumb_turno += 1
	return caja





func _thumb_monta(vp: SubViewport, prop: Dictionary) -> void:


	var r: Rect2 = prop["rect"]
	var copia: Dictionary = prop.duplicate(true)
	copia["rect"] = Rect2(- r.size * 0.5, r.size)
	copia["guardado"] = false
	var raiz: Node3D = Node3D.new()
	vp.add_child(raiz)
	var antes: Node3D = _box_parent
	_box_parent = raiz
	if copia.has("retrato_acabado"):
		_rincon_acabado(String(copia["retrato_acabado"]), String(copia["acabado"]))
	elif copia.has("retrato_extra"):
		preload("res://ui/house/extra_retratos.gd").pintar(self, String(copia["retrato_extra"]))
	else:
		_add_prop(copia)
	_box_parent = antes



	_purge_walls(raiz)

	var alto: float = House.prop_alto(String(prop.get("kind", "")))
	if raiz.get_child_count() == 0:




		var m: MeshInstance3D = MeshInstance3D.new()
		var bm: BoxMesh = BoxMesh.new()
		bm.size = Vector3(r.size.x, alto, maxf(r.size.y, 0.12))
		var mt: StandardMaterial3D = StandardMaterial3D.new()
		mt.albedo_color = _prop_color(String(prop.get("kind", "")))
		mt.roughness = 1.0
		bm.material = mt
		m.mesh = bm
		m.position = Vector3(0.0, alto * 0.5, 0.0)
		raiz.add_child(m)





	var cam3: Camera3D = Camera3D.new()
	cam3.fov = 34.0





	var caj: AABB = _thumb_aabb(raiz)
	var radio: float = maxf(0.5 * caj.size.length(), 0.2)
	var dist: float = maxf(radio / tan(deg_to_rad(cam3.fov * 0.5)) * 1.12, 1.0)


	var cara_foto: int = int(prop.get("face", House.base_face(prop)))&3
	var dir: Vector3 = Basis(Vector3.UP, PI * 0.5 * float(cara_foto)) \
			* Vector3(0.53, 0.61, -0.59).normalized()
	var centro: Vector3 = caj.get_center()



	cam3.transform = Transform3D().looking_at(centro -(centro + dir * dist),
		Vector3.UP)
	cam3.position = centro + dir * dist
	vp.add_child(cam3)

	var luz: DirectionalLight3D = DirectionalLight3D.new()
	luz.rotation_degrees = Vector3(-46.0, -128.0, 0.0)
	luz.light_energy = 1.15
	vp.add_child(luz)


	var env: WorldEnvironment = WorldEnvironment.new()
	var e: Environment = Environment.new()



	e.background_mode = Environment.BG_COLOR
	e.background_color = Color(0, 0, 0, 0)
	e.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	e.ambient_light_color = Color("cfd2d6")
	e.ambient_light_energy = 0.55
	env.environment = e
	vp.add_child(env)














func prop_aabb(prop: Dictionary) -> AABB:
	var raiz: Node3D = Node3D.new()
	add_child(raiz)
	var antes: Node3D = _box_parent
	_box_parent = raiz
	_add_prop(prop)
	_box_parent = antes
	_purge_walls(raiz)
	var caja: AABB = _thumb_aabb(raiz)
	raiz.queue_free()
	return caja


func _thumb_aabb(raiz: Node3D) -> AABB:
	var out: AABB = AABB()
	var primero: bool = true















	var pila: Array = [{"n": raiz, "t": Transform3D.IDENTITY}]
	while not pila.is_empty():
		var it: Dictionary = pila.pop_back()
		var nodo: Node = it["n"]
		var acum: Transform3D = it["t"]
		for hijo in nodo.get_children():
			var h3: Node3D = hijo as Node3D
			if h3 == null:
				continue
			var tr: Transform3D = acum * h3.transform
			var caja: AABB = AABB()
			var tiene: bool = false
			var mi: MeshInstance3D = h3 as MeshInstance3D
			var sp: SpriteBase3D = h3 as SpriteBase3D
			if mi != null and mi.mesh != null:
				caja = mi.mesh.get_aabb()
				tiene = true
			elif sp != null:


				caja = sp.get_aabb()
				tiene = true
			if tiene:
				var puesta: AABB = tr * caja
				out = puesta if primero else out.merge(puesta)
				primero = false
			pila.append({"n": h3, "t": tr})
	if primero:
		return AABB(Vector3(-0.3, 0.0, -0.3), Vector3(0.6, 0.6, 0.6))
	return out








var _thumb_turno: int = 0





func thumbs_batch() -> void:
	_thumb_turno = 0










func _thumb_freeze(vp: SubViewport, turno: int = 0, prop: Dictionary = {},
		llave: int = 0) -> void:
	for i in turno + 1:
		await get_tree().process_frame
		if not is_instance_valid(vp):
			return
	if not prop.is_empty():
		_thumb_monta(vp, prop)
	vp.render_target_update_mode = SubViewport.UPDATE_ALWAYS
	await get_tree().process_frame
	await get_tree().process_frame
	if not is_instance_valid(vp):
		return
	if not prop.is_empty() and DisplayServer.get_name() != "headless":
		await RenderingServer.frame_post_draw
		if not is_instance_valid(vp):
			return
		var img: Image = vp.get_texture().get_image()
		if img != null and not img.is_empty():
			_thumb_tex[llave] = ImageTexture.create_from_image(img)
	vp.render_target_update_mode = SubViewport.UPDATE_DISABLED








func _light_host() -> Node:
	return _box_parent if _box_parent != null else viewport











func _add_luz(at: Vector3, col: Color, energia: float,
		radio: float = 5.0) -> OmniLight3D:
	var luz: OmniLight3D = OmniLight3D.new()
	luz.position = at
	luz.light_color = col
	luz.light_energy = energia *(1.55 if _noche else 1.0)
	luz.omni_range = radio
	luz.shadow_enabled = false
	_light_host().add_child(luz)
	_luces.append({"nodo": luz, "at": Vector2(at.x, at.z)})
	return luz













func _tick_luces(delta: float) -> void:
	_luz_t -= delta
	if _luz_t > 0.0:
		return
	_luz_t = LUZ_TICK
	var vivas: Array = []
	for l in _luces:







		var n: Variant = l["nodo"]
		if is_instance_valid(n):
			vivas.append(l)
	_luces = vivas
	if _luces.size() <= MAX_LUCES:
		for l in _luces:
			(l["nodo"] as OmniLight3D).visible = true
		return


	var foco: Vector2 = _pos
	_luces.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return (a["at"] as Vector2).distance_squared_to(foco) \
				<(b["at"] as Vector2).distance_squared_to(foco))
	for i in _luces.size():
		(_luces[i]["nodo"] as OmniLight3D).visible = i < MAX_LUCES

















func _hoja_col() -> Color:
	return (_pal.get("trim", TRIM_COL) as Color).lightened(0.12)


func _prop_color(kind: String) -> Color:
	var look: Dictionary = PROP_LOOK.get(kind, {})
	var fam: String = String(PROP_MAT.get(kind, ""))
	if not fam.is_empty() and _pal.has(fam):
		return _pal[fam]
	return look.get("col", Color("8a6a45"))





func _bag_pet_card(id: String) -> Button:
	var apagada: bool = Career.house_pets_off.has(id)
	var extra: Dictionary = House.extra_by_id(id)
	var b: Button = Button.new()







	b.mouse_filter = Control.MOUSE_FILTER_PASS






	b.custom_minimum_size = Vector2(BAG_CARD_W_TUMBADA if UiKit.es_horizontal() else 0.0, 140)
	CareerTheme.apply_button(b,
		CareerTheme.Kind.GHOST if apagada else CareerTheme.Kind.NEUTRAL, 18)


	b.pressed.connect(func() -> void:
		_pet_modal(id))
	var pad: MarginContainer = MarginContainer.new()
	pad.set_anchors_preset(Control.PRESET_FULL_RECT)
	pad.mouse_filter = Control.MOUSE_FILTER_IGNORE
	for side in ["left", "right", "top", "bottom"]:
		pad.add_theme_constant_override("margin_" + side, 14)
	b.add_child(pad)
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 16)
	fila.mouse_filter = Control.MOUSE_FILTER_IGNORE
	pad.add_child(fila)
	fila.add_child(pet_portrait(id, apagada))
	var txt: VBoxContainer = VBoxContainer.new()
	txt.add_theme_constant_override("separation", 4)
	txt.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	txt.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	txt.mouse_filter = Control.MOUSE_FILTER_IGNORE
	fila.add_child(txt)
	var nom: Label = CareerUi.plain(22, CareerTheme.TEXT)
	nom.text = House.pet_name(id, Career.pet_names)
	nom.clip_text = true
	txt.add_child(nom)
	var desc: Label = CareerUi.plain(16, Color(1, 1, 1, 0.75))
	desc.text = I18n.t(String(extra.get("desc", "")))
	desc.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	desc.custom_minimum_size = Vector2(0, 22)
	txt.add_child(desc)








	var pie: Label = CareerUi.plain(16,
		CareerTheme.TEXT_DIM if apagada else CareerTheme.accent_text())
	pie.text = I18n.t("HOY NO SALE · TOCA PARA RENOMBRAR O SACAR") if apagada \
			else I18n.t("ANDA POR LA CASA · TOCA PARA RENOMBRAR O GUARDAR")







	pie.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	txt.add_child(pie)
	return b















func _club_label(id: String) -> String:
	var t2: Dictionary = Teams.by_id(id)
	return Competitions.demarca(String(t2.get("name", id))) if not t2.is_empty() \
			else id


func _jersey_modal(marco: int = -1) -> void:
	if CareerUi.modal_open(self):
		return
	if _jersey_prop.is_empty():
		return
	var percha: String = _jersey_prop


	var cap: int = 1
	for p in House.plan_slots(_plano(), "camisetas"):
		if String(p.get("id", "")) == percha:
			cap = int(p.get("cap", 1))



	if marco < 0 and cap == 1:
		marco = 0
	var col: VBoxContainer = CareerUi.modal(self)
	col.add_theme_constant_override("separation", 14)
	if marco < 0:


		CareerUi.head(col, I18n.t("COLGAR PLAYERAS"))
		var puesto: Dictionary = {}
		for j in House.plan_jerseys(_plano(), House.cola_camisetas(CasaFoto.clubes(), Career.keepsakes)):
			if String(j.get("prop_id", "")) == percha:
				puesto[int(j.get("idx", -1))] = j


		var picks: Dictionary = Career.jersey_picks.get(percha, {})
		var rej: GridContainer = GridContainer.new()
		rej.columns = mini(cap, 4)
		rej.add_theme_constant_override("h_separation", 8)
		rej.add_theme_constant_override("v_separation", 8)
		col.add_child(rej)
		for i in cap:
			var j2: Dictionary = puesto.get(i, {})
			var pie: String = str(i + 1)
			if not j2.is_empty():
				pie = "%d · %s" % [i + 1, I18n.t("AUTO")] if not picks.has(str(i)) \
						else "%d · #%d" % [i + 1, int(j2.get("number", 0))]
			var b: Button = _playera_tile(j2, pie, false, 170)
			b.pressed.connect(func() -> void:
				CareerUi.close_top_modal(self)
				_jersey_modal(i))
			rej.add_child(b)
		_cerrar_playeras(col)
		return





	CareerUi.head(col, I18n.t("COLGAR PLAYERA") if cap == 1
		else I18n.tf("MARCO {0}", [marco + 1]))
	var picks2: Dictionary = Career.jersey_picks.get(percha, {})
	var actual: Dictionary = picks2.get(str(marco), {})
	var clubes: Array = CasaFoto.clubes()
	var club_sel: String = String(actual.get("club",
		clubes[mini(marco, clubes.size() - 1)]))
	var num_sel: int = int(actual.get("number", Career.club_number(club_sel)))



	if actual.has("trade"):
		club_sel = String(clubes[mini(marco, clubes.size() - 1)])
		num_sel = Career.club_number(club_sel)



	var en_uso: Dictionary = {}
	for ju in House.plan_jerseys(_plano(), House.cola_camisetas(CasaFoto.clubes(), Career.keepsakes)):
		if String(ju.get("prop_id", "")) == percha and int(ju.get("idx", -1)) == marco:
			continue
		en_uso[House.clave_playera(ju)] = true
	var fila_club: GridContainer = GridContainer.new()
	fila_club.columns = 3
	fila_club.add_theme_constant_override("h_separation", 8)
	fila_club.add_theme_constant_override("v_separation", 8)
	col.add_child(CareerUi.plain(18, CareerTheme.TEXT_DIM))
	(col.get_child(col.get_child_count() - 1) as Label).text = I18n.t("EQUIPO")
	col.add_child(fila_club)
	var num_fila: HBoxContainer = HBoxContainer.new()
	num_fila.add_theme_constant_override("separation", 8)
	for cid in clubes:

		var c_uso: bool = en_uso.has(House.clave_playera({"club": String(cid), "number": num_sel}))
		var cb: Button = _playera_tile({"club": String(cid), "number": num_sel},
			I18n.t("EN USO") if c_uso else _club_label(String(cid)),
			String(cid) == club_sel and not actual.has("trade"))
		cb.disabled = c_uso
		cb.pressed.connect(func() -> void:
			Career.set_jersey_pick(percha, marco, String(cid), num_sel)
			_build_furniture()
			CareerUi.close_top_modal(self)
			_jersey_modal(marco))
		fila_club.add_child(cb)
	col.add_child(CareerUi.plain(18, CareerTheme.TEXT_DIM))
	(col.get_child(col.get_child_count() - 1) as Label).text = I18n.t("DORSAL")
	col.add_child(num_fila)
	for n in Career.career_numbers():
		var nb: Button = Button.new()
		nb.custom_minimum_size = Vector2(0, 84)
		nb.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		nb.text = str(n)
		nb.disabled = int(n) != num_sel and en_uso.has(House.clave_playera({"club": club_sel, "number": int(n)}))
		CareerTheme.apply_button(nb,
			CareerTheme.Kind.PRIMARY if int(n) == num_sel \
					else CareerTheme.Kind.NEUTRAL, 22)
		nb.pressed.connect(func() -> void:
			Career.set_jersey_pick(percha, marco, club_sel, int(n))
			_build_furniture()
			CareerUi.close_top_modal(self)
			_jersey_modal(marco))
		num_fila.add_child(nb)






	var cambiadas: Array = Keepsakes.of_kind(Career.keepsakes, Keepsakes.SHIRT)
	if not cambiadas.is_empty():
		col.add_child(CareerUi.plain(18, CareerTheme.TEXT_DIM))
		(col.get_child(col.get_child_count() - 1) as Label).text = I18n.t("INTERCAMBIADAS")
		var en_marco: Dictionary = actual.get("trade", {})
		var rej_t: GridContainer = GridContainer.new()
		rej_t.columns = 3
		rej_t.add_theme_constant_override("h_separation", 8)
		rej_t.add_theme_constant_override("v_separation", 8)
		col.add_child(rej_t)
		for k in cambiadas:
			var kd: Dictionary = k
			var num_k: int = int(kd.get("who_num", 0))
			var puesta: bool = String(actual.get("club", "")) == String(kd.get("rival", "")) \
					and String(en_marco.get("who", "")) == String(kd.get("who", "")) \
					and String(en_marco.get("legend_key", "")) == Keepsakes.legend_key_of(kd)
			var tj: Dictionary = {"club": String(kd.get("rival", "")),
				"number": num_k, "trade": {"who": kd.get("who", ""),
				"legend_key": Keepsakes.legend_key_of(kd), "season": kd.get("season", 0)}}
			var t_uso: bool = en_uso.has(House.clave_playera(tj))
			var tb: Button = _playera_tile(tj, I18n.t("EN USO") if t_uso
				else Keepsakes.quien_pintado(kd), puesta)
			tb.disabled = t_uso
			tb.pressed.connect(func() -> void:
				Career.set_jersey_pick(percha, marco, String(kd.get("rival", "")),
					num_k, kd)
				_build_furniture()
				CareerUi.close_top_modal(self)
				_jersey_modal(marco))




			var celda: VBoxContainer = VBoxContainer.new()
			celda.size_flags_horizontal = Control.SIZE_EXPAND_FILL
			celda.add_theme_constant_override("separation", 4)
			celda.add_child(tb)




			var cerrada: bool = preload("res://features/career/subasta.gd").cerrada(kd)
			var vb: Button = CareerUi.accion("candado" if cerrada else "martillo",
				I18n.t("SUBASTAR"), CareerTheme.DANGER)
			vb.custom_minimum_size = Vector2(0, 56)
			vb.disabled = cerrada



			vb.pressed.connect(func() -> void:
				var ape_v: String = Espalda.apellido_de(Keepsakes.quien_pintado(kd))
				preload("res://ui/subasta_playera.gd").abre(self, kd, JerseyArt.texture_named(_kit_playera(tj),
					num_k, ape_v), func(cobrado: int) -> void:
						if cobrado > 0:
							_build_furniture()
						CareerUi.close_top_modal(self)
						_jersey_modal(marco)))
			celda.add_child(vb)
			rej_t.add_child(celda)



	var auto: Button = CareerUi.accion("girar", I18n.t("DEJARLO AUTOMÁTICO"),
		UiKit.BTN_BLUE["bg"] as Color)
	auto.custom_minimum_size = Vector2(0, 90)
	auto.pressed.connect(func() -> void:
		Career.clear_jersey_pick(percha, marco)
		_build_furniture()
		CareerUi.close_top_modal(self))
	col.add_child(auto)
	_cerrar_playeras(col)







func _pet_modal(id: String) -> void:






	var col: VBoxContainer = CareerUi.modal(self, false)
	if col == null:
		return
	col.add_theme_constant_override("separation", 16)
	var apagada: bool = Career.house_pets_off.has(id)
	col.add_child(pet_portrait(id, apagada))
	var le: LineEdit = LineEdit.new()






	le.mouse_filter = Control.MOUSE_FILTER_STOP
	le.focus_mode = Control.FOCUS_ALL
	le.text = House.pet_name(id, Career.pet_names)
	le.max_length = 14
	le.alignment = HORIZONTAL_ALIGNMENT_CENTER
	le.select_all_on_focus = true
	le.custom_minimum_size = Vector2(0, 76)
	le.add_theme_font_size_override("font_size", 28)
	le.add_theme_color_override("font_color", CareerTheme.TEXT)
	col.add_child(le)
	var poner: Callable = func() -> void:
		var t: String = le.text.strip_edges()
		if t.is_empty():
			Career.pet_names.erase(id)
		else:
			Career.pet_names[id] = t
			Achievements.ingest_pet_name(t)
		_rebuild_pets()
		_bag_fill()
		CareerUi.close_modal(col)
	le.text_submitted.connect(func(_s: String) -> void: poner.call())

















	le.text_changed.connect(func(s: String) -> void:
		var lim: String = s.strip_edges()
		if lim.is_empty():
			Career.pet_names.erase(id)
		else:
			Career.pet_names[id] = lim


			Achievements.ingest_pet_name(lim)
		_pets_pide_rebuild())



	col.tree_exiting.connect(func() -> void: _pets_rebuild_pendiente.call_deferred())
	var nom_btn: Button = Button.new()
	nom_btn.text = I18n.t("PONER NOMBRE")
	nom_btn.custom_minimum_size = Vector2(0, 100)
	CareerTheme.apply_button(nom_btn, CareerTheme.Kind.PRIMARY, 24)
	nom_btn.pressed.connect(func() -> void: poner.call())
	col.add_child(nom_btn)


	var sacar_btn: Button = CareerUi.accion("mascota", I18n.t("SACARLA A LA CASA"),
		CareerTheme.NAV_CASA) if apagada else CareerUi.accion("caja",
		I18n.t("GUARDARLA (HOY NO SALE)"), UiKit.BTN_BLUE["bg"] as Color)
	sacar_btn.custom_minimum_size = Vector2(0, 90)
	sacar_btn.pressed.connect(func() -> void:
		if Career.house_pets_off.has(id):
			Career.house_pets_off.erase(id)
		else:
			Career.house_pets_off.append(id)
		_rebuild_pets()
		_bag_fill()
		CareerUi.close_modal(col))
	col.add_child(sacar_btn)
	_cerrar_tumbado(col)














static func pet_portrait(id: String, apagada: bool) -> Control:
	var caja: TextureRect = TextureRect.new()
	caja.custom_minimum_size = Vector2(92, 92)
	caja.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	caja.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED

	caja.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	caja.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var cfg: Dictionary = PET_SPECIES.get(id, {})


	if cfg.has("proc"):
		var pf: SpriteFrames = PetSpritesLib.build(String(cfg["proc"]))
		if pf.has_animation("idle_south") and pf.get_frame_count("idle_south") > 0:
			var ptex: Texture2D = pf.get_frame_texture("idle_south", 0)


			var pimg: Image = SceneFade.imagen(ptex)
			var pu: Rect2i = pimg.get_used_rect() if pimg != null else Rect2i()
			if pu.size.x > 0 and pu.size != pimg.get_size():
				var pat: AtlasTexture = AtlasTexture.new()
				pat.atlas = ptex
				pat.region = Rect2(pu)
				caja.texture = pat
			else:
				caja.texture = ptex
		if apagada:
			caja.modulate = Color(1, 1, 1, 0.38)
		return caja
	var raiz: String = String(cfg.get("sheet", ""))



	for stem in ["idle_south_01", "walk_south_01"]:
		var ruta: String = "%s%s.png" % [raiz, stem]
		if not ResourceLoader.exists(ruta):
			continue
		var tex: Texture2D = load(ruta)









		var img: Image = tex.get_image()
		if img == null:
			caja.texture = tex
			if apagada:
				caja.modulate = Color(1, 1, 1, 0.38)
			return caja
		var usado: Rect2i = img.get_used_rect()
		if usado.size.x > 0 and usado.size.y > 0 and usado.size != img.get_size():
			var atlas: AtlasTexture = AtlasTexture.new()
			atlas.atlas = tex
			atlas.region = Rect2(usado)
			caja.texture = atlas
		else:
			caja.texture = tex
		break
	if apagada:
		caja.modulate = Color(1, 1, 1, 0.38)
	return caja




func _pets_pide_rebuild() -> void:
	_pets_pend = true
	if _pets_debounce == null:
		_pets_debounce = Timer.new()
		_pets_debounce.one_shot = true
		_pets_debounce.wait_time = PETS_DEBOUNCE_S
		_pets_debounce.timeout.connect(_pets_rebuild_pendiente)
		add_child(_pets_debounce)
	_pets_debounce.start()




func _pets_rebuild_pendiente() -> void:
	if _pets_debounce != null and is_instance_valid(_pets_debounce):
		_pets_debounce.stop()
	if not _pets_pend or not is_inside_tree():
		return
	_rebuild_pets()




func _rebuild_pets() -> void:

	_pets_pend = false
	for pet in _pets:
		var n: Node = pet.get("node")
		if n != null and is_instance_valid(n):
			n.queue_free()
	_pets.clear()
	_build_pets()

















func _bag_take(id: String) -> void:
	var base: Dictionary = _base_prop(id)
	if base.is_empty():
		return
	var ov: Dictionary = _layout_of().get(id, {})
	_carry = id
	_carry_face = int(ov.get("face", House.base_face(base)))&3
	_carry_pos = ov.get("pos",(base["rect"] as Rect2).position)
	_carry_step()






func _colocar_al_entrar() -> void:
	var iid: String = House.colocar_al_entrar
	House.colocar_al_entrar = ""
	await get_tree().process_frame
	await get_tree().process_frame
	if not is_inside_tree() or museo:
		return
	var ok: bool = false
	for prop in (_plano()["props"] as Array):
		if String((prop as Dictionary).get("id", "")) == iid \
				and bool((prop as Dictionary).get("guardado", false)):
			ok = true
			break
	if not ok:
		return
	if not _grid_on:
		_toggle_grid()
	_bag_take(iid)

































func _vaciar_piezas() -> Array:
	var out: Array = []
	for prop in (_plano()["props"] as Array):
		if not _en_inventario(prop):
			continue
		if bool(prop.get("guardado", false)):
			continue
		out.append(String(prop.get("id", "")))
	return out




func _open_vaciar() -> void:
	if CareerUi.modal_open(self):
		return
	var col: VBoxContainer = CareerUi.modal(self)
	if col == null:
		return
	var piezas: int = _vaciar_piezas().size()
	var tabs: int =(_layout_of().get("tabiques", []) as Array).size()
	var pintadas: int = House.celdas_pintadas(Career.floor_paint_of())
	var title: Label = CareerUi.plain(CareerTheme.T_TITLE_MODAL, CareerTheme.TEXT)
	title.text = I18n.t("VACIAR")
	title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	col.add_child(title)



	CareerUi.kv(col, I18n.t("PUESTOS"), str(piezas))
	CareerUi.kv(col, I18n.t("TABIQUES"), str(tabs))
	CareerUi.kv(col, I18n.t("PINTADO"), str(pintadas))







	CareerUi.hold_button(col, I18n.t("MANTEN PARA GUARDAR TODO"), 2.0,
		func() -> void:
			CareerUi.close_modal(col)
			_guardar_todo(), 22, CareerTheme.NAV_CASA)
	CareerUi.dim(col, I18n.t(
		"Recoge tus muebles al inventario. Las paredes y la pintura se quedan."))
	CareerUi.hold_button(col, I18n.t("MANTEN PARA DEJARLO LIMPIO"), 3.0,
		func() -> void:
			CareerUi.close_modal(col)
			_limpiar_planta(), 22)
	CareerUi.dim(col, I18n.t(
		"Además tira tus tabiques, cierra los boquetes y borra la pintura del suelo."))








	CareerUi.hold_button(col, I18n.t("MANTEN PARA ARRASAR"), 4.0,
		func() -> void:
			CareerUi.close_modal(col)
			_arrasar_planta(), 22)
	CareerUi.dim(col, I18n.t(
		"Tira TAMBIÉN el cascarón y las paredes de fábrica. Queda el terreno con su piso."))
	CareerUi.dim(col, I18n.t(
		"Nada se pierde: todo lo que compraste sigue en tu inventario."))
	var cerrar: Button = Button.new()
	cerrar.custom_minimum_size = Vector2(0, CareerTheme.BTN_SECONDARY_H)
	cerrar.text = I18n.t("CERRAR")
	CareerTheme.apply_button(cerrar, CareerTheme.Kind.GHOST, 24)
	cerrar.pressed.connect(func() -> void:
		CareerUi.close_modal(cerrar))
	col.add_child(cerrar)







func _undo_push(grupo: String = "") -> void:
	if not grupo.is_empty() and grupo == _undo_grupo:
		return
	_undo_grupo = grupo
	_undo.append({
		"capa": _layout_of().duplicate(true),







		"pintura": Career.floor_paint_of(),
	})
	if _undo.size() > UNDO_MAX:
		_undo.pop_front()






func _undo_pop() -> void:
	if _undo.is_empty():
		return
	var foto: Dictionary = _undo.pop_back()
	_undo_grupo = ""
	_layout_commit((foto["capa"] as Dictionary).duplicate(true), false)


	Career.set_floor_paint(foto["pintura"] as Dictionary)
	_rebuild_planta()
	_rebuild_pintura()
	_build_furniture()
	_refresh_mode()


func _vaciar_foto() -> void:
	_vaciar_antes = _layout_of().duplicate(true)
	_vaciar_pintura_antes = Career.floor_paint_of().duplicate(true)
	_vaciar_hay = true










func _vaciar_a_cajas(capa: Dictionary, ids: Array) -> void:
	for pid in ids:
		var base: Dictionary = _base_prop(String(pid))
		if base.is_empty():
			continue
		var ov: Dictionary = capa.get(String(pid), {})
		capa[String(pid)] = {
			"pos": ov.get("pos",(base["rect"] as Rect2).position),
			"face": int(ov.get("face", House.base_face(base)))&3,
			"guardado": true}


func _guardar_todo() -> void:
	var ids: Array = _vaciar_piezas()
	if ids.is_empty():
		_vaciar_aviso(I18n.t("NO HAY NADA PUESTO"), I18n.t(
			"Esta planta ya está vacía: todo lo tuyo está en el inventario."))
		return
	_vaciar_foto()
	var capa: Dictionary = _layout_of().duplicate(true)
	_vaciar_a_cajas(capa, ids)
	_layout_commit(capa)
	_build_furniture()
	_refresh_mode()
	_vaciar_resultado(ids.size(), 0, 0)









func _limpiar_planta() -> void:
	var ids: Array = _vaciar_piezas()
	var capa0: Dictionary = _layout_of()
	var tabs: int =(capa0.get("tabiques", []) as Array).size()
	var huecos: int =(capa0.get("aberturas", []) as Array).size()
	var pintadas: int = House.celdas_pintadas(Career.floor_paint_of())
	if ids.is_empty() and tabs == 0 and huecos == 0 and pintadas == 0:
		_vaciar_aviso(I18n.t("YA ESTA LIMPIO"), I18n.t(
			"Ni muebles puestos, ni tabiques tuyos, ni pintura: no hay nada que quitar."))
		return
	_vaciar_foto()
	var capa: Dictionary = capa0.duplicate(true)
	_vaciar_a_cajas(capa, ids)




	capa.erase("tabiques")
	capa.erase("aberturas")
	_layout_commit(capa)
	Career.set_floor_paint({})



	_rebuild_planta()
	_build_furniture()
	_refresh_mode()
	_vaciar_resultado(ids.size(), tabs + huecos, pintadas)


























static var _quotes_mem: Dictionary = {}


func _open_planos() -> void:
	if CareerUi.modal_open(self):
		return
	var pl: Dictionary = _plano()
	var lista: Array = House.plantillas(pl)
	var col: VBoxContainer = CareerUi.modal(self)
	if col == null:
		return
	var title: Label = CareerUi.plain(CareerTheme.T_TITLE_MODAL, CareerTheme.TEXT)
	title.text = I18n.t("PLANOS")
	title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	col.add_child(title)
	if lista.is_empty():


		CareerUi.dim(col, I18n.t(
			"Este terreno es demasiado chico para repartirlo en cuartos."))
		_planos_cerrar(col)
		return
	var caja: Rect2 = House.plan_bounds(pl)
	var pta: Vector2 = House.plan_door(pl)


	var grande: PlanPreview = PlanPreview.new()
	grande.custom_minimum_size = Vector2(0, 420)
	col.add_child(grande)
	var nom: Label = CareerUi.plain(CareerTheme.T_HEAD, CareerTheme.TEXT)
	nom.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER


	nom.clip_text = true
	col.add_child(nom)
	var pista: Label = CareerUi.dim(col, "")
	pista.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	var cifras: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
	cifras.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	cifras.clip_text = true
	col.add_child(cifras)



	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 12)
	fila.alignment = BoxContainer.ALIGNMENT_CENTER
	col.add_child(fila)
	var botones: Array[Button] = []
	var sel: Array = [0]









	var qsig: String = str(hash([House.plan_bounds(pl), Career.house_finishes,
		Career.house_items]))
	if String(_quotes_mem.get("sig", "")) != qsig:
		_quotes_mem = {"sig": qsig, "q": {}}
	var quotes: Dictionary = _quotes_mem["q"]
	var pack_ui: Array = [null, null, null]



	var pinta: Callable = func() -> void:
		var d: Dictionary = lista[int(sel[0])] as Dictionary
		var tabs: Array = d["tabiques"] as Array
		grande.plano(caja, tabs, pta)
		nom.text = I18n.t(String(d["name"]))
		pista.text = I18n.t(String(d["hint"]))
		cifras.text = "%s · %s" % [
			I18n.tf("{0} cuartos", [str(int(d.get("cuartos", 0)))]),
			I18n.tf("{0} paredes", [str(House.plantilla_paredes(tabs))])]




		for i in botones.size():
			CareerTheme.style_button(botones[i],
				CareerTheme.Kind.PRIMARY if i == int(sel[0])
				else CareerTheme.Kind.NEUTRAL, 18)
		await _pack_pinta(pack_ui, quotes, pl, lista, sel)
	for i in lista.size():
		var d: Dictionary = lista[i] as Dictionary
		var b: Button = Button.new()
		b.custom_minimum_size = Vector2(150, 150)
		CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, 18)
		b.pressed.connect(func() -> void:
			sel[0] = i
			pinta.call())
		fila.add_child(b)
		botones.append(b)
		var mini: PlanPreview = PlanPreview.new()
		mini.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)


		mini.mouse_filter = Control.MOUSE_FILTER_IGNORE
		b.add_child(mini)
		mini.plano(caja, d["tabiques"] as Array, pta)







	var pz_hoy: int = _vaciar_piezas().size()
	var tuyos: int = House.plantilla_paredes(_tabs_hoy() as Array)
	var pint_hoy: int = House.celdas_pintadas(Career.floor_paint_of())
	if pz_hoy > 0 or tuyos > 0 or pint_hoy > 0:
		CareerUi.head(col, I18n.t("LO QUE SE VA"))
		if pz_hoy > 0:
			CareerUi.kv(col, I18n.t("PUESTOS"), str(pz_hoy))
		if tuyos > 0:
			CareerUi.kv(col, I18n.t("PAREDES QUE HAY"), str(tuyos))
		if pint_hoy > 0:
			CareerUi.kv(col, I18n.t("PINTADO"), str(pint_hoy))
		CareerUi.dim(col, I18n.t(
			"El plano REEMPLAZA tu casa: tira tus paredes, borra la pintura y recoge tus muebles al inventario."))



		CareerUi.dim(col, I18n.t(
			"Nada se pierde: todo lo que compraste sigue en tu inventario."))




	CareerUi.hold_button(col, I18n.t("MANTEN PARA PONER ESTE PLANO"), 3.0,
		func() -> void:
			CareerUi.close_modal(col)
			_aplica_plano(lista[int(sel[0])] as Dictionary), 22,
		CareerTheme.NAV_CASA)




	CareerUi.head(col, I18n.t("O YA AMUEBLADA"))
	pack_ui[0] = CareerUi.dim(col, "")
	pack_ui[1] = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
	(pack_ui[1] as Label).clip_text = true
	col.add_child(pack_ui[1] as Label)





	pack_ui[2] = CareerUi.hold_button(col, I18n.t("AMUEBLADA"), 3.0,
		func() -> void:
			CareerUi.close_modal(col)
			_compra_pack(lista[int(sel[0])] as Dictionary, quotes), 22,
		CareerTheme.MONEY)
	_planos_cerrar(col)
	pinta.call()






func _pack_pinta(ui: Array, quotes: Dictionary, pl: Dictionary, lista: Array,
		sel: Array) -> void:
	var i: int = int(sel[0])
	var frase: Label = ui[0] as Label
	var cifras: Label = ui[1] as Label
	var btn: Button = ui[2] as Button
	if frase == null or cifras == null or btn == null:
		return
	var plt: Dictionary = lista[i] as Dictionary
	var id: String = String(plt.get("id", ""))
	if not quotes.has(id):





		quotes[id] = null
		frase.text = I18n.t("Calculando la oferta…")
		cifras.text = ""
		btn.disabled = true
		btn.text = I18n.t("AMUEBLADA")
		var qa: Dictionary = await House.pack_quote_async(pl, plt)
		if not is_instance_valid(btn) or not btn.is_inside_tree():


			quotes[id] = qa
			return
		quotes[id] = qa
		if int(sel[0]) != i:
			return
	elif quotes[id] == null:

		frase.text = I18n.t("Calculando la oferta…")
		cifras.text = ""
		btn.disabled = true
		btn.text = I18n.t("AMUEBLADA")
		return
	var q: Dictionary = quotes[id] as Dictionary
	if q.is_empty():

		frase.text = I18n.t("En este plano no cabe el juego de muebles completo.")
		cifras.text = ""
		btn.disabled = true
		btn.text = I18n.t("AMUEBLADA")
		return
	var n: int =(q["pone"] as Array).size()
	frase.text = I18n.tf("Llega con {0} muebles ya puestos en su sitio.", [str(n)])






	cifras.text = I18n.tf("Sueltos costarían {0}",
		[CareerUi.money(int(q["valor"]))])
	btn.disabled = not Career.can_afford(int(q["precio"]))




	btn.text = I18n.tf("COMPRAR AMUEBLADA · {0}",
		[CareerUi.money(int(q["precio"]))])





















func _compra_pack(plt: Dictionary, quotes: Dictionary = {}) -> void:


	var memo: Variant = quotes.get(String(plt.get("id", "")))
	var q: Dictionary = {}
	if memo is Dictionary:
		q = memo
	else:
		q = House.pack_quote(_plano(), plt)
	if not Career.buy_house_pack(plt, q):
		return


	_undo.clear()









	_vaciar_hay = false
	_vaciar_antes = {}
	_vaciar_pintura_antes = {}
	_rebuild_planta()
	_build_furniture()
	_refresh_mode()
	_pack_resultado(String(plt["name"]), q)




func _pack_resultado(nombre: String, q: Dictionary) -> void:
	await get_tree().process_frame
	if not is_inside_tree():
		return
	var col: VBoxContainer = CareerUi.modal(self)
	if col == null:
		return
	var title: Label = CareerUi.plain(CareerTheme.T_TITLE_MODAL, CareerTheme.TEXT)
	title.text = I18n.t("YA ESTA")
	title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	col.add_child(title)
	CareerUi.kv(col, I18n.t("PLANO"), I18n.t(nombre))
	CareerUi.kv(col, I18n.t("MUEBLES"), str((q.get("pone", []) as Array).size()))
	CareerUi.kv(col, I18n.t("PAGASTE"), CareerUi.money(int(q.get("precio", 0))))
	var extra: int =(q.get("acomoda", {}) as Dictionary).size()
	if extra > 0:
		CareerUi.line(col, I18n.tf("Y de paso te acomodamos {0} muebles que ya"
			+ " tenías guardados.", [str(extra)]))
	CareerUi.dim(col, I18n.t(
		"Muévelo todo si quieres: la casa ya es tuya y nada está clavado."))
	var listo: Button = CareerUi.primary_cta(I18n.t("LISTO"))
	listo.pressed.connect(func() -> void:
		CareerUi.close_modal(listo))
	col.add_child(listo)





func _planos_cerrar(col: VBoxContainer) -> void:
	var cerrar: Button = Button.new()
	cerrar.custom_minimum_size = Vector2(0, CareerTheme.BTN_SECONDARY_H)
	cerrar.text = I18n.t("CERRAR")
	CareerTheme.apply_button(cerrar, CareerTheme.Kind.GHOST, 24)
	cerrar.pressed.connect(func() -> void:
		CareerUi.close_modal(cerrar))
	col.add_child(cerrar)






















func _aplica_plano(pt: Dictionary) -> void:
	_vaciar_foto()
	var capa: Dictionary = _layout_of().duplicate(true)
	_vaciar_a_cajas(capa, _vaciar_piezas())
	Career.set_floor_paint({})






	capa["tabiques"] = House.plt_gratis(pt, Career.house_finishes)









	if pt.has("aberturas"):
		capa["aberturas"] =(pt["aberturas"] as Array).duplicate(true)
	else:
		capa.erase("aberturas")
	_layout_commit(capa)


	_rebuild_planta()
	_build_furniture()
	_refresh_mode()
	_plano_resultado(String(pt["name"]),
		House.plantilla_paredes(capa["tabiques"] as Array))




func _plano_resultado(nombre: String, n: int) -> void:
	await get_tree().process_frame
	if not is_inside_tree():
		return
	var col: VBoxContainer = CareerUi.modal(self)
	if col == null:
		return
	var title: Label = CareerUi.plain(CareerTheme.T_TITLE_MODAL, CareerTheme.TEXT)
	title.text = I18n.t("YA ESTA")
	title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	col.add_child(title)
	CareerUi.kv(col, I18n.t("PLANO"), I18n.t(nombre))
	CareerUi.kv(col, I18n.t("PAREDES"), str(n))
	CareerUi.dim(col, I18n.t(
		"Muévelas, tíralas o ábreles más puertas: ahora son tuyas."))
	var deshacer: Button = Button.new()
	deshacer.custom_minimum_size = Vector2(0, CareerTheme.BTN_SECONDARY_H)
	deshacer.text = I18n.t("DESHACER")
	CareerTheme.apply_button(deshacer, CareerTheme.Kind.WARN, 24)
	deshacer.pressed.connect(func() -> void:
		_vaciar_deshacer()
		CareerUi.close_modal(deshacer))
	col.add_child(deshacer)
	var listo: Button = CareerUi.primary_cta(I18n.t("LISTO"))
	listo.pressed.connect(func() -> void:
		_vaciar_hay = false
		_vaciar_antes = {}
		_vaciar_pintura_antes = {}
		CareerUi.close_modal(listo))
	_atras_tumbado(listo)
	col.add_child(listo)

























func _arrasar_planta() -> void:
	var ids: Array = _vaciar_piezas()
	var capa0: Dictionary = _layout_of()



	var tabs: int =(_tabs_hoy() as Array).size()
	var cascaron: Array = House.plan_cascaron(_plano(), _level)
	var abiertos: Array = capa0.get("aberturas", []) as Array
	var en_pie: int = 0
	for t in cascaron:
		if House.seg_index(abiertos, t[0], t[1]) < 0:
			en_pie += 1
	var pintadas: int = House.celdas_pintadas(Career.floor_paint_of())
	if ids.is_empty() and tabs == 0 and en_pie == 0 and pintadas == 0:
		_vaciar_aviso(I18n.t("YA ESTA PELADO"), I18n.t(
			"Ni muebles, ni paredes, ni pintura: este terreno ya está pelado."))
		return
	_vaciar_foto()
	var capa: Dictionary = capa0.duplicate(true)
	_vaciar_a_cajas(capa, ids)




	capa["tabiques"] = []
	capa["aberturas"] = cascaron.duplicate(true)
	_layout_commit(capa)
	Career.set_floor_paint({})

	_rebuild_planta()
	_build_furniture()
	_refresh_mode()
	_vaciar_resultado(ids.size(), tabs + en_pie, pintadas)




func _vaciar_aviso(titulo: String, texto: String) -> void:
	await get_tree().process_frame
	if not is_inside_tree():
		return
	var col: VBoxContainer = CareerUi.modal(self)
	if col == null:
		return
	var t: Label = CareerUi.plain(CareerTheme.T_TITLE_MODAL, CareerTheme.TEXT)
	t.text = titulo
	t.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	col.add_child(t)
	CareerUi.dim(col, texto)
	var listo: Button = CareerUi.primary_cta(I18n.t("LISTO"))
	listo.pressed.connect(func() -> void:
		CareerUi.close_modal(listo))
	col.add_child(listo)









func _vaciar_resultado(guardados: int, obra: int, pintadas: int) -> void:
	await get_tree().process_frame
	if not is_inside_tree():
		return
	var col: VBoxContainer = CareerUi.modal(self)
	if col == null:
		return
	var title: Label = CareerUi.plain(CareerTheme.T_TITLE_MODAL, CareerTheme.TEXT)
	title.text = I18n.t("YA ESTA")
	title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	col.add_child(title)
	CareerUi.kv(col, I18n.t("A CAJAS"), str(guardados))


	if obra > 0:
		CareerUi.kv(col, I18n.t("TIRADOS"), str(obra))
	if pintadas > 0:
		CareerUi.kv(col, I18n.t("DESPINTADO"), str(pintadas))
	CareerUi.dim(col, I18n.t(
		"Nada se pierde: todo lo que compraste sigue en tu inventario."))
	var deshacer: Button = Button.new()
	deshacer.custom_minimum_size = Vector2(0, CareerTheme.BTN_SECONDARY_H)
	deshacer.text = I18n.t("DESHACER")
	CareerTheme.apply_button(deshacer, CareerTheme.Kind.WARN, 24)
	deshacer.pressed.connect(func() -> void:
		_vaciar_deshacer()
		CareerUi.close_modal(deshacer))
	col.add_child(deshacer)
	var listo: Button = CareerUi.primary_cta(I18n.t("LISTO"))
	listo.pressed.connect(func() -> void:


		_vaciar_hay = false
		_vaciar_antes = {}
		_vaciar_pintura_antes = {}
		CareerUi.close_modal(listo))
	_atras_tumbado(listo)
	col.add_child(listo)


func _vaciar_deshacer() -> void:
	if not _vaciar_hay:
		return
	_layout_commit(_vaciar_antes.duplicate(true), false)
	Career.set_floor_paint(_vaciar_pintura_antes.duplicate(true))
	_vaciar_hay = false
	_vaciar_antes = {}
	_vaciar_pintura_antes = {}
	_rebuild_planta()
	_build_furniture()
	_refresh_mode()






func _en_inventario(prop: Dictionary) -> bool:
	if prop.get("fijo", false):
		return false
	var req: String = String(prop.get("req", ""))
	if not req.is_empty() and not Career.house_extras.has(req):
		return false
	var life: String = String(prop.get("req_life", ""))
	if not life.is_empty() and not Career.lifestyle.has(life):
		return false
	return true




func _pick_prop() -> void:
	var prop: Dictionary = _edit_target()
	if prop.is_empty():
		return
	_carry = String(prop["id"])
	_carry_face = House.base_face(prop)
	var ov: Dictionary = _layout_of().get(_carry, {})
	if ov.has("face"):
		_carry_face = int(ov["face"])&3
	_carry_pos =(prop["rect"] as Rect2).position



	_layout_set(_carry, {"pos": _carry_pos, "face": _carry_face, "guardado": true})
	_build_furniture()
	_carry_step()




func _spin_prop() -> void:



	if _wall_on:
		_wall_spin()
		return
	if _carry.is_empty():
		return
	var base: Dictionary = _base_prop(_carry)
	var nueva: int =(_carry_face + 1)&3
	_carry_pos = House.rotate_pos(base, _carry_face, nueva, _carry_pos)
	_carry_face = nueva
	_carry_step(false)




func _drop_prop() -> void:
	if _carry.is_empty() or not _carry_ok:
		return
	_layout_set(_carry, {"pos": _carry_pos, "face": _carry_face, "guardado": false})
	_carry = ""
	_clear_ghost()
	_build_furniture()
	_refresh_mode()



func _stash_prop() -> void:
	if _carry.is_empty():
		return
	_layout_set(_carry, {"pos": _carry_pos, "face": _carry_face, "guardado": true})
	_carry = ""
	_clear_ghost()
	_build_furniture()
	_refresh_mode()




func _cancel_carry() -> void:
	if _carry.is_empty():
		return
	var ov: Dictionary = _layout_of().get(_carry, {})
	if bool(ov.get("nuevo", false)):
		_layout_del(_carry)
	else:
		_layout_set(_carry, {"pos": _carry_pos, "face": _carry_face, "guardado": false})
	_carry = ""
	_clear_ghost()
	_build_furniture()
	_refresh_mode()






func _carry_step(seguir: bool = true) -> void:
	if _carry.is_empty():
		return
	var base: Dictionary = _base_prop(_carry)
	if seguir:
		var r0: Rect2 = House.prop_rect(base, _carry_face, Vector2.ZERO)








		var f0: Vector2 = _focus()
		var frente: Vector2 = Vector2(f0.x - r0.size.x * 0.5, f0.y + 0.55)
		_carry_pos = House.snap_pos(frente, base, _carry_face)
	var r: Rect2 = House.prop_rect(base, _carry_face, _carry_pos)



	var pl: Dictionary = _plano()
	var props: Array =(pl["props"] as Array).duplicate()
	var idx: int = -1
	for i in props.size():
		if String(props[i].get("id", "")) == _carry:
			idx = i
	if idx >= 0:
		var copia: Dictionary =(props[idx] as Dictionary).duplicate(true)
		copia["rect"] = r


		if not copia.has("face_fab"):
			copia["face_fab"] = House.base_face(props[idx] as Dictionary)
		copia["face"] = _carry_face
		copia["guardado"] = false
		props[idx] = copia

		var mal: PackedStringArray = House.plan_place_ok(
			{"rooms": pl["rooms"], "props": props, "tabiques": pl.get("tabiques", [])},
			idx, _pos)
		_carry_ok = mal.is_empty()
		_carry_why = "" if _carry_ok else String(mal[0])
	_show_ghost(base, r)
	_refresh_mode()
















func _show_ghost(base: Dictionary, r: Rect2) -> void:
	var sig: String = "%s|%d|%s" % [str(r), _carry_face, str(_carry_ok)]
	if _ghost != null and is_instance_valid(_ghost) and sig == _ghost_sig:
		return
	_clear_ghost()
	_ghost_sig = sig
	_ghost = Node3D.new()
	viewport.add_child(_ghost)



	var antes: Node3D = _box_parent
	_box_parent = _ghost
	var copia: Dictionary = base.duplicate(true)
	copia["rect"] = r









	copia["face_fab"] = House.base_face(base)
	copia["face"] = _carry_face
	copia["guardado"] = false
	_add_prop(copia)
	_box_parent = antes
	_ghostify(_ghost)




	var g_y: float = float(base.get("y", 1.5)) \
			if House.HANG_KINDS.has(String(base.get("kind", ""))) else 0.02














	var col_h: Color = CareerTheme.GOOD if _carry_ok else CareerTheme.DANGER





	var halo: MeshInstance3D = MeshInstance3D.new()
	var halo_box: BoxMesh = BoxMesh.new()
	halo_box.size = Vector3(r.size.x + 0.12, 0.018, r.size.y + 0.12)
	var halo_mat: StandardMaterial3D = StandardMaterial3D.new()
	halo_mat.albedo_color = Color(col_h.r, col_h.g, col_h.b, 0.85)
	halo_mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	halo_mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	halo_mat.no_depth_test = true
	halo_mat.render_priority = -3
	halo_box.material = halo_mat
	halo.mesh = halo_box
	halo.position = Vector3(r.get_center().x, g_y - 0.001, r.get_center().y)
	_ghost.add_child(halo)
	var cols: int = maxi(1, int(round(r.size.x / House.CELDA)))
	var rows: int = maxi(1, int(round(r.size.y / House.CELDA)))
	var cw: float = r.size.x / float(cols)
	var ch: float = r.size.y / float(rows)
	for ix in cols:
		for iz in rows:
			var cmat: StandardMaterial3D = StandardMaterial3D.new()
			cmat.albedo_color = Color(col_h.r, col_h.g, col_h.b, 0.72)
			cmat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
			cmat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
			cmat.no_depth_test = true
			cmat.render_priority = -2
			var cbox: BoxMesh = BoxMesh.new()
			cbox.size = Vector3(cw * 0.86, 0.02, ch * 0.86)
			cbox.material = cmat
			var cel: MeshInstance3D = MeshInstance3D.new()
			cel.mesh = cbox
			cel.position = Vector3(
				r.position.x +(float(ix) + 0.5) * cw, g_y,
				r.position.y +(float(iz) + 0.5) * ch)
			_ghost.add_child(cel)


	var dir: Vector2 = House.FACE_DIR[_carry_face]
	var largo: float =(r.size.y if absf(dir.y) > 0.5 else r.size.x)
	var ceja: MeshInstance3D = MeshInstance3D.new()
	var cb: BoxMesh = BoxMesh.new()
	cb.size = Vector3(r.size.x *(0.9 if absf(dir.y) > 0.5 else 0.14),
		0.03, r.size.y *(0.14 if absf(dir.y) > 0.5 else 0.9))
	var cm: StandardMaterial3D = StandardMaterial3D.new()
	cm.albedo_color = Color(1, 1, 1, 0.9)
	cm.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	cm.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	cm.no_depth_test = true


	cm.render_priority = -1
	cb.material = cm
	ceja.mesh = cb
	ceja.position = Vector3(r.get_center().x, g_y + 0.005, r.get_center().y) \
			+ Vector3(dir.x, 0.0, dir.y) *(largo * 0.42)
	_ghost.add_child(ceja)













func _ghostify(root: Node3D) -> void:
	_purge_walls(root)
	_ghost_translu(root, CareerTheme.GOOD if _carry_ok else CareerTheme.DANGER)


func _ghost_translu(n: Node, tinte: Color) -> void:
	for hijo in n.get_children():
		if hijo.has_meta("alberca_agua"):
			hijo.call("hacer_fantasma", tinte)
		elif hijo is MeshInstance3D:
			var mesh: Mesh =(hijo as MeshInstance3D).mesh
			var mat: Material = null
			if mesh is BoxMesh:
				mat =(mesh as BoxMesh).material
			elif mesh is CylinderMesh:
				mat =(mesh as CylinderMesh).material
			if mat is StandardMaterial3D:
				var sm: StandardMaterial3D = mat






				sm.albedo_color = sm.albedo_color.lerp(tinte, 0.28)
				sm.albedo_color.a = 0.88
				sm.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
				sm.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
				sm.no_depth_test = true
		if hijo.get_child_count() > 0:
			_ghost_translu(hijo, tinte)













func _purge_walls(root: Node) -> void:
	var vivos: Array = []
	for w in _walls:
		var rt: Variant = w.get("root")
		if rt == root:
			continue
		if rt == null or not is_instance_valid(rt):
			continue
		if root != null and is_instance_valid(root) and root.is_ancestor_of(rt):
			continue
		vivos.append(w)
	_walls = vivos


func _clear_ghost() -> void:
	if _ghost != null and is_instance_valid(_ghost):
		_purge_walls(_ghost)
		_ghost.queue_free()
	_ghost = null
	_ghost_sig = ""




func _base_prop(id: String) -> Dictionary:
	for p in House.plan_base(_level)["props"]:
		if String(p.get("id", "")) == id:
			return p











	for p in House.item_props():
		if String(p.get("id", "")) == id:
			return p
	return {}







func _focus() -> Vector2:
	return _cursor if _grid_on else _pos





func _cursor_move(step: Vector2) -> void:
	var b: Rect2 = House.plan_bounds(_plano()).grow(1.0)
	_cursor = Vector2(clampf(_cursor.x + step.x, b.position.x, b.end.x),
		clampf(_cursor.y + step.y, b.position.y, b.end.y))
	_place_cursor()
	if not _grids.is_empty() and _grids[0].visible:
		_grid_focus()
	if not _carry.is_empty():
		_carry_step()
	elif _wall_on:
		_wall_aim()
		_wall_brocha_pinta()
	elif _brocha_on:



		_brocha_pinta(_cursor)
	_refresh_mode()



func _tick_cursor(delta: float) -> void:
	_cursor_t += delta
	_place_cursor()


func _place_cursor() -> void:
	if _cursor_node == null or not is_instance_valid(_cursor_node):
		return
	_cursor_node.position = Vector3(_cursor.x,
		CURSOR_Y + sin(_cursor_t * 2.4) * CURSOR_BOB, _cursor.y)



	if _cursor_shadow != null and is_instance_valid(_cursor_shadow):
		_cursor_shadow.position = Vector3(
			snappedf(_cursor.x, House.CELDA), 0.03,
			snappedf(_cursor.y, House.CELDA))
	if _cursor_stem != null and is_instance_valid(_cursor_stem):
		_cursor_stem.position = Vector3(_cursor.x, CURSOR_Y * 0.5, _cursor.y)






func _build_cursor() -> void:
	if _cursor_node != null and is_instance_valid(_cursor_node):
		return
	_cursor_node = Node3D.new()
	viewport.add_child(_cursor_node)
	var antes: Node3D = _box_parent
	_box_parent = _cursor_node
	var verde: Color = CareerTheme.GOOD




	_add_box(Vector3(0.0, 0.22, 0.0), Vector3(0.42, 0.4, 0.18), verde, 2)
	_add_box(Vector3(0.0, -0.1, -0.04), Vector3(0.14, 0.36, 0.14),
		verde.lightened(0.25), 2)
	_add_box(Vector3(0.0, 0.48, 0.05), Vector3(0.32, 0.18, 0.15),
		verde.darkened(0.3), 2)
	_box_parent = antes



	var tallo: MeshInstance3D = MeshInstance3D.new()
	var tm: BoxMesh = BoxMesh.new()
	tm.size = Vector3(0.035, CURSOR_Y, 0.035)
	var tmat: StandardMaterial3D = StandardMaterial3D.new()
	tmat.albedo_color = Color(verde.r, verde.g, verde.b, 0.35)
	tmat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	tmat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	tm.material = tmat
	tallo.mesh = tm
	_cursor_node.add_child(tallo)
	tallo.top_level = true
	_cursor_stem = tallo




	for hijo in _cursor_node.get_children():
		if hijo is MeshInstance3D and (hijo as MeshInstance3D).mesh is BoxMesh:
			var mm: StandardMaterial3D = \
					((hijo as MeshInstance3D).mesh as BoxMesh).material
			if mm != null:
				mm.no_depth_test = true


	var pisada: MeshInstance3D = MeshInstance3D.new()
	var pm: BoxMesh = BoxMesh.new()
	pm.size = Vector3(House.CELDA * 0.9, 0.04, House.CELDA * 0.9)
	var mt: StandardMaterial3D = StandardMaterial3D.new()
	mt.albedo_color = Color(verde.r, verde.g, verde.b, 0.42)
	mt.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	mt.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mt.no_depth_test = true
	pm.material = mt
	pisada.mesh = pm
	_cursor_node.add_child(pisada)

	pisada.top_level = true
	_cursor_shadow = pisada





const SPOT_SECS: float = 4.0
var _spot: MeshInstance3D = null
var _spot_left: float = 0.0


func _spot_show(r: Rect2) -> void:
	_spot_clear()
	_spot = MeshInstance3D.new()
	var bm: BoxMesh = BoxMesh.new()
	bm.size = Vector3(r.size.x + 0.1, 0.08, r.size.y + 0.1)
	var mt: StandardMaterial3D = StandardMaterial3D.new()
	mt.albedo_color = Color(CareerTheme.MONEY.r, CareerTheme.MONEY.g,
		CareerTheme.MONEY.b, 0.5)
	mt.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	mt.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED


	mt.no_depth_test = true
	bm.material = mt
	_spot.mesh = bm
	_spot.position = Vector3(r.get_center().x, 0.06, r.get_center().y)
	viewport.add_child(_spot)
	_spot_left = SPOT_SECS


func _spot_clear() -> void:
	if _spot != null and is_instance_valid(_spot):
		_spot.queue_free()
	_spot = null
	_spot_left = 0.0


func _clear_cursor() -> void:
	_spot_clear()
	if _cursor_node != null and is_instance_valid(_cursor_node):
		_cursor_node.queue_free()
	_cursor_node = null
	_cursor_shadow = null
	_cursor_stem = null







func _edit_target() -> Dictionary:
	var cerca: Array = _edit_candidates()
	if cerca.is_empty():
		return {}
	return cerca[clampi(_pick_i, 0, cerca.size() - 1)]










func _edit_candidates() -> Array:
	var out: Array = []
	for prop in (_plano()["props"] as Array):
		if prop.get("fijo", false):
			continue
		if bool(prop.get("guardado", false)):
			continue
		if not _prop_visible(prop):
			continue
		var r: Rect2 = prop["rect"]
		var f: Vector2 = _focus()
		var c: Vector2 = Vector2(clampf(f.x, r.position.x, r.end.x),
			clampf(f.y, r.position.y, r.end.y))
		var d: float = c.distance_to(f)
		if d < 1.6:
			out.append({"d": d, "p": prop})
	out.sort_custom(func(a, b): return float(a["d"]) < float(b["d"]))
	var solo: Array = []
	for e in out:
		solo.append(e["p"])
	return solo




func _toggle_wall_mode() -> void:
	_wall_on = not _wall_on


	_wall_from = Vector2.INF
	_reach_antes = -1
	if _wall_on:



		_wall_aim()
	else:
		_clear_wall_ghost()
	_refresh_mode()


























func _tap_wall_mat() -> void:
	if _wall_brocha_on:
		_wall_brocha_on = false
		_refresh_mode()
		return
	_open_wall_mat()


func _open_wall_mat() -> void:
	if CareerUi.modal_open(self):
		return
	var tabs: Array = _tabs_hoy() as Array
	var idx: int = _wall_at(tabs, _wall_a, _wall_b)
	if idx < 0:
		return
	var actual: String = House.wall_finish(tabs[idx])
	var col: VBoxContainer = CareerUi.modal(self)
	var t: Label = CareerUi.plain(28, CareerTheme.TEXT)
	t.text = I18n.t("MATERIAL DE ESTA PARED")
	col.add_child(t)
	var flow: HFlowContainer = HFlowContainer.new()
	flow.add_theme_constant_override("h_separation", 8)
	flow.add_theme_constant_override("v_separation", 8)
	col.add_child(flow)

	var opciones: Array = [{"id": "", "name": "EL DE LA CASA",
		"color": _pal.get("wall", WALL_COL)}]
	for a in House.PAREDES:
		if House.acabado_owned(String((a as Dictionary)["id"]), Career.house_finishes):
			opciones.append(a)
	for o in opciones:
		flow.add_child(_wall_mat_tile(o as Dictionary, actual, idx))














	var todas: Button = CareerUi.accion("pincel", I18n.t("PINTAR TODAS LAS PAREDES"),
		CareerTheme.NAV_CASA)
	todas.custom_minimum_size = Vector2(0, 92)
	todas.pressed.connect(func() -> void:
		_set_wall_finish_all(actual if _wall_brocha.is_empty() and actual != "" \
				else _wall_brocha)
		CareerUi.close_top_modal(self)
		_refresh_mode())
	col.add_child(todas)
	var t2: Label = CareerUi.plain(28, CareerTheme.TEXT)
	t2.text = I18n.t("MARCOS DE TODA LA CASA")
	col.add_child(t2)
	CareerUi.dim(col, I18n.t(
		"Puertas, ventanas, corredizas, rodapiés y remates."))




	var flow2: GridContainer = GridContainer.new()
	flow2.columns = 2
	flow2.add_theme_constant_override("h_separation", 8)
	flow2.add_theme_constant_override("v_separation", 8)
	col.add_child(flow2)
	var puesto: String = String(_acabados_puestos().get("trim",
		House.ACABADO_BASE["trim"]))
	for a in House.CARPINTERIAS:
		var ca: Dictionary = a as Dictionary
		var cid: String = String(ca["id"])
		var mio: bool = House.acabado_owned(cid, Career.house_finishes)
		var precio: int = int(ca.get("price", 0))
		var b: Button = Button.new()


		b.custom_minimum_size = Vector2(0, 92)
		b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		b.clip_text = true
		b.text = I18n.t(String(ca["name"])) if mio \
				else "%s · %s" % [I18n.t(String(ca["name"])), CareerUi.money(precio)]


		CareerTheme.apply_button_accent(b, ca["color"] as Color, 16)
		b.disabled = cid == puesto or (not mio and not Career.can_afford(precio))
		b.pressed.connect(func() -> void:


			if mio:
				Career.equip_finish(cid)
			elif not Career.buy_finish(cid):
				return


			_undo.clear()
			CareerUi.close_top_modal(self)


			_pal = House.palette_for(_level, Career.house_extras,
				CareerTheme.accent(), _acabados_puestos(), _acabados_puestos_ids())
			_carga_perimetro(_acabados(), _acabados_tuyos())
			_rebuild_planta()
			_build_furniture()
			_refresh_mode())
		flow2.add_child(b)
	var cerrar: Button = Button.new()
	cerrar.custom_minimum_size = Vector2(0, 92)
	cerrar.text = I18n.t("CERRAR")
	CareerTheme.apply_button(cerrar, CareerTheme.Kind.NEUTRAL, 22)
	cerrar.pressed.connect(func() -> void: CareerUi.close_top_modal(self))
	col.add_child(cerrar)



func _wall_mat_tile(o: Dictionary, actual: String, idx: int) -> Control:
	var id: String = String(o.get("id", ""))
	var b: Button = Button.new()



	b.custom_minimum_size = Vector2(330, 92)
	CareerTheme.apply_button(b,
		CareerTheme.Kind.PRIMARY if id == actual else CareerTheme.Kind.NEUTRAL, 20)
	var row: HBoxContainer = HBoxContainer.new()
	row.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	row.offset_left = 16.0
	row.offset_right = -16.0
	row.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row.add_theme_constant_override("separation", 14)
	b.add_child(row)
	var sw: PanelContainer = PanelContainer.new()
	sw.custom_minimum_size = Vector2(52, 52)
	sw.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	sw.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = o.get("color", WALL_COL)
	sb.border_color = Color(CareerTheme.TEXT.r, CareerTheme.TEXT.g,
		CareerTheme.TEXT.b, 0.35)
	sb.set_border_width_all(2)
	sw.add_theme_stylebox_override("panel", sb)
	row.add_child(sw)
	var nl: Label = CareerUi.plain(20, CareerTheme.TEXT)
	nl.text = I18n.t(String(o.get("name", "")))
	nl.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	nl.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	nl.clip_text = true
	nl.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	nl.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row.add_child(nl)
	if id == actual:
		b.disabled = true
	else:
		b.pressed.connect(func() -> void:
			_set_wall_finish(idx, id)


			_wall_brocha = id
			_wall_brocha_on = true
			CareerUi.close_top_modal(self)
			_refresh_mode())
	return b






func _set_wall_finish_all(id: String) -> void:
	var capa: Dictionary = _layout_of().duplicate()
	var lista: Array =(_tabs_hoy() as Array).duplicate()
	if lista.is_empty():
		return
	for i in lista.size():
		lista[i] = House.with_finish(lista[i] as Array, id)
	capa["tabiques"] = lista
	_layout_commit(capa)
	_build_furniture()
	_refresh_mode()









func _wall_brocha_pinta() -> void:
	if not _wall_brocha_on or _wall_from != Vector2.INF:
		return
	var tabs: Array = _tabs_hoy() as Array
	var idx: int = _wall_at(tabs, _wall_a, _wall_b)
	if idx < 0 or House.wall_finish(tabs[idx]) == _wall_brocha:
		return
	_set_wall_finish(idx, _wall_brocha)




func _set_wall_finish(idx: int, id: String) -> void:
	var capa: Dictionary = _layout_of().duplicate()
	var lista: Array =(_tabs_hoy() as Array).duplicate()
	if idx < 0 or idx >= lista.size():
		return
	lista[idx] = House.with_finish(lista[idx] as Array, id)
	capa["tabiques"] = lista
	_layout_commit(capa)




	_build_furniture()
	_refresh_mode()







func _row_look() -> void:
	var alguno: bool = false
	for c in _row_libre.get_children():
		if c is Control and (c as Control).visible:
			alguno = true
			break
	_row_libre.visible = alguno
	if _grid_on:
		_exit_btn.visible = false
		if _calle_btn != null:
			_calle_btn.visible = false
		_train_btn.visible = false





func _wall_spin() -> void:
	_wall_flip = not _wall_flip
	_wall_aim()
	_refresh_mode()











func _wall_law_cached() -> bool:
	var sig: String = "%s|%s|%d" % [str(_wall_a), str(_wall_b), hash(_layout_of())]
	if sig == _wall_sig:
		return true
	_wall_sig = sig
	return false


func _wall_aim() -> void:
	if not _wall_on:
		return
	var d: float = House.CELDA
	var fw: Vector2 = _focus()
	if _wall_from != Vector2.INF:





		var dif: Vector2 = fw - _wall_from
		var fin: Vector2 = _wall_from




		if (absf(dif.x) >= absf(dif.y)) != _wall_flip:
			fin.x = snappedf(fw.x, d)
		else:
			fin.y = snappedf(fw.y, d)


		if fin.distance_to(_wall_from) < d * 0.5:


			if (absf(dif.x) >= absf(dif.y)) != _wall_flip:
				fin.x = _wall_from.x +(d if dif.x >= 0.0 else - d)
			else:
				fin.y = _wall_from.y +(d if dif.y >= 0.0 else - d)
		_wall_a = _wall_from
		_wall_b = fin
		if _wall_law_cached():
			_show_wall_ghost()
			return
		var pl2: Dictionary = _plano()
		var mal2: PackedStringArray = House.plan_wall_ok(pl2, _wall_a, _wall_b,
			Career.house_extras, _pos, _reach_antes)
		_wall_ok = mal2.is_empty()
		_wall_why = "" if _wall_ok else String(mal2[0])
		_show_wall_ghost()
		return



	var co: Vector2 = Vector2(floorf(fw.x / d) * d, floorf(fw.y / d) * d)


	var off: Vector2 = fw -(co + Vector2(d * 0.5, d * 0.5))


	if (absf(off.x) >= absf(off.y)) != _wall_flip:
		var x: float = co.x +(d if off.x >= 0.0 else 0.0)
		_wall_a = Vector2(x, co.y)
		_wall_b = Vector2(x, co.y + d)
	else:
		var z: float = co.y +(d if off.y >= 0.0 else 0.0)
		_wall_a = Vector2(co.x, z)
		_wall_b = Vector2(co.x + d, z)
	if _wall_law_cached():
		_show_wall_ghost()
		return
	var pl: Dictionary = _plano()



	var mal: PackedStringArray = House.plan_wall_ok(pl, _wall_a, _wall_b,
		Career.house_extras, _pos, _reach_antes)
	_wall_ok = mal.is_empty()
	_wall_why = "" if _wall_ok else String(mal[0])
	_show_wall_ghost()





func _do_wall() -> void:


	if _wall_from == Vector2.INF:
		var capa0: Dictionary = _layout_of().duplicate()
		var lista0: Array =(_tabs_hoy() as Array).duplicate()
		var j: int = _wall_at(lista0, _wall_a, _wall_b)
		if j >= 0:










			var fuera: Array = _tabs_en_linea(lista0, j)
			fuera.reverse()
			for k in fuera:
				lista0.remove_at(int(k))
			capa0["tabiques"] = lista0
			_layout_commit(capa0)
			_build_furniture()
			_rebuild_walls()
			_wall_aim()
			_refresh_mode()
			return






		if _toggle_shell():
			return




		_wall_from = _wall_a

		_reach_antes = -1
		_wall_aim()
		_refresh_mode()
		return

	if not _wall_ok:
		return
	var capa: Dictionary = _layout_of().duplicate()
	var lista: Array =(_tabs_hoy() as Array).duplicate()
	lista.append([_wall_a, _wall_b])
	capa["tabiques"] = lista
	_layout_commit(capa)
	_wall_from = Vector2.INF
	_reach_antes = -1
	_build_furniture()
	_rebuild_walls()
	_wall_aim()
	_refresh_mode()
















func _tabs_en_linea(tabs: Array, i: int) -> Array:
	if i < 0 or i >= tabs.size():
		return []
	var eps: float = 0.01
	var out: Array = [i]
	var crecio: bool = true
	while crecio:
		crecio = false
		for j in tabs.size():
			if out.has(j):
				continue
			for k in out:
				if not _tabs_pegados(tabs[k], tabs[j], eps):
					continue
				out.append(j)
				crecio = true
				break
	out.sort()
	return out



func _tabs_pegados(a: Array, b: Array, eps: float) -> bool:
	if a.size() < 2 or b.size() < 2:
		return false
	var av: bool = absf((a[1] as Vector2).x -(a[0] as Vector2).x) < eps
	var bv: bool = absf((b[1] as Vector2).x -(b[0] as Vector2).x) < eps
	if av != bv:
		return false


	var afix: float =(a[0] as Vector2).x if av else (a[0] as Vector2).y
	var bfix: float =(b[0] as Vector2).x if bv else (b[0] as Vector2).y
	if absf(afix - bfix) > eps:
		return false
	var a0: float = minf((a[0] as Vector2).y,(a[1] as Vector2).y) if av \
			else minf((a[0] as Vector2).x,(a[1] as Vector2).x)
	var a1: float = maxf((a[0] as Vector2).y,(a[1] as Vector2).y) if av \
			else maxf((a[0] as Vector2).x,(a[1] as Vector2).x)
	var b0: float = minf((b[0] as Vector2).y,(b[1] as Vector2).y) if bv \
			else minf((b[0] as Vector2).x,(b[1] as Vector2).x)
	var b1: float = maxf((b[0] as Vector2).y,(b[1] as Vector2).y) if bv \
			else maxf((b[0] as Vector2).x,(b[1] as Vector2).x)


	return maxf(a0, b0) <= minf(a1, b1) + eps




func _tabs_rect(tabs: Array, idxs: Array) -> Rect2:
	var out: Rect2 = Rect2()
	var primero: bool = true
	for i in idxs:
		var r: Rect2 = House.tabique_rect(tabs[i][0], tabs[i][1])
		out = r if primero else out.merge(r)
		primero = false
	return out



























var _run_mem: Dictionary = {}


func _shell_run(a: Vector2, b: Vector2) -> Array:




	var sig: String = "%s|%s|%d" % [str(a), str(b), hash(_layout_of())]
	if _run_mem.has(sig):
		return _run_mem[sig] as Array
	var d: float = House.CELDA
	var pl: Dictionary = _plano()
	var abiertos: Array = _layout_of().get("aberturas", []) as Array
	var paso: Vector2 =(b - a).normalized() * d
	var ini: Vector2 = a
	var fin: Vector2 = b
	for signo in [-1.0, 1.0]:
		var p: Vector2 =(a if signo < 0.0 else b)
		for _i in 128:
			var q: Vector2 = p + paso * signo
			if not House.is_perimeter_wall(pl, p, q, _level):
				break
			if _wall_at(abiertos, p, q) >= 0:
				break
			p = q
		if signo < 0.0:
			ini = p
		else:
			fin = p



	_run_mem = {sig: [ini, fin]}
	return [ini, fin]


func _toggle_shell() -> bool:
	var capa: Dictionary = _layout_of().duplicate()
	var abiertos: Array =(capa.get("aberturas", []) as Array).duplicate()
	var k: int = _wall_at(abiertos, _wall_a, _wall_b)
	if k >= 0:








		return false
	else:
		var pl: Dictionary = _plano()
		if not House.is_perimeter_wall(pl, _wall_a, _wall_b, _level):
			return false








		var run: Array = _shell_run(_wall_a, _wall_b)
		abiertos.append([run[0], run[1]])
	capa["aberturas"] = abiertos
	_layout_commit(capa)
	_rebuild_walls()



	_wall_sig = ""
	_wall_aim()
	_refresh_mode()
	return true









func _shell_tapa() -> void:
	var capa: Dictionary = _layout_of().duplicate()
	var abiertos: Array =(capa.get("aberturas", []) as Array).duplicate()
	var k: int = _wall_at(abiertos, _wall_a, _wall_b)
	if k < 0:
		return


	abiertos.remove_at(k)
	capa["aberturas"] = abiertos
	_layout_commit(capa)
	_rebuild_walls()
	_wall_sig = ""
	_wall_aim()
	_refresh_mode()

















func _wall_corner() -> void:
	if _wall_from == Vector2.INF or not _wall_ok:
		return
	var capa: Dictionary = _layout_of().duplicate()
	var lista: Array =(_tabs_hoy() as Array).duplicate()
	lista.append([_wall_a, _wall_b])
	capa["tabiques"] = lista
	_layout_commit(capa)

	_wall_from = _wall_b





	_wall_flip = false



	_reach_antes = -1
	_wall_sig = ""
	_build_furniture()
	_wall_aim()
	_refresh_mode()




func _cancel_wall_trace() -> void:
	if _wall_from == Vector2.INF:
		return
	_wall_from = Vector2.INF
	_reach_antes = -1
	_wall_aim()
	_refresh_mode()











func _do_slide() -> void:
	var capa: Dictionary = _layout_of().duplicate()
	var lista: Array =(_tabs_hoy() as Array).duplicate(true)
	var i: int = _wall_at(lista, _wall_a, _wall_b)
	if i < 0:
		return
	var t: Array = lista[i]
	if House.is_slide(t):


		var nuevo: Array = House.with_finish([t[0], t[1]], House.wall_finish(t))
		if _pared_tapete_rechazada(t, [nuevo], _slide_btn):
			return
		lista[i] = nuevo
	else:
		if not _cabe_corrediza(t):
			return
		var celda: Vector2 = Vector2(minf(_wall_a.x, _wall_b.x),
			minf(_wall_a.y, _wall_b.y))
		var trozos: Array = House.split_wall(t, celda, "corrediza",
			House.CORREDIZA_ANCHO)
		if _pared_tapete_rechazada(t, trozos, _slide_btn):
			return
		lista.remove_at(i)
		for tr in trozos:
			lista.append(tr)
	capa["tabiques"] = lista
	_layout_commit(capa)
	_build_furniture()
	_wall_aim()
	_refresh_mode()



func _cabe_corrediza(t: Array) -> bool:
	return (t[0] as Vector2).distance_to(t[1] as Vector2) \
			>= House.CORREDIZA_ANCHO - 0.01





func _motivo_pared_tapete(antes: Array, nuevos: Array) -> String:
	if not House.is_pass(antes):
		return ""
	for t in nuevos:
		if House.is_pass(t):
			continue
		var muro: Rect2 = House.tabique_rect(t[0], t[1])
		for pr in (_plano()["props"] as Array):
			var prop: Dictionary = pr as Dictionary
			if bool(prop.get("guardado", false)) \
					or not House.BAJO_TODO.has(String(prop.get("kind", ""))):
				continue
			if muro.intersects(prop["rect"] as Rect2):
				return I18n.tf("encima de {0}", [I18n.t(House.kind_name(prop))])
	return ""


func _pared_tapete_rechazada(antes: Array, nuevos: Array, boton: Button) -> bool:
	var motivo: String = _motivo_pared_tapete(antes, nuevos)
	if motivo.is_empty():
		return false
	if boton != null:
		boton.disabled = true
	if _why_lbl != null and _why_card != null:
		_why_set(motivo)
	return true






func _do_door() -> void:
	var capa: Dictionary = _layout_of().duplicate()
	var lista: Array =(_tabs_hoy() as Array).duplicate(true)
	var i: int = _wall_at(lista, _wall_a, _wall_b)
	if i < 0:
		return
	var t: Array = lista[i]
	if House.is_door(t):





		var sig: String = House.next_kind(House.DOOR_KINDS, House.wall_kind(t))
		var nuevo: Array = House.with_finish([t[0], t[1], sig], House.wall_finish(t))
		if _pared_tapete_rechazada(t, [nuevo], _door_btn):
			return
		lista[i] = nuevo
		capa["tabiques"] = lista
		_layout_commit(capa)
		_build_furniture()
		_wall_aim()
		_refresh_mode()
		return
	else:








		var celda: Vector2 = Vector2(minf(_wall_a.x, _wall_b.x),
			minf(_wall_a.y, _wall_b.y))




		var vano_a: Vector2 = celda
		var vano_b: Vector2 = celda +(Vector2(House.PUERTA_ANCHO, 0.0)
			if absf(_wall_b.y - _wall_a.y) < 0.01 else Vector2(0.0, House.PUERTA_ANCHO))
		if not House.door_spot_ok(lista, vano_a, vano_b):
			_icon_cap(_door_btn, "HAY UNA PARED AHI")
			_door_btn.disabled = true
			return
		var trozos: Array = House.split_wall(t, celda)

		if _pared_tapete_rechazada(t, trozos, _door_btn):
			return
		lista.remove_at(i)
		for tr in trozos:
			lista.append(tr)
	capa["tabiques"] = lista
	_layout_commit(capa)
	_build_furniture()
	_wall_aim()
	_refresh_mode()















func _do_window() -> void:
	var capa: Dictionary = _layout_of().duplicate()
	var lista: Array =(_tabs_hoy() as Array).duplicate(true)
	var i: int = _wall_at(lista, _wall_a, _wall_b)
	if i < 0:
		return
	var t: Array = lista[i]
	if House.is_door(t):
		return
	if House.is_window(t):



		var sig: String = House.next_kind(House.WIN_KINDS, House.wall_kind(t))
		var nuevo: Array = House.with_finish([t[0], t[1], sig], House.wall_finish(t))
		if _pared_tapete_rechazada(t, [nuevo], _win_btn):
			return
		lista[i] = nuevo
	else:
		var celda: Vector2 = Vector2(minf(_wall_a.x, _wall_b.x),
			minf(_wall_a.y, _wall_b.y))
		var trozos: Array = House.split_wall(t, celda, "ventana")
		if _pared_tapete_rechazada(t, trozos, _win_btn):
			return
		lista.remove_at(i)
		for tr in trozos:
			lista.append(tr)
	capa["tabiques"] = lista
	_layout_commit(capa)
	_build_furniture()
	_wall_aim()
	_refresh_mode()



















func _tabs_hoy() -> Array:
	return _plano().get("tabiques", []) as Array










func _wall_at(lista: Array, a: Vector2, b: Vector2) -> int:
	return House.seg_index(lista, a, b)




func _show_wall_ghost() -> void:
	_clear_wall_ghost()
	var r: Rect2 = House.tabique_rect(_wall_a, _wall_b)










	var quita: bool = _wall_from == Vector2.INF \
			and (_wall_at((_tabs_hoy() as Array),
				_wall_a, _wall_b) >= 0 \
						or (House.is_perimeter_wall(_plano(),
					_wall_a, _wall_b, _level) \
							and _wall_at((_layout_of().get("aberturas", []) as Array),
					_wall_a, _wall_b) < 0))




	if quita and _wall_from == Vector2.INF:
		var tabs_g: Array = _tabs_hoy() as Array
		var ig: int = _wall_at(tabs_g, _wall_a, _wall_b)
		if ig >= 0:

			r = _tabs_rect(tabs_g, _tabs_en_linea(tabs_g, ig))
		elif _wall_at((_layout_of().get("aberturas", []) as Array),
				_wall_a, _wall_b) < 0:
			var run: Array = _shell_run(_wall_a, _wall_b)
			r = House.tabique_rect(run[0], run[1])
	_wall_ghost = MeshInstance3D.new()
	var bm: BoxMesh = BoxMesh.new()
	bm.size = Vector3(r.size.x, WALL_H, r.size.y)
	var mt: StandardMaterial3D = StandardMaterial3D.new()
	var col: Color = CareerTheme.MONEY if quita \
			else (CareerTheme.GOOD if _wall_ok else CareerTheme.DANGER)
	mt.albedo_color = Color(col.r, col.g, col.b, 0.4)
	mt.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	mt.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mt.no_depth_test = true
	bm.material = mt
	_wall_ghost.mesh = bm
	_wall_ghost.position = Vector3(r.get_center().x, WALL_H * 0.5, r.get_center().y)
	viewport.add_child(_wall_ghost)


func _clear_wall_ghost() -> void:
	if _wall_ghost != null and is_instance_valid(_wall_ghost):
		_wall_ghost.queue_free()
	_wall_ghost = null












func _rebuild_walls() -> void:
	_cubierta_casa_sucia = true
	if _muros != null and is_instance_valid(_muros):
		_purge_walls(_muros)
		_muros.queue_free()
	_muros = Node3D.new()
	_muros.name = "Muros"
	viewport.add_child(_muros)
	var antes: Node3D = _box_parent
	_box_parent = _muros
	_add_walls()
	_add_wall_corner_posts()
	_box_parent = antes




func _pick_next() -> void:
	var n: int = _edit_candidates().size()
	if n <= 1:
		return
	_pick_i =(_pick_i + 1) % n
	_refresh_mode()





func _show_aura(prop: Dictionary) -> void:
	if prop.is_empty():
		_clear_aura()
		return
	var r: Rect2 = prop["rect"]



	if _aura == null or not is_instance_valid(_aura):
		_aura = MeshInstance3D.new()
		var bm: BoxMesh = BoxMesh.new()
		var mt: StandardMaterial3D = StandardMaterial3D.new()
		mt.albedo_color = Color(CareerTheme.GOOD.r, CareerTheme.GOOD.g,
			CareerTheme.GOOD.b, 0.5)
		mt.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
		mt.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED


		mt.no_depth_test = true
		bm.material = mt
		_aura.mesh = bm
		viewport.add_child(_aura)
	(_aura.mesh as BoxMesh).size = Vector3(r.size.x + 0.08, 0.06, r.size.y + 0.08)
	_aura.position = Vector3(r.get_center().x, 0.05, r.get_center().y)


func _clear_aura() -> void:
	if _aura != null and is_instance_valid(_aura):
		_aura.queue_free()
	_aura = null




func _layout_of() -> Dictionary:
	return Career.house_layout.get(House.layout_key(_level), {})















func _layout_commit(capa: Dictionary, historial: bool = true) -> void:
	if historial:
		_undo_push()
	Career.house_layout[House.layout_key(_level)] = capa
	_layout_dirty = true

	_pl_dirty()





func _layout_flush() -> void:
	if not _layout_dirty:
		return
	_layout_dirty = false
	Career._save()







func _al_vecindario() -> void:
	_layout_flush()
	Career._save_flush()
	load("res://ui/house/calle.gd").set("origen", "casa")
	SceneFade.to_scene("res://ui/house/calle.tscn")









func _notification(what: int) -> void:
	match what:
		NOTIFICATION_APPLICATION_PAUSED, NOTIFICATION_WM_CLOSE_REQUEST:
			_layout_flush()
		NOTIFICATION_APPLICATION_FOCUS_OUT:
			if OS.has_feature("mobile"):
				_layout_flush()


func _layout_set(id: String, ov: Dictionary) -> void:
	var capa: Dictionary = _layout_of().duplicate()
	capa[id] = ov
	_layout_commit(capa)


func _layout_del(id: String) -> void:
	var capa: Dictionary = _layout_of().duplicate()
	capa.erase(id)
	_layout_commit(capa)








func _mode_sig() -> String:
	if not _grid_on:
		return "off"



	var s: String = "%s|%s|%s|%d|%d" % [_carry, str(_carry_ok), _carry_why, _pick_i,
		_undo.size()]
	if _wall_on:






		return s + "|w|%s|%s|%s|%s|%s|%d" % [str(_wall_a), str(_wall_b),
			str(_wall_ok), _wall_why, str(_wall_from),
			(_layout_of().get("aberturas", []) as Array).size()]
	if _carry.is_empty():
		for p in _edit_candidates():
			s += "|%s%s" % [String(p.get("id", "")),
				str((p["rect"] as Rect2).position)]
	return s




func _refresh_mode() -> void:
	_mode_last = _mode_sig()
	var llevando: bool = not _carry.is_empty()
	var cerca: Array = _edit_candidates() if _grid_on and not llevando else []


	if _pick_i >= cerca.size():
		_pick_i = 0



	_brocha_btn.visible = _grid_on and not llevando and not _wall_on
	_icon_btn_look(_brocha_btn,
		CareerTheme.Kind.PRIMARY if _brocha_on else CareerTheme.Kind.NEUTRAL,
		"material")
	_icon_cap(_brocha_btn, "DEJAR DE PINTAR" if _brocha_on else "PINTAR SUELO")
	_bag_btn.visible = _grid_on and not llevando and not _wall_on





	_vaciar_btn.visible = _grid_on and not llevando and not _wall_on


	_planos_btn.visible = _grid_on and not llevando and not _wall_on
	_wall_btn.visible = _grid_on and not llevando



	_icon_btn_look(_wall_btn,
		CareerTheme.Kind.PRIMARY if _wall_on else CareerTheme.Kind.NEUTRAL,
		"sofa" if _wall_on else "pared")
	_icon_cap(_wall_btn, "MUEBLES" if _wall_on else "PAREDES")
	_other_btn.visible = cerca.size() > 1 and not _wall_on

	_wall_do_btn.visible = _grid_on and _wall_on and not llevando
	_door_btn.visible = false



	_win_btn.visible = false
	_slide_btn.visible = false
	_mat_btn.visible = false
	_corner_btn.visible = false




	_undo_btn.visible = _grid_on and not llevando and not _undo.is_empty()



	_why_set("")
	if _wall_on and not llevando:
		var tabs: Array = _tabs_hoy() as Array
		var idx: int = _wall_at(tabs, _wall_a, _wall_b)
		var hay: bool = idx >= 0
		var trazando: bool = _wall_from != Vector2.INF




		var abiertos: Array = _layout_of().get("aberturas", []) as Array
		var hueco: bool = not trazando \
				and _wall_at(abiertos, _wall_a, _wall_b) >= 0
		var cascaron: bool = not trazando and not hay and not hueco \
				and House.is_perimeter_wall(_plano(),
				_wall_a, _wall_b, _level)



		_mat_btn.visible = hay and not trazando



		_icon_btn_look(_mat_btn,
			CareerTheme.Kind.PRIMARY if _wall_brocha_on else CareerTheme.Kind.NEUTRAL,
			"material")
		_icon_cap(_mat_btn, "DEJAR DE PINTAR" if _wall_brocha_on else "MATERIAL")



		_win_btn.visible = hay and not trazando
		var es_ven: bool = hay and House.is_window(tabs[idx])
		var es_pta: bool = hay and House.is_door(tabs[idx])
		var es_cor: bool = hay and House.is_slide(tabs[idx])





		_slide_btn.visible = hay and not trazando
		var corta: bool = hay and not _cabe_corrediza(tabs[idx])
		_slide_btn.disabled = es_pta or es_ven or (corta and not es_cor)
		_icon_btn_look(_slide_btn,
			CareerTheme.Kind.WARN if es_cor else CareerTheme.Kind.NEUTRAL, "ventana")
		_icon_cap(_slide_btn, "QUITAR CORREDIZA" if es_cor \
				else ("PARED CORTA" if corta else "PONER CORREDIZA"))
		_win_btn.disabled = es_pta or es_cor
		_icon_btn_look(_win_btn,
			CareerTheme.Kind.WARN if es_ven else CareerTheme.Kind.NEUTRAL, "ventana")
		_icon_cap(_win_btn, _cap_ciclo(House.WIN_KINDS,
			House.wall_kind(tabs[idx]) if hay else "", "QUITAR VENTANA"))



		_corner_btn.visible = trazando
		_corner_btn.disabled = not _wall_ok


		_wall_do_btn.disabled =(not hay and not cascaron \
				and not _wall_ok) if not trazando else not _wall_ok



		if _wall_do_btn.disabled:
			_why_set(_wall_why)


		if trazando:
			_icon_btn_look(_wall_do_btn, CareerTheme.Kind.PRIMARY, "check")
			_icon_cap(_wall_do_btn, "FIN DE PARED")
		elif hay:
			_icon_btn_look(_wall_do_btn, CareerTheme.Kind.WARN, "derribar")



			_icon_cap(_wall_do_btn, "TIRAR ESTA PARED" \
					if _tabs_en_linea(tabs, idx).size() <= 1 else "TIRAR TODO EL TRAMO")
		elif cascaron:



			_icon_btn_look(_wall_do_btn, CareerTheme.Kind.WARN, "derribar")
			_icon_cap(_wall_do_btn, "TIRAR TODO EL TRAMO")
		else:




			_icon_btn_look(_wall_do_btn, CareerTheme.Kind.PRIMARY, "pared")
			_icon_cap(_wall_do_btn, "INICIAR PARED")



		if trazando:
			_door_btn.visible = true
			_door_btn.disabled = false
			_icon_btn_look(_door_btn, CareerTheme.Kind.WARN, "cerrar")
			_icon_cap(_door_btn, "CANCELAR TRAZO")
		elif hay:


			_door_btn.visible = true
			_door_btn.disabled = false
			_icon_btn_look(_door_btn, CareerTheme.Kind.NEUTRAL, "puerta")
			_icon_cap(_door_btn, _cap_ciclo(House.DOOR_KINDS,
				House.wall_kind(tabs[idx]), "QUITAR PUERTA"))
		elif hueco:



			_door_btn.visible = true
			_door_btn.disabled = false
			_icon_btn_look(_door_btn, CareerTheme.Kind.NEUTRAL, "pared")
			_icon_cap(_door_btn, "REHACER ESTA PARED")










		_spin_btn.visible = true
		_spin_btn.disabled = false
		for b in [_drop_btn, _stash_btn, _cancel_btn]:
			b.visible = false
		_row_look()





		_move_btn.visible = false
		_prop_set("")
		_clear_aura()
		return


	var otro_txt: String = I18n.tf("OTRO ({0}/{1})", [str(_pick_i + 1),
		str(cerca.size())]) if cerca.size() > 1 else I18n.t("OTRO")
	_other_btn.tooltip_text = otro_txt


	var otro_rot: Label = _other_btn.get_node_or_null("rotulo") as Label
	if otro_rot != null:
		otro_rot.text = "%d/%d" % [_pick_i + 1, cerca.size()] if cerca.size() > 1 \
				else I18n.t("OTRO")
	_move_btn.visible = _grid_on and not llevando and not cerca.is_empty() \
			and not _wall_on
	for b in [_spin_btn, _drop_btn, _stash_btn, _cancel_btn]:
		b.visible = _grid_on and llevando
	_row_look()
	if not llevando:

		if _grid_on and not cerca.is_empty():
			var sel: Dictionary = cerca[clampi(_pick_i, 0, cerca.size() - 1)]
			_show_aura(sel)
			_prop_set(I18n.t(House.kind_name(sel)))
		else:
			_clear_aura()
		return
	_clear_aura()


	_drop_btn.disabled = not _carry_ok



	_drop_btn.text = ""




	_icon_cap(_drop_btn, "PONER AQUI")
	_why_set("" if _carry_ok else _carry_why)


	_prop_set(I18n.t(House.kind_name(_base_prop(_carry))))





func _toggle_grid() -> void:








	if museo or visita:
		return
	_grid_on = not _grid_on





	if _grid_on:
		_cursor = _pos
		_cursor_t = 0.0
		_build_cursor()
		_place_cursor()
	else:
		_clear_cursor()
	if player != null:
		player.visible = not _grid_on
	if not _grid_on and not _carry.is_empty():


		_cancel_carry()
	grid_show(_grid_on)



	_grid_btn.text = I18n.t("TERMINAR") if _grid_on else I18n.t("MODO EDICION")
	_edit_btn_look()
	if not _grid_on:
		_clear_ghost()
		_clear_aura()
		_clear_wall_ghost()
		_wall_on = false
	elif _wall_on:
		_wall_aim()
	_pick_i = 0



	if not _grid_on:
		_layout_flush()
	_refresh_mode()


func grid_show(on: bool) -> void:
	for g in _grids:
		g.visible = on
	if not on:
		for h in _huellas:
			h.visible = false
		return
	_grid_focus()






func _grid_focus() -> void:
	var fp: Vector2 = _focus()
	var f: Vector3 = Vector3(fp.x, 0.0, fp.y)
	for g in _grids:
		(g.material_override as ShaderMaterial).set_shader_parameter("foco", f)





	for h in _huellas:
		var r: Rect2 = h.get_meta("rect", Rect2())
		h.visible = r.grow(House.BODY_R).has_point(fp)
		if h.visible:
			(h.material_override as ShaderMaterial).set_shader_parameter("foco", f)












func _add_tabiques() -> void:
	var wall: Color = _pal.get("wall", WALL_COL)
	var trim: Color = _pal.get("trim", TRIM_COL)
	var tabs: Array = _plano().get("tabiques", [])
	for t in tabs:
		var r: Rect2 = House.tabique_rect(t[0], t[1])
		var c: Vector2 = r.get_center()




		var wc: Color = House.wall_color(t, wall)



		var gr: int = _grano_muro_de(t)




		match House.wall_kind(t):
			"puerta":
				_add_door_tabique(r, c, wc, trim, gr)
				continue
			"doble":
				_add_double_tabique(r, c, wc, trim, gr)
				continue
			"arco":
				_add_arch_tabique(r, c, wc, trim, gr)
				continue
			"corrediza":
				_add_slide_tabique(r, c, wc, trim, gr)
				continue
			"ventana", "ventanal", "ojo_buey":
				_add_window_tabique(r, c, wc, trim, gr, House.wall_kind(t))
				continue
		_grano_muro(_add_box(Vector3(c.x, WALL_H * 0.5, c.y),
			Vector3(r.size.x, WALL_H, r.size.y), wc), wc, _grano_muro_de(t))







		_add_box(Vector3(c.x, WALL_H + 0.03, c.y),
			Vector3(r.size.x + 0.05, 0.06, r.size.y + 0.05), trim, 1)
	_add_tabique_posts(tabs, wall, trim)




















func _add_door_tabique(r: Rect2, c: Vector2, wall: Color, trim: Color,
		grano: int = 0) -> void:



	var alto_vano: float = House.PUERTA_ALTO
	_grano_muro(_add_box(Vector3(c.x,(alto_vano + WALL_H) * 0.5, c.y),
		Vector3(r.size.x, WALL_H - alto_vano, r.size.y), wall, 1), wall, grano)
	_add_box(Vector3(c.x, WALL_H + 0.03, c.y),
		Vector3(r.size.x + 0.05, 0.06, r.size.y + 0.05), trim, 1)

	_add_box(Vector3(c.x, 0.02, c.y),
		Vector3(r.size.x, 0.04, r.size.y), trim)


	var vert: bool = r.size.y > r.size.x
	var ancho: float = maxf(r.size.x, r.size.y)




	var bis: Vector3 = Vector3(c.x, 0.0, c.y - ancho * 0.5) if vert \
			else Vector3(c.x - ancho * 0.5, 0.0, c.y)
	var hinge: Node3D = Node3D.new()
	hinge.position = bis


	var cerrada: float = -90.0 if vert else 0.0
	hinge.rotation.y = deg_to_rad(cerrada)
	var padre: Node = _box_parent if _box_parent != null else viewport
	padre.add_child(hinge)
	var mats: Array[StandardMaterial3D] = _leaf_pieces(hinge, ancho * 0.94,
		alto_vano, _hoja_col())



	var barrido: AABB = AABB(
		Vector3(c.x - ancho, 0.0, c.y - ancho),
		Vector3(ancho * 2.0, alto_vano + 0.1, ancho * 2.0))
	for mat in mats:
		_walls.append({"mat": mat, "root": padre, "aabb": barrido,
			"base": 1.0, "a": 1.0})
	_puertas.append({"hinge": hinge, "at": c, "cerrada": cerrada, "t": 0.0})















func _add_double_tabique(r: Rect2, c: Vector2, wall: Color, trim: Color,
		grano: int = 0) -> void:
	var alto: float = House.PUERTA_ALTO


	_grano_muro(_add_box(Vector3(c.x,(alto + WALL_H) * 0.5, c.y),
		Vector3(r.size.x, WALL_H - alto, r.size.y), wall, 1), wall, grano)
	_add_box(Vector3(c.x, WALL_H + 0.03, c.y),
		Vector3(r.size.x + 0.05, 0.06, r.size.y + 0.05), trim, 1)
	_add_box(Vector3(c.x, 0.02, c.y),
		Vector3(r.size.x, 0.04, r.size.y), trim)
	var vert: bool = r.size.y > r.size.x
	var ancho: float = maxf(r.size.x, r.size.y)
	var eje: Vector3 = Vector3(0.0, 0.0, 1.0) if vert else Vector3(1.0, 0.0, 0.0)
	var padre: Node = _box_parent if _box_parent != null else viewport
	var barrido: AABB = AABB(
		Vector3(c.x - ancho, 0.0, c.y - ancho),
		Vector3(ancho * 2.0, alto + 0.1, ancho * 2.0))
	var cerrada: float = -90.0 if vert else 0.0
	for lado in [-1.0, 1.0]:
		var hinge: Node3D = Node3D.new()


		hinge.position = Vector3(c.x, 0.0, c.y) + eje *(lado * ancho * 0.5)
		hinge.rotation.y = deg_to_rad(cerrada if lado < 0.0 else cerrada + 180.0)
		padre.add_child(hinge)
		var mats: Array[StandardMaterial3D] = _leaf_pieces(hinge,
			ancho * 0.47, alto, _hoja_col())
		for mat in mats:
			_walls.append({"mat": mat, "root": padre, "aabb": barrido,
				"base": 1.0, "a": 1.0})
		_puertas.append({"hinge": hinge, "at": c, "t": 0.0,
			"cerrada": float(hinge.rotation_degrees.y),
			"signo": 1.0 if lado < 0.0 else -1.0})














func _add_arch_tabique(r: Rect2, c: Vector2, wall: Color, trim: Color,
		grano: int = 0) -> void:
	var alto: float = House.PUERTA_ALTO
	var horiz: bool = r.size.x >= r.size.y
	var ancho: float = maxf(r.size.x, r.size.y)

	_grano_muro(_add_box(Vector3(c.x,(alto + WALL_H) * 0.5, c.y),
		Vector3(r.size.x, WALL_H - alto, r.size.y), wall, 1), wall, grano)
	_add_box(Vector3(c.x, WALL_H + 0.03, c.y),
		Vector3(r.size.x + 0.05, 0.06, r.size.y + 0.05), trim, 1)






	const PELDANOS: int = 4
	const FLECHA: float = 0.3
	for i in PELDANOS:
		var u0: float = float(i) / float(PELDANOS)
		var u1: float = float(i + 1) / float(PELDANOS)


		var caida: float = FLECHA * u1 * u1
		var largo: float =(u1 - u0) * ancho * 0.5
		if caida < 0.02 or largo < 0.02:
			continue
		for lado in [-1.0, 1.0]:
			var dist: float =(u0 + u1) * 0.5 * ancho * 0.5 * lado
			var d: Vector3 = Vector3(dist, 0.0, 0.0) if horiz \
					else Vector3(0.0, 0.0, dist)
			_grano_muro(_add_box(
				Vector3(c.x, alto - caida * 0.5, c.y) + d,
				Vector3(largo if horiz else r.size.x, caida,
					r.size.y if horiz else largo), wall, 1), wall, grano)





















func _add_slide_tabique(r: Rect2, c: Vector2, wall: Color, trim: Color,
		grano: int = 0) -> void:
	var alto: float = House.PUERTA_ALTO
	var vert: bool = r.size.y > r.size.x
	var ancho: float = maxf(r.size.x, r.size.y)
	var grueso: float = minf(r.size.x, r.size.y)

	_grano_muro(_add_box(Vector3(c.x,(alto + WALL_H) * 0.5, c.y),
		Vector3(r.size.x, WALL_H - alto, r.size.y), wall, 1), wall, grano)
	_add_box(Vector3(c.x, WALL_H + 0.03, c.y),
		Vector3(r.size.x + 0.05, 0.06, r.size.y + 0.05), trim, 1)


	_add_box(Vector3(c.x, 0.02, c.y),
		Vector3(r.size.x, 0.04, r.size.y), trim)

	var eje: Vector3 = Vector3(0.0, 0.0, 1.0) if vert else Vector3(1.0, 0.0, 0.0)
	var hoja_l: float = ancho * 0.5 - 0.04
	var padre: Node = _box_parent if _box_parent != null else viewport
	for lado in [-1.0, 1.0]:
		var carro: Node3D = Node3D.new()

		carro.position = Vector3(c.x, 0.0, c.y) \
				+ eje *(lado *(ancho * 0.25))
		padre.add_child(carro)
		var antes: Node3D = _box_parent
		_box_parent = carro
		var largo: Vector3 = Vector3(hoja_l, 0.0, grueso * 0.6) if not vert \
				else Vector3(grueso * 0.6, 0.0, hoja_l)


		var pano: MeshInstance3D = _add_box(Vector3(0.0, alto * 0.5, 0.0),
			Vector3(maxf(largo.x, 0.06), alto - 0.14, maxf(largo.z, 0.06)),
			SKY_COL, 1)
		var pm: StandardMaterial3D =(pano.mesh as BoxMesh).material
		pm.albedo_color.a = 0.55
		pm.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
		pm.emission_enabled = true
		pm.emission = SKY_COL
		pm.emission_energy_multiplier = 0.35
		for alt in [0.03, alto - 0.03]:
			_add_box(Vector3(0.0, alt, 0.0),
				Vector3(maxf(largo.x, 0.08), 0.06, maxf(largo.z, 0.08)), trim, 1)
		for canto in [-1.0, 1.0]:
			_add_box(Vector3(0.0, alto * 0.5, 0.0)
					+ eje *(canto *(hoja_l * 0.5 - 0.03)),
				Vector3(0.08 if not vert else maxf(largo.x, 0.08), alto,
					maxf(largo.z, 0.08) if not vert else 0.08), trim, 1)
		_box_parent = antes


		var barrido: AABB = AABB(
			Vector3(c.x - ancho, 0.0, c.y - ancho),
			Vector3(ancho * 2.0, alto + 0.1, ancho * 2.0))
		for hijo in carro.get_children():
			var mi: MeshInstance3D = hijo as MeshInstance3D
			if mi == null:
				continue
			_walls.append({"mat":(mi.mesh as BoxMesh).material, "root": padre,
				"aabb": barrido, "base": 1.0, "a": 1.0})












		if lado > 0.0:
			_puertas.append({"hinge": carro, "at": c, "cerrada": 0.0, "t": 0.0,
				"corre": eje *(- ancho * 0.5), "base": carro.position})

























func _add_window_tabique(r: Rect2, c: Vector2, wall: Color, trim: Color,
		grano: int = 0, tipo: String = "ventana") -> void:











	var sill: float = 0.96
	var head: float = 1.94
	var estrecho: float = 0.0
	if tipo == "ventanal":
		sill = 0.12
		head = 2.1
	elif tipo == "ojo_buey":
		sill = 1.3
		head = 1.9
		estrecho = 0.6
	var horiz: bool = r.size.x >= r.size.y

	_grano_muro(_add_box(Vector3(c.x, sill * 0.5, c.y),
		Vector3(r.size.x, sill, r.size.y), wall), wall, grano)
	_grano_muro(_add_box(Vector3(c.x,(head + WALL_H) * 0.5, c.y),
		Vector3(r.size.x, WALL_H - head, r.size.y), wall, 1), wall, grano)


	_add_box(Vector3(c.x, WALL_H + 0.03, c.y),
		Vector3(r.size.x + 0.05, 0.06, r.size.y + 0.05), trim, 1)


	var rep: float = maxf(r.size.x, r.size.y) if estrecho <= 0.0 \
			else minf(estrecho + 0.12, maxf(r.size.x, r.size.y))
	_add_box(Vector3(c.x, sill + 0.03, c.y),
		Vector3(rep if horiz else r.size.x + 0.12, 0.06,
			r.size.y + 0.12 if horiz else rep), trim)


	var alto: float = head - sill
	var med: float = sill + alto * 0.5
	var largo: float = maxf(r.size.x, r.size.y) - 0.14
	if estrecho > 0.0:
		largo = minf(largo, estrecho)



	var flanco: float =(maxf(r.size.x, r.size.y) - largo) * 0.5
	if flanco > 0.12:
		for lado in [-1.0, 1.0]:
			var d: Vector3 = Vector3(lado *(largo + flanco) * 0.5, 0.0, 0.0) if horiz \
					else Vector3(0.0, 0.0, lado *(largo + flanco) * 0.5)
			_grano_muro(_add_box(Vector3(c.x,(sill + head) * 0.5, c.y) + d,
				Vector3(flanco if horiz else r.size.x, head - sill,
					r.size.y if horiz else flanco), wall, 1), wall, grano)
	var glass: MeshInstance3D = _add_box(Vector3(c.x, med, c.y),
		Vector3(largo if horiz else r.size.x + 0.02, alto - 0.1,
			r.size.y + 0.02 if horiz else largo), SKY_COL, 1)
	var gm: StandardMaterial3D =(glass.mesh as BoxMesh).material
	gm.emission_enabled = true
	gm.emission = SKY_COL
	gm.emission_energy_multiplier = 0.55







	var montantes: Array[float] = [0.0]
	if tipo == "ventanal":
		montantes = [- largo / 6.0, largo / 6.0]
	for off in montantes:
		var d: Vector3 = Vector3(off, 0.0, 0.0) if horiz else Vector3(0.0, 0.0, off)
		_add_box(Vector3(c.x, med, c.y) + d,
			Vector3(0.05 if horiz else r.size.x + 0.04, alto - 0.1,
				r.size.y + 0.04 if horiz else 0.05), trim, 1)
	if tipo != "ventanal":
		_add_box(Vector3(c.x, med, c.y),
			Vector3(largo if horiz else r.size.x + 0.04, 0.05,
				r.size.y + 0.04 if horiz else largo), trim, 1)







func _leaf_pieces(hinge: Node3D, ancho: float, alto: float,
		col: Color) -> Array[StandardMaterial3D]:
	var out: Array[StandardMaterial3D] = []
	for piece in [
		[Vector3(ancho * 0.5, alto * 0.5, 0.0),
			Vector3(ancho, alto - 0.05, 0.06), col],
		[Vector3(ancho * 0.5, alto * 0.5 + 0.35, -0.04),
			Vector3(ancho * 0.62, 0.7, 0.02), col.darkened(0.12)],
		[Vector3(ancho * 0.5, alto * 0.5 - 0.45, -0.04),
			Vector3(ancho * 0.62, 0.55, 0.02), col.darkened(0.12)],
		[Vector3(ancho * 0.86, alto * 0.5 - 0.05, -0.07),
			Vector3(0.07, 0.07, 0.09), Color("c9a961")],
	]:
		var m: MeshInstance3D = MeshInstance3D.new()
		var box: BoxMesh = BoxMesh.new()
		box.size = piece[1]
		var mat: StandardMaterial3D = StandardMaterial3D.new()
		mat.albedo_color = piece[2]
		mat.roughness = 1.0
		box.material = mat
		m.mesh = box
		m.position = piece[0]
		hinge.add_child(m)
		out.append(mat)
	return out










func _tick_puertas(delta: float) -> void:
	if _puertas.is_empty():
		return
	for p in _puertas:
		var hinge: Node3D = p["hinge"]
		if not is_instance_valid(hinge):
			continue
		var quiere: float = 1.0 if _pos.distance_to(p["at"]) < DOOR_NEAR else 0.0
		var t: float = float(p["t"])
		if is_equal_approx(t, quiere):
			continue
		t = move_toward(t, quiere, delta * DOOR_SWING_SPEED)
		p["t"] = t

		var s: float = t * t *(3.0 - 2.0 * t)



		if p.has("corre"):
			hinge.position =(p["base"] as Vector3) +(p["corre"] as Vector3) * s
			continue




		hinge.rotation.y = deg_to_rad(float(p["cerrada"])
			+ DOOR_LEAF_DEG * s * float(p.get("signo", 1.0)))








func _add_tabique_posts(tabs: Array, wall: Color, trim: Color) -> void:


	var esq: Dictionary = {}
	for t in tabs:
		var vert: bool = absf(t[0].x - t[1].x) < 0.001






		var ac: String = House.wall_finish(t)
		for p in [t[0], t[1]]:
			var key: String = "%.2f,%.2f" % [p.x, p.y]
			var e: Dictionary = esq.get(key, {"n": 0, "v": false, "h": false, "p": p,
				"ac": ac, "mix": false})
			e["n"] = int(e["n"]) + 1
			if String(e["ac"]) != ac:
				e["mix"] = true
			if vert:
				e["v"] = true
			else:
				e["h"] = true
			esq[key] = e




	var t_w: float = House.TABIQUE_T
	for key in esq:
		var e: Dictionary = esq[key]


		if not ((bool(e["v"]) and bool(e["h"])) or int(e["n"]) >= 3):
			continue
		var p: Vector2 = e["p"]
		var pc: Color = wall
		if not bool(e["mix"]) and not String(e["ac"]).is_empty():
			pc = House.wall_color([Vector2.ZERO, Vector2.ZERO, "", String(e["ac"])], wall)
		var pg: int = _grano_muro_casa()
		if not bool(e["mix"]) and not String(e["ac"]).is_empty():
			pg = House.wall_grano(String(e["ac"]))
		_grano_muro(_add_box(Vector3(p.x, WALL_H * 0.5, p.y),
			Vector3(t_w, WALL_H, t_w), pc), pc, pg)
		_add_box(Vector3(p.x, WALL_H + 0.03, p.y),
			Vector3(t_w + 0.05, 0.06, t_w + 0.05), trim, 1)













func _add_wall_corner_posts() -> void:
	var wall: Color = _pal.get("wall", WALL_COL)
	var trim: Color = _pal.get("trim", TRIM_COL)
	var viste: bool = not _perimetro.is_empty()
	var piel: float = PIEL if viste else 0.0
	var carp: Color = _perimetro["carpinteria"] if viste else trim
	var eps: float = WALL_T * 0.5 + 0.05
	var seen: Dictionary = {}
	for room in _cuartos():
		if House.OUTDOOR_ROOMS.has(String(room.get("id", ""))):
			continue
		var r: Rect2 = room["rect"]
		for c in [r.position, Vector2(r.end.x, r.position.y),
				Vector2(r.position.x, r.end.y), r.end]:
			var key: String = "%.2f,%.2f" % [c.x, c.y]
			if seen.has(key):
				continue
			seen[key] = true
			var f: int = 0
			var dentro: Vector2 = Vector2.ZERO
			for dq in [Vector2(- eps, - eps), Vector2(eps, - eps),
					Vector2(- eps, eps), Vector2(eps, eps)]:
				if House.plan_in_floor(_plano(), c + dq):
					f += 1
					dentro = dq
			if f != 1:
				continue



























			var pl_c: Dictionary = _plano()
			var mx: Vector2 = c + Vector2(signf(dentro.x) * House.CELDA * 0.5, 0.0)
			var mz: Vector2 = c + Vector2(0.0, signf(dentro.y) * House.CELDA * 0.5)
			if House.in_opening(pl_c, mx) and House.in_opening(pl_c, mz):
				continue
			var fuera: Vector2 = Vector2(- signf(dentro.x), - signf(dentro.y)) \
					*(WALL_T * 0.5)
			var at: Vector2 = c + fuera
			_add_box(Vector3(at.x, WALL_H * 0.5, at.y),
				Vector3(WALL_T, WALL_H, WALL_T), wall)
			_add_box(Vector3(at.x, TRIM_H * 0.5, at.y),
				Vector3(WALL_T + 0.04, TRIM_H, WALL_T + 0.04), trim)





			var at_r: Vector2 = at + fuera.normalized() *(piel * 0.5 * sqrt(2.0)) \
					if viste else at
			_add_box(Vector3(at_r.x, WALL_H + 0.03, at_r.y),
				Vector3(WALL_T + 0.05 + piel, 0.06, WALL_T + 0.05 + piel), carp, 1)
			if viste:
				_add_piel_poste(at, Vector2(- signf(dentro.x), 0.0),
					Vector2(0.0, - signf(dentro.y)))

























func _add_walls() -> void:




	var pl: Dictionary = _plano()
	for room in _cuartos():
		var r: Rect2 = room["rect"]





		var outdoor: bool = String(room["id"]) in OUTDOOR_ROOMS

















		if outdoor:
			continue

		var edges: Array = [
			[Vector2(r.position.x, r.position.y), Vector2.RIGHT, Vector2(0, -1), r.size.x],
			[Vector2(r.position.x, r.end.y), Vector2.RIGHT, Vector2(0, 1), r.size.x],
			[Vector2(r.position.x, r.position.y), Vector2(0, 1), Vector2(-1, 0), r.size.y],
			[Vector2(r.end.x, r.position.y), Vector2(0, 1), Vector2(1, 0), r.size.y],
		]
		for e in edges:
			var cuts: PackedFloat32Array = _edge_cuts(e)
			var run_from: float = -1.0
			for i in cuts.size() - 1:
				var from: float = cuts[i]
				var to: float = cuts[i + 1]



				var sobre: Vector2 = e[0] + e[1] *((from + to) * 0.5)
				var probe: Vector2 = sobre + e[2] *(WALL_T * 0.75)





				var solid: bool = not House.plan_in_floor(_plano(), probe) \
						and not House.plan_in_doorway(_plano(), probe) \
						and not House.in_opening(pl, sobre)
				if solid and run_from < 0.0:
					run_from = from
				elif not solid and run_from >= 0.0:
					_add_wall_box(e, run_from, from, outdoor)
					run_from = -1.0
			if run_from >= 0.0:
				_add_wall_box(e, run_from, e[3], outdoor)













func _edge_cuts(edge: Array) -> PackedFloat32Array:
	var along_x: bool = not is_zero_approx((edge[1] as Vector2).x)
	var start: Vector2 = edge[0]
	var base: float = start.x if along_x else start.y
	var span: float = edge[3]
	var raw: Array[float] = [0.0, span]
	for room in _cuartos():
		var r: Rect2 = room["rect"]
		raw.append((r.position.x if along_x else r.position.y) - base)
		raw.append((r.end.x if along_x else r.end.y) - base)






	var d: Vector2 = House.plan_door(_plano())
	var mid: float = d.x if along_x else d.y
	var half: float = House.DOOR_W * 0.5 if along_x else 0.6
	raw.append(mid - half - base)
	raw.append(mid + half - base)





	for o in House.openings_of(_plano()):
		var s: Array = o
		if s.size() < 2:
			continue
		var p0: Vector2 = s[0]
		var p1: Vector2 = s[1]
		raw.append((minf(p0.x, p1.x) if along_x else minf(p0.y, p1.y)) - base)
		raw.append((maxf(p0.x, p1.x) if along_x else maxf(p0.y, p1.y)) - base)
	raw.sort()
	var cuts: PackedFloat32Array = PackedFloat32Array()
	for v in raw:
		if v < -0.001 or v > span + 0.001:
			continue
		var w: float = clampf(v, 0.0, span)
		if cuts.size() > 0 and absf(cuts[cuts.size() - 1] - w) < 0.001:
			continue
		cuts.append(w)
	return cuts


func _add_wall_box(edge: Array, from: float, to: float,
		outdoor: bool = false) -> void:
	var a: Vector2 = edge[0] + edge[1] * from
	var b: Vector2 = edge[0] + edge[1] * to









	var n: Vector2 = edge[2]
	var dir: Vector2 = edge[1]
	var cre_a: float = 0.0 if House.plan_in_floor(_plano(),
		a - dir * 0.02 + n *(WALL_T * 0.5)) else WALL_T * 0.5
	var cre_b: float = 0.0 if House.plan_in_floor(_plano(),
		b + dir * 0.02 + n *(WALL_T * 0.5)) else WALL_T * 0.5
	a -= dir * cre_a
	b += dir * cre_b
	var mid: Vector2 =(a + b) * 0.5 + n *(WALL_T * 0.5)
	var size: Vector2 = Vector2(
		maxf(absf(b.x - a.x), WALL_T), maxf(absf(b.y - a.y), WALL_T))




	var wall_h: float = FENCE_H if outdoor else WALL_H
	var at: Vector3 = Vector3(mid.x, wall_h * 0.5, mid.y)
	var vol: Vector3 = Vector3(size.x, wall_h, size.y)
	var cuerpo: MeshInstance3D = _add_box(at, vol,
		_pal.get("trim", TRIM_COL) if outdoor else _pal.get("wall", WALL_COL))


	if not outdoor:
		_grano_muro(cuerpo, _pal.get("wall", WALL_COL), _grano_muro_casa())
	if outdoor:


		_add_box(Vector3(mid.x, wall_h + 0.04, mid.y),
			Vector3(size.x + 0.06, 0.08, size.y + 0.06),
			_pal.get("wall", WALL_COL))
		return


	_add_box(Vector3(mid.x, TRIM_H * 0.5, mid.y),
		Vector3(size.x + 0.04, TRIM_H, size.y + 0.04), _pal.get("trim", TRIM_COL))





















	var viste: bool = not _perimetro.is_empty()
	var piel: float = PIEL if viste else 0.0
	var des: Vector2 = n *(piel * 0.5)
	var px: float = absf(n.x) * piel
	var pz: float = absf(n.y) * piel
	var carp: Color = _perimetro["carpinteria"] if viste else _pal.get("trim", TRIM_COL)
	_add_box(Vector3(mid.x + des.x, wall_h + 0.03, mid.y + des.y),
		Vector3(size.x + 0.05 + px, 0.06, size.y + 0.05 + pz), carp, 1)




	var run: float = maxf(size.x, size.y)




	var pedida: bool = House.in_window(_plano(), Vector2(mid.x, mid.y) - n *(WALL_T * 0.5))





	var ventana: bool = pedida or (not museo and run >= 1.5 and _wall_free(Vector2(mid.x, mid.y)))
	var w: float = minf(run * 0.45, 1.6)





	if viste:
		var half: float = run * 0.5
		var s0: float = - half -(piel if cre_a > 0.0 else 0.0)
		var s1: float = half +(piel if cre_b > 0.0 else 0.0)
		var top: float = wall_h + 0.015
		var muro: Color = _perimetro["muro"]
		_add_piel_box(mid, n, dir, s0, s1, 0.0, PIEL_ZOCALO_H, 0.0, piel + PIEL_ZOCALO_SALE,
			_perimetro["zocalo"])
		if ventana:
			var hw: float = w * 0.5
			_add_piel_box(mid, n, dir, s0, - hw, PIEL_ZOCALO_H, top, 0.0, piel, muro)
			_add_piel_box(mid, n, dir, hw, s1, PIEL_ZOCALO_H, top, 0.0, piel, muro)
			_add_piel_box(mid, n, dir, - hw, hw, PIEL_ZOCALO_H, 1.45 - 0.475, 0.0, piel, muro)
			_add_piel_box(mid, n, dir, - hw, hw, 1.45 + 0.475, top, 0.0, piel, muro)
		else:
			_add_piel_box(mid, n, dir, s0, s1, PIEL_ZOCALO_H, top, 0.0, piel, muro)
	if ventana:
		var horiz: bool = size.x >= size.y
		_add_box(Vector3(mid.x + des.x, 1.45, mid.y + des.y),
			Vector3((w if horiz else size.x + 0.05) + px, 0.95,
				(size.y + 0.05 if horiz else w) + pz), carp)
		var glass: MeshInstance3D = _add_box(Vector3(mid.x + des.x, 1.45, mid.y + des.y),
			Vector3((w - 0.16 if horiz else size.x + 0.07) + px, 0.78,
				(size.y + 0.07 if horiz else w - 0.16) + pz), SKY_COL, 1)
		var gm: StandardMaterial3D =(glass.mesh as BoxMesh).material
		gm.emission_enabled = true
		gm.emission = SKY_COL
		gm.emission_energy_multiplier = 0.55



		if _noche and viste:
			var luz: Color =(_jardin.get("entrada", {}) as Dictionary).get("luz", Color("ffe3b0"))
			var fuera: Vector2 = n *((WALL_T + 0.07 + piel) * 0.5 + 0.016)
			_enciende(_add_box(Vector3(mid.x + des.x + fuera.x, 1.45, mid.y + des.y + fuera.y),
				Vector3(w - 0.2 if horiz else 0.012, 0.72, 0.012 if horiz else w - 0.2), luz, 1), luz)


		_add_box(Vector3(mid.x + des.x, 1.45, mid.y + des.y),
			Vector3((0.05 if horiz else size.x + 0.09) + px, 0.78,
				(size.y + 0.09 if horiz else 0.05) + pz), carp, 1)
		_add_box(Vector3(mid.x + des.x, 1.45, mid.y + des.y),
			Vector3((w - 0.16 if horiz else size.x + 0.09) + px, 0.05,
				(size.y + 0.09 if horiz else w - 0.16) + pz), carp, 1)








func _add_piel_box(mid: Vector2, n: Vector2, dir: Vector2, s0: float, s1: float,
		y0: float, y1: float, o0: float, o1: float, col: Color) -> void:
	if s1 - s0 <= 0.001 or y1 - y0 <= 0.001:
		return
	var c: Vector2 = mid + dir *((s0 + s1) * 0.5) + n *(WALL_T * 0.5 +(o0 + o1) * 0.5)
	var sz: Vector2 = dir.abs() *(s1 - s0) + n.abs() *(o1 - o0)
	_add_box(Vector3(c.x,(y0 + y1) * 0.5, c.y), Vector3(sz.x, y1 - y0, sz.y), col, 1)






func _add_piel_poste(at: Vector2, nx: Vector2, nz: Vector2) -> void:
	var top: float = WALL_H + 0.015
	for par in [[nx, nz], [nz, nx]]:
		var fuera: Vector2 = par[0]
		var lado: Vector2 = par[1]
		for capa in [[0.0, PIEL_ZOCALO_H, PIEL + PIEL_ZOCALO_SALE, _perimetro["zocalo"]],
				[PIEL_ZOCALO_H, top, PIEL, _perimetro["muro"]]]:
			var y0: float = float(capa[0])
			var y1: float = float(capa[1])
			var o1: float = float(capa[2])
			var c: Vector2 = at + fuera *(WALL_T * 0.5 + o1 * 0.5) + lado *(PIEL * 0.5)
			var sz: Vector2 = fuera.abs() * o1 + lado.abs() *(WALL_T + PIEL)
			_add_box(Vector3(c.x,(y0 + y1) * 0.5, c.y), Vector3(sz.x, y1 - y0, sz.y),
				capa[3], 1)































func _wall_free(at: Vector2, clear: float = 0.85) -> bool:
	return House.muro_libre(_plano(), at, clear)



func _tiers_of(prop_id: String) -> int:
	var t: int = 0
	for p in _plan:
		if String(p["prop_id"]) == prop_id:
			t = maxi(t, int(p.get("tier", 0)))
	return t + 1





















func _add_prop(prop: Dictionary) -> void:
	if not _prop_visible(prop):
		return




	var fab: int = int(prop.get("face_fab", House.base_face(prop)))&3
	var face: int = int(prop.get("face", fab))&3
	var giro: int =(face - fab)&3
	if giro == 0:
		var inicio: int = _walls.size()
		_paint_prop(prop)
		_sellar_materiales_prop(inicio)
		return
	var r_ef: Rect2 = prop["rect"]
	var c: Vector2 = r_ef.get_center()




	var s_fab: Vector2 = r_ef.size
	if giro == 1 or giro == 3:
		s_fab = Vector2(r_ef.size.y, r_ef.size.x)
	var copia: Dictionary = prop.duplicate(true)
	copia["rect"] = Rect2(c - s_fab * 0.5, s_fab)



	copia["face"] = fab
	var antes: Node3D = _box_parent
	var pivote: Node3D = Node3D.new()
	pivote.name = "Giro"
	(antes if antes != null else viewport).add_child(pivote)
	_box_parent = pivote
	var marca: int = _walls.size()
	_paint_prop(copia)
	_sellar_materiales_prop(marca)
	_box_parent = antes




	var ang: float = PI * 0.5 * float(giro)
	var base3: Basis = Basis(Vector3.UP, ang)
	var c3: Vector3 = Vector3(c.x, 0.0, c.y)
	pivote.transform = Transform3D(base3, c3 - base3 * c3)





	for i in range(marca, _walls.size()):
		var aabb: AABB = _walls[i]["aabb"]
		var cen: Vector3 = aabb.position + aabb.size * 0.5
		var cen2: Vector3 = base3 * cen +(c3 - base3 * c3)
		var tam: Vector3 = aabb.size
		if giro == 1 or giro == 3:
			tam = Vector3(aabb.size.z, aabb.size.y, aabb.size.x)
		_walls[i]["aabb"] = AABB(cen2 - tam * 0.5, tam)






func _sellar_materiales_prop(desde: int) -> void:
	for i in range(desde, _walls.size()):
		var mat: StandardMaterial3D = _walls[i]["mat"]
		var alfa: float = mat.albedo_color.a
		_walls[i]["base"] = alfa
		_walls[i]["a"] = alfa
		if alfa < 0.995:
			mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA


























const MAPA_MUNDI: Array[String] = [
	"................................................................",
	"................................................................",
	"................................................................",
	"...####################.####.....##############################.",
	"...####################.####.....####.#########################.",
	"..#####################..###...###############################..",
	"..#####################.......###############################...",
	"...####################.......##############################....",
	"....##################........#############################.....",
	"....##################........##..###.####################......",
	".....################........############################.......",
	".......#############.........############.##############........",
	".........##########..........############..######..#####........",
	"............#######..........#############.#####...#####........",
	"...............######........##############.........#####.......",
	".................########.....#############.........######......",
	".................#########.....###########..........#######.....",
	".................##########....##########............######.....",
	"..................#########....##########...........########....",
	"..................########......########............########....",
	"...................######.......#######.............########....",
	"...................#####.........#####...............######.....",
	"...................#####.........####.......................##..",
	"....................###.....................................##..",
	"....................###.........................................",
	"....................##..........................................",
	"................................................................",
	"................................................................",
	"................................................................",
	"................................................................",
	"................................................................",
	"................................................................",
]




const MAPA_ESC: int = 3




const MAPA_PAIS_LATLON: Dictionary = {
	"España": Vector2(40.0, -4.0), "Inglaterra": Vector2(53.0, -1.5),
	"Italia": Vector2(42.5, 12.5), "Alemania": Vector2(51.0, 10.0),
	"Portugal": Vector2(39.5, -8.0), "México": Vector2(23.0, -102.0),
	"Francia": Vector2(47.0, 2.0), "Países Bajos": Vector2(52.2, 5.5),
	"Brasil": Vector2(-10.0, -52.0), "Argentina": Vector2(-34.0, -64.0),
	"Estados Unidos": Vector2(39.0, -98.0), "Arabia Saudí": Vector2(24.0, 45.0),
	"Turquía": Vector2(39.0, 35.0), "Bélgica": Vector2(50.5, 4.5),
	"Escocia": Vector2(56.5, -4.0), "Grecia": Vector2(39.0, 22.0),
	"Ucrania": Vector2(49.0, 32.0), "Austria": Vector2(47.5, 14.0),
	"Suiza": Vector2(46.8, 8.2), "Chequia": Vector2(49.8, 15.5),
	"Croacia": Vector2(45.1, 15.2), "Serbia": Vector2(44.0, 21.0),
	"Dinamarca": Vector2(56.0, 10.0), "Noruega": Vector2(61.0, 9.0),
	"Japón": Vector2(36.0, 138.0), "Corea del Sur": Vector2(36.5, 127.8),
	"Colombia": Vector2(4.0, -73.0), "Chile": Vector2(-33.0, -71.0),
	"Uruguay": Vector2(-33.0, -56.0), "Egipto": Vector2(26.0, 30.0),



	"Paraguay": Vector2(-25.26, -57.58), "Ecuador": Vector2(-0.23, -78.53),
	"Perú": Vector2(-12.05, -77.04), "Bolivia": Vector2(-16.5, -68.15),
	"Venezuela": Vector2(10.48, -66.9),


	"Marruecos": Vector2(34.02, -6.84), "Túnez": Vector2(36.81, 10.18),

	"Suecia": Vector2(59.33, 18.07), "Rumanía": Vector2(44.43, 26.1),

	"Bosnia y Herzegovina": Vector2(43.86, 18.41),





	"Nueva Zelanda": Vector2(-41.29, 174.78), "Fiyi": Vector2(-18.14, 178.44),
	"Tahití": Vector2(-17.53, -149.57), "Nueva Caledonia": Vector2(-22.27, 166.44),
}

const MAPA_MAR: Color = Color("24404f")
const MAPA_TIERRA: Color = Color("6f7f56")
const MAPA_COSTA: Color = Color("47543a")
const MAPA_MERIDIANO: Color = Color("2e4e5e")


func _cara_muro(r: Rect2) -> Dictionary:
	var lx: bool = r.size.x >= r.size.y



	return {
		"lx": lx,
		"fd": Vector2(0.0, -1.0) if lx else Vector2(-1.0, 0.0),
		"dep": r.size.y if lx else r.size.x,
		"anc": r.size.x if lx else r.size.y,
	}




func _marco_hueco(r: Rect2, centro: Vector3, alto: float,
		borde: float, col: Color) -> void:
	var lx: bool = r.size.x >= r.size.y
	var ancho: float = r.size.x if lx else r.size.y
	var fondo: float = r.size.y if lx else r.size.x
	for signo in [-1.0, 1.0]:
		var lateral: Vector3 = Vector3(signo *(ancho - borde) * 0.5, 0, 0) \
				if lx else Vector3(0, 0, signo *(ancho - borde) * 0.5)
		_add_box(centro + lateral,
			Vector3(borde, alto, fondo) if lx else Vector3(fondo, alto, borde), col)
		_add_box(centro + Vector3(0, signo *(alto - borde) * 0.5, 0),
			Vector3(ancho - borde * 2, borde, fondo) if lx \
					else Vector3(fondo, borde, ancho - borde * 2), col)
	var atras: Vector3 = Vector3(0, 0,(fondo - 0.02) * 0.5) if lx \
			else Vector3((fondo - 0.02) * 0.5, 0, 0)
	_add_box(centro + atras, Vector3(ancho, alto, 0.02) if lx \
			else Vector3(0.02, alto, ancho), col.darkened(0.18))


func _paint_prop(prop: Dictionary) -> void:






	if not _prop_visible(prop):
		return
	var kind: String = String(prop.get("kind", ""))





	if kind == Museo.KIND_FAN:
		return
	var look: Dictionary = PROP_LOOK.get(kind, {"col": Color("777777")})
	var r: Rect2 = prop["rect"]
	var h: float = House.prop_alto(kind)





	var col: Color = _prop_col(kind, look["col"])
	if prop.has("col") and prop["col"] is Color:
		col = prop["col"]
	var c: Vector2 = r.get_center()
	var along_x: bool = r.size.x >= r.size.y
	match kind:
		"tapete_redondo", "tapete_tejido", "tapete_ovalado", "tapete_hexagonal", "tapete_organico", "tapete_pasillo":
			preload("res://ui/house/tapetes_salon.gd").pintar(self, kind, r, col, h, prop)
		"bocinas_torre", "bocinas_estante":
			preload("res://ui/house/bocinas_salon.gd").pintar(self, kind, r, col, h, prop)
		"librero_abierto", "librero_modular":
			preload("res://ui/house/libreros_salon.gd").pintar(self, kind, r, col, h, prop)
		"sofa_penthouse", "comedor_penthouse", "cama_penthouse", "robot_aspirador", "espejo_inteligente", "mesa_holografica":
			preload("res://ui/house/penthouse_props.gd").pintar_penthouse(self, kind, r, col, prop)
		"alberca_surf":
			preload("res://ui/house/surf_prop.gd").pintar(self, kind, r, col)
		"canasta_basket", "reloj_pie":
			preload("res://ui/house/basket_reloj_props.gd").pintar(self, kind, r, col)
		"pingpong", "brazalete_capitan", "posadero_loro":
			CasaLegadoPropsLib.pintar_legado(self, kind, r, col)
		"pared_reflejos":

			preload("res://ui/house/reflejos_props.gd").pintar(self, kind, r, col, float(prop.get("y", 0.0)))
		"memorama":
			preload("res://ui/house/memorama_props.gd").pintar(self, kind, r, col)
		"cochera":
			preload("res://ui/house/cochera_props.gd").pintar(self, r)
		"coche", "coche_muscle", "coche_gt", "coche_hiper", "coche_compacto", "coche_sedan", "coche_familiar", "coche_pickup":
			preload("res://ui/house/coches_props.gd").pintar(self, kind, r)
		"camilla_fisio", "pizarra_tactica", "bici_estatica", "muro_records", "rincon_lectura", "mesa_recuerdos", "colchon_estiramientos", "maquina_respiracion", "vision_board", "vinoteca_saludable", "lampara_sol", "consultorio_nutri":
			var funcional: Dictionary = prop.duplicate(false)
			if kind == "pizarra_tactica":
				funcional["formation"] = Squad.formation_of(GameState.player_team_id)
			if kind in House.CONSULTA_KINDS:


				funcional["panel_tex"] = RecuerdosPanelLib.panel_texture(kind)
			HogarFuncionalPropsLib.pintar(self, kind, r, col, funcional)
		"cama_perro", "rascador_gato", "lavanderia", "recibidor", "vestidor", "telescopio":
			HogarPropsLib.pintar(self, kind, r, col, GameState.team_custom)
		"cabina_podcast", "tina_hielo", "banco_botas", "toallero", "espejo_cuerpo", "mesa_centro", "rincon_cafe", "aparador", "gallinero":


			CasaLotePropsLib.pintar(self, kind, r, col, float(prop.get("y", 0.0)))
		"sofa":
			AsientosPulidosLib.pintar(self, kind, r, col)
		"silla", "silla_alta":
			AsientosPulidosLib.pintar(self, kind, r, col)
		"sillon":
			AsientosPulidosLib.pintar(self, kind, r, col)
		"mesa":

			var top_t: float = 0.09
			_add_box(Vector3(c.x, h - top_t * 0.5, c.y),
				Vector3(r.size.x, top_t, r.size.y), col)
			for sx in [-1.0, 1.0]:
				for sz in [-1.0, 1.0]:
					_add_box(Vector3(c.x + sx *(r.size.x * 0.5 - 0.09),
						(h - top_t) * 0.5, c.y + sz *(r.size.y * 0.5 - 0.09)),
						Vector3(0.08, h - top_t, 0.08), col.darkened(0.25))
			for borde in [-1.0, 1.0]:
				_add_box(Vector3(c.x, h - 0.15, c.y + borde *(r.size.y * 0.5 - 0.09)), Vector3(r.size.x - 0.18, 0.14, 0.045), col.darkened(0.12))



			_add_box(Vector3(c.x, h + 0.012, c.y),
				Vector3(r.size.x * 0.5 if along_x else r.size.x * 0.86, 0.015,
					r.size.y * 0.86 if along_x else r.size.y * 0.5),
				_pal.get("rug", Color("7a4040")).lightened(0.1))
			_add_box(Vector3(c.x, h + 0.07, c.y), Vector3(0.26, 0.1, 0.26),
				Color("c9c4b4"))
			for fr in [[-0.05, 0.05, Color("c8543f")], [0.06, -0.03,
					Color("d8a33f")], [0.0, 0.0, Color("6f8f47")]]:
				_add_esfera(Vector3(c.x + float(fr[0]), h + 0.15,
					c.y + float(fr[1])), 0.055, fr[2])
			for s2 in [-1.0, 1.0]:
				var cup: Vector2 = Vector2(s2 * r.size.x * 0.28, 0.0) \
						if along_x else Vector2(0.0, s2 * r.size.y * 0.28)
				_add_cilindro(Vector3(c.x + cup.x, h + 0.06, c.y + cup.y), 0.052, 0.046, 0.11, Color("e6e0d4"), 12)
				_add_cilindro(Vector3(c.x + cup.x, h + 0.117, c.y + cup.y), 0.041, 0.041, 0.004, Color("503426"), 12)
				_add_cilindro(Vector3(c.x + cup.x, h + 0.012, c.y + cup.y), 0.085, 0.085, 0.014, Color("e6e0d4"), 12)




			var vcup: Vector2 = Vector2(- r.size.x * 0.28, 0.0) if along_x \
					else Vector2(0.0, - r.size.y * 0.28)
			var vap_padre: Node = _box_parent if _box_parent != null else viewport
			var vap_tex: ImageTexture = RisingSpriteLib.make_texture(
				"vapor", Color("eef0f2"))
			for vi in 3:
				var vap = RisingSpriteLib.new()
				vap_padre.add_child(vap)
				vap.setup(vap_tex, c.x + vcup.x, c.y + vcup.y, h + 0.12,
					0.2, 0.45, 0.012, float(vi) / 3.0, 0.007)
		"repisa":








			var plank: float = 0.1
			var tiers: int = _tiers_of(String(prop["id"]))
			var rp_lx2: bool = r.size.x >= r.size.y
			var rp_fondo: float =(r.size.y if rp_lx2 else r.size.x)
			for tr in tiers:
				_add_box(Vector3(c.x, h - plank * 0.5 + float(tr) * House.TIER_H,
					c.y), Vector3(r.size.x, plank, r.size.y), col)
			for s in [-1.0, 1.0]:
				var so: Vector2 = Vector2(s *(r.size.x * 0.5 - 0.11), 0.0) \
						if rp_lx2 else Vector2(0.0, s *(r.size.y * 0.5 - 0.11))
				_add_box(Vector3(c.x + so.x,(h - plank) * 0.5, c.y + so.y),
					Vector3(0.22 if rp_lx2 else rp_fondo * 0.9, h - plank,
						rp_fondo * 0.9 if rp_lx2 else 0.22), col.darkened(0.3))

			_add_box(Vector3(c.x, 0.14, c.y),
				Vector3(r.size.x * 0.86 if rp_lx2 else rp_fondo * 0.5, 0.08,
					rp_fondo * 0.5 if rp_lx2 else r.size.y * 0.86), col.darkened(0.2))
		"cama":
			preload("res://ui/house/descanso_pulido.gd").pintar(self, kind, r, col, h, prop)
		"tocador":


























			var tc_sg: float = -1.0



			var tc_fw: Vector2 = Vector2(0.0, tc_sg) if along_x \
					else Vector2(tc_sg, 0.0)



			var tc_lg: float = r.size.x if along_x else r.size.y
			var tc_fd: float = r.size.y if along_x else r.size.x


			var tc_mc: Vector2 = c - tc_fw *(tc_fd * 0.25)
			var tc_md: float = tc_fd * 0.5


			var tc_top: float = h * 0.48




			for tc_s in [-1.0, 1.0]:
				var tc_o: Vector2 = Vector2(tc_s * tc_lg * 0.32, 0.0) if along_x \
						else Vector2(0.0, tc_s * tc_lg * 0.32)
				_add_box(Vector3(tc_mc.x + tc_o.x, tc_top * 0.5, tc_mc.y + tc_o.y),
					Vector3(tc_lg * 0.28, tc_top, tc_md - 0.06) if along_x
						else Vector3(tc_md - 0.06, tc_top, tc_lg * 0.28),
					col.darkened(0.16))



				_add_box(Vector3(tc_mc.x + tc_o.x + tc_fw.x *(tc_md * 0.5 - 0.02),
						tc_top * 0.58,
						tc_mc.y + tc_o.y + tc_fw.y *(tc_md * 0.5 - 0.02)),
					Vector3(tc_lg * 0.16, 0.04, 0.04) if along_x
						else Vector3(0.04, 0.04, tc_lg * 0.16),
					Color("c9b184"))




			_add_box(Vector3(tc_mc.x, tc_top, tc_mc.y),
				Vector3(tc_lg, 0.08, tc_md) if along_x
					else Vector3(tc_md, 0.08, tc_lg),
				col)




			var tc_e0: float = tc_top + 0.02
			var tc_eh: float = h - tc_e0



			var tc_ez: Vector2 = tc_mc - tc_fw *(tc_md * 0.5 - 0.06)





			_add_box(Vector3(tc_ez.x, tc_e0 + tc_eh * 0.5, tc_ez.y),
				Vector3(tc_lg * 0.62, tc_eh, 0.06) if along_x
					else Vector3(0.06, tc_eh, tc_lg * 0.62),
				_pal.get("trim", TRIM_COL), 1)



			var tc_lu: MeshInstance3D = _add_box(
				Vector3(tc_ez.x + tc_fw.x * 0.035, tc_e0 + tc_eh * 0.5,
					tc_ez.y + tc_fw.y * 0.035),
				Vector3(tc_lg * 0.62 - 0.12, tc_eh - 0.12, 0.02) if along_x
					else Vector3(0.02, tc_eh - 0.12, tc_lg * 0.62 - 0.12),
				Color("c6d2da"), 1)
			var tc_lm: StandardMaterial3D =(tc_lu.mesh as BoxMesh).material
			tc_lm.emission_enabled = true
			tc_lm.emission = Color("b9c6cf")


			tc_lm.emission_energy_multiplier = 0.45 if _noche else 0.25




			var tc_bc: Vector2 = c + tc_fw *(tc_fd * 0.28)
			var tc_bs: float = h * 0.28
			_add_box(Vector3(tc_bc.x, tc_bs, tc_bc.y),
				Vector3(tc_lg * 0.42, 0.08, tc_fd * 0.24) if along_x
					else Vector3(tc_fd * 0.24, 0.08, tc_lg * 0.42),
				_pal.get("fabric", Color("7a5a4a")))




			for tc_p in [-1.0, 1.0]:
				var tc_po: Vector2 = Vector2(tc_p * tc_lg * 0.15, 0.0) if along_x \
						else Vector2(0.0, tc_p * tc_lg * 0.15)
				_add_box(Vector3(tc_bc.x + tc_po.x, tc_bs * 0.5,
						tc_bc.y + tc_po.y),
					Vector3(0.06, tc_bs, tc_fd * 0.2) if along_x
						else Vector3(tc_fd * 0.2, tc_bs, 0.06),
					col.darkened(0.3))




			var tc_fh: Array = [0.17, 0.11, 0.21]
			for tc_i in 3:
				var tc_fo: float = tc_lg *(-0.3 + 0.08 * float(tc_i))
				var tc_fp: Vector2 = tc_mc +(Vector2(tc_fo, 0.0) if along_x
					else Vector2(0.0, tc_fo))
				var tc_a: float = float(tc_fh[tc_i])
				_add_box(Vector3(tc_fp.x, tc_top + 0.03 + tc_a * 0.5, tc_fp.y),
					Vector3(0.07, tc_a, 0.07), Color("cfd8dc"))
				_add_box(Vector3(tc_fp.x, tc_top + 0.03 + tc_a + 0.005, tc_fp.y),
					Vector3(0.04, 0.03, 0.04), Color("c9a961"))
		"vitrina_isla":








































			var vx_base: float = float(look.get("top", h * 0.49))









			var vx_tiers: int = _tiers_of(str(prop["id"]))
			var vx_top: float = h + float(vx_tiers - 1) * House.TIER_H
			var vx_hw: float = r.size.x * 0.5
			var vx_hd: float = r.size.y * 0.5








			var vx_lz: float = c.y -(vx_hd - 0.12)










			var vx_z0: float = 0.12
			_add_box(Vector3(c.x, vx_z0 * 0.5, c.y),
				Vector3(r.size.x - 0.04, vx_z0, r.size.y - 0.04), col.darkened(0.45))
			var vx_c0: float = vx_z0 - 0.02
			var vx_c1: float = vx_base - 0.04
			_add_box(Vector3(c.x,(vx_c0 + vx_c1) * 0.5, c.y),
				Vector3(r.size.x - 0.16, vx_c1 - vx_c0, r.size.y - 0.16),
				col.darkened(0.25))
			_add_box(Vector3(c.x, vx_base - 0.04, c.y),
				Vector3(r.size.x - 0.08, 0.08, r.size.y - 0.08), col)






			_add_box(Vector3(c.x, vx_base * 0.52, c.y - vx_hd + 0.07),
				Vector3(minf(r.size.x * 0.22, 0.5), 0.09, 0.03),
				LAMINA_ORO.darkened(0.15))











			_add_box(Vector3(c.x, vx_base + 0.005, c.y),
				Vector3(r.size.x * 0.86, 0.03, r.size.y * 0.82), col.lightened(0.28))







			for vx_tr in range(1, vx_tiers):
				var vx_sy: float = vx_base + float(vx_tr) * House.TIER_H - 0.02
				var vx_sh: MeshInstance3D = _add_box(Vector3(c.x, vx_sy, c.y),
					Vector3(r.size.x * 0.86, 0.04, r.size.y * 0.82),
					Color(0.82, 0.9, 0.95, 0.3))
				var vx_sm: StandardMaterial3D =(vx_sh.mesh as BoxMesh).material
				vx_sm.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
				vx_sh.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF



				_add_strip(Vector3(c.x, vx_sy - 0.05, vx_lz),
					Vector3(r.size.x * 0.8, 0.02, 0.02))


			_add_strip(Vector3(c.x, vx_top - 0.13, vx_lz),
				Vector3(r.size.x * 0.8, 0.02, 0.02))














			var vx_lo: float = vx_base - 0.01
			var vx_hi: float = vx_top - 0.07
			var vx_gl: MeshInstance3D = _add_box(
				Vector3(c.x,(vx_lo + vx_hi) * 0.5, c.y),
				Vector3(r.size.x * 0.9, vx_hi - vx_lo, r.size.y * 0.86),
				Color(0.8, 0.88, 0.92, 0.1), 1)
			var vx_gm: StandardMaterial3D =(vx_gl.mesh as BoxMesh).material
			vx_gm.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
			vx_gl.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF









			var vx_p0: float = vx_base - 0.02
			var vx_p1: float = vx_top - 0.03
			for vx_mx in [-1.0, 1.0]:
				for vx_mz in [-1.0, 1.0]:
					_add_box(Vector3(c.x + float(vx_mx) *(vx_hw - 0.03),
						(vx_p0 + vx_p1) * 0.5,
						c.y + float(vx_mz) *(vx_hd - 0.03)),
						Vector3(0.05, vx_p1 - vx_p0, 0.05), col.lightened(0.1))













			for vx_rz in [-1.0, 1.0]:
				_add_box(Vector3(c.x, vx_top - 0.03,
						c.y + float(vx_rz) *(vx_hd - 0.03)),
					Vector3(r.size.x - 0.04, 0.06, 0.04), col.lightened(0.1), 1)
			for vx_rx in [-1.0, 1.0]:
				_add_box(Vector3(c.x + float(vx_rx) *(vx_hw - 0.03),
						vx_top - 0.035, c.y),
					Vector3(0.04, 0.04, r.size.y - 0.04), col.lightened(0.1), 1)






			var vx_tp: MeshInstance3D = _add_box(
				Vector3(c.x, vx_top - 0.035, c.y),
				Vector3(r.size.x - 0.08, 0.03, r.size.y - 0.08),
				Color(0.82, 0.9, 0.95, 0.12))
			var vx_tm: StandardMaterial3D =(vx_tp.mesh as BoxMesh).material
			vx_tm.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
			vx_tp.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		"vitrina", "vitrina_torre", "vitrina_galeria", "vitrina_premios":






















			var base_h: float = float(look.get("top", h * 0.42))


			var tiers: int = _tiers_of(String(prop["id"]))
			var case_top: float = h + float(tiers - 1) * House.TIER_H
			var front: float = c.y - r.size.y * 0.5
			var copias_museo: int = House.shelf_of(_plan, String(prop["id"])).size() if bool(prop.get("exhibicion_museo", false)) else 0
			var cierre_x: float = c.x
			if copias_museo > 0:


				cierre_x += r.size.x * 0.5 - 0.065 if copias_museo == 1 \
						else (- House.MUSEO_COPY_GAP * 0.5 if copias_museo % 2 == 1 else 0.0)

			for lado in [-1.0, 1.0]:
				for fraccion in [0.22, 0.78]:
					_add_box(Vector3(c.x + lado *(r.size.x * 0.5 - 0.045), lerpf(base_h, case_top, fraccion), front + 0.035),
						Vector3(0.045, 0.07, 0.045), Color("9fa9aa"), 1)
			_add_box(Vector3(cierre_x, base_h +(case_top - base_h) * 0.4, front + 0.01), Vector3(0.055, 0.09, 0.035), Color("929d9f"), 1)
			_add_box(Vector3(cierre_x, base_h +(case_top - base_h) * 0.4, front - 0.009), Vector3(0.012, 0.026, 0.006), Color("303a40"), 1)

			_add_box(Vector3(c.x, base_h * 0.5, c.y),
				Vector3(r.size.x, base_h, r.size.y), col.darkened(0.25))





			_add_box(Vector3(c.x, 0.05, c.y),
				Vector3(r.size.x - 0.08, 0.1, r.size.y - 0.04),
				col.darkened(0.45))
			_add_box(Vector3(c.x, base_h - 0.03, c.y),
				Vector3(r.size.x - 0.04, 0.07, r.size.y - 0.04), col)

			_add_box(Vector3(c.x, base_h * 0.55, front + 0.01),
				Vector3(minf(r.size.x * 0.22, 0.5), 0.09, 0.03),
				CareerTheme.MONEY.darkened(0.15))



			_add_box(Vector3(c.x, base_h + 0.015, c.y),
				Vector3(r.size.x * 0.94, 0.03, r.size.y * 0.9),
				col.lightened(0.28))





			_add_box(Vector3(c.x,(base_h + case_top) * 0.5,
					c.y + r.size.y * 0.42),
				Vector3(r.size.x * 0.98, case_top - base_h, r.size.y * 0.12),
				col.darkened(0.55), 1)















			for tr in range(1, tiers):
				var shelf_y: float = base_h + float(tr) * House.TIER_H - 0.02
				var shelf: MeshInstance3D = _add_box(Vector3(c.x, shelf_y, c.y),
					Vector3(r.size.x * 0.96, 0.04, r.size.y * 0.96),
					Color(0.82, 0.9, 0.95, 0.22))
				var sm: StandardMaterial3D =(shelf.mesh as BoxMesh).material
				sm.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
				shelf.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF



				_add_box(Vector3(c.x, shelf_y, front + 0.02),
					Vector3(r.size.x * 0.96, 0.045, 0.02),
					Color(0.88, 0.94, 0.97))
				_add_strip(Vector3(c.x, shelf_y - 0.05, front + 0.05),
					Vector3(r.size.x * 0.9, 0.03, 0.03))


			_add_strip(Vector3(c.x, case_top - 0.1, front + 0.05),
				Vector3(r.size.x * 0.9, 0.03, 0.03))











			var g_lo: float = base_h + 0.03
			var g_hi: float = case_top - 0.05








			var glass: MeshInstance3D = _add_box(
				Vector3(c.x,(g_lo + g_hi) * 0.5, c.y),
				Vector3(r.size.x * 0.9, g_hi - g_lo, r.size.y * 0.9),
				Color(0.8, 0.88, 0.92, 0.1))
			var gm: StandardMaterial3D =(glass.mesh as BoxMesh).material
			gm.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
			glass.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF



			var shine: MeshInstance3D = _add_box(
				Vector3(c.x, base_h +(case_top - base_h) * 0.72, front + 0.02),
				Vector3(r.size.x * 0.9,(case_top - base_h) * 0.16, 0.02),
				Color(0.92, 0.96, 1.0, 0.13))
			var shm: StandardMaterial3D =(shine.mesh as BoxMesh).material
			shm.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
			shine.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF

			for sx in [-1.0, 1.0]:
				for sz in [-1.0, 1.0]:
					_add_box(Vector3(c.x + sx *(r.size.x * 0.5 - 0.03),
						(base_h + case_top) * 0.5,
						c.y + sz *(r.size.y * 0.5 - 0.03)),
						Vector3(0.05, case_top - base_h, 0.05), col.lightened(0.1))






			var postes: Array[float] = trophy_mullion_offsets(r.size.x, copias_museo) \
					if copias_museo > 0 else House.postes_frente(r.size.x)
			for poste in postes:
				var bx: float = c.x - r.size.x * 0.5 + poste
				_add_box(Vector3(bx,(base_h + case_top) * 0.5, front + 0.03),
					Vector3(0.04, case_top - base_h, 0.04), col.lightened(0.1))
			for sy in [base_h + 0.03, case_top - 0.03]:
				for sz2 in [-1.0, 1.0]:
					_add_box(Vector3(c.x, sy, c.y + sz2 *(r.size.y * 0.5 - 0.03)),
						Vector3(r.size.x * 0.98, 0.05, 0.05),
						col.lightened(0.1), 1)
			_add_box(Vector3(c.x, case_top - 0.04, c.y),
				Vector3(r.size.x - 0.04, 0.08, r.size.y - 0.04), col.lightened(0.05))






			_add_luz(Vector3(c.x,(base_h + case_top) * 0.5, c.y),
				Color("fff0d2"), 1.7, 3.4)
		"balones":








			var bl_plank: float = 0.06
			var bl_deep: float = r.size.y


			_add_box(Vector3(c.x, h * 0.5, c.y + bl_deep * 0.5 - 0.03),
				Vector3(r.size.x, h, 0.06), col.darkened(0.35))

			for bl_s in [-1.0, 1.0]:
				_add_box(Vector3(c.x + bl_s *(r.size.x * 0.5 - 0.04), h * 0.5, c.y),
					Vector3(0.08, h, bl_deep), col.darkened(0.15))




			var bl_y0: float = float(look.get("top", 0.52))
			var bl_y1: float = bl_y0 +(h - bl_y0) * 0.5
			for bl_y in [0.12, bl_y0, bl_y1]:
				_add_box(Vector3(c.x, float(bl_y), c.y),
					Vector3(r.size.x * 0.94, bl_plank, bl_deep * 0.92),
					col.lightened(0.08))
			_add_box(Vector3(c.x, h - bl_plank * 0.5, c.y),
				Vector3(r.size.x * 1.02, bl_plank, bl_deep * 1.02),
				col.lightened(0.05))








			var bl_front: float = c.y - bl_deep * 0.5
			var bl_back: float = c.y + bl_deep * 0.5
			for bl_gy in [bl_y0, bl_y1]:


				_add_strip(Vector3(c.x, float(bl_gy) + 0.11, bl_back - 0.1),
					Vector3(r.size.x * 0.86, 0.14, 0.02))
			for bl_sy in [bl_y0, bl_y1, h - bl_plank]:
				_add_strip(Vector3(c.x, float(bl_sy) - 0.03, bl_front + 0.04),
					Vector3(r.size.x * 0.9, 0.025, 0.03))
			_add_luz(Vector3(c.x,(bl_y0 + h) * 0.5, c.y),
				Color("ffe6c2"), 1.5, 3.0)


			_add_box(Vector3(c.x, 0.12 + bl_plank + 0.09, bl_front + 0.02),
				Vector3(minf(r.size.x * 0.3, 0.45), 0.09, 0.03),
				CareerTheme.MONEY.darkened(0.15))







			var bg_lo: float = 0.12 + bl_plank
			var bg_hi: float = h - bl_plank
			for bg_y in [bg_lo, bg_hi]:
				_add_box(Vector3(c.x, bg_y, bl_front + 0.04),
					Vector3(r.size.x * 0.9, 0.05, 0.05), col.lightened(0.1), 1)






			var bglass: MeshInstance3D = _add_box(
				Vector3(c.x,(bg_lo + bg_hi) * 0.5, bl_front + 0.05),
				Vector3(r.size.x * 0.92, bg_hi - bg_lo, 0.03),
				Color(0.8, 0.88, 0.92, 0.1))
			var bgm: StandardMaterial3D =(bglass.mesh as BoxMesh).material
			bgm.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
			bglass.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
			var bshine: MeshInstance3D = _add_box(
				Vector3(c.x, bg_lo +(bg_hi - bg_lo) * 0.72, bl_front + 0.02),
				Vector3(r.size.x * 0.8,(bg_hi - bg_lo) * 0.16, 0.02),
				Color(0.92, 0.96, 1.0, 0.13))
			var bshm: StandardMaterial3D =(bshine.mesh as BoxMesh).material
			bshm.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
			bshine.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF




			_add_keepsake_balls(c, r, [bl_y0, bl_y1], bl_plank,
				BALLS_PER_TIER, _ball_offset(prop))
		"balones_museo":









			var mu_plank: float = 0.07
			var mu_deep: float = r.size.y
			var mu_front: float = c.y - mu_deep * 0.5
			var mu_back: float = c.y + mu_deep * 0.5
			var mu_zoc: float = 0.14


			_add_box(Vector3(c.x, mu_zoc * 0.5, c.y),
				Vector3(r.size.x - 0.14, mu_zoc, mu_deep - 0.14),
				col.darkened(0.45))

			_add_box(Vector3(c.x, mu_zoc +(h - mu_zoc) * 0.5, mu_back - 0.03),
				Vector3(r.size.x, h - mu_zoc, 0.06), col.darkened(0.35))
			for mu_s in [-1.0, 1.0]:
				_add_box(Vector3(c.x + mu_s *(r.size.x * 0.5 - 0.05),
						mu_zoc +(h - mu_zoc) * 0.5, c.y),
					Vector3(0.1, h - mu_zoc, mu_deep), col.darkened(0.12))



			var mu_y0: float = float(look.get("top", 0.42))
			var mu_hueco: float =(h - 0.16) - mu_y0
			var mu_tiers: Array = []
			for mu_i in MUSEO_TIERS:
				mu_tiers.append(mu_y0 + mu_hueco * float(mu_i)
					/ float(MUSEO_TIERS))
			for mu_y in mu_tiers:
				_add_box(Vector3(c.x, float(mu_y), c.y),
					Vector3(r.size.x * 0.94, mu_plank, mu_deep * 0.92),
					col.lightened(0.08))





			_add_box(Vector3(c.x, h - 0.03, c.y),
				Vector3(r.size.x * 1.02, 0.05, mu_deep * 1.02),
				col.darkened(0.25))
			_add_box(Vector3(c.x, h - 0.12, mu_front + 0.02),
				Vector3(r.size.x * 0.98, 0.03, 0.03), CareerTheme.MONEY)



			for mu_gy in mu_tiers:
				_add_strip(Vector3(c.x, float(mu_gy) + 0.12, mu_back - 0.1),
					Vector3(r.size.x * 0.86, 0.15, 0.02))
				_add_strip(Vector3(c.x, float(mu_gy) - 0.035, mu_front + 0.05),
					Vector3(r.size.x * 0.9, 0.025, 0.03))
			_add_luz(Vector3(c.x, mu_zoc +(h - mu_zoc) * 0.5, c.y),
				Color("ffe6c2"), 2.0, 4.0)

			_add_box(Vector3(c.x, mu_zoc + 0.09, mu_front + 0.02),
				Vector3(minf(r.size.x * 0.24, 0.55), 0.1, 0.03),
				CareerTheme.MONEY.darkened(0.15))



			var mu_lo: float = mu_zoc + 0.06
			var mu_hi: float = h - 0.12
			for mu_gy2 in [mu_lo, mu_hi]:
				_add_box(Vector3(c.x, mu_gy2, mu_front + 0.05),
					Vector3(r.size.x * 0.9, 0.05, 0.06), col.lightened(0.1), 1)
			var mu_panes: Array = [
				[Vector3(c.x,(mu_lo + mu_hi) * 0.5, mu_front + 0.06),
					Vector3(r.size.x * 0.92, mu_hi - mu_lo, 0.03)],
				[Vector3(c.x - r.size.x * 0.5 + 0.11,(mu_lo + mu_hi) * 0.5, c.y),
					Vector3(0.03, mu_hi - mu_lo, mu_deep * 0.9)],
				[Vector3(c.x + r.size.x * 0.5 - 0.11,(mu_lo + mu_hi) * 0.5, c.y),
					Vector3(0.03, mu_hi - mu_lo, mu_deep * 0.9)],
			]
			for mu_p in mu_panes:
				var mu_g: MeshInstance3D = _add_box(mu_p[0], mu_p[1],
					Color(0.8, 0.88, 0.92, 0.1))
				var mu_gm: StandardMaterial3D =(mu_g.mesh as BoxMesh).material
				mu_gm.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
				mu_g.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
			var mu_sh: MeshInstance3D = _add_box(
				Vector3(c.x, mu_lo +(mu_hi - mu_lo) * 0.74, mu_front + 0.03),
				Vector3(r.size.x * 0.78,(mu_hi - mu_lo) * 0.14, 0.02),
				Color(0.92, 0.96, 1.0, 0.13))
			var mu_shm: StandardMaterial3D =(mu_sh.mesh as BoxMesh).material
			mu_shm.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
			mu_sh.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF

			_add_keepsake_balls(c, r, mu_tiers, mu_plank, MUSEO_PER_TIER,
				_ball_offset(prop), mu_deep * 0.3)
		"perchero_tienda":









			var pt_cromo: Color = col
			var pt_largo: float = r.size.x if along_x else r.size.y
			var pt_alto: float = 2.12
			for pt_s in [-1.0, 1.0]:
				var pt_off: float = pt_s *(pt_largo * 0.5 - 0.05)
				var pt_p: Vector2 = c +(Vector2(pt_off, 0.0) if along_x else Vector2(0.0, pt_off))
				_add_box(Vector3(pt_p.x, pt_alto * 0.5, pt_p.y), Vector3(0.07, pt_alto, 0.07), pt_cromo)
				_add_box(Vector3(pt_p.x, pt_alto + 0.03, pt_p.y), Vector3(0.11, 0.06, 0.11), pt_cromo.lightened(0.2))
				_add_box(Vector3(pt_p.x, 0.03, pt_p.y),
					Vector3(0.14, 0.06, 0.5) if along_x else Vector3(0.5, 0.06, 0.14),
					Color("2b2f36"))
			_add_box(Vector3(c.x, 0.1, c.y),
				Vector3(pt_largo - 0.1, 0.05, 0.05) if along_x
					else Vector3(0.05, 0.05, pt_largo - 0.1), pt_cromo.darkened(0.25))
			for pt_f in range(House.PERCHERO_FILAS):
				var pt_y: float = 1.7 + 0.35 - float(pt_f) * House.PERCHERO_FILA_DY
				_add_box(Vector3(c.x, pt_y, c.y),
					Vector3(pt_largo - 0.06, 0.05, 0.05) if along_x
						else Vector3(0.05, 0.05, pt_largo - 0.06), pt_cromo)
		"urna_playeras":







			var ur_face: int = int(prop.get("face", House.base_face(prop)))&3
			var ur_lx: bool =(ur_face&1) == 0
			var ur_dir: Vector2 = House.FACE_DIR[ur_face]
			var ur_largo: float = r.size.x if ur_lx else r.size.y
			var ur_fondo: float = r.size.y if ur_lx else r.size.x
			var ur_zoc: float = 0.42
			var ur_hang: float = float(prop.get("y", 1.42))
			_caja_cara(c, ur_lx, ur_dir, 0.0, ur_zoc * 0.5, 0.0, ur_largo, ur_zoc, ur_fondo,
				col.darkened(0.1))


			_caja_cara(c, ur_lx, ur_dir, 0.0, ur_zoc - 0.05, ur_fondo * 0.5 + 0.005,
				ur_largo * 0.96, 0.03, 0.03, CareerTheme.MONEY)
			_caja_cara(c, ur_lx, ur_dir, 0.0, ur_zoc * 0.5, ur_fondo * 0.5 + 0.005,
				minf(ur_largo * 0.22, 0.5), 0.1, 0.03, CareerTheme.MONEY.darkened(0.15))
			_caja_cara(c, ur_lx, ur_dir, 0.0, ur_zoc + 0.01, 0.0, ur_largo * 0.98, 0.04,
				ur_fondo * 0.98, col.lightened(0.1))

			for ur_sa in [-1.0, 1.0]:
				for ur_sb in [-1.0, 1.0]:
					_caja_cara(c, ur_lx, ur_dir, ur_sa *(ur_largo * 0.5 - 0.03),
						(ur_zoc - 0.02 + h - 0.05) * 0.5, ur_sb *(ur_fondo * 0.5 - 0.03),
						0.05, h - 0.03 - ur_zoc, 0.05, col.lightened(0.05))
			_caja_cara(c, ur_lx, ur_dir, 0.0, h - 0.05, 0.0, ur_largo + 0.04, 0.1,
				ur_fondo + 0.04, col.darkened(0.2))
			_caja_cara(c, ur_lx, ur_dir, 0.0, h - 0.115, ur_fondo * 0.5 + 0.005,
				ur_largo * 0.96, 0.025, 0.02, CareerTheme.MONEY)


			_caja_cara(c, ur_lx, ur_dir, 0.0,(ur_zoc + h - 0.1) * 0.5, - ur_fondo * 0.5 + 0.06,
				ur_largo - 0.14, h - 0.12 - ur_zoc, 0.02, Color("1d2229"))
			_caja_cara(c, ur_lx, ur_dir, 0.0, ur_hang + 0.48, 0.0, ur_largo - 0.16, 0.03, 0.03,
				Color("b8c0c8"))
			_add_strip(Vector3(c.x, h - 0.13, c.y),
				Vector3(ur_largo * 0.9, 0.02, 0.06) if ur_lx else Vector3(0.06, 0.02, ur_largo * 0.9))
			_add_luz(Vector3(c.x + ur_dir.x * 0.4, h * 0.62, c.y + ur_dir.y * 0.4),
				Color("ffe6c2"), 1.6, 3.5)

			var ur_lo: float = ur_zoc + 0.03
			var ur_hi: float = h - 0.1
			var ur_ym: float =(ur_lo + ur_hi) * 0.5
			for ur_pane in [
					[0.0, ur_fondo * 0.5 - 0.03, ur_largo - 0.1, 0.012],
					[-(ur_largo * 0.5 - 0.03), 0.0, 0.012, ur_fondo - 0.1],
					[ur_largo * 0.5 - 0.03, 0.0, 0.012, ur_fondo - 0.1]]:
				_vuelve_vidrio(_caja_cara(c, ur_lx, ur_dir, float(ur_pane[0]), ur_ym,
					float(ur_pane[1]), float(ur_pane[2]), ur_hi - ur_lo, float(ur_pane[3]),
					Color(0.8, 0.88, 0.92, 0.1)))
			_vuelve_vidrio(_caja_cara(c, ur_lx, ur_dir, 0.0, ur_lo +(ur_hi - ur_lo) * 0.74,
				ur_fondo * 0.5 - 0.022, ur_largo * 0.78,(ur_hi - ur_lo) * 0.12, 0.004,
				Color(0.92, 0.96, 1.0, 0.13)))
		"mural_playeras":




			var mu2_face: int = int(prop.get("face", House.base_face(prop)))&3
			var mu2_lx: bool =(mu2_face&1) == 0
			var mu2_dir: Vector2 = House.FACE_DIR[mu2_face]
			var mu2_largo: float = r.size.x if mu2_lx else r.size.y
			var mu2_fondo: float =(r.size.y if mu2_lx else r.size.x) * 0.5
			var mu2_y: float = float(prop.get("y", 1.27))

			_caja_cara(c, mu2_lx, mu2_dir, 0.0, mu2_y, - mu2_fondo * 0.5, mu2_largo, 1.86,
				mu2_fondo, col.darkened(0.15), 1)
			for mu2_dy in [0.95, -0.95]:
				_caja_cara(c, mu2_lx, mu2_dir, 0.0, mu2_y + mu2_dy, 0.0, mu2_largo + 0.04, 0.06,
					0.08, col.lightened(0.12), 1)
			for mu2_k in 3:
				var mu2_a: float = House.MURAL_PASO * float(mu2_k - 1)
				var mu2_p: Vector2 = c +(Vector2(mu2_a, 0.0) if mu2_lx else Vector2(0.0, mu2_a)) \
						+ mu2_dir * 0.12
				_add_strip(Vector3(mu2_p.x, mu2_y + 0.895, mu2_p.y), Vector3(0.16, 0.04, 0.1)
					if mu2_lx else Vector3(0.1, 0.04, 0.16))
		"vitrina_especiales":






			var ve_face: int = int(prop.get("face", House.base_face(prop)))&3
			var ve_lx: bool =(ve_face&1) == 0
			var ve_dir: Vector2 = House.FACE_DIR[ve_face]
			var ve_largo: float = r.size.x if ve_lx else r.size.y
			var ve_fondo: float = r.size.y if ve_lx else r.size.x
			var ve_y: float = float(prop.get("y", 1.4))
			var ve_lo: float = ve_y - House.prop_alto("vitrina_especiales") * 0.5
			var ve_hi: float = ve_y + House.prop_alto("vitrina_especiales") * 0.5
			var ve_cap: int = int(prop.get("cap", 4))

			_caja_cara(c, ve_lx, ve_dir, 0.0, ve_hi - 0.05, 0.0, ve_largo, 0.1, ve_fondo, col, 1)
			_caja_cara(c, ve_lx, ve_dir, 0.0, ve_lo + 0.05, 0.0, ve_largo, 0.1, ve_fondo, col, 1)
			_caja_cara(c, ve_lx, ve_dir, 0.0, ve_y, - ve_fondo * 0.5 + 0.03, ve_largo - 0.02,
				ve_hi - ve_lo - 0.1, 0.04, Color("3a1620"), 1)

			var ve_alto_in: float = ve_hi - ve_lo - 0.13
			for ve_sa in [-1.0, 1.0]:
				_caja_cara(c, ve_lx, ve_dir, ve_sa *(ve_largo * 0.5 - 0.03), ve_y, -0.005,
					0.06, ve_alto_in, ve_fondo - 0.03, col.lightened(0.06), 1)
			for ve_k in range(1, ve_cap):
				var ve_a: float = House.ESPECIALES_PASO *(float(ve_k) - float(ve_cap) * 0.5)
				_caja_cara(c, ve_lx, ve_dir, ve_a, ve_y, -0.01, 0.04, ve_alto_in,
					ve_fondo - 0.05, col.lightened(0.06), 1)

			for ve_k in ve_cap:
				var ve_a2: float = House.ESPECIALES_PASO *(float(ve_k) - float(ve_cap - 1) * 0.5)
				var ve_p: Vector2 = c +(Vector2(ve_a2, 0.0) if ve_lx else Vector2(0.0, ve_a2))
				_add_strip(Vector3(ve_p.x, ve_hi - 0.115, ve_p.y), Vector3(0.6, 0.02, 0.05)
					if ve_lx else Vector3(0.05, 0.02, 0.6))
				_caja_cara(c, ve_lx, ve_dir, ve_a2, ve_lo + 0.13, ve_fondo * 0.5 - 0.07, 0.3,
					0.06, 0.02, CareerTheme.MONEY.darkened(0.1), 1)

			_caja_cara(c, ve_lx, ve_dir, 0.0, ve_hi - 0.05, ve_fondo * 0.5 + 0.005,
				ve_largo * 0.98, 0.025, 0.03, CareerTheme.MONEY, 1)
			_vuelve_vidrio(_caja_cara(c, ve_lx, ve_dir, 0.0, ve_y, ve_fondo * 0.5 - 0.03,
				ve_largo - 0.08, ve_hi - ve_lo - 0.22, 0.012, Color(0.8, 0.88, 0.92, 0.1), 1))
			_vuelve_vidrio(_caja_cara(c, ve_lx, ve_dir, 0.0, ve_y + 0.3, ve_fondo * 0.5 - 0.022,
				ve_largo * 0.8, 0.1, 0.004, Color(0.95, 0.98, 1.0, 0.14), 1))
			_add_luz(Vector3(c.x + ve_dir.x * 0.5, ve_y + 0.2, c.y + ve_dir.y * 0.5),
				Color("ffe6c2"), 1.4, 3.0)
		"playera":






















			var pl_face: int = int(prop.get("face", House.base_face(prop)))&3
			var pl_lx: bool =(pl_face&1) == 0
			var pl_dir: Vector2 = House.FACE_DIR[pl_face]
			var pl_sg: float = pl_dir.y if pl_lx else pl_dir.x
			_add_jersey_frame(
				_jersey_solo_at(r, pl_dir, float(prop.get("y", 1.3))),
				pl_lx, pl_sg, col, JERSEY_SOLO_W, JERSEY_SOLO_H)
		"gorras_seleccion":

























			var gs_por_aro: int = 6
			var gs_pilas: int = 2
			var gs_por_pila: int = 6





			var gs_aforo: int = gs_por_aro * 2 + gs_pilas * gs_por_pila









			var gs_mio: String = str(prop.get("id", ""))
			var gs_off: int = 0
			for gs_pr in (_plano()["props"] as Array):
				var gs_otro: Dictionary = gs_pr as Dictionary
				if str(gs_otro.get("kind", "")) != "gorras_seleccion":
					continue
				if bool(gs_otro.get("guardado", false)):
					continue
				if str(gs_otro.get("id", "")) < gs_mio:
					gs_off += gs_aforo
			var gs_mias: int = clampi(Career.nat_caps - gs_off, 0, gs_aforo)








			var gs_col: Color = Color("2a4bd7")
			var gs_col2: Color = Color("f0efe8")
			var gs_nat: Dictionary = Nations.as_team(Career.nationality)
			if gs_nat.has("kit"):
				gs_col = gs_nat["kit"]
				gs_col2 = gs_nat.get("kit2", gs_col2)
			else:
				var gs_kit: Dictionary = GameState.player_kit()
				gs_col = gs_kit.get("kit", gs_col)
				gs_col2 = gs_kit.get("kit2", gs_col2)


			var gs_trim: Color = _pal.get("trim", TRIM_COL)



			var gs_pie: float = 0.1
			_add_box(Vector3(c.x, gs_pie * 0.5, c.y),
				Vector3(r.size.x * 0.86, gs_pie, r.size.y * 0.86),
				col.darkened(0.3))

			var gs_by: float = 0.4
			var gs_bt: float = 0.05
			_add_box(Vector3(c.x, gs_by, c.y),
				Vector3(r.size.x * 0.94, gs_bt, r.size.y * 0.82),
				col.lightened(0.1))



			var gs_p0: float = 0.06
			var gs_p1: float = h - 0.06
			_add_box(Vector3(c.x,(gs_p0 + gs_p1) * 0.5, c.y),
				Vector3(0.09, gs_p1 - gs_p0, 0.09), col)




			_add_box(Vector3(c.x, h - 0.045, c.y), Vector3(0.14, 0.06, 0.14), gs_trim)










			var gs_rx: float = r.size.x * 0.32
			var gs_rz: float = 0.3
			var gs_y0: float = 1.02
			var gs_y1: float = 1.52
			for gs_ay in [gs_y0, gs_y1]:
				var gs_tor: TorusMesh = TorusMesh.new()
				gs_tor.inner_radius = gs_rx - 0.025
				gs_tor.outer_radius = gs_rx + 0.025
				gs_tor.rings = 20
				gs_tor.ring_segments = 5
				var gs_anillo: MeshInstance3D = _add_malla(gs_tor,
					Vector3(c.x, float(gs_ay), c.y), gs_trim, 0.6)
				gs_anillo.scale = Vector3(1.0, 1.0, gs_rz)
				gs_anillo.cast_shadow = \
						GeometryInstance3D.SHADOW_CASTING_SETTING_OFF





			var gs_colgadas: int = mini(gs_mias, gs_por_aro * 2)
			for gs_i in gs_colgadas:
				var gs_arriba: bool = gs_i >= gs_por_aro
				var gs_k: int = gs_i -(gs_por_aro if gs_arriba else 0)
				var gs_ah: float = gs_y1 if gs_arriba else gs_y0
				var gs_a: float =(float(gs_k) / float(gs_por_aro - 1) - 0.5) \
						* deg_to_rad(130.0)
				var gs_nx: float = sin(gs_a)
				var gs_nz: float = - cos(gs_a)



				var gs_pos: Vector3 = Vector3(c.x + gs_nx * gs_rx, gs_ah - 0.09,
					c.y + gs_nz * gs_rx * gs_rz)



				var gs_copa: MeshInstance3D = _add_box(gs_pos,
					Vector3(0.2, 0.11, 0.16),
					gs_col if gs_k % 2 == 0 else gs_col.lightened(0.12))



				gs_copa.rotation.y = - gs_a











				var gs_vis: MeshInstance3D = _add_box(
					gs_pos + Vector3(gs_nx, 0.0, gs_nz) * 0.085
						+ Vector3(0.0, -0.035, 0.0),
					Vector3(0.17, 0.03, 0.1), gs_col2)
				gs_vis.rotation.y = - gs_a






			var gs_resto: int = gs_mias - gs_colgadas
			for gs_j in gs_pilas:
				var gs_en: int = clampi(gs_resto - gs_j * gs_por_pila, 0,
					gs_por_pila)
				if gs_en <= 0:
					break
				var gs_alt: float = 0.045 * float(gs_en)
				var gs_ox: float =(float(gs_j) * 2.0 - 1.0) * r.size.x * 0.28


				var gs_cy: float = gs_by + gs_bt * 0.5 - 0.01 + gs_alt * 0.5
				_add_box(Vector3(c.x + gs_ox, gs_cy, c.y),
					Vector3(0.2, gs_alt, 0.16),
					gs_col if gs_j % 2 == 0 else gs_col2)


				_add_box(Vector3(c.x + gs_ox, gs_cy + gs_alt * 0.5 - 0.02,
						c.y - 0.12),
					Vector3(0.17, 0.03, 0.1),
					gs_col2 if gs_j % 2 == 0 else gs_col)
		"balon_debut":

















			var bu_gol: Dictionary = Career.first_goal
			var bu_hay: bool = not bu_gol.is_empty() \
					and not bool(bu_gol.get("perdido", false))
			var bu_base: float = float(look.get("top", h * 0.55))











			var bu_zh: float = 0.12
			var bu_mh: float = 0.06
			_add_box(Vector3(c.x, bu_zh * 0.5, c.y),
				Vector3(r.size.x * 0.66, bu_zh, r.size.y * 0.92), col.darkened(0.45))
			var bu_f0: float = bu_zh - 0.02
			var bu_f1: float = bu_base - bu_mh * 0.5
			_add_box(Vector3(c.x,(bu_f0 + bu_f1) * 0.5, c.y),
				Vector3(r.size.x * 0.44, bu_f1 - bu_f0, r.size.y * 0.62),
				col.darkened(0.1))
			_add_box(Vector3(c.x, bu_base - bu_mh * 0.5, c.y),
				Vector3(r.size.x * 0.62, bu_mh, r.size.y * 0.86), col)













			var bu_front: float = c.y - r.size.y * 0.31
			_add_box(Vector3(c.x, 0.36, bu_front - 0.01),
				Vector3(r.size.x * 0.4, 0.18, 0.04), LAMINA_ORO.darkened(0.15))
			if bu_hay:






















				var bu_riv: String = _club_label(String(bu_gol.get("rival", "")))
				var bu_lin: Array = []
				if not bu_riv.strip_edges().is_empty():
					bu_lin.append({"t": I18n.tf("VS {0}", [bu_riv]), "px": 2})
				bu_lin.append({"t": I18n.tf("TEMPORADA {0}",
					[int(bu_gol.get("season", 1))]), "px": 1})
				_add_lamina(bu_lin, Vector3(c.x, 0.36, bu_front - 0.03),
					Vector2(r.size.x * 0.36, 0.15), Vector2(0.0, -1.0),
					Color("3a3026"), LAMINA_ORO)






			var bu_aro: float = bu_base + 0.02
			_add_cilindro(Vector3(c.x, bu_base - 0.005, c.y), 0.085, 0.085, 0.05,
				LAMINA_ORO.darkened(0.1))
			_add_cilindro(Vector3(c.x, bu_base - 0.015, c.y), 0.055, 0.055, 0.05,
				col.darkened(0.6))














			var bu_uw: float = r.size.x * 0.5
			var bu_ud: float = r.size.y * 0.68
			var bu_lo: float = bu_base + 0.03
			var bu_hi: float = h - bu_mh + 0.02
			var bu_gl: MeshInstance3D = _add_box(
				Vector3(c.x,(bu_lo + bu_hi) * 0.5, c.y),
				Vector3(bu_uw * 0.9, bu_hi - bu_lo, bu_ud * 0.9),
				Color(0.8, 0.88, 0.92, 0.1), 1)
			var bu_gm: StandardMaterial3D =(bu_gl.mesh as BoxMesh).material
			bu_gm.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
			bu_gl.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF




			var bu_sh: MeshInstance3D = _add_box(
				Vector3(c.x, bu_base +(h - bu_base) * 0.72,
					c.y - bu_ud * 0.5 + 0.008),
				Vector3(bu_uw * 0.9,(h - bu_base) * 0.18, 0.02),
				Color(0.92, 0.96, 1.0, 0.13))
			var bu_shm: StandardMaterial3D =(bu_sh.mesh as BoxMesh).material
			bu_shm.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
			bu_sh.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF



			var bu_p0: float = bu_base - 0.02
			var bu_p1: float = h - 0.03
			for bu_sx in [-1.0, 1.0]:
				for bu_sz in [-1.0, 1.0]:
					_add_box(Vector3(c.x + bu_sx *(bu_uw * 0.5 - 0.015),
						(bu_p0 + bu_p1) * 0.5,
						c.y + bu_sz *(bu_ud * 0.5 - 0.015)),
						Vector3(0.03, bu_p1 - bu_p0, 0.03), col.lightened(0.1))



			_add_box(Vector3(c.x, h - bu_mh * 0.5, c.y),
				Vector3(bu_uw + 0.06, bu_mh, bu_ud + 0.06), col.lightened(0.05))





			_add_strip(Vector3(c.x, bu_hi - 0.06, c.y - bu_ud * 0.5 + 0.04),
				Vector3(bu_uw * 0.7, 0.02, 0.02))








			if bu_hay:
				var bu_fr: SpriteFrames = BallDeco.frames_for(
					Keepsakes.fixture_of(bu_gol), true)
				if bu_fr != null and bu_fr.has_animation("idle") \
						and bu_fr.get_frame_count("idle") > 0:
					var bu_padre: Node = _box_parent if _box_parent != null \
							else viewport
					var bu_spr: Sprite3D = Sprite3D.new()
					bu_spr.texture = bu_fr.get_frame_texture("idle", 0)
					bu_spr.pixel_size = BALL_M / float(maxi(1,
						bu_spr.texture.get_height()))


					bu_spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
					bu_spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
					bu_spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD








					bu_spr.position = Vector3(c.x,
						bu_aro + BALL_M * 0.41 - 0.012, c.y)
					bu_padre.add_child(bu_spr)








					_add_ball_crest(bu_gol, c.x, bu_aro, c.y, bu_padre)
		"estatua_bronce":























			var eb_top: float = float(look.get("top", h * 0.3))










			var eb_zh: float = 0.14
			var eb_mh: float = 0.08
			_add_box(Vector3(c.x, eb_zh * 0.5, c.y),
				Vector3(r.size.x * 0.88, eb_zh, r.size.y * 0.88), col.darkened(0.42))
			var eb_f0: float = eb_zh - 0.02
			var eb_f1: float = eb_top - eb_mh * 0.5
			_add_box(Vector3(c.x,(eb_f0 + eb_f1) * 0.5, c.y),
				Vector3(r.size.x * 0.7, eb_f1 - eb_f0, r.size.y * 0.7),
				col.darkened(0.08))




			_add_box(Vector3(c.x, eb_top - eb_mh * 0.5, c.y),
				Vector3(r.size.x * 0.82, eb_mh, r.size.y * 0.82), col)














			var eb_front: float = c.y - r.size.y * 0.35
			_add_box(Vector3(c.x, 0.34, eb_front - 0.01),
				Vector3(r.size.x * 0.62, 0.3, 0.04), LAMINA_ORO.darkened(0.18))














			var eb_cab: Dictionary = Trophies.cabinet(Career.awards)
			var eb_n: int = 0
			for eb_fam in ["team", "individual"]:
				for eb_it in eb_cab.get(eb_fam, []):
					eb_n += int((eb_it as Dictionary).get("count", 0))
			var eb_txt: String = I18n.t("SIN TÍTULOS")
			if eb_n > 0:
				eb_txt = I18n.tf("{0} TROFEOS", [eb_n])













			_add_lamina([{"t": Career.nombre_espalda(), "px": 2},
				{"t": eb_txt, "px": 1}],
				Vector3(c.x, 0.34, eb_front - 0.03),
				Vector2(r.size.x * 0.56, 0.26), Vector2(0.0, -1.0),
				Color("2f2a22"), LAMINA_ORO)









			_add_strip(Vector3(c.x, eb_top + 0.02, c.y - r.size.y * 0.34),
				Vector3(r.size.x * 0.34, 0.03, 0.05))








			var eb_tex: Texture2D = _bronce_tex(player_cfg())
			if eb_tex != null:


				var eb_img: Image = SceneFade.imagen(eb_tex)
				var eb_uso: Rect2i = eb_img.get_used_rect() if eb_img != null else Rect2i()
				if eb_uso.size.y > 0:











					var eb_px: float =(h - eb_top) / float(eb_uso.size.y)





					var eb_pies: float = float(eb_img.get_height()) * 0.5 \
							- float(eb_img.get_height() - eb_uso.end.y)
					var eb_padre: Node = _box_parent if _box_parent != null \
							else viewport
					var eb_spr: Sprite3D = Sprite3D.new()
					eb_spr.texture = eb_tex
					eb_spr.pixel_size = eb_px



					eb_spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
					eb_spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
					eb_spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
					eb_spr.position = Vector3(c.x, eb_top + eb_pies * eb_px, c.y)
					eb_padre.add_child(eb_spr)
		"camisetas":














			var cm_face: int = int(prop.get("face", House.base_face(prop)))&3
			var cm_lx: bool =(cm_face&1) == 0
			var cm_dir: Vector2 = House.FACE_DIR[cm_face]
			var cm_sg: float = cm_dir.y if cm_lx else cm_dir.x
			var cm_y: float = float(prop.get("y", 1.55))
			var cm_largo: float =(r.size.x if cm_lx else r.size.y)




			var cm_fondo: float =(r.size.y if cm_lx else r.size.x) * 0.5
			var cm_back: Vector2 = - cm_dir *(cm_fondo * 0.5)
			_add_box(Vector3(c.x + cm_back.x, cm_y, c.y + cm_back.y),










				Vector3(r.size.x if cm_lx else cm_fondo, 1.45,
					cm_fondo if cm_lx else r.size.y),
				col.darkened(0.15), 1)



			for cm_dy in [0.78, -0.78]:
				_add_box(Vector3(c.x, cm_y + cm_dy, c.y),
					Vector3(r.size.x + 0.04 if cm_lx else 0.08, 0.06,
						0.08 if cm_lx else r.size.y + 0.04),
					col.lightened(0.12), 1)



			for cm_s in [-1.0, 1.0]:
				var cm_o: Vector2 = Vector2(cm_s * cm_largo * 0.3, 0.0) if cm_lx \
						else Vector2(0.0, cm_s * cm_largo * 0.3)
				var cm_ad: Vector2 = cm_dir * 0.12
				_add_strip(Vector3(c.x + cm_o.x + cm_ad.x, cm_y + 0.75,
					c.y + cm_o.y + cm_ad.y), Vector3(0.16, 0.04, 0.1))
		"alfombra":










			var al_h: float = h
			_add_box(Vector3(c.x, al_h * 0.4, c.y),
				Vector3(r.size.x, al_h * 0.8, r.size.y), col.darkened(0.25))
			_add_box(Vector3(c.x, al_h * 0.45, c.y),
				Vector3(r.size.x - 0.22, al_h * 0.9, r.size.y - 0.22), col)


			_add_box(Vector3(c.x, al_h * 0.5, c.y),
				Vector3(maxf(r.size.x - 0.9, 0.2), al_h,
					maxf(r.size.y - 0.9, 0.2)), col.lightened(0.1))


			for ax in [-1.0, 1.0]:
				for az in [-1.0, 1.0]:
					_add_box(Vector3(c.x + ax *(r.size.x * 0.5 - 0.18), al_h * 0.52,
						c.y + az *(r.size.y * 0.5 - 0.18)),
						Vector3(0.24, al_h, 0.24), col.darkened(0.45))
		"tele":



			var stand_h: float = 0.4





			var tv_k: float = House.tv_scale(Career.house_extras)
			var sh: float =(h - stand_h) * tv_k
			var scr_w: float =(maxf(r.size.x, 0.9) if along_x else r.size.x) * tv_k
			var scr_d: float =(r.size.y if along_x else maxf(r.size.y, 0.9)) * tv_k




			var tv_t: int = House.tv_tier(Career.house_extras)
			var perp: float = r.size.y if along_x else r.size.x
			var span: float = scr_w if along_x else scr_d
			var scr_y0: float = 0.72 if tv_t >= 2 else stand_h

			var mando_y: float = 0.6825 if tv_t >= 2 else (stand_h + 0.0375 if tv_t == 1 else stand_h + 0.0125)
			var mando_at: Vector3 = Vector3(c.x, mando_y, c.y) +(Vector3(span * 0.28, 0, - perp * 0.24) if along_x else Vector3(- perp * 0.24, 0, span * 0.28))
			_add_box(mando_at, Vector3(0.075, 0.025, 0.18) if along_x else Vector3(0.18, 0.025, 0.075), Color("272d33"))
			for tecla in [-0.045, 0.0, 0.045]:
				_add_box(mando_at + Vector3(0 if along_x else tecla, 0.016, tecla if along_x else 0), Vector3(0.025, 0.009, 0.025), Color("8e989b"))
			if tv_t >= 2:


				var cw: float = span * 0.72
				var cy: float = 0.5
				_add_box(Vector3(c.x, cy, c.y),
					Vector3(cw if along_x else perp * 0.8, 0.26,
						perp * 0.8 if along_x else cw), col.lightened(0.05))
				_add_box(Vector3(c.x, cy + 0.15, c.y),
					Vector3((cw + 0.05) if along_x else (perp * 0.8 + 0.04), 0.04,
						(perp * 0.8 + 0.04) if along_x else (cw + 0.05)),
					col.lightened(0.22))
				var led: MeshInstance3D = _add_box(Vector3(c.x, cy - 0.16, c.y),
					Vector3(cw * 0.94 if along_x else 0.05, 0.03,
						0.05 if along_x else cw * 0.94), Color("2f4a63"))
				var lmat: StandardMaterial3D =(led.mesh as BoxMesh).material
				lmat.emission_enabled = true
				lmat.emission = Color("3d6d96")
				lmat.emission_energy_multiplier = 0.8
			elif tv_t == 1:


				var bw: float = span * 0.95
				_add_box(Vector3(c.x, stand_h * 0.5, c.y),
					Vector3(bw if along_x else perp, stand_h,
						perp if along_x else bw), col.lightened(0.05))
				_add_box(Vector3(c.x, stand_h, c.y),
					Vector3((bw + 0.06) if along_x else (perp + 0.04), 0.05,
						(perp + 0.04) if along_x else (bw + 0.06)),
					col.lightened(0.22))
				_add_box(Vector3(c.x, stand_h + 0.1, c.y),
					Vector3(bw * 0.82 if along_x else 0.05, 0.06,
						0.05 if along_x else bw * 0.82), col.darkened(0.5))
			else:

				_add_box(Vector3(c.x, stand_h * 0.5, c.y),
					Vector3(span * 0.9 if along_x else perp, stand_h,
						perp if along_x else span * 0.9), col.lightened(0.1))
			_add_box(Vector3(c.x, scr_y0 + sh * 0.5, c.y),
				Vector3(scr_w if along_x else 0.08, sh,
					0.08 if along_x else scr_d), col.darkened(0.4))





			var reel: Dictionary = Career.goal_reel




			_add_tv_screen(reel,
				Vector3(c.x, scr_y0 + sh * 0.55, c.y),
				Vector2(scr_w * 0.86, sh * 0.72), along_x)
		"cocina":

			var largo_k: float = r.size.x if along_x else r.size.y
			var fondo_k: float = r.size.y if along_x else r.size.x
			for junta in [-0.16, 0.16]:
				var at: Vector3 = Vector3(c.x, h * 0.5, c.y) +(Vector3(largo_k * junta, 0, - fondo_k * 0.5 - 0.006) if along_x else Vector3(- fondo_k * 0.5 - 0.006, 0, largo_k * junta))
				_add_box(at, Vector3(0.018, h * 0.8, 0.01) if along_x else Vector3(0.01, h * 0.8, 0.018), col.darkened(0.5))
				var alto_at: Vector3 = Vector3(c.x, 1.72, c.y) +(Vector3(largo_k * junta, 0, - fondo_k * 0.3 - 0.006) if along_x else Vector3(- fondo_k * 0.3 - 0.006, 0, largo_k * junta))
				_add_box(alto_at, Vector3(0.016, 0.56, 0.01) if along_x else Vector3(0.01, 0.56, 0.016), col.darkened(0.4), 1)
			for puerta in [-0.33, 0.0, 0.33]:
				_add_box(Vector3(c.x, h * 0.48, c.y) +(Vector3(largo_k * puerta, 0, - fondo_k * 0.5) if along_x else Vector3(- fondo_k * 0.5, 0, largo_k * puerta)),
					Vector3(largo_k * 0.26, h * 0.64, 0.025) if along_x else Vector3(0.025, h * 0.64, largo_k * 0.26), col.darkened(0.12))
			var tabla_at: Vector3 = Vector3(c.x, h + 0.065, c.y) +(Vector3(- largo_k * 0.3, 0, 0) if along_x else Vector3(0, 0, - largo_k * 0.3))
			_add_box(tabla_at, Vector3(largo_k * 0.2, 0.025, fondo_k * 0.55) if along_x else Vector3(fondo_k * 0.55, 0.025, largo_k * 0.2), Color("b7986c"))
			_add_box(tabla_at + Vector3(0, 0.018, 0), Vector3(0.15, 0.012, 0.025) if along_x else Vector3(0.025, 0.012, 0.15), Color("929d9d"))















			_add_box(Vector3(c.x, h * 0.5, c.y),
				Vector3(r.size.x, h, r.size.y), col.darkened(0.28))
			_add_box(Vector3(c.x, h, c.y),
				Vector3(r.size.x + 0.06, 0.08, r.size.y + 0.06), col)
			_add_box(Vector3(c.x, 1.72, c.y),
				Vector3(r.size.x * 0.9 if along_x else r.size.x * 0.6, 0.62,
					r.size.y * 0.6 if along_x else r.size.y * 0.9),
				col.darkened(0.12), 1)

			_add_box(Vector3(c.x, h + 0.045, c.y),
				Vector3(r.size.x * 0.34 if along_x else r.size.x * 0.7, 0.03,
					r.size.y * 0.7 if along_x else r.size.y * 0.34),
				Color("b9c0c4"))
			var k_u: Vector3 = Vector3.RIGHT if along_x else Vector3.BACK
			var k_d: Vector3 = Vector3.BACK if along_x else Vector3.RIGHT
			var k_at: Vector3 = Vector3(c.x, h + 0.062, c.y)
			_add_box(k_at, k_u *(largo_k * 0.27) + Vector3.UP * 0.008 + k_d *(fondo_k * 0.52), Color("56656a"))
			for borde in [-1.0, 1.0]:
				_add_box(k_at + k_u *(borde * largo_k * 0.15), k_u * 0.025 + Vector3.UP * 0.035 + k_d *(fondo_k * 0.64), Color("c6ced0"))
				_add_box(k_at + k_d *(borde * fondo_k * 0.3), k_u *(largo_k * 0.3) + Vector3.UP * 0.035 + k_d * 0.025, Color("c6ced0"))
			for curva in 8:
				var ang: float = float(curva) / 7.0 * PI
				_add_box(Vector3(c.x, h + 0.17 + sin(ang) * 0.16, c.y) + k_d *(cos(ang) * 0.1), Vector3(0.038, 0.065, 0.038), Color("cdd2d6"))

			var tost: Vector3 = Vector3(c.x, h + 0.13, c.y) - k_u *(largo_k * 0.35) - k_d *(fondo_k * 0.3)
			AsientosPulidosLib.acolchado(self, tost, k_u * 0.22 + Vector3.UP * 0.18 + k_d * 0.16, Color("dad4bf"))
			for ranura in [-1.0, 1.0]:
				_add_box(tost + Vector3.UP * 0.091 + k_d *(ranura * 0.035), k_u * 0.15 + Vector3.UP * 0.006 + k_d * 0.016, Color("373a39"))
			var burn: Vector2 = Vector2(r.size.x * 0.3, 0.0) if along_x \
					else Vector2(0.0, r.size.y * 0.3)
			for bx in [-1.0, 1.0]:
				for bz in [-1.0, 1.0]:
					_add_box(Vector3(c.x + burn.x + bx * 0.11,
						h + 0.05, c.y + burn.y + bz * 0.11),
						Vector3(0.13, 0.02, 0.13), Color("2f2f2e"))

			_add_box(Vector3(c.x + burn.x, 1.36, c.y + burn.y),
				Vector3(0.44 if along_x else r.size.x * 0.5, 0.1,
					r.size.y * 0.5 if along_x else 0.44), Color("aeb4b8"), 1)
			_add_box(Vector3(c.x + burn.x, 1.5, c.y + burn.y),
				Vector3(0.3 if along_x else r.size.x * 0.34, 0.2,
					r.size.y * 0.34 if along_x else 0.3), Color("9aa0a4"), 1)

			var n_k: int = 3
			for i in n_k:
				var t_k: float = -0.3 + float(i) * 0.3
				var ko: Vector2 = Vector2(t_k * r.size.x, 0.0) if along_x \
						else Vector2(0.0, t_k * r.size.y)
				var kf: Vector2 = Vector2(0.0, -(r.size.y * 0.5 + 0.03)) \
						if along_x else Vector2(-(r.size.x * 0.5 + 0.03), 0.0)
				_add_box(Vector3(c.x + ko.x + kf.x, h * 0.62, c.y + ko.y + kf.y),
					Vector3(0.22 if along_x else 0.04, 0.04,
						0.04 if along_x else 0.22), Color("b9c0c4"))
				_add_box(Vector3(c.x + ko.x + kf.x, 1.46, c.y + ko.y + kf.y),
					Vector3(0.2 if along_x else 0.04, 0.04,
						0.04 if along_x else 0.2), Color("b9c0c4"), 1)
		"cocina_dieta":
























			var cd_u: Vector3 = Vector3(1.0, 0.0, 0.0) if along_x \
					else Vector3(0.0, 0.0, 1.0)
			var cd_d: Vector3 = Vector3(0.0, 0.0, 1.0) if along_x \
					else Vector3(1.0, 0.0, 0.0)
			var cd_n: Vector3 = - cd_d
			var cd_alto: Vector3 = Vector3(0.0, 1.0, 0.0)
			var cd_l: float = r.size.x if along_x else r.size.y
			var cd_p: float = r.size.y if along_x else r.size.x
			var cd_c: Vector3 = Vector3(c.x, 0.0, c.y)




			var cd_nc: Vector3 = cd_c + cd_u *(- cd_l * 0.29)
			_add_box(cd_nc + cd_alto *(h * 0.5),
				cd_u *(cd_l * 0.42) + cd_alto * h + cd_d *(cd_p * 0.96),
				col.darkened(0.22))







			var cd_f: Vector3 = cd_n *(cd_p * 0.5 - 0.01)

			for bisagra_y in [0.27, 0.94, 1.38, 1.73]:
				_add_box(cd_nc + cd_f + cd_n * 0.034 + cd_u *(- cd_l * 0.18) + cd_alto * bisagra_y,
					cd_u * 0.035 + cd_alto * 0.07 + cd_d * 0.025, Color("b9c0c4"), 1)
			for rejilla in 3:
				_add_box(cd_nc + cd_f + cd_n * 0.032 + cd_alto *(0.11 + rejilla * 0.035),
					cd_u *(cd_l * 0.28) + cd_alto * 0.012 + cd_d * 0.01, col.darkened(0.5), 1)
			_add_box(cd_nc + cd_f + cd_alto * 0.61,
				cd_u *(cd_l * 0.4) + cd_alto * 1.14 + cd_d * 0.06,
				col.lightened(0.06))








			var cd_g: MeshInstance3D = _add_box(cd_nc + cd_f + cd_alto * 1.55,
				cd_u *(cd_l * 0.4) + cd_alto * 0.62 + cd_d * 0.06,
				Color(0.8, 0.88, 0.92, 0.22), 1)
			var cd_gm: StandardMaterial3D =(cd_g.mesh as BoxMesh).material
			cd_gm.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
			cd_g.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF











			var cd_ic: Vector3 = cd_nc + cd_n *(cd_p * 0.12)
			for cd_i in 2:
				var cd_by: float = 1.265 + 0.26 * float(cd_i)
				_add_box(cd_ic + cd_alto * cd_by,
					cd_u *(cd_l * 0.36) + cd_alto * 0.03 + cd_d *(cd_p * 0.56),
					col.lightened(0.2), 1)
				for cd_j in 2:
					_add_box(cd_ic + cd_u *((float(cd_j) - 0.5) * cd_l * 0.18)
							+ cd_alto *(cd_by + 0.09),
						cd_u *(cd_l * 0.15) + cd_alto * 0.2
							+ cd_d *(cd_p * 0.44),
						Color("cfd8c9") if cd_j == 0 else Color("d8c4a0"), 1)




			var cd_t: Vector3 = cd_n *(cd_p * 0.5 + 0.03) + cd_u *(cd_l * 0.16)
			for cd_k in 2:
				_add_box(cd_nc + cd_t + cd_alto *(1.02 + 0.42 * float(cd_k)),
					cd_u * 0.04 + cd_alto * 0.3 + cd_d * 0.05,
					Color("b9c0c4"), 1)

			var cd_bc: Vector3 = cd_c + cd_u *(cd_l * 0.23)
			_add_box(cd_bc + cd_alto * 0.46,
				cd_u *(cd_l * 0.5) + cd_alto * 0.92 + cd_d *(cd_p * 0.92),
				col.darkened(0.1))



			_add_box(cd_bc + cd_alto * 0.92,
				cd_u *(cd_l * 0.5 + 0.06) + cd_alto * 0.08
					+ cd_d *(cd_p * 0.92 + 0.06),
				col.lightened(0.12))





			_add_box(cd_bc + cd_n *(cd_p * 0.46 + 0.015) + cd_alto * 0.7,
				cd_u *(cd_l * 0.24) + cd_alto * 0.04 + cd_d * 0.04,
				Color("b9c0c4"))





			var cd_sc: Vector3 = cd_bc + cd_u *(- cd_l * 0.06)
			_add_box(cd_sc + cd_alto * 0.955,
				cd_u * 0.24 + cd_alto * 0.03 + cd_d * 0.2, Color("d5dade"))




			_add_box(cd_sc + cd_d * 0.08 + cd_alto * 0.99,
				cd_u * 0.14 + cd_alto * 0.07 + cd_d * 0.02, Color("2f3a40"))








			var cd_bl: Vector3 = cd_bc + cd_u *(cd_l * 0.16)
			_add_box(cd_bl + cd_alto * 1.0,
				cd_u * 0.16 + cd_alto * 0.1 + cd_d * 0.16, Color("3d444a"))
			_add_box(cd_bl + cd_alto * 1.17,
				cd_u * 0.12 + cd_alto * 0.26 + cd_d * 0.12, Color("cfd6da"))
		"cocina_isla":























			var ci_lg: float = r.size.x if along_x else r.size.y
			var ci_fo: float = r.size.y if along_x else r.size.x





			var ci_ax: Vector2 = Vector2(1.0, 0.0) if along_x else Vector2(0.0, 1.0)
			var ci_fr: Vector2 = Vector2(0.0, -1.0) if along_x else Vector2(-1.0, 0.0)


			var ci_cb: Vector2 = c - ci_fr *(ci_fo * 0.19)




			_add_box(Vector3(ci_cb.x, 0.06, ci_cb.y),
				Vector3(ci_lg * 0.86, 0.12, ci_fo * 0.5) if along_x
					else Vector3(ci_fo * 0.5, 0.12, ci_lg * 0.86), col.darkened(0.5))


			_add_box(Vector3(ci_cb.x,(h + 0.06) * 0.5, ci_cb.y),
				Vector3(ci_lg * 0.9, h - 0.14, ci_fo * 0.62) if along_x
					else Vector3(ci_fo * 0.62, h - 0.14, ci_lg * 0.9), col.darkened(0.28))



			_add_box(Vector3(c.x, h - 0.03, c.y),
				Vector3(ci_lg, 0.06, ci_fo) if along_x
					else Vector3(ci_fo, 0.06, ci_lg), col)






			for ci_i in 3:
				var ci_u: float =(float(ci_i) - 1.0) * ci_lg * 0.26
				var ci_p: Vector2 = ci_cb + ci_ax * ci_u + ci_fr *(ci_fo * 0.32)
				_add_box(Vector3(ci_p.x,(h + 0.06) * 0.5, ci_p.y),
					Vector3(ci_lg * 0.2, h - 0.26, 0.03) if along_x
						else Vector3(0.03, h - 0.26, ci_lg * 0.2), col.darkened(0.42))



			var ci_fg: Vector2 = ci_cb + ci_ax *(ci_lg * 0.26)
			_add_box(Vector3(ci_fg.x, h + 0.005, ci_fg.y),
				Vector3(ci_lg * 0.26, 0.03, ci_fo * 0.3) if along_x
					else Vector3(ci_fo * 0.3, 0.03, ci_lg * 0.26), Color("b9c0c4"))





			var ci_gr: Vector2 = ci_fg - ci_fr *(ci_fo * 0.2)
			_add_box(Vector3(ci_gr.x, h + 0.13, ci_gr.y),
				Vector3(0.05, 0.3, 0.05), Color("cdd2d6"))
			_add_box(Vector3(ci_gr.x + ci_fr.x * 0.09, h + 0.26,
					ci_gr.y + ci_fr.y * 0.09),
				Vector3(0.05, 0.05, 0.18) if along_x
					else Vector3(0.18, 0.05, 0.05), Color("cdd2d6"))






			var ci_rp: Vector2 = c + ci_fr *(ci_fo * 0.42)
			_add_box(Vector3(ci_rp.x, 0.22, ci_rp.y),
				Vector3(ci_lg * 0.78, 0.05, 0.05) if along_x
					else Vector3(0.05, 0.05, ci_lg * 0.78), Color("8a8f95"))
			for ci_s in [-1.0, 1.0]:
				var ci_po: Vector2 = ci_rp + ci_ax *(float(ci_s) * ci_lg * 0.36)
				_add_box(Vector3(ci_po.x, 0.11, ci_po.y),
					Vector3(0.05, 0.22, 0.05), Color("8a8f95"))





			var ci_tb: Vector2 = ci_cb - ci_ax *(ci_lg * 0.3)
			_add_box(Vector3(ci_tb.x, h + 0.02, ci_tb.y),
				Vector3(ci_lg * 0.18, 0.03, ci_fo * 0.28) if along_x
					else Vector3(ci_fo * 0.28, 0.03, ci_lg * 0.18),
				_pal.get("wood", Color("6b5540")))
			var ci_fu: Vector2 = ci_cb - ci_ax *(ci_lg * 0.06)
			_add_box(Vector3(ci_fu.x, h + 0.04, ci_fu.y),
				Vector3(0.22, 0.07, 0.22), Color("c9c4b4"))
		"librero":
			preload("res://ui/house/muebles_pulidos.gd").pintar(self, kind, r, col, h, prop)
		"planta":






			var pl_radio: float = minf(r.size.x, r.size.y) * 0.34
			var pl_maceta_h: float = minf(0.3, h * 0.34)
			_add_cilindro(Vector3(c.x, pl_maceta_h * 0.5, c.y), pl_radio * 0.84,
				pl_radio, pl_maceta_h, Color("8a5a3f"), 10)


			_add_cilindro(Vector3(c.x, pl_maceta_h - 0.015, c.y), pl_radio * 1.05,
				pl_radio * 1.05, 0.055, Color("6f4732"), 10)
			_add_cilindro(Vector3(c.x, pl_maceta_h + 0.008, c.y), pl_radio * 0.78,
				pl_radio * 0.78, 0.025, Color("3c3024"), 10)
			var pl_tallo_h: float = maxf(0.1, h - pl_maceta_h - 0.14)
			_add_cilindro(Vector3(c.x, pl_maceta_h + pl_tallo_h * 0.38, c.y),
				0.035, 0.045, pl_tallo_h * 0.76, Color("4a4930"), 8)



			var pl_hojas: Array = [
				[Vector3(-0.12, 0.34, 0.02), Vector3(1.05, 0.82, 0.88), col.darkened(0.08)],
				[Vector3(0.13, 0.43, -0.03), Vector3(0.94, 0.94, 0.82), col],
				[Vector3(-0.04, 0.57, -0.12), Vector3(0.82, 1.0, 0.72), col.lightened(0.1)],
				[Vector3(0.09, 0.7, 0.07), Vector3(0.68, 0.88, 0.7), col.lightened(0.16)],
				[Vector3(-0.09, 0.8, 0.01), Vector3(0.54, 0.72, 0.58), col.lightened(0.22)],
			]
			for pl_hoja in pl_hojas:
				var pl_d: Vector3 = pl_hoja[0]
				var pl_esc: Vector3 = pl_hoja[1]
				var pl_color: Color = pl_hoja[2]
				var pl_n: MeshInstance3D = _add_esfera(
					Vector3(c.x + pl_d.x * r.size.x,
						pl_maceta_h + pl_d.y * pl_tallo_h, c.y + pl_d.z * r.size.y),
					pl_radio * 0.8, pl_color)
				pl_n.scale = pl_esc
		"lampara":




			var la_radio: float = minf(r.size.x, r.size.y) * 0.46
			_add_cilindro(Vector3(c.x, 0.035, c.y), la_radio * 0.64,
				la_radio * 0.7, 0.07, Color("4a4038"), 10, 0.55)
			_add_cilindro(Vector3(c.x,(h - 0.31) * 0.5 + 0.05, c.y), 0.028,
				0.038, h - 0.31, Color("5a4f42"), 8, 0.45)
			var shade: MeshInstance3D = _add_cilindro(Vector3(c.x, h - 0.16, c.y),
				la_radio * 0.58, la_radio, 0.3, col, 10, 0.72)
			var smat: StandardMaterial3D =(shade.mesh as CylinderMesh).material
			smat.emission_enabled = true
			smat.emission = Color("ffd9a0")


			smat.emission_energy_multiplier = 1.1 if _noche else 0.7
			var la_bulbo: MeshInstance3D = _add_esfera(Vector3(c.x, h - 0.18, c.y),
				la_radio * 0.22, Color("fff0c8"), 0.25)
			var la_bmat: StandardMaterial3D =(la_bulbo.mesh as SphereMesh).material
			la_bmat.emission_enabled = true
			la_bmat.emission = Color("ffd9a0")
			la_bmat.emission_energy_multiplier = 1.35 if _noche else 0.7



			_add_luz(Vector3(c.x, h - 0.2, c.y), Color("ffd9a0"), 1.5, 5.0)
		"momentos":












			var wy: float = float(prop.get("y", 1.5))
			var fw: float = 0.34
			var n_m: int = 3
			var span_m: float =(r.size.x if along_x else r.size.y)
			var msign: float = -1.0
			var cards: Array = _moment_cards()
			for i in n_m:
				var t: float =(float(i) + 0.5) / float(n_m)
				var fx: float =(r.position.x + span_m * t) if along_x else c.x
				var fz: float = c.y if along_x else (r.position.y + span_m * t)



				_add_box(Vector3(fx, wy, fz),
					Vector3(fw if along_x else 0.06, 0.42,
						0.06 if along_x else fw), col.darkened(0.2))
				_add_box(Vector3(fx, wy, fz),
					Vector3((fw - 0.05) if along_x else 0.07, 0.37,
						0.07 if along_x else (fw - 0.05)), col.lightened(0.12))


				_add_box(Vector3(fx +(0.0 if along_x else msign * 0.03), wy - 0.26,
						fz +(msign * 0.03 if along_x else 0.0)),
					Vector3(0.16 if along_x else 0.02, 0.045,
						0.02 if along_x else 0.16),
					CareerTheme.MONEY.darkened(0.12))
				var f_at: Vector3 = Vector3(
					fx +(0.0 if along_x else msign * 0.045), wy,
					fz +(msign * 0.045 if along_x else 0.0))
				if i < cards.size():
					_add_moment_photo(cards[i], f_at, along_x, msign)
					continue

				var foto: MeshInstance3D = _add_box(f_at,
					Vector3((fw - 0.08) if along_x else 0.02, 0.32,
						0.02 if along_x else (fw - 0.08)), Color("c9a961"))
				var fm: StandardMaterial3D =(foto.mesh as BoxMesh).material
				fm.emission_enabled = true
				fm.emission = Color("c9a961")
				fm.emission_energy_multiplier = 0.25
		"maqueta":






			var mesa_h: float = 0.5
			_add_box(Vector3(c.x, mesa_h * 0.5, c.y),
				Vector3(r.size.x, mesa_h, r.size.y), col.darkened(0.15))


			var mlx: bool = r.size.x >= r.size.y
			var fl: float =(r.size.x if mlx else r.size.y) * 0.68
			var fw: float =(r.size.y if mlx else r.size.x) * 0.6
			var verde: MeshInstance3D = _add_box(Vector3(c.x, mesa_h + 0.03, c.y),
				Vector3(fl if mlx else fw, 0.04, fw if mlx else fl),
				Color("4f7a3a"))
			var vm: StandardMaterial3D =(verde.mesh as BoxMesh).material
			vm.emission_enabled = true
			vm.emission = Color("3d5f2e")
			vm.emission_energy_multiplier = 0.2
			var cal: Color = Color("e8ede4")
			var ly: float = mesa_h + 0.056

			for s in [-1.0, 1.0]:
				_add_box(Vector3(c.x + s *(fl * 0.5 - 0.006) *(1.0 if mlx else 0.0),
					ly, c.y + s *(fl * 0.5 - 0.006) *(0.0 if mlx else 1.0)),
					Vector3(0.012 if mlx else fw, 0.004, fw if mlx else 0.012), cal)
				_add_box(Vector3(c.x + s *(fw * 0.5 - 0.006) *(0.0 if mlx else 1.0),
					ly, c.y + s *(fw * 0.5 - 0.006) *(1.0 if mlx else 0.0)),
					Vector3(fl if mlx else 0.012, 0.004, 0.012 if mlx else fl), cal)
			_add_box(Vector3(c.x, ly, c.y),
				Vector3(0.012 if mlx else fw, 0.004, fw if mlx else 0.012), cal)
			_add_box(Vector3(c.x, ly + 0.002, c.y), Vector3(0.03, 0.004, 0.03), cal)

			for s in [-1.0, 1.0]:
				var gx: float = c.x + s * fl * 0.5 *(1.0 if mlx else 0.0)
				var gz: float = c.y + s * fl * 0.5 *(0.0 if mlx else 1.0)
				for pp in [-1.0, 1.0]:
					_add_box(Vector3(gx + pp * 0.09 *(0.0 if mlx else 1.0),
						ly + 0.035,
						gz + pp * 0.09 *(1.0 if mlx else 0.0)),
						Vector3(0.012, 0.07, 0.012), cal)
				_add_box(Vector3(gx, ly + 0.07, gz),
					Vector3(0.012 if mlx else 0.19, 0.012,
						0.19 if mlx else 0.012), cal)


			var acc: Color = CareerTheme.accent()
			var g_off: float =(fl * 0.5 + 0.1)
			var s_off: float =(fw * 0.5 + 0.1)
			for s in [-1.0, 1.0]:

				_add_box(Vector3(c.x + s * g_off *(1.0 if mlx else 0.0),
					mesa_h + 0.08,
					c.y + s * g_off *(0.0 if mlx else 1.0)),
					Vector3(0.14 if mlx else fw * 0.9, 0.12,
						fw * 0.9 if mlx else 0.14), acc.darkened(0.25))

				_add_box(Vector3(c.x + s * s_off *(0.0 if mlx else 1.0),
					mesa_h + 0.11,
					c.y + s * s_off *(1.0 if mlx else 0.0)),
					Vector3(fl * 0.95 if mlx else 0.16, 0.18,
						0.16 if mlx else fl * 0.95), acc)
				_add_box(Vector3(c.x + s * s_off *(0.0 if mlx else 1.0),
					mesa_h + 0.215,
					c.y + s * s_off *(1.0 if mlx else 0.0)),
					Vector3(fl * 0.95 if mlx else 0.16, 0.03,
						0.16 if mlx else fl * 0.95), acc.lightened(0.35))
			for lado in [-1.0, 1.0]:
				for grada in 3:
					var grada_at: Vector3 = Vector3(c.x, mesa_h + 0.08 + grada * 0.045, c.y)
					grada_at +=(Vector3.BACK if mlx else Vector3.RIGHT) *(lado *(fw * 0.5 - 0.04 + grada * 0.035))
					_add_box(grada_at, Vector3(fl * 0.88, 0.022, 0.024) if mlx else Vector3(0.024, 0.022, fl * 0.88), acc.lightened(0.15 + grada * 0.12))


			for sx in [-1.0, 1.0]:
				for sz in [-1.0, 1.0]:
					var px: float = c.x + sx *(fl if mlx else fw) * 0.5 + sx * 0.06
					var pz: float = c.y + sz *(fw if mlx else fl) * 0.5 + sz * 0.06
					_add_box(Vector3(px, mesa_h + 0.19, pz),
						Vector3(0.014, 0.34, 0.014), Color("3a3a38"))
					var head: MeshInstance3D = _add_box(
						Vector3(px, mesa_h + 0.375, pz),
						Vector3(0.045, 0.028, 0.045), Color("fff4d8"))
					var hm: StandardMaterial3D =(head.mesh as BoxMesh).material
					hm.emission_enabled = true
					hm.emission = Color("ffedb8")
					hm.emission_energy_multiplier = 1.2

			var board: MeshInstance3D = _add_box(
				Vector3(c.x +(0.0 if mlx else s_off), mesa_h + 0.3,
					c.y +(s_off if mlx else 0.0)),
				Vector3(0.16 if mlx else 0.03, 0.09,
					0.03 if mlx else 0.16), Color("1d1d20"))
			var bm2: StandardMaterial3D =(board.mesh as BoxMesh).material
			bm2.emission_enabled = true
			bm2.emission = Color("58c8a8")
			bm2.emission_energy_multiplier = 0.5
		"simulador":
			preload("res://ui/house/simulador_prop.gd").pintar(self, r)
		"arcade":
			preload("res://ui/house/ocio_pulido.gd").pintar(self, kind, r, col, h)
		"piano":
			preload("res://ui/house/piano_pulido.gd").pintar(self, r, col, h)
		"dardos":









			var dd: Dictionary = _cara_muro(r)
			var d_lx: bool = bool(dd["lx"])
			var d_fd: Vector2 = dd["fd"]
			var d_dep: float = float(dd["dep"])
			var d_anc: float = float(dd["anc"])
			var d_at: Vector3 = Vector3(c.x, float(prop.get("y", 1.73)), c.y)
			var d_ad: Vector3 = Vector3(d_fd.x, 0.0, d_fd.y)


			var d_lat: Vector3 = Vector3(0.0, 0.0, 1.0) if not d_lx \
					else Vector3(1.0, 0.0, 0.0)



			var d_cw: float = d_anc * 0.5
			_add_box(d_at, Vector3(d_cw, h, d_dep) if d_lx
				else Vector3(d_dep, h, d_cw), col)


















			var d_r: float = minf(0.225, minf(h, d_cw) * 0.47 / 1.235)
			var d_cara: Node3D = Node3D.new()
			var d_padre: Node = _box_parent if _box_parent != null else viewport
			d_padre.add_child(d_cara)
			d_cara.position = d_at + d_ad *(d_dep * 0.5 + 0.004)
			d_cara.rotation.y = atan2(- d_ad.x, - d_ad.z)
			_add_diana(d_cara, d_r)







			var d_hw: float = d_anc * 0.25
			var d_hh: float = h * 0.94
			for d_s in [-1.0, 1.0]:
				var d_hc: Vector3 = d_at + d_lat *(d_s * d_anc * 0.375) \
						+ d_ad *(d_dep * 0.15)
				_add_box(d_hc,
					Vector3(d_hw, d_hh, d_dep * 0.5) if d_lx
						else Vector3(d_dep * 0.5, d_hh, d_hw),
					col.lightened(0.1))
				var d_pz: Vector3 = d_hc + d_ad *(d_dep * 0.25 + 0.004)
				_add_box(d_pz,
					Vector3(d_hw * 0.82, d_hh * 0.88, 0.006) if d_lx
						else Vector3(0.006, d_hh * 0.88, d_hw * 0.82),
					Color("232a26"))



				var d_tiza: Vector3 = d_pz + d_ad * 0.004
				_add_box(d_tiza,
					Vector3(0.0035, d_hh * 0.74, 0.002) if d_lx
						else Vector3(0.002, d_hh * 0.74, 0.0035),
					Color("cfd6cf"))
				var d_largos: Array = [0.62, 0.48, 0.7, 0.4, 0.55]
				for d_i in d_largos.size():
					var d_yy: float = d_hh *(0.32 - 0.115 * float(d_i))
					var d_w: float = d_hw * 0.33 * float(d_largos[d_i])
					for d_l in [-1.0, 1.0]:
						_add_box(d_tiza + Vector3(0.0, d_yy, 0.0)
								+ d_lat *(d_l * d_hw * 0.19),
							Vector3(d_w, 0.0025, 0.002) if d_lx
								else Vector3(0.002, 0.0025, d_w),
							Color("cfd6cf"))


			_add_box(d_at + Vector3(0.0, - h * 0.5 - 0.03, 0.0)
					+ d_ad *(d_dep * 0.22),
				Vector3(d_anc * 0.9, 0.05, d_dep * 0.55) if d_lx
					else Vector3(d_dep * 0.55, 0.05, d_anc * 0.9),
				col.darkened(0.18))
		"billar":





















			var bw: float = r.size.x
			var bd: float = r.size.y



			var b_lx: bool = bw >= bd
			var b_ol: float = maxf(bw, bd)
			var b_oa: float = minf(bw, bd)
			var b_banda: float = clampf(b_oa * 0.09, 0.05, 0.1)
			var b_l: float = b_ol - b_banda * 2.0
			var b_a: float = b_oa - b_banda * 2.0



			var b_esc: float = b_a / Billar.ANCHO
			var b_r: float = Billar.BOLA_R * b_esc
			var b_tr: float = Billar.TRONERA_R * b_esc


			var b_pos: Callable = func(al: float, y: float, ac: float) -> Vector3: return Vector3(c.x + al, y, c.y + ac) if b_lx else Vector3(c.x + ac, y, c.y + al)
			var b_tam: Callable = func(al: float, alto: float, ac: float) -> Vector3: return Vector3(al, alto, ac) if b_lx else Vector3(ac, alto, al)


			var b_tapa_h: float = 0.036
			var b_tapa_y: float = h - b_tapa_h * 0.5
			var b_goma_h: float = 0.047
			var b_pano: float = b_tapa_y - b_tapa_h * 0.5 - 0.018 - b_goma_h



			var b_pata: float = 0.11
			var b_alto: float = b_pano - 0.22
			for b_sl in [-1.0, 1.0]:
				for b_sa in [-1.0, 1.0]:
					var b_pl: float = b_sl *(b_l * 0.5 - b_pata * 1.45)
					var b_pa: float = b_sa *(b_a * 0.5 - b_pata * 0.9)
					_add_box(b_pos.call(b_pl, 0.025, b_pa),
						b_tam.call(b_pata * 1.45, 0.05, b_pata * 1.45),
						col.darkened(0.32))
					_add_box(b_pos.call(b_pl, 0.05 + b_alto * 0.5, b_pa),
						b_tam.call(b_pata, b_alto, b_pata), col.darkened(0.2))
					_add_box(b_pos.call(b_pl, 0.05 + b_alto + 0.035, b_pa),
						b_tam.call(b_pata * 1.3, 0.07, b_pata * 1.3),
						col.darkened(0.1))



			_add_box(b_pos.call(0.0, b_pano - 0.08, 0.0),
				b_tam.call(b_ol, 0.14, b_oa), col)
			_add_box(b_pos.call(0.0, b_pano - 0.185, 0.0),
				b_tam.call(b_ol - b_banda * 0.5, 0.075, b_oa - b_banda * 0.5),
				col.darkened(0.22))



			_add_box(b_pos.call(0.0, b_pano + 0.002, 0.0),
				b_tam.call(b_l, 0.012, b_a), BillarRoom3D.M_PANO)



			var b_marca: Color = BillarRoom3D.M_PANO.lightened(0.16)
			_add_box(b_pos.call(- b_l * 0.25, b_pano + 0.009, 0.0),
				b_tam.call(0.006, 0.002, b_a), b_marca)
			for b_mz in [- b_l * 0.25, b_l * 0.25]:
				_add_cilindro(b_pos.call(b_mz, b_pano + 0.01, 0.0), 0.011, 0.011,
					0.002, BillarRoom3D.M_BLANCA.darkened(0.15), 10)
















			var b_goma: Color = BillarRoom3D.M_PANO.darkened(0.34)
			var b_tapa: Color = col.lightened(0.12)
			var b_goma_y: float = b_pano + b_goma_h * 0.5
			var b_esc_r: float = b_tr * 1.16
			var b_tramo: float = b_l * 0.5 - b_esc_r * 2.0
			var b_tramo_c: float = b_esc_r + b_tramo * 0.5
			var b_corto: float = b_a - b_esc_r * 2.0

			var b_tramos: Array = []
			for b_ga in [-1.0, 1.0]:
				for b_gs in [-1.0, 1.0]:
					b_tramos.append([b_gs * b_tramo_c, b_ga * b_a * 0.5, b_tramo, true])
			for b_gl in [-1.0, 1.0]:
				b_tramos.append([b_gl * b_l * 0.5, 0.0, b_corto, false])
			for b_t in b_tramos:
				var b_cl: float = float(b_t[0])
				var b_ca: float = float(b_t[1])
				var b_len: float = float(b_t[2])
				var b_largo: bool = bool(b_t[3])



				var b_fuera: float = signf(b_ca) if b_largo else signf(b_cl)
				var b_gc: float = b_banda * 0.28 * b_fuera
				var b_tc: float = b_banda * 0.5 * b_fuera
				if b_largo:
					_add_box(b_pos.call(b_cl, b_goma_y, b_ca + b_gc),
						b_tam.call(b_len, b_goma_h, b_banda * 0.56), b_goma)
					_add_box(b_pos.call(b_cl, b_tapa_y, b_ca + b_tc),
						b_tam.call(b_len, b_tapa_h, b_banda * 1.05), b_tapa)
				else:
					_add_box(b_pos.call(b_cl + b_gc, b_goma_y, b_ca),
						b_tam.call(b_banda * 0.56, b_goma_h, b_len), b_goma)
					_add_box(b_pos.call(b_cl + b_tc, b_tapa_y, b_ca),
						b_tam.call(b_banda * 1.05, b_tapa_h, b_len), b_tapa)




			for b_tl2 in [-1.0, 0.0, 1.0]:
				for b_ta2 in [-1.0, 1.0]:
					var b_bl: float = b_tl2 * b_l * 0.5
					var b_ba: float = b_ta2 * b_a * 0.5
					_add_cilindro(b_pos.call(b_bl, b_pano + 0.007, b_ba),
						b_tr * 1.32, b_tr * 1.32, 0.006, Color("9a7b46"), 16, 0.55)
					_add_cilindro(b_pos.call(b_bl, b_pano - 0.013, b_ba),
						b_tr, b_tr * 0.7, 0.05, BillarRoom3D.M_TRONERA, 14)

			for boca_l in [-1.0, 0.0, 1.0]:
				for boca_a in [-1.0, 1.0]:
					_add_cilindro(b_pos.call(boca_l * b_l * 0.5, b_pano - 0.17, boca_a * b_a * 0.5),
						b_tr * 0.65, b_tr * 1.1, 0.22, Color("483326"), 10)
			for pata_l in [-1.0, 1.0]:
				for pata_a in [-1.0, 1.0]:
					_add_box(b_pos.call(pata_l *(b_l * 0.5 - b_pata * 1.45), 0.13, pata_a *(b_a * 0.5 - b_pata * 0.9)),
						b_tam.call(0.12, 0.055, 0.12), Color("9a7b46"))
			for soporte in [-0.28, 0.28]:
				_add_box(b_pos.call(b_l * soporte, h - 0.22, - b_oa * 0.5 + 0.015),
					b_tam.call(0.075, 0.1, 0.06), Color("9a7b46"))
			_add_box(b_pos.call(0, h - 0.2, - b_oa * 0.5 + 0.025),
				b_tam.call(b_l * 0.7, 0.025, 0.025), Color("bd9864"))

			_add_box(b_pos.call(- b_l * 0.08, h + 0.012, - b_a * 0.5 - b_banda * 0.48),
				b_tam.call(b_l * 0.65, 0.022, 0.022), Color("c5a16c"))
			_add_box(b_pos.call(- b_l * 0.32, h + 0.012, - b_a * 0.5 - b_banda * 0.48),
				b_tam.call(b_l * 0.17, 0.026, 0.026), Color("382e29"))
			_add_box(b_pos.call(b_l * 0.33, h + 0.016, - b_a * 0.5 - b_banda * 0.48),
				b_tam.call(0.036, 0.032, 0.036), Color("527d9b"))










			var b_paso: float = b_r * 2.04
			var b_bola_y: float = b_pano + 0.006 + b_r
			var b_lisa: int = 0
			var b_raya: int = 0
			var b_idx: int = 0
			for b_fila in 5:
				for b_i in b_fila + 1:
					var b_fl: float = b_l * 0.25 + float(b_fila) * b_paso * 0.87
					var b_fa: float =(float(b_i) - float(b_fila) * 0.5) * b_paso
					var b_at: Vector3 = b_pos.call(b_fl, b_bola_y, b_fa)


					var b_es_raya: bool =(b_idx % 2 == 1) !=(b_idx >= 13)
					if b_idx == 4:
						_add_esfera(b_at, b_r, BillarRoom3D.M_NEGRA)
					elif b_es_raya:
						_add_esfera(b_at, b_r, BillarRoom3D.M_BLANCA)
						_add_cilindro(b_at, b_r * 1.005, b_r * 1.005, b_r * 1.05,
							BillarRoom3D.M_COLORES[b_raya % 7], 12, 0.35)
						b_raya += 1
					else:
						_add_esfera(b_at, b_r, BillarRoom3D.M_COLORES[b_lisa % 7])
						b_lisa += 1
					b_idx += 1
			_add_esfera(b_pos.call(- b_l * 0.25, b_bola_y, 0.0), b_r,
				BillarRoom3D.M_BLANCA)
		"futbolin":


			var fw: float = r.size.x
			var fd: float = r.size.y
			var f_lx: bool = fw >= fd
			var f_top: float = h
			for fsx in [-1.0, 1.0]:
				for fsz in [-1.0, 1.0]:
					_add_box(Vector3(c.x + fsx *(fw * 0.5 - 0.1),
							(f_top - 0.16) * 0.5, c.y + fsz *(fd * 0.5 - 0.1)),
						Vector3(0.1, f_top - 0.16, 0.1), col.darkened(0.2))
			_add_box(Vector3(c.x, f_top - 0.09, c.y), Vector3(fw, 0.18, fd), col)
			_add_box(Vector3(c.x, f_top - 0.01, c.y),
				Vector3(fw - 0.12, 0.04, fd - 0.12), Color("2f7d46"))
			for fbi in 4:
				var ft: float = -0.3 + 0.2 * float(fbi)
				var bar_off: Vector3 = Vector3(ft * fw, 0.0, 0.0) if f_lx \
						else Vector3(0.0, 0.0, ft * fd)
				_add_box(Vector3(c.x, f_top + 0.07, c.y) + bar_off,
					Vector3(0.03 if f_lx else fd * 0.86, 0.03,
						fd * 0.86 if f_lx else 0.03), Color("c9ccd0"))
				var mcol: Color = Color("d84040") if fbi % 2 == 0 \
						else Color("3a6fc9")
				for fmi in 3:
					var mt: float = -0.28 + 0.28 * float(fmi)
					var m_off: Vector3 = Vector3(0.0, 0.0, mt * fd) if f_lx \
							else Vector3(mt * fw, 0.0, 0.0)
					_add_box(Vector3(c.x, f_top + 0.09, c.y) + bar_off + m_off,
						Vector3(0.05, 0.11, 0.05), mcol)
			for hsx in [-1.0, 1.0]:


				var h_off: Vector3 = Vector3(0.0, 0.0, hsx *(fd * 0.5 - 0.03)) \
						if f_lx else Vector3(hsx *(fw * 0.5 - 0.03), 0.0, 0.0)
				_add_box(Vector3(c.x, f_top + 0.05, c.y) + h_off,
					Vector3(0.05, 0.05, 0.05), Color("d8b040"))
		"escultura":
			DecoPulidaLib.pintar(self, kind, r, col)
		"acuario":
			preload("res://ui/house/acuario_pulido.gd").pintar(self, r, col, h)
		"mesa_jardin":
			preload("res://ui/house/sombrillas_pulidas.gd").pintar(self, kind, r, col, h)
		"fuente":


			var uw: float = r.size.x
			var ud: float = r.size.y

			_add_box(Vector3(c.x, 0.05, c.y), Vector3(uw, 0.1, ud), col.darkened(0.15))
			for borde in [-1.0, 1.0]:
				_add_box(Vector3(c.x + borde *(uw - 0.12) * 0.5, h * 0.5, c.y),
					Vector3(0.12, h, ud), col)
				_add_box(Vector3(c.x, h * 0.5, c.y + borde *(ud - 0.12) * 0.5),
					Vector3(uw - 0.24, h, 0.12), col)
			var f_agua: MeshInstance3D = _add_box(Vector3(c.x, h - 0.04, c.y),
				Vector3(uw - 0.18, 0.06, ud - 0.18), Color("4a86b0"))
			var fam: StandardMaterial3D =(f_agua.mesh as BoxMesh).material
			fam.emission_enabled = true
			fam.emission = Color("4a86b0")
			fam.emission_energy_multiplier = 0.35




			var koi_padre: Node = _box_parent if _box_parent != null else viewport
			var koi_y: float = h - 0.02
			for koi_def in [[Color("e07a2e"), -0.16, 0.5, 0.0],
					[Color("e8ded0"), 0.16, 0.62, 2.1]]:
				var koi: AquariumFish = AquariumFish.new()
				koi_padre.add_child(koi)
				koi.setup(AquariumFish.make_texture(koi_def[0]),
					c.x + float(koi_def[1]) * uw, koi_y, c.y,
					uw * 0.12, 0.015, float(koi_def[2]), float(koi_def[3]))
			_add_box(Vector3(c.x, h + 0.14, c.y),
				Vector3(0.12, 0.32, 0.12), col.lightened(0.05))
			_add_box(Vector3(c.x, h + 0.3, c.y),
				Vector3(0.3, 0.05, 0.3), col.lightened(0.1))
		"pergola":


			var gw: float = r.size.x
			var gd: float = r.size.y
			for gsx in [-1.0, 1.0]:
				for gsz in [-1.0, 1.0]:
					_add_box(Vector3(c.x + gsx *(gw * 0.5 - 0.08), h * 0.5,
						c.y + gsz *(gd * 0.5 - 0.08)),
						Vector3(0.1, h, 0.1), col)
			for gs in [-1.0, 1.0]:
				_add_box(Vector3(c.x, h - 0.05, c.y + gs *(gd * 0.5 - 0.05)),
					Vector3(gw, 0.09, 0.09), col.darkened(0.12))
			for gi in 6:
				var gt: float = -0.42 + 0.168 * float(gi)
				_add_box(Vector3(c.x + gt * gw, h, c.y),
					Vector3(0.06, 0.06, gd), col.lightened(0.06))
		"camastro":
			preload("res://ui/house/reposo_jardin_pulido.gd").pintar(self, kind, r, col, h, prop)
		"sombrilla":
			preload("res://ui/house/sombrillas_pulidas.gd").pintar(self, kind, r, col, h)
		"hamaca":
			DecoPulidaLib.pintar(self, kind, r, col)
		"arbusto":
			DecoPulidaLib.pintar(self, kind, r, col)
		"arbol":
			DecoPulidaLib.pintar(self, kind, r, col)
		"farol":








			var fl_caja: float = h - 0.42
			_add_box(Vector3(c.x, 0.06, c.y),
				Vector3(0.36, 0.12, 0.36), Color("6b6560"))
			_add_box(Vector3(c.x, fl_caja * 0.5, c.y),
				Vector3(0.1, fl_caja, 0.1), Color("46423d"))


			var fl_v: MeshInstance3D = _add_box(
				Vector3(c.x, fl_caja + 0.16, c.y), Vector3(0.26, 0.3, 0.26), col)
			var fl_m: StandardMaterial3D =(fl_v.mesh as BoxMesh).material
			fl_m.emission_enabled = true
			fl_m.emission = Color("ffe9b8")
			fl_m.emission_energy_multiplier = 1.8 if _noche else 0.7
			fl_v.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF

			for fl_x in [-1.0, 1.0]:
				for fl_z in [-1.0, 1.0]:
					_add_box(Vector3(c.x + fl_x * 0.13, fl_caja + 0.16,
						c.y + fl_z * 0.13),
						Vector3(0.04, 0.32, 0.04), Color("46423d"))

			_add_box(Vector3(c.x, fl_caja + 0.36, c.y),
				Vector3(0.34, 0.07, 0.34), Color("46423d"))
			_add_box(Vector3(c.x, fl_caja + 0.43, c.y),
				Vector3(0.18, 0.08, 0.18), Color("46423d"))
			_add_luz(Vector3(c.x, fl_caja + 0.16, c.y), Color("ffe4b0"), 1.3, 5.0)
		"fogata":
			preload("res://ui/house/coleccion_pulida.gd").pintar(self, kind, r, col, h)

			_add_luz(Vector3(c.x, 0.4, c.y), Color("ff9040"), 2.0, 3.4)
		"huerto":






			var hu_iid: String = String(prop.get("id", ""))
			var hu_planta: Dictionary = {}
			if hu_iid in Huerto.piezas() \
					and String((Career.huerto.get(hu_iid, {}) as Dictionary).get("c", "")) != "":
				hu_planta =(Career.huerto.get(hu_iid, {}) as Dictionary).duplicate()
				hu_planta["riego"] = hu_iid in Huerto.bancales()
			preload("res://ui/house/coleccion_pulida.gd").pintar(self, kind, r, col, h,
				0.0, hu_planta)
		"columpio":
			preload("res://ui/house/reposo_jardin_pulido.gd").pintar(self, kind, r, col, h, prop)
		"porteria":







			var pt_l: float = maxf(r.size.x, r.size.y)
			var pt_dep: float = minf(r.size.x, r.size.y)
			var pt_gr: float = 0.09
			for pt_s in [-1.0, 1.0]:
				var pt_o: Vector2 = Vector2(pt_s *(pt_l - pt_gr) * 0.5, 0.0) \
						if along_x else Vector2(0.0, pt_s *(pt_l - pt_gr) * 0.5)
				_add_box(Vector3(c.x + pt_o.x, h * 0.5, c.y + pt_o.y),
					Vector3(pt_gr, h, pt_gr), col, 2)



				var pt_at: Vector2 = Vector2(0.0, pt_dep * 0.2) if along_x \
						else Vector2(pt_dep * 0.2, 0.0)
				_add_box(Vector3(c.x + pt_o.x + pt_at.x, 0.1,
					c.y + pt_o.y + pt_at.y),
					Vector3(0.07, 0.2, pt_dep * 0.6) if along_x
						else Vector3(pt_dep * 0.6, 0.2, 0.07), col.darkened(0.1))

			_add_box(Vector3(c.x, h - pt_gr * 0.5, c.y),
				Vector3(pt_l, pt_gr, pt_gr) if along_x
					else Vector3(pt_gr, pt_gr, pt_l), col, 2)

			var pt_net: Color = Color("dcdfe2")
			for pt_i in 8:
				var pt_t: float = -0.44 + 0.125 * float(pt_i)
				var pt_v: MeshInstance3D = _add_box(
					Vector3(c.x +(pt_t * pt_l if along_x else pt_dep * 0.34),
						h * 0.5,
						c.y +(pt_dep * 0.34 if along_x else pt_t * pt_l)),
					Vector3(0.03, h, 0.03), pt_net, 2)
				pt_v.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF

			for pt_j in 3:
				var pt_y: float = h *(0.28 + 0.3 * float(pt_j))
				var pt_hb: MeshInstance3D = _add_box(
					Vector3(c.x +(0.0 if along_x else pt_dep * 0.34), pt_y,
						c.y +(pt_dep * 0.34 if along_x else 0.0)),
					Vector3(pt_l * 0.98, 0.03, 0.03) if along_x
						else Vector3(0.03, 0.03, pt_l * 0.98), pt_net, 2)
				pt_hb.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF

			_add_box(Vector3(c.x +(pt_l * 0.22 if along_x else 0.0), 0.11,
				c.y +(0.0 if along_x else pt_l * 0.22)),
				Vector3(0.22, 0.22, 0.22), Color("f2f2f2"))
		"estanque":
			preload("res://ui/house/agua_equipaje_pulidos.gd").pintar(self, kind, r, col, h, prop)

			var es_w: float = r.size.x
			var es_d: float = r.size.y

			var es_padre: Node = _box_parent if _box_parent != null else viewport
			for es_koi in [[Color("e07a2e"), -0.2, 0.15, 0.46, 0.0],
					[Color("e8ded0"), 0.18, -0.18, 0.58, 1.6],
					[Color("d94f3a"), 0.05, 0.24, 0.4, 3.1],
					[Color("f0b24a"), -0.24, -0.1, 0.52, 4.4]]:
				var es_f: AquariumFish = AquariumFish.new()
				es_padre.add_child(es_f)
				es_f.setup(AquariumFish.make_texture(es_koi[0]),
					c.x + float(es_koi[1]) * es_w, h - 0.02,
					c.y + float(es_koi[2]) * es_d,
					es_w * 0.16, 0.02, float(es_koi[3]), float(es_koi[4]))
		"cocina_ext":







			var ce_l: float = maxf(r.size.x, r.size.y)
			var ce_dp: float = minf(r.size.x, r.size.y)

			_add_box(Vector3(c.x,(h - 0.08) * 0.5, c.y),
				Vector3(r.size.x - 0.08, h - 0.08, r.size.y - 0.08),
				col.darkened(0.18))
			_add_box(Vector3(c.x, h - 0.04, c.y),
				Vector3(r.size.x + 0.08, 0.08, r.size.y + 0.08), col)

			for ce_i in 2:
				var ce_p: float =(float(ce_i) - 0.5) * ce_l * 0.42
				var ce_fr: Vector2 = Vector2(ce_p, - ce_dp * 0.5) if along_x \
						else Vector2(- ce_dp * 0.5, ce_p)
				_add_box(Vector3(c.x + ce_fr.x, h * 0.45, c.y + ce_fr.y),
					Vector3(ce_l * 0.34, h * 0.6, 0.05) if along_x
						else Vector3(0.05, h * 0.6, ce_l * 0.34),
					col.lightened(0.08))
				_add_box(Vector3(c.x + ce_fr.x, h * 0.68, c.y + ce_fr.y),
					Vector3(ce_l * 0.16, 0.04, 0.05) if along_x
						else Vector3(0.05, 0.04, ce_l * 0.16), Color("d8d5cf"))

			var ce_go: Vector2 = Vector2(- ce_l * 0.28, 0.0) if along_x \
					else Vector2(0.0, - ce_l * 0.28)
			_add_box(Vector3(c.x + ce_go.x, h - 0.02, c.y + ce_go.y),
				Vector3(ce_l * 0.28, 0.09, ce_dp * 0.62) if along_x
					else Vector3(ce_dp * 0.62, 0.09, ce_l * 0.28), Color("17171a"))
			var ce_br: MeshInstance3D = _add_box(
				Vector3(c.x + ce_go.x, h - 0.01, c.y + ce_go.y),
				Vector3(ce_l * 0.22, 0.05, ce_dp * 0.5) if along_x
					else Vector3(ce_dp * 0.5, 0.05, ce_l * 0.22), Color("d0442a"))
			var ce_bm: StandardMaterial3D =(ce_br.mesh as BoxMesh).material
			ce_bm.emission_enabled = true
			ce_bm.emission = Color("ff6a30")
			ce_bm.emission_energy_multiplier = 1.4 if _noche else 0.9
			ce_br.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
			for ce_j in 3:
				var ce_t: float =(float(ce_j) - 1.0) * 0.1
				_add_box(Vector3(c.x + ce_go.x +(ce_t if along_x else 0.0),
					h + 0.05, c.y + ce_go.y +(0.0 if along_x else ce_t)),
					Vector3(0.04, 0.03, ce_dp * 0.5) if along_x
						else Vector3(ce_dp * 0.5, 0.03, 0.04), Color("6d7278"))

			var ce_so: Vector2 = Vector2(ce_l * 0.3, 0.0) if along_x \
					else Vector2(0.0, ce_l * 0.3)
			_add_box(Vector3(c.x + ce_so.x, h - 0.03, c.y + ce_so.y),
				Vector3(ce_l * 0.2, 0.08, ce_dp * 0.5) if along_x
					else Vector3(ce_dp * 0.5, 0.08, ce_l * 0.2), Color("b9bec4"))
			_add_box(Vector3(c.x + ce_so.x, h + 0.14, c.y + ce_so.y - 0.1),
				Vector3(0.05, 0.28, 0.05), Color("cdd2d7"))
			_add_box(Vector3(c.x + ce_so.x, h + 0.27, c.y + ce_so.y - 0.05),
				Vector3(0.05, 0.05, 0.16), Color("cdd2d7"))












			for ce_k in [-1.0, 1.0]:
				var ce_to: Vector2 = Vector2(ce_k * ce_l * 0.24, - ce_dp * 0.33) \
						if along_x else Vector2(- ce_dp * 0.33, ce_k * ce_l * 0.24)
				_add_box(Vector3(c.x + ce_to.x, 0.32, c.y + ce_to.y),
					Vector3(0.08, 0.64, 0.08), Color("6d7278"))
				_add_box(Vector3(c.x + ce_to.x, 0.68, c.y + ce_to.y),
					Vector3(0.34, 0.08, 0.34), Color("6b5d4a"))
		"helipuerto":












			var hp_w: float = r.size.x
			var hp_d: float = r.size.y

			_add_box(Vector3(c.x, h * 0.5, c.y), Vector3(hp_w, h, hp_d), col)
			_add_box(Vector3(c.x, h + 0.01, c.y),
				Vector3(hp_w * 0.96, 0.02, hp_d * 0.96), col.lightened(0.06))
			var hp_lin: Color = Color("e9edf0")
			for hp_s in [-1.0, 1.0]:
				_add_box(Vector3(c.x, h + 0.02, c.y + hp_s * hp_d * 0.45),
					Vector3(hp_w * 0.9, 0.03, 0.12), hp_lin)
				_add_box(Vector3(c.x + hp_s * hp_w * 0.45, h + 0.02, c.y),
					Vector3(0.12, 0.03, hp_d * 0.9), hp_lin)

			for hp_i in 8:
				var hp_a: float = TAU * float(hp_i) / 8.0
				_add_box(Vector3(c.x + cos(hp_a) * hp_w * 0.3, h + 0.02,
					c.y + sin(hp_a) * hp_d * 0.3),
					Vector3(0.5, 0.03, 0.5) if hp_i % 2 == 0
						else Vector3(0.42, 0.03, 0.42), hp_lin)

			for hp_k in [-1.0, 1.0]:
				_add_box(Vector3(c.x + hp_k * hp_w * 0.11, h + 0.03, c.y),
					Vector3(0.16, 0.04, hp_d * 0.3), hp_lin)
			_add_box(Vector3(c.x, h + 0.03, c.y),
				Vector3(hp_w * 0.22, 0.04, 0.16), hp_lin)

			for hp_x in [-1.0, 1.0]:
				for hp_z in [-1.0, 1.0]:
					var hp_b: MeshInstance3D = _add_box(
						Vector3(c.x + hp_x * hp_w * 0.46, h + 0.06,
							c.y + hp_z * hp_d * 0.46),
						Vector3(0.16, 0.12, 0.16), Color("ff5a4a"))
					var hp_m: StandardMaterial3D =(hp_b.mesh as BoxMesh).material
					hp_m.emission_enabled = true
					hp_m.emission = Color("ff5a4a")
					hp_m.emission_energy_multiplier = 2.2 if _noche else 1.0
					hp_b.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF






			if Career.house_extras.has("helicoptero") or prop.get("retrato_helicoptero", false):
				var hc_col: Color = Color("2b3a4d")
				var hc_osc: Color = Color("1f2c3c")
				var hc_y: float = h + 0.14


				_add_box(Vector3(c.x, h + 0.035, c.y + 0.25),
					Vector3(1.5, 0.005, 3.3), Color(0.06, 0.07, 0.09, 1.0)
						.lerp(col, 0.55))

				for hc_s in [-1.0, 1.0]:
					_add_box(Vector3(c.x + hc_s * 0.55, hc_y, c.y),
						Vector3(0.09, 0.06, 2.1), Color("b8bcc0"))
					_add_box(Vector3(c.x + hc_s * 0.55, hc_y + 0.04, c.y - 1.12),
						Vector3(0.09, 0.09, 0.16), Color("b8bcc0"))
				for hc_z in [-0.55, 0.65]:
					_add_box(Vector3(c.x, hc_y + 0.14, c.y + hc_z),
						Vector3(1.2, 0.06, 0.07), Color("6b7076"))


				_add_box(Vector3(c.x, hc_y + 0.34, c.y + 0.1),
					Vector3(1.0, 0.3, 1.9), hc_osc)
				_add_box(Vector3(c.x, hc_y + 0.62, c.y + 0.12),
					Vector3(1.08, 0.42, 2.05), hc_col)
				_add_box(Vector3(c.x, hc_y + 0.94, c.y + 0.3),
					Vector3(0.85, 0.28, 1.35), hc_col.lightened(0.08))
				_add_box(Vector3(c.x, hc_y + 1.02, c.y + 0.72),
					Vector3(0.5, 0.16, 0.4), Color("3d4c5e"))

				_add_box(Vector3(c.x, hc_y + 0.5, c.y - 1.05),
					Vector3(0.8, 0.4, 0.3), hc_col)
				_add_box(Vector3(c.x, hc_y + 0.42, c.y - 1.25),
					Vector3(0.55, 0.26, 0.16), hc_osc)


				var hc_vidrios: Array = [
					[Vector3(c.x, hc_y + 0.78, c.y - 0.86),
						Vector3(0.78, 0.34, 0.34)],
					[Vector3(c.x, hc_y + 0.72, c.y - 0.35),
						Vector3(1.1, 0.22, 0.6)]]
				for hc_v in hc_vidrios:
					var hc_cab: MeshInstance3D = _add_box(hc_v[0], hc_v[1],
						Color("aee1f2"))
					var hc_cm: StandardMaterial3D = \
							(hc_cab.mesh as BoxMesh).material
					hc_cm.emission_enabled = true
					hc_cm.emission = Color("7fb8cf")
					hc_cm.emission_energy_multiplier = 1.4 if _noche else 0.5



				_add_box(Vector3(c.x, hc_y + 0.72, c.y + 1.45),
					Vector3(0.24, 0.24, 0.9), hc_col)
				_add_box(Vector3(c.x, hc_y + 0.76, c.y + 2.0),
					Vector3(0.16, 0.16, 0.6), hc_osc)
				_add_box(Vector3(c.x, hc_y + 1.04, c.y + 2.2),
					Vector3(0.08, 0.5, 0.32), CareerTheme.accent())
				_add_box(Vector3(c.x + 0.1, hc_y + 1.06, c.y + 2.2),
					Vector3(0.05, 0.09, 0.09), Color("1d1d20"))
				_add_box(Vector3(c.x + 0.13, hc_y + 1.06, c.y + 2.2),
					Vector3(0.03, 0.6, 0.1), Color("23262b"))
				var hc_bz: MeshInstance3D = _add_box(
					Vector3(c.x, hc_y + 1.32, c.y + 2.2),
					Vector3(0.09, 0.07, 0.09), Color("ff5a4a"))
				var hc_bm: StandardMaterial3D =(hc_bz.mesh as BoxMesh).material
				hc_bm.emission_enabled = true
				hc_bm.emission = Color("ff5a4a")
				hc_bm.emission_energy_multiplier = 2.2 if _noche else 1.0
				hc_bz.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF



				_add_box(Vector3(c.x, hc_y + 1.2, c.y + 0.15),
					Vector3(0.14, 0.22, 0.14), Color("1d1d20"))
				_add_box(Vector3(c.x, hc_y + 1.32, c.y + 0.15),
					Vector3(0.3, 0.05, 0.3), Color("2c2f34"))
				_add_box(Vector3(c.x, hc_y + 1.36, c.y + 0.15),
					Vector3(2.6, 0.035, 0.15), Color("23262b"))
				_add_box(Vector3(c.x, hc_y + 1.36, c.y + 0.15),
					Vector3(0.15, 0.035, 2.6), Color("23262b"))
				for hc_t in [[Vector3(1.55, 0.0, 0.0), Vector3(0.5, 0.03, 0.14)],
						[Vector3(-1.55, 0.0, 0.0), Vector3(0.5, 0.03, 0.14)],
						[Vector3(0.0, 0.0, 1.55), Vector3(0.14, 0.03, 0.5)],
						[Vector3(0.0, 0.0, -1.55), Vector3(0.14, 0.03, 0.5)]]:
					_add_box(Vector3(c.x, hc_y + 1.335, c.y + 0.15)
						+(hc_t[0] as Vector3), hc_t[1] as Vector3,
						Color("1d1f23"))


				_add_box(Vector3(c.x, hc_y + 0.56, c.y + 0.1),
					Vector3(1.1, 0.13, 1.7), CareerTheme.accent())
				_add_box(Vector3(c.x - 0.28, hc_y + 1.14, c.y - 0.75),
					Vector3(0.025, 0.3, 0.025), Color("1d1d20"))
		"jacuzzi":










			var jw: float = r.size.x
			var jd: float = r.size.y
			var jb_t: float = 0.16

			_add_box(Vector3(c.x, 0.06, c.y),
				Vector3(jw, 0.12, jd), Color("1f4a5a"))

			_add_box(Vector3(c.x, 0.05, c.y),
				Vector3(jw * 1.02, 0.1, jd * 1.02), col.darkened(0.32))

			for jsz in [-1.0, 1.0]:
				_add_box(Vector3(c.x, h * 0.5, c.y + jsz *(jd - jb_t) * 0.5),
					Vector3(jw, h, jb_t), col)
			for jsx in [-1.0, 1.0]:
				_add_box(Vector3(c.x + jsx *(jw - jb_t) * 0.5, h * 0.5, c.y),
					Vector3(jb_t, h, jd - jb_t * 2.0), col)

			for jbx in [-1.0, 1.0]:
				for jbz in [-1.0, 1.0]:
					_add_box(Vector3(c.x + jbx * jw * 0.42, h * 0.5,
						c.y + jbz * jd * 0.42),
						Vector3(jw * 0.2, h, jd * 0.2), col.darkened(0.1))
			for lado in [-1.0, 1.0]:
				AsientosPulidosLib.acolchado(self, Vector3(c.x + lado * jw * 0.25, h - 0.035, c.y + jd * 0.5 - 0.24), Vector3(jw * 0.22, 0.06, 0.18), Color("58686c"))
				for junta in 6:
					_add_box(Vector3(c.x +(junta - 2.5) * jw * 0.14, h * 0.47, c.y + lado * jd * 0.5), Vector3(0.012, h * 0.82, 0.012), col.darkened(0.28))
			_add_box(Vector3(c.x, h + 0.012, c.y - jd * 0.5 + 0.07), Vector3(0.24, 0.03, 0.1), Color("35484c"))
			for boton in [-1.0, 1.0]:
				_add_box(Vector3(c.x + boton * 0.065, h + 0.03, c.y - jd * 0.5 + 0.07), Vector3(0.035, 0.008, 0.045), Color("87c9d2"))



			var jagua_h: float = h - 0.06 - 0.12
			var jagua: MeshInstance3D = _add_box(
				Vector3(c.x, 0.12 + jagua_h * 0.5, c.y),
				Vector3(jw - jb_t * 2.0, jagua_h, jd - jb_t * 2.0), Color("40a0c2"))
			var jam: StandardMaterial3D =(jagua.mesh as BoxMesh).material
			jam.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
			jam.albedo_color = Color(0.25, 0.627, 0.76, 0.72)
			jam.emission_enabled = true
			jam.emission = Color("58b4d0")
			jam.emission_energy_multiplier = 0.5

			var jsp_padre: Node = _box_parent if _box_parent != null else viewport
			var jbub_tex: ImageTexture = RisingSpriteLib.make_texture(
				"burbuja", Color("d4eef6"))
			for jb in 7:
				var jang: float = float(jb) * 0.9
				var jbub = RisingSpriteLib.new()
				jsp_padre.add_child(jbub)
				jbub.setup(jbub_tex,
					c.x + cos(jang) *(jw - 0.3) * 0.3,
					c.y + sin(jang) *(jd - 0.3) * 0.3,
					h - 0.28, 0.42, 0.9 + float(jb % 3) * 0.25, 0.01,
					float(jb) / 7.0, 0.006)

			var jvap_tex: ImageTexture = RisingSpriteLib.make_texture(
				"vapor", Color("e4f0f4"))
			for jv in 2:
				var jvs = RisingSpriteLib.new()
				jsp_padre.add_child(jvs)
				jvs.setup(jvap_tex, c.x +(0.16 if jv == 0 else -0.16), c.y,
					h + 0.04, 0.34, 0.4, 0.02, float(jv) * 0.5, 0.009)
		"piscina":










			var pw: float = r.size.x
			var pd: float = r.size.y
			var pb_t: float = 0.22

			_add_box(Vector3(c.x, 0.06, c.y),
				Vector3(pw, 0.12, pd), Color("245063"))

			for psz in [-1.0, 1.0]:
				_add_box(Vector3(c.x, h * 0.5, c.y + psz *(pd - pb_t) * 0.5),
					Vector3(pw, h, pb_t), Color("b8b0a0"))
			for psx in [-1.0, 1.0]:
				_add_box(Vector3(c.x + psx *(pw - pb_t) * 0.5, h * 0.5, c.y),
					Vector3(pb_t, h, pd - pb_t * 2.0), Color("b8b0a0"))

			var agua_top: float = h - 0.06
			var agua_h: float = agua_top - 0.12
			var agua: MeshInstance3D = _add_box(
				Vector3(c.x, 0.12 + agua_h * 0.5, c.y),
				Vector3(pw - pb_t * 2.0, agua_h, pd - pb_t * 2.0), Color("5f9fc9"))
			var pm: StandardMaterial3D =(agua.mesh as BoxMesh).material
			pm.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
			pm.albedo_color = Color(0.373, 0.624, 0.788, 0.72)
			pm.emission_enabled = true
			pm.emission = Color("4a86b0")
			pm.emission_energy_multiplier = 0.4

			for i in 2:
				_add_box(Vector3(c.x - 0.3 + 0.55 * float(i),
					agua_top + 0.005, c.y - 0.2 + 0.42 * float(i)),
					Vector3(0.5, 0.012, 0.09), Color("bfe0f2"))

			for dx in [0.14, 0.34]:
				_add_box(Vector3(r.end.x - dx, h + 0.16, r.end.y - 0.2),
					Vector3(0.05, 0.32, 0.05), Color("c9ced2"))
			for pel in [0.0, 0.12, 0.24]:
				_add_box(Vector3(r.end.x - 0.24, h + 0.06 + pel, r.end.y - 0.2),
					Vector3(0.24, 0.03, 0.04), Color("b4b9bd"))

			var cam_x: float = r.position.x + 0.42
			_add_box(Vector3(cam_x, 0.16, c.y - 0.5),
				Vector3(0.55, 0.06, 1.1), Color("d9c9a8"))
			for lp in [[-0.2, -0.95], [0.2, -0.95], [-0.2, -0.05], [0.2, -0.05]]:
				_add_box(Vector3(cam_x + float(lp[0]), 0.065,
					c.y + float(lp[1]) + 0.45),
					Vector3(0.05, 0.13, 0.05), Color("6a5a48"))
			_add_box(Vector3(cam_x, 0.34, c.y - 1.02),
				Vector3(0.55, 0.34, 0.07), Color("d9c9a8"))
		"moto":
			preload("res://ui/house/coleccion_pulida.gd").pintar(self, kind, r, col, h)
		"inodoro":
			BanoPropsLib.pintar(self, kind, r, col)
		"lavabo":
			BanoPropsLib.pintar(self, kind, r, col)
		"ducha":









			_add_box(Vector3(c.x, 0.06, c.y),
				Vector3(r.size.x * 0.94, 0.12, r.size.y * 0.94), Color("e6ecee"))
			var mam: MeshInstance3D = _add_box(
				Vector3(c.x - r.size.x * 0.45, 1.0, c.y),
				Vector3(0.05, 1.9, r.size.y * 0.94), col)
			(mam.mesh as BoxMesh).material.albedo_color.a = 0.5
			(mam.mesh as BoxMesh).material.transparency = \
					BaseMaterial3D.TRANSPARENCY_ALPHA
			var mam2: MeshInstance3D = _add_box(
				Vector3(c.x, 1.0, c.y - r.size.y * 0.45),
				Vector3(r.size.x * 0.94, 1.9, 0.05), col)
			(mam2.mesh as BoxMesh).material.albedo_color.a = 0.5
			(mam2.mesh as BoxMesh).material.transparency = \
					BaseMaterial3D.TRANSPARENCY_ALPHA

			_add_box(Vector3(c.x - r.size.x * 0.45, 1.96, c.y),
				Vector3(0.06, 0.05, r.size.y * 0.94), col.darkened(0.35))
			_add_box(Vector3(c.x, 1.96, c.y - r.size.y * 0.45),
				Vector3(r.size.x * 0.94, 0.05, 0.06), col.darkened(0.35))

			var du_x: float = c.x - r.size.x * 0.34
			var du_z: float = c.y + r.size.y * 0.36
			_add_box(Vector3(du_x, 1.05, du_z),
				Vector3(0.07, 2.1, 0.07), Color("b4bcc0"))
			_add_box(Vector3(du_x, 1.98, du_z - 0.16),
				Vector3(0.05, 0.05, 0.32), Color("b4bcc0"))
			_add_box(Vector3(du_x, 1.92, du_z - 0.3),
				Vector3(0.18, 0.05, 0.18), Color("9aa0a4"))

			_add_box(Vector3(du_x, 1.0, du_z - 0.05),
				Vector3(0.09, 0.12, 0.06), Color("9aa0a4"))
		"tina":
			BanoPropsLib.pintar(self, kind, r, col)
		"sauna":

































			var sa_t: float = 0.08
			var sa_w: float = r.size.x
			var sa_d: float = r.size.y
			var sa_y0: float = 0.14



			var sa_h0: float = sa_y0 - 0.03



			var sa_pie: float = 0.1
			var sa_z0: float = c.y - sa_d * 0.5 + sa_t * 0.5


			_add_box(Vector3(c.x, sa_y0 * 0.5, c.y),
				Vector3(sa_w * 0.98, sa_y0, sa_d * 0.98), col.darkened(0.18))





			var sa_pl: float =(h - sa_y0) / 3.0
			for sa_i in 3:
				_add_box(Vector3(c.x, sa_y0 + sa_pl *(0.5 + float(sa_i)),
						c.y + sa_d * 0.5 - sa_t * 0.5),
					Vector3(sa_w * 0.98, sa_pl - 0.02, sa_t),
					col.lightened(0.08) if sa_i == 1 else col, 1)








			for sa_s in [-1.0, 1.0]:
				_add_box(Vector3(c.x + sa_s *(sa_w * 0.5 - sa_t * 0.5),
						(sa_h0 + h) * 0.5, c.y),
					Vector3(sa_t, h - sa_h0, sa_d * 0.92), col.darkened(0.06), 1)








			var sa_jt: float = h - 0.06
			for sa_s2 in [-1.0, 1.0]:
				_add_box(Vector3(c.x + sa_s2 *(sa_w * 0.41),
						(sa_h0 + sa_jt) * 0.5, sa_z0),
					Vector3(sa_w * 0.16, sa_jt - sa_h0, sa_t),
					col.darkened(0.06), 1)





			_add_box(Vector3(c.x, h - 0.13, sa_z0),
				Vector3(sa_w * 0.98, 0.22, sa_t * 1.2), col.darkened(0.12), 1)










			var sa_pb: float = sa_y0 + 0.06
			var sa_pt: float = h - 0.18
			var sa_g: MeshInstance3D = _add_box(
				Vector3(c.x,(sa_pb + sa_pt) * 0.5, sa_z0 - 0.02),
				Vector3(sa_w * 0.62, sa_pt - sa_pb, 0.03),
				Color(0.8, 0.88, 0.92, 0.18))
			var sa_gm: StandardMaterial3D =(sa_g.mesh as BoxMesh).material
			sa_gm.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
			sa_g.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF


			_add_box(Vector3(c.x + sa_w * 0.24, sa_pb +(sa_pt - sa_pb) * 0.55,
					sa_z0 - 0.07),
				Vector3(0.05, 0.26, 0.05), col.lightened(0.2))








			_add_box(Vector3(c.x,(sa_pie + 0.48) * 0.5, c.y + sa_d * 0.1),
				Vector3(sa_w * 0.84, 0.48 - sa_pie, sa_d * 0.3),
				col.lightened(0.1))



			_add_box(Vector3(c.x, 0.88, c.y + sa_d * 0.28),
				Vector3(sa_w * 0.84, 0.07, sa_d * 0.24), col.lightened(0.14))






			for sa_s3 in [-1.0, 1.0]:
				_add_box(Vector3(c.x + sa_s3 *(sa_w * 0.36), 0.65,
						c.y + sa_d * 0.2),
					Vector3(0.07, 0.42, 0.07), col.darkened(0.12))





			var sa_ex: float = c.x - sa_w * 0.3
			var sa_ez: float = c.y - sa_d * 0.22
			_add_box(Vector3(sa_ex,(sa_pie + 0.58) * 0.5, sa_ez),
				Vector3(sa_w * 0.17, 0.58 - sa_pie, sa_d * 0.23), Color("2a2723"))









			for sa_k in 2:
				var sa_r: MeshInstance3D = _add_box(
					Vector3(sa_ex, sa_y0 + 0.45 + 0.07 * float(sa_k), sa_ez),
					Vector3(sa_w *(0.15 - 0.04 * float(sa_k)), 0.09,
						sa_d *(0.2 - 0.06 * float(sa_k))),
					Color("c76a32") if sa_k == 1 else Color("8a4f2c"))
				var sa_rm: StandardMaterial3D =(sa_r.mesh as BoxMesh).material
				sa_rm.emission_enabled = true
				sa_rm.emission = Color("ff8a3d")
				sa_rm.emission_energy_multiplier = 1.7 if _noche else 1.0
				sa_r.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF


			_add_box(Vector3(c.x + sa_w * 0.3,(sa_pie + 0.36) * 0.5, sa_ez),
				Vector3(0.2, 0.36 - sa_pie, 0.2), col.darkened(0.24))






			_add_luz(Vector3(sa_ex, sa_y0 + 0.62, sa_ez),
				Color("ff9040"), 1.5, 2.6)
		"poker":
			preload("res://ui/house/mesa_grada_pulidas.gd").pintar(self, kind, r, col, h, prop)
		"gimnasio":






			var g_lx: bool = r.size.x >= r.size.y
			var g_len: float =(r.size.x if g_lx else r.size.y)
			var g_wid: float =(r.size.y if g_lx else r.size.x)

			var along: Vector3 = Vector3(1.0, 0.0, 0.0) if g_lx \
					else Vector3(0.0, 0.0, 1.0)
			var across: Vector3 = Vector3(0.0, 0.0, 1.0) if g_lx \
					else Vector3(1.0, 0.0, 0.0)
			var base: Vector3 = Vector3(c.x, 0.0, c.y)
			var back: float = g_wid * 0.32


			for st in [-1.0, 1.0]:
				var tower: Vector3 = base + along *(st * g_len * 0.3) \
						+ across * back
				_add_box(tower + Vector3(0.0, h * 0.5, 0.0),
					Vector3(0.15, h, 0.15), col)
				_add_box(tower + Vector3(0.0, 0.06, 0.0)
						- across *(g_wid * 0.1),
					Vector3(0.2 if g_lx else 0.42, 0.12,
						0.42 if g_lx else 0.2), col.darkened(0.18))

				_add_box(tower + Vector3(0.0, h * 0.9, 0.0),
					Vector3(0.19, 0.08, 0.19), col.lightened(0.18))

			var bar_y: float = h * 0.92
			_add_box(base + Vector3(0.0, bar_y, 0.0) + across *(back - 0.07),
				Vector3(g_len * 1.02 if g_lx else 0.07, 0.07,
					0.07 if g_lx else g_len * 1.02), Color("c2c7cb"))

			for sd in [-1.0, 1.0]:
				for disco in 3:
					var disc: Vector3 = base + Vector3(0.0, bar_y, 0.0) + along *(sd * g_len *(0.36 + disco * 0.055)) + across *(back - 0.07)
					_add_wheel(disc, 0.22 - disco * 0.015, g_len * 0.045, Color("25292e") if disco % 2 == 0 else Color("414950"), not g_lx)
				var collar: Vector3 = base + Vector3.UP * bar_y + along *(sd * g_len * 0.505) + across *(back - 0.07)
				_add_wheel(collar, 0.06, 0.025, Color("b9c2c8"), not g_lx)



			var pad: float = 0.44

			var bench_len: float = maxf(1.5, g_wid * 1.35)
			var bench_head: float = g_wid * 0.38
			var bench: Vector3 = base + across *(bench_head - bench_len * 0.5)
			AsientosPulidosLib.acolchado(self, bench + Vector3(0.0, pad, 0.0),
				along * 0.34 + Vector3.UP * 0.12 + across * bench_len,
				_pal.get("fabric", Color("5f6b74")))
			_add_box(bench + Vector3(0.0, pad + 0.12, 0.0)
					+ across *(bench_len * 0.5 - g_wid * 0.12),
				along * 0.34 + Vector3.UP * 0.16 + across *(g_wid * 0.17),
				_pal.get("fabric", Color("5f6b74")).darkened(0.12))
			for sb in [-1.0, 1.0]:
				_add_box(bench + Vector3(0.0, pad * 0.5, 0.0)
						+ across *(sb *(bench_len * 0.5 - 0.16)),
					Vector3(0.08, pad, 0.08), col.darkened(0.1))
			for lado in [-1.0, 1.0]:
				for ajuste in 5:
					_add_box(base + along *(lado * g_len * 0.3) + across *(back - 0.079) + Vector3.UP *(0.35 + ajuste * h * 0.09), along * 0.03 + Vector3.UP * 0.025 + across * 0.008, Color("1c2328"), 1)
		"pesas":




			var p_lx: bool = r.size.x >= r.size.y
			var p_len: float =(r.size.x if p_lx else r.size.y)
			var p_along: Vector3 = Vector3(1.0, 0.0, 0.0) if p_lx \
					else Vector3(0.0, 0.0, 1.0)
			var p_across: Vector3 = Vector3(0.0, 0.0, 1.0) if p_lx \
					else Vector3(1.0, 0.0, 0.0)
			var p_base: Vector3 = Vector3(c.x, 0.0, c.y)


			for ps in [-1.0, 1.0]:
				_add_box(p_base + Vector3(0.0, h * 0.5, 0.0)
						+ p_along *(ps * p_len * 0.46),
					Vector3(0.1 if p_lx else r.size.x, h,
						r.size.y if p_lx else 0.1), col)
			for tier in 2:
				var ty: float = 0.3 + 0.34 * float(tier)
				var toff: float = 0.05 - 0.1 * float(tier)
				_add_box(p_base + Vector3(0.0, ty, 0.0) + p_across * toff,
					Vector3(p_len * 0.92 if p_lx else 0.24, 0.07,
						0.24 if p_lx else p_len * 0.92), col.lightened(0.1))

				for k in 3:
					var t: float =(float(k) - 1.0) * p_len * 0.28
					var at2: Vector3 = p_base + Vector3(0.0, ty + 0.11, 0.0) \
							+ p_along * t + p_across * toff
					_add_box(at2, Vector3(0.2 if p_lx else 0.05, 0.05,
						0.05 if p_lx else 0.2), Color("9aa0a4"))
					for pd in [-1.0, 1.0]:
						_add_box(at2 + p_along *(pd * 0.09),
							Vector3(0.06 if p_lx else 0.13, 0.13,
								0.13 if p_lx else 0.06), Color("1d1d20"))
		"cinta":











			var t_lx: bool = r.size.x >= r.size.y
			var t_len: float =(r.size.x if t_lx else r.size.y)
			var t_wid: float =(r.size.y if t_lx else r.size.x)
			var t_along: Vector3 = Vector3(1.0, 0.0, 0.0) if t_lx \
					else Vector3(0.0, 0.0, 1.0)
			var t_across: Vector3 = Vector3(0.0, 0.0, 1.0) if t_lx \
					else Vector3(1.0, 0.0, 0.0)
			var t_base: Vector3 = Vector3(c.x, 0.0, c.y)
			var deck: float = 0.2
			_add_box(t_base + Vector3(0.0, deck * 0.5, 0.0),
				Vector3(r.size.x, deck, r.size.y), col)
			_add_box(t_base + Vector3(0.0, deck + 0.02, 0.0),
				Vector3(r.size.x *(0.98 if t_lx else 0.62), 0.04,
					r.size.y *(0.62 if t_lx else 0.98)), Color("1a1a1d"))

			for tr in [-1.0, 1.0]:
				_add_box(t_base + Vector3(0.0, deck + 0.03, 0.0)
						+ t_along *(tr * t_len * 0.44),
					Vector3(0.07 if t_lx else t_wid * 0.62, 0.07,
						t_wid * 0.62 if t_lx else 0.07), Color("6e7478"))

			_add_box(t_base + Vector3(0.0, deck + 0.1, 0.0)
					+ t_along *(t_len * 0.4),
				Vector3(t_len * 0.14 if t_lx else t_wid * 0.8, 0.16,
					t_wid * 0.8 if t_lx else t_len * 0.14), col.darkened(0.2))
			var head: Vector3 = t_base + t_along *(t_len * 0.44)

			for ts2 in [-1.0, 1.0]:
				_add_box(head + Vector3(0.0, h * 0.42, 0.0)
						+ t_across *(ts2 * t_wid * 0.36),
					Vector3(0.1, h * 0.84, 0.1), col.lightened(0.1))



			for tp in [-1.0, 1.0]:
				var t_lat: Vector3 = t_across *(tp * t_wid * 0.42)
				_add_box(t_base + Vector3(0.0, 0.95, 0.0) + t_lat
						+ t_along *(t_len * 0.12),
					Vector3(t_len * 0.62 if t_lx else 0.06, 0.06,
						0.06 if t_lx else t_len * 0.62), col.lightened(0.15))

				_add_box(t_base + Vector3(0.0, 0.58, 0.0) + t_lat
						- t_along *(t_len * 0.18),
					Vector3(0.06, 0.74, 0.06), col.lightened(0.1))
			_add_box(head + Vector3(0.0, h * 0.88, 0.0),
				Vector3(0.1 if t_lx else t_wid * 0.9, 0.3,
					t_wid * 0.9 if t_lx else 0.1), col.darkened(0.1))
			var scr: MeshInstance3D = _add_box(
				head + Vector3(0.0, h * 0.88, 0.0) - t_along * 0.04,
				Vector3(0.06 if t_lx else t_wid * 0.66, 0.18,
					t_wid * 0.66 if t_lx else 0.06), Color("7fd2c4"))
			var sm: StandardMaterial3D =(scr.mesh as BoxMesh).material
			sm.emission_enabled = true
			sm.emission = Color("4fb3a2")
			sm.emission_energy_multiplier = 0.7
			for raya in 9:
				_add_box(t_base + t_along *((raya - 4) * t_len * 0.085) + Vector3.UP *(deck + 0.043), t_along * 0.012 + Vector3.UP * 0.004 + t_across *(t_wid * 0.55), Color("343a3d"))
			for dato in 4:
				_add_box(head - t_along * 0.074 + t_across *((dato - 1.5) * t_wid * 0.12) + Vector3.UP *(h * 0.88 - 0.035 + dato * 0.01), t_along * 0.008 + Vector3.UP *(0.035 + dato * 0.02) + t_across *(t_wid * 0.045), Color("244a4b"), 1)
			_add_box(head - t_along * 0.065 + Vector3.UP *(h * 0.77), t_along * 0.035 + Vector3.UP * 0.04 + t_across * 0.07, Color("d65744"), 1)
		"reloj":



			var w_y: float = float(prop.get("y", 1.45))
			var w_at: Vector3 = Vector3(c.x, w_y, c.y)





			var w_lx: bool = r.size.x >= r.size.y
			var w_sg: float = -1.0
			var w_fd: Vector2 = Vector2(0.0, w_sg) if w_lx else Vector2(w_sg, 0.0)
			var w_dep: float = r.size.y if w_lx else r.size.x
			var w_anc: float = r.size.x if w_lx else r.size.y
			_marco_hueco(r, w_at, h, 0.035, _pal.get("trim", TRIM_COL))





			_add_box(w_at + Vector3(- w_fd.x, 0.0, - w_fd.y) *(w_dep * 0.28),
				Vector3(w_anc - 0.07, h - 0.07, w_dep * 0.3) if w_lx
					else Vector3(w_dep * 0.3, h - 0.07, w_anc - 0.07),
				Color("3a2a30"))






			var esfera: MeshInstance3D = _add_box(
				w_at + Vector3(w_fd.x, 0.0, w_fd.y) *(w_dep * 0.44)
					+ Vector3(0.0, 0.02, 0.0),
				Vector3(0.2, 0.2, 0.05) if w_lx else Vector3(0.05, 0.2, 0.2), col)
			var em: StandardMaterial3D =(esfera.mesh as BoxMesh).material
			em.emission_enabled = true
			em.emission = col
			em.emission_energy_multiplier = 0.7
			var w_u: Vector3 = Vector3.RIGHT if w_lx else Vector3.BACK
			var w_n: Vector3 = Vector3(w_fd.x, 0, w_fd.y)
			var w_centro: Vector3 = w_at + w_n *(w_dep * 0.44 + 0.029) + Vector3.UP * 0.02
			_add_box(w_centro + Vector3.UP * 0.027, w_u * 0.009 + Vector3.UP * 0.065 + w_n.abs() * 0.008, Color("302c28"))
			_add_box(w_centro + w_u * 0.027, w_u * 0.065 + Vector3.UP * 0.009 + w_n.abs() * 0.008, Color("302c28"))


			_add_box(w_at + Vector3(w_fd.x, 0.0, w_fd.y) *(w_dep * 0.42)
					+ Vector3(0.0, 0.02, 0.0),
				Vector3(0.24, 0.24, 0.04) if w_lx else Vector3(0.04, 0.24, 0.24),
				Color("2a2016"))
			for wb in [-1.0, 1.0]:
				_add_box(w_at + Vector3(w_fd.x, 0.0, w_fd.y) *(w_dep * 0.44)
						+ Vector3(0.0, wb * 0.15, 0.0),
					Vector3(0.12, 0.12, 0.04) if w_lx
						else Vector3(0.04, 0.12, 0.12),
					col.darkened(0.22))


			_add_box(w_at + Vector3(w_fd.x, 0.0, w_fd.y) *(w_dep * 0.3)
					+ Vector3(0.0, - h * 0.5 + 0.03, 0.0),
				Vector3(w_anc * 0.55, 0.05, 0.04) if w_lx
					else Vector3(0.04, 0.05, w_anc * 0.55),
				Color("d8d2c4"))
		"espejo":









			var e_y: float = float(prop.get("y", 1.35))
			var e_lx: bool = r.size.x >= r.size.y
			var e_sg: float = -1.0
			_marco_hueco(r, Vector3(c.x, e_y, c.y), h, 0.065,
				_pal.get("trim", TRIM_COL))
			var luna: MeshInstance3D = _add_box(
				Vector3(c.x +(0.0 if e_lx else e_sg * r.size.x * 0.18), e_y,
					c.y +(e_sg * r.size.y * 0.18 if e_lx else 0.0)),
				Vector3((r.size.x - 0.16) if e_lx else r.size.x * 0.7, h - 0.16,
					r.size.y * 0.7 if e_lx else (r.size.y - 0.16)), col)
			var lm2: StandardMaterial3D =(luna.mesh as BoxMesh).material
			lm2.emission_enabled = true
			lm2.emission = Color("b9c6cf")
			lm2.emission_energy_multiplier = 0.25

			var e_u: Vector3 = Vector3.RIGHT if e_lx else Vector3.BACK
			var e_n: Vector3 = Vector3.FORWARD if e_lx else Vector3.LEFT
			var e_len: float = maxf(r.size.x, r.size.y)
			var e_dep: float = minf(r.size.x, r.size.y)
			for lado in [-1.0, 1.0]:
				_add_box(Vector3(c.x, e_y, c.y) + e_u *(lado * e_len * 0.31) + e_n *(e_dep * 0.54),
					e_u * 0.022 + Vector3.UP *(h * 0.48) + e_n.abs() * 0.008, Color("d9e4e7"), 1)
				_add_box(Vector3(c.x, e_y + h * 0.5 - 0.04, c.y) + e_u *(lado * e_len * 0.3) + e_n *(e_dep * 0.52),
					e_u * 0.055 + Vector3.UP * 0.05 + e_n.abs() * 0.02, Color("b2b8bb"), 1)
		"repisa_pared":










			var rp_y: float = float(prop.get("y", 1.35))
			var rp_top: float = float(PROP_LOOK.get("repisa_pared", {}).get(
				"top", rp_y + 0.06))
			var rp_lx: bool = r.size.x >= r.size.y
			var rp_len: float =(r.size.x if rp_lx else r.size.y)
			_add_box(Vector3(c.x, rp_top - 0.03, c.y),
				Vector3(r.size.x, 0.06, r.size.y), col)
			for lado in [-1.0, 1.0]:
				var rp_off: float = lado * rp_len * 0.32
				_add_box(Vector3(c.x +(rp_off if rp_lx else 0.0), rp_top - 0.12,
					c.y +(0.0 if rp_lx else rp_off)),
					Vector3(0.05 if rp_lx else r.size.x * 0.8, 0.12,
						r.size.y * 0.8 if rp_lx else 0.05),
					col.darkened(0.25))

			var rp_u: Vector3 = Vector3.RIGHT if rp_lx else Vector3.BACK
			var rp_d: Vector3 = Vector3.BACK if rp_lx else Vector3.RIGHT
			var rp_depth: float = minf(r.size.x, r.size.y)
			_add_box(Vector3(c.x, rp_top - 0.205, c.y), rp_u *(rp_len * 0.5) + Vector3.UP * 0.025 + rp_d *(rp_depth * 0.75), col.darkened(0.12), 1)
			for soporte in [-1.0, 1.0]:
				_add_box(Vector3(c.x, rp_top - 0.13, c.y) + rp_u *(soporte * rp_len * 0.24),
					rp_u * 0.025 + Vector3.UP * 0.15 + rp_d *(rp_depth * 0.7), col.darkened(0.1), 1)
			for libro in 3:
				var libro_at: Vector3 = Vector3(c.x, rp_top - 0.18 + libro * 0.033, c.y) - rp_d *(rp_depth * 0.12)
				_add_box(libro_at, rp_u *(rp_len *(0.27 - libro * 0.025)) + Vector3.UP * 0.03 + rp_d *(rp_depth * 0.6),
					[Color("687d74"), Color("ae8059"), Color("d1bc8f")][libro], 1)
		"ojo_buey":





			var o_lx: bool = r.size.x >= r.size.y
			var o_sg: float = -1.0
			var o_y: float = float(prop.get("y", 1.75))
			var o_dep: float =(r.size.y if o_lx else r.size.x)
			var o_rad: float =(r.size.x if o_lx else r.size.y) * 0.5







			_add_wheel(Vector3(c.x, o_y, c.y), o_rad, o_dep * 0.7,
				_pal.get("trim", TRIM_COL), o_lx)
			var o_off: Vector2 =(Vector2(0.0, o_sg) if o_lx
				else Vector2(o_sg, 0.0)) *(o_dep * 0.55)
			var o_gl: MeshInstance3D = _add_wheel(
				Vector3(c.x, o_y, c.y), o_rad - 0.07,
				o_dep * 1.2, SKY_COL, o_lx)
			var o_gm: StandardMaterial3D =(o_gl.mesh as CylinderMesh).material
			o_gm.emission_enabled = true
			o_gm.emission = SKY_COL
			o_gm.emission_energy_multiplier = 0.55






			var o_larg: float = o_rad * 1.35
			var o_gro: float = 0.04
			var o_fon: float = o_dep * 0.6
			var o_ejes: Array = [

				Vector3(o_gro if o_lx else o_fon, o_larg, o_fon if o_lx else o_gro),
				Vector3(o_larg if o_lx else o_fon, o_gro, o_fon if o_lx else o_larg),
			]
			for medida in o_ejes:
				_add_box(Vector3(c.x + o_off.x, o_y, c.y + o_off.y),
					medida, _pal.get("trim", TRIM_COL), 1)
		"ventana", "ventanal":





			var v_y: float = float(prop.get("y", 1.45))
			var v_lx: bool = r.size.x >= r.size.y
			var v_anc: float =(r.size.x if v_lx else r.size.y)
			var v_dep: float =(r.size.y if v_lx else r.size.x)

			_add_box(Vector3(c.x, v_y, c.y),
				Vector3(r.size.x, h, r.size.y), _pal.get("trim", TRIM_COL))








			var v_glass: MeshInstance3D = _add_box(
				Vector3(c.x, v_y, c.y),
				Vector3(v_anc - 0.16, h - 0.16, v_dep + 0.07) if v_lx
					else Vector3(v_dep + 0.07, h - 0.16, v_anc - 0.16),
				SKY_COL, 1)
			var v_gm: StandardMaterial3D =(v_glass.mesh as BoxMesh).material
			v_gm.emission_enabled = true
			v_gm.emission = SKY_COL
			v_gm.emission_energy_multiplier = 0.55






			var v_grande: bool = kind == "ventanal"
			var v_montantes: Array = [0.0] if not v_grande else [-0.32, 0.0, 0.32]
			for f in v_montantes:
				var v_d: Vector2 =(Vector2(float(f) * v_anc, 0.0) if v_lx
					else Vector2(0.0, float(f) * v_anc))
				_add_box(Vector3(c.x + v_d.x, v_y, c.y + v_d.y),
					Vector3(0.05, h - 0.16, v_dep + 0.09) if v_lx
						else Vector3(v_dep + 0.09, h - 0.16, 0.05),
					_pal.get("trim", TRIM_COL), 1)



			var v_tr: float = 0.0 if not v_grande else h * 0.26
			_add_box(Vector3(c.x, v_y + v_tr, c.y),
				Vector3(v_anc - 0.16, 0.05, v_dep + 0.09) if v_lx
					else Vector3(v_dep + 0.09, 0.05, v_anc - 0.16),
				_pal.get("trim", TRIM_COL), 1)





		"cuadro":




			var cu: Dictionary = _cara_muro(r)
			var cu_lx: bool = bool(cu["lx"])
			var cu_fd: Vector2 = cu["fd"]
			var cu_dep: float = float(cu["dep"])
			var cu_anc: float = float(cu["anc"])
			var cu_at: Vector3 = Vector3(c.x, float(prop.get("y", 1.55)), c.y)
			var cu_ad: Vector3 = Vector3(cu_fd.x, 0.0, cu_fd.y)

			for lado in [-1.0, 1.0]:
				_add_box(cu_at + cu_ad *(cu_dep * 0.44) + Vector3(0, lado *(h * 0.5 - 0.085), 0),
					Vector3(cu_anc - 0.12, 0.04, 0.018) if cu_lx else Vector3(0.018, 0.04, cu_anc - 0.12), Color("eee7d8"))
			_marco_hueco(r, cu_at, h, 0.05, _pal.get("trim", TRIM_COL))


			_add_box(cu_at + cu_ad *(cu_dep * 0.22),
				Vector3(cu_anc - 0.12, h - 0.12, cu_dep * 0.4) if cu_lx
					else Vector3(cu_dep * 0.4, h - 0.12, cu_anc - 0.12), Color("d8ded4"))
			for cu_i in 2:
				var cu_v: float =(float(cu_i) - 0.5) * h * 0.34
				_add_box(cu_at + cu_ad *(cu_dep * 0.44)
						+ Vector3(0.0, cu_v, 0.0),
					Vector3(cu_anc *(0.7 - 0.25 * float(cu_i)), h * 0.16, 0.02)
						if cu_lx
						else Vector3(0.02, h * 0.16,
							cu_anc *(0.7 - 0.25 * float(cu_i))),
					Color("4b6860") if cu_i == 0 else Color("b4915b"))
			var cu_u: Vector3 = Vector3.RIGHT if cu_lx else Vector3.BACK
			_add_wheel(cu_at + cu_ad *(cu_dep * 0.49) + cu_u *(cu_anc * 0.24) + Vector3.UP *(h * 0.2),
				minf(cu_anc, h) * 0.1, 0.012, Color("cd9b58"), cu_lx)
			_add_box(cu_at + cu_ad *(cu_dep * 0.49) - cu_u *(cu_anc * 0.22),
				cu_u *(cu_anc * 0.07) + Vector3.UP *(h * 0.52) + cu_ad.abs() * 0.012, Color("a76951"))
		"banderines":
			preload("res://ui/house/paredes_pulidas.gd").pintar(self, kind, r, col, h, prop)
		"bufandas":











			var bf: Dictionary = _cara_muro(r)
			var bf_lx: bool = bool(bf["lx"])
			var bf_fd: Vector2 = bf["fd"]
			var bf_dep: float = float(bf["dep"])
			var bf_anc: float = float(bf["anc"])
			var bf_at: Vector3 = Vector3(c.x, float(prop.get("y", 1.5)), c.y)
			var bf_ad: Vector3 = Vector3(bf_fd.x, 0.0, bf_fd.y)


			_add_box(bf_at - bf_ad *(bf_dep * 0.325),
				Vector3(bf_anc, h - 0.04, bf_dep * 0.35) if bf_lx
					else Vector3(bf_dep * 0.35, h - 0.04, bf_anc),
				Color("2e2620"))


			for bf_dy in [0.5, -0.5]:
				_add_box(bf_at + bf_ad *(bf_dep * 0.12)
						+ Vector3(0.0,(h - 0.05) * bf_dy, 0.0),
					Vector3(bf_anc + 0.04, 0.05, bf_dep * 0.6) if bf_lx
						else Vector3(bf_dep * 0.6, 0.05, bf_anc + 0.04), col)
			var bf_n: int = maxi(3, int(bf_anc / 0.45))
			for bf_i in bf_n:
				var bf_off: float =((float(bf_i) + 0.5) / float(bf_n) - 0.5) \
						*(bf_anc - 0.1)



				var bf_col: Color = Color.from_hsv(
					fposmod(0.08 + float(bf_i) * 0.17, 1.0), 0.52, 0.78)
				_add_box(bf_at + bf_ad *(bf_dep * 0.22)
						+ Vector3(bf_off if bf_lx else 0.0, -0.03,
							0.0 if bf_lx else bf_off),
					Vector3(0.16, h - 0.18, bf_dep * 0.45) if bf_lx
						else Vector3(bf_dep * 0.45, h - 0.18, 0.16), bf_col)


				_add_box(bf_at + bf_ad *(bf_dep * 0.36)
						+ Vector3(bf_off if bf_lx else 0.0, - h * 0.5, 0.0
							if bf_lx else bf_off),
					Vector3(0.1, h * 0.3, 0.03) if bf_lx
						else Vector3(0.03, h * 0.3, 0.1), bf_col.darkened(0.2))




		"escudo_muro":



			var ec: Dictionary = _cara_muro(r)
			var ec_lx: bool = bool(ec["lx"])
			var ec_fd: Vector2 = ec["fd"]
			var ec_dep: float = float(ec["dep"])
			var ec_anc: float = float(ec["anc"])
			var ec_at: Vector3 = Vector3(c.x, float(prop.get("y", 1.65)), c.y)
			var ec_ad: Vector3 = Vector3(ec_fd.x, 0.0, ec_fd.y)
			var ec_kit: Dictionary = GameState.player_kit()


			_add_box(ec_at - ec_ad *(ec_dep * 0.3),
				Vector3(ec_anc, h, ec_dep * 0.4) if ec_lx
					else Vector3(ec_dep * 0.4, h, ec_anc), col)

			_add_box(ec_at - ec_ad *(ec_dep * 0.2)
					+ Vector3(0.0, - h * 0.42, 0.0),
				Vector3(ec_anc - 0.08, 0.06, ec_dep * 0.5) if ec_lx
					else Vector3(ec_dep * 0.5, 0.06, ec_anc - 0.08),
				ec_kit.get("kit", Color("2a4bd7")))
			_add_crest_sprite(ec_at + ec_ad *(ec_dep * 0.35)
				+ Vector3(0.0, h * 0.06, 0.0), ec_lx, ec_fd, h * 0.66)




			_add_strip(ec_at + ec_ad *(ec_dep * 0.36)
					+ Vector3(0.0, - h * 0.48, 0.0),
				Vector3(ec_anc * 0.7, 0.04, 0.06) if ec_lx
					else Vector3(0.06, 0.04, ec_anc * 0.7))
		"banderin_vitrina":
			preload("res://ui/house/paredes_pulidas.gd").pintar(self, kind, r, col, h, prop)
		"tifo_enmarcado":





			var tf: Dictionary = _cara_muro(r)
			var tf_lx: bool = bool(tf["lx"])
			var tf_fd: Vector2 = tf["fd"]
			var tf_dep: float = float(tf["dep"])
			var tf_anc: float = float(tf["anc"])
			var tf_at: Vector3 = Vector3(c.x, float(prop.get("y", 1.45)), c.y)
			var tf_ad: Vector3 = Vector3(tf_fd.x, 0.0, tf_fd.y)
			var tf_kit: Dictionary = GameState.player_kit()
			var tf_a: Color = tf_kit.get("kit", Color("2a4bd7"))
			var tf_b: Color = tf_kit.get("kit_b", tf_kit.get("kit2",
				tf_a.lightened(0.6)))

			_add_box(tf_at, Vector3(r.size.x, h, r.size.y), col)
			var tf_cols: int = 8
			var tf_rows: int = 5
			var tf_w: float =(tf_anc - 0.12) / float(tf_cols)
			var tf_hh: float =(h - 0.12) / float(tf_rows)
			for tf_i in tf_cols:
				for tf_j in tf_rows:
					var tf_ox: float =(float(tf_i) + 0.5 - float(tf_cols) * 0.5) \
							* tf_w
					var tf_oy: float =(float(tf_rows) * 0.5 - float(tf_j) - 0.5) \
							* tf_hh




					var tf_diag: bool =((tf_i + tf_j) % 4) < 2
					_add_box(tf_at + tf_ad *(tf_dep * 0.54)
							+ Vector3(tf_ox if tf_lx else 0.0, tf_oy,
								0.0 if tf_lx else tf_ox),
						Vector3(tf_w * 0.9, tf_hh * 0.9, tf_dep * 0.2) if tf_lx
							else Vector3(tf_dep * 0.2, tf_hh * 0.9, tf_w * 0.9),
						tf_a if tf_diag else tf_b)
			for ribete in [-1.0, 1.0]:
				_add_box(tf_at + tf_ad *(tf_dep * 0.55) + Vector3(0, ribete *(h * 0.5 - 0.035), 0),
					Vector3(tf_anc - 0.04, 0.022, 0.012) if tf_lx else Vector3(0.012, 0.022, tf_anc - 0.04), Color("c4af81"), 1)
		"balones_temporada":




			var bl: Dictionary = _cara_muro(r)
			var bl_lx: bool = bool(bl["lx"])
			var bl_fd: Vector2 = bl["fd"]
			var bl_dep: float = float(bl["dep"])
			var bl_anc: float = float(bl["anc"])
			var bl_at: Vector3 = Vector3(c.x, float(prop.get("y", 1.3)), c.y)
			var bl_ad: Vector3 = Vector3(bl_fd.x, 0.0, bl_fd.y)

			_add_box(bl_at + bl_ad *(bl_dep * 0.1)
					+ Vector3(0.0, - h * 0.45, 0.0),
				Vector3(bl_anc, 0.06, bl_dep * 0.8) if bl_lx
					else Vector3(bl_dep * 0.8, 0.06, bl_anc), col)
			for bl_s in [-1.0, 1.0]:
				var bl_eo: float = bl_s *(bl_anc * 0.5 - 0.12)
				_add_box(bl_at - bl_ad *(bl_dep * 0.2)
						+ Vector3(bl_eo if bl_lx else 0.0, - h * 0.5,
							0.0 if bl_lx else bl_eo),
					Vector3(0.06, 0.12, bl_dep * 0.35) if bl_lx
						else Vector3(bl_dep * 0.35, 0.12, 0.06),
					col.darkened(0.25))
			var bl_hist: Array = CasaFoto.clubes()
			var bl_n: int = clampi(maxi(bl_hist.size(), GameState.season_num),
				3, maxi(3, int(bl_anc / 0.3)))
			var bl_frames: SpriteFrames = BallDeco.frames_for({}, true)
			if bl_frames != null and bl_frames.has_animation("idle") \
					and bl_frames.get_frame_count("idle") > 0:
				var bl_padre: Node = _box_parent if _box_parent != null else viewport
				var bl_tex: Texture2D = bl_frames.get_frame_texture("idle", 0)
				for bl_i in bl_n:
					var bl_off: float =((float(bl_i) + 0.5) / float(bl_n) - 0.5) \
							*(bl_anc - 0.16)
					var bl_col: Color = GameState.player_kit().get("kit",
						Color("2a4bd7"))
					if bl_i < bl_hist.size():

						var bl_t: Dictionary = Teams.by_id(String(bl_hist[bl_i]))
						if not bl_t.is_empty():
							bl_col = bl_t.get("kit", bl_col)
					var bl_spr: Sprite3D = Sprite3D.new()
					bl_spr.texture = bl_tex
					bl_spr.pixel_size = BALL_M \
							/ float(maxi(1, bl_tex.get_height()))
					bl_spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
					bl_spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
					bl_spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y




					bl_spr.modulate = bl_col.lightened(0.25)
					bl_spr.position = bl_at + bl_ad *(bl_dep * 0.25) \
							+ Vector3(bl_off if bl_lx else 0.0,
							- h * 0.42 + 0.03 + BALL_M * 0.5,
							0.0 if bl_lx else bl_off)
					bl_padre.add_child(bl_spr)
		"butaca_estadio":
			preload("res://ui/house/mesa_grada_pulidas.gd").pintar(self, kind, r, col, h, prop)
		"alfombra_circulo":




			var ac_h: float = h
			var ac_kit: Dictionary = GameState.player_kit()
			_add_box(Vector3(c.x, ac_h * 0.4, c.y),
				Vector3(r.size.x, ac_h * 0.8, r.size.y), col.darkened(0.3))


			var ac_n: int = 6
			for ac_i in ac_n:
				if ac_i % 2 == 1:
					continue
				var ac_w: float =(r.size.x - 0.2) / float(ac_n)
				var ac_ox: float =(float(ac_i) + 0.5 - float(ac_n) * 0.5) * ac_w
				_add_box(Vector3(c.x + ac_ox, ac_h * 0.45, c.y),
					Vector3(ac_w, ac_h * 0.9, r.size.y - 0.2), col.lightened(0.12))



			var ac_r: float = minf(r.size.x, r.size.y) * 0.3
			for ac_s in [-1.0, 1.0]:
				_add_box(Vector3(c.x + ac_s * ac_r, ac_h * 0.5, c.y),
					Vector3(0.08, ac_h, ac_r * 1.5), Color("e8ece8"))
				_add_box(Vector3(c.x, ac_h * 0.5, c.y + ac_s * ac_r),
					Vector3(ac_r * 1.5, ac_h, 0.08), Color("e8ece8"))

			_add_crest_sprite(Vector3(c.x, ac_h + 0.004, c.y), true,
				Vector2.ZERO, ac_r * 1.2, true)

			for ac_s2 in [-1.0, 1.0]:
				_add_box(Vector3(c.x, ac_h * 0.5, c.y + ac_s2 *(r.size.y * 0.5 - 0.06)),
					Vector3(r.size.x, ac_h, 0.12),
					ac_kit.get("kit", Color("2a4bd7")))
		"casillero":



			var cs_kit: Dictionary = GameState.player_kit()
			var cs_col: Color = cs_kit.get("kit", Color("2a4bd7"))
			var cs_face: int = int(prop.get("face", House.base_face(prop)))&3
			var cs_lx: bool =(cs_face&1) == 0
			var cs_dir: Vector2 = House.FACE_DIR[cs_face]
			var cs_fondo: float = r.size.y if cs_lx else r.size.x
			var cs_anc: float = r.size.x if cs_lx else r.size.y

			_add_box(Vector3(c.x, 0.06, c.y),
				Vector3(r.size.x - 0.08, 0.12, r.size.y - 0.08),
				col.darkened(0.35))
			_add_box(Vector3(c.x, 0.12 +(h - 0.12) * 0.5, c.y),
				Vector3(r.size.x, h - 0.12, r.size.y), col)



			var cs_ad: Vector3 = Vector3(cs_dir.x, 0.0, cs_dir.y) *(cs_fondo * 0.5)
			_add_box(Vector3(c.x, h * 0.55, c.y) + cs_ad * 0.96,
				Vector3(cs_anc - 0.1, h * 0.8, 0.05) if cs_lx
					else Vector3(0.05, h * 0.8, cs_anc - 0.1), cs_col)


			for cs_k in 4:
				_add_box(Vector3(c.x, h * 0.86 - float(cs_k) * 0.06, c.y)
						+ cs_ad * 1.02,
					Vector3(cs_anc * 0.45, 0.02, 0.03) if cs_lx
						else Vector3(0.03, 0.02, cs_anc * 0.45),
					cs_col.darkened(0.45))


			var cs_num: int = GameState.player_number
			_add_lamina([{"t": str(cs_num), "px": 3}],
				Vector3(c.x, h * 0.52, c.y) + cs_ad * 1.04,
				Vector2(cs_anc * 0.4, 0.22), cs_dir,
				Color("f0efe8"), Color("22262c"))
		"botines_muro":
			preload("res://ui/house/paredes_pulidas.gd").pintar(self, kind, r, col, h, prop)
		"tapiz":
			preload("res://ui/house/paredes_pulidas.gd").pintar(self, kind, r, col, h, prop)
		"panel_madera":

			var tz: Dictionary = _cara_muro(r)
			var tz_lx: bool = bool(tz["lx"])
			var tz_fd: Vector2 = tz["fd"]
			var tz_dep: float = float(tz["dep"])
			var tz_anc: float = float(tz["anc"])
			var tz_at: Vector3 = Vector3(c.x, float(prop.get("y", 1.15)), c.y)
			var tz_ad: Vector3 = Vector3(tz_fd.x, 0.0, tz_fd.y)




			_add_box(tz_at, Vector3(r.size.x, h, r.size.y), col, 2)
			var tz_n: int = maxi(3, int(tz_anc / 0.35))
			for tz_i in tz_n:
				var tz_off: float =((float(tz_i) + 0.5) / float(tz_n) - 0.5) \
						* tz_anc
				_add_box(tz_at + tz_ad *(tz_dep * 0.4)
						+ Vector3(tz_off if tz_lx else 0.0, 0.0,
							0.0 if tz_lx else tz_off),
					Vector3(0.03, h - 0.06, tz_dep * 0.3) if tz_lx
						else Vector3(tz_dep * 0.3, h - 0.06, 0.03),
					col.darkened(0.3), 2)
		"mapa_giras":











			var mg: Dictionary = _cara_muro(r)
			var mg_fd: Vector2 = mg["fd"]
			var mg_dep: float = float(mg["dep"])
			var mg_anc: float = float(mg["anc"])
			var mg_at: Vector3 = Vector3(c.x, float(prop.get("y", 1.5)), c.y)
			var mg_ad: Vector3 = Vector3(mg_fd.x, 0.0, mg_fd.y)


			_add_box(mg_at, Vector3(r.size.x, h, r.size.y),
				_pal.get("trim", TRIM_COL))
			_add_box(mg_at + mg_ad *(mg_dep * 0.3),
				Vector3(mg_anc - 0.06, h - 0.06, mg_dep * 0.35) if bool(mg["lx"])
					else Vector3(mg_dep * 0.35, h - 0.06, mg_anc - 0.06), col)
			var mg_paises: Array = []
			for mg_id in CasaFoto.clubes():
				var mg_pais: String = Teams.country_of(String(mg_id))
				if not mg_pais.is_empty() and not mg_paises.has(mg_pais):
					mg_paises.append(mg_pais)
			_add_map_lamina(mg_at + mg_ad *(mg_dep * 0.5),
				Vector2(mg_anc - 0.12, h - 0.12), mg_fd, mg_paises)
		"cartel_partido", "portada_prensa", "placa_fichaje":










			var la: Dictionary = _cara_muro(r)
			var la_fd: Vector2 = la["fd"]
			var la_dep: float = float(la["dep"])
			var la_anc: float = float(la["anc"])
			var la_at: Vector3 = Vector3(c.x, float(prop.get("y", 1.5)), c.y)
			var la_ad: Vector3 = Vector3(la_fd.x, 0.0, la_fd.y)


			_add_box(la_at, Vector3(r.size.x, h, r.size.y), col)
			var la_papel: Color = LAMINA_PAPEL.get(kind, Color("241f1a"))
			_add_lamina(_lamina_lineas(kind),
				la_at + la_ad *(la_dep * 0.5),
				Vector2(la_anc - 0.08, h - 0.08), la_fd, la_papel,
				LAMINA_TINTA.get(kind, Color("e8e2d2")))
		"tv_muro":



			var tm: Dictionary = _cara_muro(r)
			var tm_lx: bool = bool(tm["lx"])
			var tm_fd: Vector2 = tm["fd"]
			var tm_dep: float = float(tm["dep"])
			var tm_anc: float = float(tm["anc"])
			var tm_at: Vector3 = Vector3(c.x, float(prop.get("y", 1.5)), c.y)
			var tm_ad: Vector3 = Vector3(tm_fd.x, 0.0, tm_fd.y)
			_add_box(tm_at, Vector3(r.size.x, h, r.size.y), col)
			var tm_p: MeshInstance3D = _add_box(tm_at + tm_ad *(tm_dep * 0.42),
				Vector3(tm_anc - 0.08, h - 0.08, tm_dep * 0.2) if tm_lx
					else Vector3(tm_dep * 0.2, h - 0.08, tm_anc - 0.08),
				Color("1d3a4a"))
			var tm_m: StandardMaterial3D =(tm_p.mesh as BoxMesh).material
			tm_m.emission_enabled = true
			tm_m.emission = Color("3d6d96")


			tm_m.emission_energy_multiplier = 1.0 if _noche else 0.6









			_add_tv_screen(Career.goal_reel,
				tm_at + tm_ad *(tm_dep * 0.5),
				Vector2((tm_anc - 0.16) * 0.92,(h - 0.16) * 0.92), tm_lx, tm_fd)
			_add_box(tm_at + tm_ad *(tm_dep * 0.3)
					+ Vector3(0.0, - h * 0.5 - 0.02, 0.0),
				Vector3(tm_anc * 0.5, 0.03, tm_dep * 0.4) if tm_lx
					else Vector3(tm_dep * 0.4, 0.03, tm_anc * 0.5),
				Color("58c8e8"))
		"chimenea":





			var ch: Dictionary = _cara_muro(r)
			var ch_lx: bool = bool(ch["lx"])
			var ch_fd: Vector2 = ch["fd"]
			var ch_dep: float = float(ch["dep"])
			var ch_anc: float = float(ch["anc"])
			var ch_ad: Vector3 = Vector3(ch_fd.x, 0.0, ch_fd.y)




			for ch_s in [-1.0, 1.0]:
				var ch_lado: Vector3 = Vector3(ch_s * ch_anc * 0.4, 0, 0) if ch_lx \
						else Vector3(0, 0, ch_s * ch_anc * 0.4)
				_add_box(Vector3(c.x, h * 0.35, c.y) + ch_lado,
					Vector3(ch_anc * 0.2, h * 0.7, ch_dep) if ch_lx \
							else Vector3(ch_dep, h * 0.7, ch_anc * 0.2), col, 2)
			for ch_y in [h * 0.04, h * 0.64]:
				_add_box(Vector3(c.x, ch_y, c.y),
					Vector3(r.size.x, h * 0.08, r.size.y), col.lightened(0.06), 2)

			_add_box(Vector3(c.x, h * 0.86, c.y) - ch_ad *(ch_dep * 0.1),
				Vector3(ch_anc * 0.72, h * 0.3, ch_dep * 0.8) if ch_lx
					else Vector3(ch_dep * 0.8, h * 0.3, ch_anc * 0.72),
				col.lightened(0.12), 2)

			_add_box(Vector3(c.x, h * 0.32, c.y) - ch_ad *(ch_dep * 0.44),
				Vector3(ch_anc * 0.6, h * 0.5, ch_dep * 0.1) if ch_lx
					else Vector3(ch_dep * 0.1, h * 0.5, ch_anc * 0.6),
				Color("14100e"))
			var ch_u: Vector3 = Vector3.RIGHT if ch_lx else Vector3.BACK
			for leno in [-1.0, 1.0]:
				_add_box(Vector3(c.x, h * 0.1, c.y) + ch_ad *(ch_dep *(0.15 + leno * 0.1)), ch_u *(ch_anc * 0.48) + Vector3.UP * 0.09 + ch_ad.abs() * 0.09, Color("4b3024"))
			for barra in 5:
				_add_box(Vector3(c.x, h * 0.15, c.y) + ch_ad *(ch_dep * 0.39) + ch_u *((barra - 2) * ch_anc * 0.11), ch_u * 0.022 + Vector3.UP *(h * 0.19) + ch_ad.abs() * 0.025, Color("302a25"))
			_add_box(Vector3(c.x, h * 0.245, c.y) + ch_ad *(ch_dep * 0.39), ch_u *(ch_anc * 0.5) + Vector3.UP * 0.025 + ch_ad.abs() * 0.025, Color("302a25"))
			for ch_i in 3:
				var ch_o: float =(float(ch_i) - 1.0) * ch_anc * 0.16
				var ch_f: MeshInstance3D = _add_box(
					Vector3(c.x +(ch_o if ch_lx else 0.0),
						h *(0.15 + 0.06 * float(ch_i % 2)),
						c.y +(0.0 if ch_lx else ch_o))
						+ ch_ad *(ch_dep * 0.18),
					Vector3(ch_anc * 0.12, h *(0.2 + 0.07 * float(ch_i % 2)),
						ch_dep * 0.3) if ch_lx
						else Vector3(ch_dep * 0.3,
							h *(0.2 + 0.07 * float(ch_i % 2)), ch_anc * 0.12),
					Color("ff8a3d") if ch_i == 1 else Color("e2612a"))
				var ch_m: StandardMaterial3D =(ch_f.mesh as BoxMesh).material
				ch_m.emission_enabled = true
				ch_m.emission = Color("ff9a4a")
				ch_m.emission_energy_multiplier = 1.9 if _noche else 1.2
				ch_f.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF

			_add_luz(Vector3(c.x, h * 0.3, c.y)
				+ Vector3(ch_fd.x, 0.0, ch_fd.y) * 0.3,
				Color("ff9040"), 1.9, 3.2)
		"plafon":




			var pf_y: float = float(prop.get("y", 2.2))

			_add_box(Vector3(c.x, pf_y + h * 0.4, c.y),
				Vector3(r.size.x * 0.4, h * 0.35, r.size.y * 0.4),
				_pal.get("trim", TRIM_COL))
			var pf_d: MeshInstance3D = _add_box(Vector3(c.x, pf_y, c.y),
				Vector3(r.size.x * 0.85, h * 0.7, r.size.y * 0.85), col)
			var pf_m: StandardMaterial3D =(pf_d.mesh as BoxMesh).material
			pf_m.emission_enabled = true
			pf_m.emission = Color("fff0cf")
			pf_m.emission_energy_multiplier = 1.3 if _noche else 0.8
			pf_d.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF


			_add_luz(Vector3(c.x, pf_y - 0.12, c.y), Color("fff0cf"), 1.4, 6.5)
		"arana":
			DecoPulidaLib.pintar_colgado(self, kind, r, col, float(prop.get("y", 1.95)))
		"aplique":




			var ap: Dictionary = _cara_muro(r)
			var ap_lx: bool = bool(ap["lx"])
			var ap_fd: Vector2 = ap["fd"]
			var ap_dep: float = float(ap["dep"])
			var ap_at: Vector3 = Vector3(c.x, float(prop.get("y", 1.75)), c.y)
			var ap_ad: Vector3 = Vector3(ap_fd.x, 0.0, ap_fd.y)
			_add_box(ap_at - ap_ad *(ap_dep * 0.3),
				Vector3(0.12, h * 0.8, ap_dep * 0.3) if ap_lx
					else Vector3(ap_dep * 0.3, h * 0.8, 0.12),
				_pal.get("trim", TRIM_COL))
			var ap_p: MeshInstance3D = _add_box(ap_at + ap_ad *(ap_dep * 0.15),
				Vector3(r.size.x * 0.55, h * 0.6, ap_dep * 0.55) if ap_lx
					else Vector3(ap_dep * 0.55, h * 0.6, r.size.y * 0.55), col)
			var ap_m: StandardMaterial3D =(ap_p.mesh as BoxMesh).material
			ap_m.emission_enabled = true
			ap_m.emission = Color("ffe2b4")
			ap_m.emission_energy_multiplier = 1.4 if _noche else 0.85
			ap_p.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
			_add_luz(ap_at + Vector3(0.0, 0.22, 0.0)
				+ ap_ad *(ap_dep * 0.2), Color("ffe2b4"), 1.1, 3.6)
		"lampara_mesa":
			DecoPulidaLib.pintar(self, kind, r, col)
		"neon":
			preload("res://ui/house/paredes_pulidas.gd").pintar(self, kind, r, col, h, prop)
		"tira_led":




			var tl: Dictionary = _cara_muro(r)
			var tl_lx: bool = bool(tl["lx"])
			var tl_fd: Vector2 = tl["fd"]
			var tl_dep: float = float(tl["dep"])
			var tl_at: Vector3 = Vector3(c.x, float(prop.get("y", 2.05)), c.y)
			var tl_ad: Vector3 = Vector3(tl_fd.x, 0.0, tl_fd.y)

			_add_box(tl_at + Vector3(0.0, 0.06, 0.0),
				Vector3(r.size.x, 0.05, tl_dep) if tl_lx
					else Vector3(tl_dep, 0.05, r.size.y),
				Color("2a2e33"))
			var tl_s: MeshInstance3D = _add_box(tl_at + tl_ad *(tl_dep * 0.2),
				Vector3(r.size.x - 0.06, h * 0.5, tl_dep * 0.5) if tl_lx
					else Vector3(tl_dep * 0.5, h * 0.5, r.size.y - 0.06), col)
			var tl_m: StandardMaterial3D =(tl_s.mesh as BoxMesh).material
			tl_m.emission_enabled = true
			tl_m.emission = col
			tl_m.emission_energy_multiplier = 2.2 if _noche else 1.3
			tl_s.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF


			_add_luz(tl_at + tl_ad * 0.2, col, 0.8, 4.2)
		"macetero":
			DecoPulidaLib.pintar(self, kind, r, col)
		"pecera_pie":



			var pp_b: float = h * 0.22
			_add_box(Vector3(c.x, pp_b * 0.5, c.y),
				Vector3(r.size.x * 0.9, pp_b, r.size.y * 0.9), col)
			var pp_ag: MeshInstance3D = _add_box(
				Vector3(c.x,(h + pp_b) * 0.5, c.y),
				Vector3(r.size.x * 0.72, h - pp_b - 0.06, r.size.y * 0.72),
				Color("2f6d8c", 0.55))
			var pp_m: StandardMaterial3D =(pp_ag.mesh as BoxMesh).material
			pp_m.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
			pp_m.emission_enabled = true
			pp_m.emission = Color("3d8db6")
			pp_m.emission_energy_multiplier = 0.9 if _noche else 0.5


			for pp_i in 5:
				var pp_a: float = float(pp_i) * 2.399963
				_add_box(Vector3(c.x + cos(pp_a) * r.size.x * 0.2,
						pp_b +(h - pp_b) *(0.2 + 0.15 * float(pp_i)),
						c.y + sin(pp_a) * r.size.y * 0.2),
					Vector3(0.07, 0.04, 0.04),
					Color("e8a13d") if pp_i % 2 == 0 else Color("d8d2c4"))




			_add_box(Vector3(c.x, h - 0.02, c.y),
				Vector3(r.size.x * 0.86, 0.06, r.size.y * 0.86),
				col.lightened(0.15))
		"bar_carrito":
			DecoPulidaLib.pintar(self, kind, r, col)
		"puf":
			DecoPulidaLib.pintar(self, kind, r, col)
		"baul":



			_add_box(Vector3(c.x, h * 0.36, c.y),
				Vector3(r.size.x, h * 0.72, r.size.y), col)
			_add_box(Vector3(c.x, h * 0.8, c.y),
				Vector3(r.size.x * 0.98, h * 0.2, r.size.y * 0.9),
				col.lightened(0.1))
			_add_box(Vector3(c.x, h * 0.94, c.y),
				Vector3(r.size.x * 0.8, h * 0.12, r.size.y * 0.7),
				col.lightened(0.16))
			for ba_x in [-1.0, 1.0]:
				_add_box(Vector3(c.x + ba_x * r.size.x * 0.32, h * 0.5, c.y),
					Vector3(0.05, h * 0.9, r.size.y * 1.02),
					_pal.get("trim", TRIM_COL))
			_add_box(Vector3(c.x, h * 0.6, c.y + r.size.y * 0.52),
				Vector3(r.size.x * 0.16, h * 0.2, 0.03), Color("c9a961"))
		"maletas":
			preload("res://ui/house/agua_equipaje_pulidos.gd").pintar(self, kind, r, col, h, prop)
		"percha":



			_add_box(Vector3(c.x, 0.03, c.y),
				Vector3(r.size.x * 0.7, 0.06, 0.08), col.darkened(0.2))
			_add_box(Vector3(c.x, 0.03, c.y),
				Vector3(0.08, 0.06, r.size.y * 0.7), col.darkened(0.2))
			_add_box(Vector3(c.x, h * 0.5, c.y), Vector3(0.06, h, 0.06), col)
			for pe_i in 4:
				var pe_a: float = TAU * float(pe_i) / 4.0 + PI * 0.25
				_add_box(Vector3(c.x + cos(pe_a) * 0.12, h - 0.08,
						c.y + sin(pe_a) * 0.12),
					Vector3(0.16 if pe_i % 2 == 0 else 0.05, 0.05,
						0.05 if pe_i % 2 == 0 else 0.16),
					col.lightened(0.12))

			_add_box(Vector3(c.x, h + 0.02, c.y),
				Vector3(0.1, 0.08, 0.1), _pal.get("trim", TRIM_COL))
		"vinoteca":
			DecoPulidaLib.pintar(self, kind, r, col)
		"tocadiscos":
			preload("res://ui/house/ocio_pulido.gd").pintar(self, kind, r, col, h)
		"despacho":
			preload("res://ui/house/muebles_pulidos.gd").pintar(self, kind, r, col, h, prop)
		"barbero":
			preload("res://ui/house/muebles_pulidos.gd").pintar(self, kind, r, col, h, prop)
		"banca":










			var b_lx: bool = r.size.x >= r.size.y
			var b_len: float =(r.size.x if b_lx else r.size.y) * 0.94
			var seat_h: float = 0.42


			var b_marco: float = 0.62
			for s in [-1.0, 1.0]:
				_add_box(Vector3(c.x + s *(b_len * 0.42 if b_lx else 0.0),
					b_marco * 0.5,
					c.y + s *(0.0 if b_lx else b_len * 0.42)),
					Vector3(0.07 if b_lx else 0.3, b_marco,
						0.3 if b_lx else 0.07), col.darkened(0.3))


			_add_box(Vector3(c.x, 0.12, c.y),
				Vector3(b_len * 0.84 if b_lx else 0.06, 0.05,
					0.06 if b_lx else b_len * 0.84), col.darkened(0.3))

			for i in 2:
				var so: float = -0.09 + 0.18 * float(i)
				_add_box(Vector3(c.x +(0.0 if b_lx else so), seat_h,
					c.y +(so if b_lx else 0.0)),
					Vector3(b_len if b_lx else 0.16, 0.05,
						0.16 if b_lx else b_len), col)










			var b_alto: float = maxf(h, seat_h + 0.2)
			for s2 in [-1.0, 1.0]:
				var mo: Vector2 = Vector2(s2 * b_len * 0.42, 0.17) if b_lx \
						else Vector2(0.17, s2 * b_len * 0.42)
				_add_box(Vector3(c.x + mo.x,(0.4 + b_alto) * 0.5, c.y + mo.y),
					Vector3(0.07 if b_lx else 0.06, b_alto - 0.4,
						0.06 if b_lx else 0.07), col.darkened(0.3))


			for i in 2:
				var bo: float = b_alto - 0.05 - 0.16 * float(1 - i)
				_add_box(Vector3(c.x +(0.0 if b_lx else 0.17), bo,
					c.y +(0.17 if b_lx else 0.0)),
					Vector3(b_len if b_lx else 0.06, 0.1,
						0.06 if b_lx else b_len), col.darkened(0.1))


			for s3 in [-1.0, 1.0]:
				var ao: Vector2 = Vector2(s3 * b_len * 0.42, 0.02) if b_lx \
						else Vector2(0.02, s3 * b_len * 0.42)
				_add_box(Vector3(c.x + ao.x, 0.645, c.y + ao.y),
					Vector3(0.06 if b_lx else 0.34, 0.05,
						0.34 if b_lx else 0.06), col)
		_:
			_add_box(Vector3(c.x, h * 0.5, c.y),
				Vector3(r.size.x, h, r.size.y), col)







func _cuarto_exterior_en(p: Vector2) -> bool:
	for room in _cuartos():
		var r: Rect2 =(room as Dictionary)["rect"]
		if r.grow(0.01).has_point(p):
			return OUTDOOR_ROOMS.has(String((room as Dictionary).get("id", "")))
	return false





func _add_camino_entrada(d: Vector2) -> void:

	if not _jardin.is_empty():
		return
	for k in 4:
		_add_box(Vector3(d.x, 0.015, d.y + 0.35 - float(k) * 0.75),
			Vector3(House.DOOR_W * 0.9, 0.03, 0.5), Color("9a958c"))















func _vol(en_x: bool, a: float, h: float, g: float) -> Vector3:
	return Vector3(a, h, g) if en_x else Vector3(g, h, a)





func _add_cerca(cer: Dictionary, at: Vector3, largo: float, en_x: bool, dim: float) -> void:
	var tipo: String = String(cer.get("tipo", "seto"))
	var col: Color = cer.get("col", Color("2f5b33"))
	var col2: Color = cer.get("col2", col)
	if tipo == "seto" and _invierno:
		col = Color("dfe4e8")
	col = col.darkened(dim)
	col2 = col2.darkened(dim)

	col = cer.get("calle", col)
	var eje: Vector3 = Vector3(1, 0, 0) if en_x else Vector3(0, 0, 1)
	var base: Vector3 = Vector3(at.x, 0.0, at.z)
	match tipo:
		"tapia":
			_add_box(base + Vector3(0, 0.3, 0), _vol(en_x, largo, 0.6, 0.22), col, 2)
			_add_box(base + Vector3(0, 0.625, 0), _vol(en_x, largo + 0.04, 0.05, 0.3), col2, 2)
		"valla":
			var fina: bool = bool(cer.get("fina", false))
			var pw: float = 0.06 if fina else 0.12
			var rh: float = 0.03 if fina else 0.06
			var alto: float = 1.0 if fina else 0.95
			for lado in [-0.5, 0.5]:
				_add_box(base + eje *(largo * lado) + Vector3(0, alto * 0.5, 0),
					_vol(en_x, pw, alto, pw), col, 2)
			var alturas: Array = [0.25, 0.85] if fina else [0.38, 0.72]
			for y in alturas:
				_add_box(base + Vector3(0, float(y), 0), _vol(en_x, largo, rh, rh * 1.4), col2, 2)
			if fina:
				var n: int = maxi(1, int(largo / 0.3))
				for i in n:
					var t: float =(float(i) + 0.5) / float(n) - 0.5
					_add_box(base + eje *(largo * t) + Vector3(0, 0.55, 0),
						_vol(en_x, 0.025, 0.72, 0.025), col, 2)
		_:
			_add_box(base + Vector3(0, 0.24, 0), _vol(en_x, largo, 0.55, 0.6), col, 2)







func _add_jardin(x0: float, x1: float, z0: float, z1: float, step: float, dim: float) -> void:
	var d: Vector2 = House.plan_door(_plano())
	var ent: Dictionary = _jardin.get("entrada", {})

	var estorbos: Array = []
	var ar: Dictionary = _jardin.get("arbol", {})
	_jardin_alt = {}
	_columpio = {}
	var ultimo: Array = []
	if not ar.is_empty():
		for p in [Vector3(x0 + 1.1, -0.05, z0 + 1.1), Vector3(d.x + 2.8, -0.05, z0 + 1.5)]:
			var at: Vector3 = p
			if at.x > x1 - 0.8:
				continue
			var dims: Dictionary = _add_arbol(ar, at, dim, estorbos.size())
			estorbos.append(Vector3(at.x, 1.4, at.z))


			var tipo: String = String(ar.get("tipo", "roble"))
			if _estacion == "otono" and ARBOLES_CADUCOS.has(tipo):
				_add_hojas(at, float(dims["ancho"]) * 0.55, HOJAS_OTONO, "hoja", dim, estorbos.size())
			elif _estacion == "primavera" and tipo == "jacaranda":
				_add_hojas(at, float(dims["ancho"]) * 0.5, PETALOS_JACARANDA, "petalo", dim, estorbos.size())
			ultimo = [at, dims]

	if not ultimo.is_empty():
		_add_columpio(ultimo[0], ultimo[1], ent, dim)

	_jardin_sitios = {}
	var caseta_at: Vector3 = Vector3(d.x - 3.0, -0.05, z0 + 1.3)
	if caseta_at.x - 0.5 > x0 + 0.3:
		_add_caseta(ent, caseta_at, dim)
		_jardin_sitios["mascota"] = {"pos": Vector2(caseta_at.x, caseta_at.z - 0.7), "alto": 0.0}
		estorbos.append(Vector3(caseta_at.x, 1.1, caseta_at.z))
	var cojin_at: Vector3 = Vector3(d.x + House.DOOR_W * 0.5 + 0.55, -0.05, d.y - 0.55)
	_add_cojin(_jardin.get("plantas", {}), cojin_at, dim)
	_jardin_sitios["mascota_gato"] = {"pos": Vector2(cojin_at.x, cojin_at.z), "alto": 0.06}
	var pl: Dictionary = _jardin.get("plantas", {})
	var k: int = 0
	if not pl.is_empty():
		var alta: bool = String(pl.get("tipo", "")) in ["pinos", "cipreses", "palmeras"]
		var x: float = x0 + step * 0.5
		while x <= x1 - step * 0.4:
			var esquina: bool = x < x0 + step or x > x1 - step
			if absf(x - d.x) > 1.9 and (not alta or esquina) and _jardin_libre(estorbos, x, z0 + 0.75):
				_add_planta(pl, Vector3(x, -0.05, z0 + 0.75), dim, k)
				k += 1
			x += step * 1.5
		if not alta:
			for lado in [-1.0, 1.0]:
				_add_planta(pl, Vector3(d.x + float(lado) *(House.DOOR_W * 0.5 + 0.9), -0.05,
					d.y - 1.1), dim, k)
				k += 1
		for zz in [z0 + step * 1.5,(z0 + z1) * 0.5, z1 - step * 1.5]:
			for xx in [x0 + 0.75, x1 - 0.75]:
				if _jardin_libre(estorbos, float(xx), float(zz)):
					_add_planta(pl, Vector3(float(xx), -0.05, float(zz)), dim, k)
					k += 1

	if _estacion == "primavera" and not pl.is_empty():
		_add_flores(x0, x1, z0, d, step, estorbos, dim)



	var cam: Dictionary = _jardin.get("camino", {})
	if not cam.is_empty():
		var n_pel: int = int(ent.get("peldanos", 0))
		_add_camino_jardin(cam, d, d.y - WALL_T * 0.5 - 0.34 * float(n_pel) - 0.05, z0 - 0.02, dim)





func _add_planta(pl: Dictionary, at: Vector3, dim: float, k: int) -> void:
	var col: Color = Color("dfe4e8") if _invierno else pl.get("col", Color("3f6a34"))
	var col2: Color = Color("d2d8dd") if _invierno else pl.get("col2", col)
	var col3: Color = pl.get("col3", Color("5a4634"))
	col = col.darkened(dim)
	col2 = col2.darkened(dim)
	col3 = col3.darkened(dim)
	match String(pl.get("tipo", "arbustos")):
		"macetas":
			_add_cilindro(at + Vector3(0, 0.16, 0), 0.19, 0.14, 0.32, col3)
			_add_esfera(at + Vector3(0, 0.46, 0), 0.24, col, 1.0)
			for lado in [-0.12, 0.12]:
				_add_esfera(at + Vector3(float(lado), 0.6, -0.1), 0.07, col2, 1.0)
		"matas":
			_add_box(at + Vector3(0, 0.14, 0), Vector3(0.55, 0.28, 0.45), col, 2)
			_add_box(at + Vector3(0.12, 0.26, -0.05), Vector3(0.28, 0.4, 0.26), col2, 2)
			_add_box(at + Vector3(-0.2, 0.06, 0.18), Vector3(0.16, 0.12, 0.14), col3, 2)
		"pinos":
			_add_cilindro(at + Vector3(0, 0.3, 0), 0.07, 0.09, 0.6, col3, 8)
			var copa: MeshInstance3D = _add_cilindro(at + Vector3(0, 1.0, 0), 0.0, 0.5, 1.1, col, 8)
			_add_cilindro(at + Vector3(0, 1.6, 0), 0.0, 0.34, 0.8, col2, 8)
			_registra_estorbo(copa, AABB(at - Vector3(0.5, 0.0, 0.5), Vector3(1.0, 2.0, 1.0)))
		"cipreses":
			_add_cilindro(at + Vector3(0, 0.15, 0), 0.06, 0.07, 0.3, col3, 8)
			var copa: MeshInstance3D = _add_cilindro(at + Vector3(0, 1.3, 0), 0.03, 0.32, 2.1,
				col if k % 2 == 0 else col2, 8)
			_registra_estorbo(copa, AABB(at - Vector3(0.35, 0.0, 0.35), Vector3(0.7, 2.4, 0.7)))
		"palmeras":
			var tronco: MeshInstance3D = _add_cilindro(at + Vector3(0, 1.0, 0), 0.08, 0.11, 2.0, col3, 8)
			_add_esfera(at + Vector3(0, 2.05, 0), 0.28, col, 1.0)
			for i in 5:
				var ang: float = float(i) * TAU / 5.0 + 0.4 * float(k)
				var hoja: MeshInstance3D = _add_box(at + Vector3(cos(ang) * 0.5, 2.0, sin(ang) * 0.5),
					Vector3(1.1, 0.05, 0.26), col if i % 2 == 0 else col2, 2)
				hoja.rotation = Vector3(0.0, - ang, deg_to_rad(-22.0))
			_registra_estorbo(tronco, AABB(at - Vector3(1.0, 0.0, 1.0), Vector3(2.0, 2.4, 2.0)))
		_:
			_add_esfera(at + Vector3(0, 0.3, 0), 0.34, col, 1.0)
			_add_esfera(at + Vector3(0.22, 0.22, -0.2), 0.2, col, 1.0)
			for lado in [-0.15, 0.1, 0.25]:
				_add_esfera(at + Vector3(float(lado), 0.5 + absf(float(lado)) * 0.3, -0.18), 0.06,
					col2, 1.0)



func _registra_estorbo(m: MeshInstance3D, aabb: AABB) -> void:
	var mat: StandardMaterial3D = m.mesh.material as StandardMaterial3D
	if mat == null:
		return
	_walls.append({"mat": mat, "root": _box_parent if _box_parent != null else viewport,
		"aabb": aabb, "base": 1.0, "a": 1.0})





func _add_camino_jardin(cam: Dictionary, d: Vector2, z_ini: float, z_fin: float, dim: float) -> void:
	var col: Color =(cam.get("col", Color("9a958c")) as Color).darkened(dim)
	var col2: Color =(cam.get("col2", col) as Color).darkened(dim)
	var w: float = House.DOOR_W * 0.95
	var largo: float = z_ini - z_fin
	if largo < 0.5:
		return
	var zc: float =(z_ini + z_fin) * 0.5
	match String(cam.get("tipo", "losas")):
		"barro":
			_add_box(Vector3(d.x, -0.028, zc), Vector3(w, 0.044, largo), col, 2)
			var n: int = maxi(1, int(largo / 0.5))
			for i in n + 1:
				_add_box(Vector3(d.x, -0.025, z_ini - float(i) *(largo / float(n))),
					Vector3(w, 0.05, 0.03), col2, 2)
			for lado in [-0.5, 0.5]:
				_add_box(Vector3(d.x + float(lado) * w, -0.025, zc), Vector3(0.03, 0.05, largo), col2, 2)
		"piedras":



			var n: int = maxi(3, int(largo / 0.3))
			for i in n:
				var z: float = z_ini - 0.17 - float(i) *(largo - 0.34) / float(n - 1)
				var corr: float = 0.11 if i % 2 == 0 else -0.11
				_add_box(Vector3(d.x - 0.22 + corr, -0.028, z), Vector3(0.36, 0.044, 0.24),
					col if i % 3 != 2 else col2, 2)
				_add_box(Vector3(d.x + 0.22 + corr, -0.028, z + 0.03), Vector3(0.3, 0.044, 0.22),
					col2 if i % 3 != 1 else col, 2)
		"tablones":
			for lado in [-0.5, 0.5]:
				_add_box(Vector3(d.x + float(lado) *(w + 0.06), -0.02, zc), Vector3(0.08, 0.06, largo),
					col2, 2)
			var n: int = int(largo / 0.3)
			for i in n:
				_add_box(Vector3(d.x, -0.01, z_ini - 0.15 - float(i) * 0.3), Vector3(w, 0.04, 0.22), col, 2)
		"grava":
			_add_box(Vector3(d.x, -0.028, zc), Vector3(w + 0.1, 0.044, largo), col, 2)
			for lado in [-0.5, 0.5]:
				_add_box(Vector3(d.x + float(lado) *(w + 0.16), -0.02, zc), Vector3(0.06, 0.06, largo),
					col2, 2)
		_:
			var n: int = int(largo / 0.72)
			for i in n:
				_add_box(Vector3(d.x, -0.028, z_ini - 0.3 - float(i) * 0.72), Vector3(w, 0.044, 0.56),
					col if i % 2 == 0 else col2, 2)



func _enciende(m: MeshInstance3D, luz: Color) -> MeshInstance3D:
	if _noche:
		var mat: StandardMaterial3D = _box_mat(m)
		mat.emission_enabled = true
		mat.emission = luz
		mat.emission_energy_multiplier = 1.8
	return m








func _add_entrada_jardin(ent: Dictionary, d: Vector2, top: float, jamb: float) -> void:
	var dim: float = 0.34 if _noche else 0.0
	var piedra: Color =(ent.get("piedra", Color("9a958c")) as Color).darkened(dim)
	var n: int = int(ent.get("peldanos", 0))
	var fondo: float = 0.34
	var z_cara: float = d.y - WALL_T * 0.5
	for k in n:
		var alto: float = 0.05 - 0.016 * float(k)
		var ancho: float = House.DOOR_W + jamb * 2.0 + 0.4 + 0.3 * float(k)
		_add_box(Vector3(d.x, -0.05 + alto * 0.5, z_cara - fondo *(float(k) + 0.5)),
			Vector3(ancho, alto, fondo), piedra, 2)
	_add_farol(ent, d, z_cara - fondo * float(n), top, jamb, dim)
	_add_porche(ent, d, top, jamb, dim)


func _add_farol(ent: Dictionary, d: Vector2, z_pie: float, top: float, jamb: float,
		dim: float) -> void:
	var tipo: String = String(ent.get("farol", ""))
	if tipo == "":
		return
	var metal: Color =(ent.get("farol_col", Color("2a2624")) as Color).darkened(dim)
	var luz: Color = ent.get("luz", Color("ffe3b0"))
	var z_cara: float = d.y - WALL_T * 0.5
	match tipo:
		"pie":
			for k in 2:
				var z: float = z_pie - 0.9 - float(k) * 1.5
				for lado in [-1.0, 1.0]:
					var x: float = d.x + float(lado) *(House.DOOR_W * 0.5 + 0.35)
					_add_box(Vector3(x, 0.25, z), Vector3(0.09, 0.6, 0.09), metal, 2)
					_enciende(_add_box(Vector3(x, 0.59, z), Vector3(0.13, 0.08, 0.13), luz, 2), luz)
			if _noche:
				_add_luz(Vector3(d.x, 0.9, z_pie - 1.6), luz, 0.9, 4.0)
		"farola":
			var b: Rect2 = preload("res://features/career/cochera.gd").limites_solar(_plano())
			var z0: float = snappedf(b.position.y - 2.5, House.CELDA) + 0.55
			for lado in [-1.0, 1.0]:
				var x: float = d.x + float(lado) * 1.15
				_add_cilindro(Vector3(x, 1.2, z0), 0.045, 0.06, 2.4, metal, 8)
				_add_box(Vector3(x - float(lado) * 0.17, 2.3, z0), Vector3(0.34, 0.04, 0.04), metal, 2)
				_enciende(_add_box(Vector3(x - float(lado) * 0.32, 2.12, z0), Vector3(0.2, 0.28, 0.2),
					luz, 2), luz)
				_add_box(Vector3(x - float(lado) * 0.32, 2.28, z0), Vector3(0.26, 0.04, 0.26), metal, 2)
			if _noche:
				_add_luz(Vector3(d.x, 2.0, z0 + 0.4), luz, 1.0, 5.0)
		_:
			for lado in [-1.0, 1.0]:
				var x: float = d.x + float(lado) *(House.DOOR_W * 0.5 + jamb + 0.26)
				_add_box(Vector3(x, top - 0.25, z_cara - 0.08), Vector3(0.05, 0.05, 0.16), metal, 2)
				_add_box(Vector3(x, top - 0.33, z_cara - 0.18), Vector3(0.2, 0.04, 0.2), metal, 2)
				_enciende(_add_box(Vector3(x, top - 0.48, z_cara - 0.18), Vector3(0.15, 0.26, 0.15),
					luz, 2), luz)
				_add_box(Vector3(x, top - 0.63, z_cara - 0.18), Vector3(0.17, 0.03, 0.17), metal, 2)
			if _noche:
				_add_luz(Vector3(d.x, 1.5, z_cara - 0.7), luz, 1.2, 4.5)


func _add_porche(ent: Dictionary, d: Vector2, top: float, jamb: float, dim: float) -> void:
	var tipo: String = String(ent.get("porche", ""))
	if tipo == "":
		return
	var col: Color =(ent.get("porche_col", TRIM_COL) as Color).darkened(dim)
	var z_cara: float = d.y - WALL_T * 0.5
	var ancho: float = House.DOOR_W + jamb * 2.0 + 0.9
	match tipo:
		"marquesina":
			_add_box(Vector3(d.x, top + 0.3, z_cara - 0.4), Vector3(ancho, 0.06, 0.8), col, 1)
			for lado in [-1.0, 1.0]:
				_add_box(Vector3(d.x + float(lado) *(ancho * 0.5 - 0.15), top + 0.2, z_cara - 0.12),
					Vector3(0.06, 0.14, 0.24), col.darkened(0.2), 2)
		"tejadillo":
			var teja: MeshInstance3D = _add_box(Vector3(d.x, top + 0.42, z_cara - 0.42),
				Vector3(ancho, 0.07, 0.9), col, 1)
			teja.rotation.x = deg_to_rad(-24.0)
			for lado in [-1.0, 1.0]:
				var x: float = d.x + float(lado) *(ancho * 0.5 - 0.12)
				_add_box(Vector3(x, top + 0.14, z_cara - 0.3), Vector3(0.07, 0.07, 0.6), col.darkened(0.35), 2)
				_add_box(Vector3(x, top - 0.1, z_cara - 0.05), Vector3(0.07, 0.5, 0.07), col.darkened(0.35), 2)
		"pergola":
			for lado in [-1.0, 1.0]:
				var x: float = d.x + float(lado) *(ancho * 0.5)
				_add_box(Vector3(x, 1.05, z_cara - 1.0), Vector3(0.12, 2.1, 0.12), col)
				_add_box(Vector3(x, top + 0.22, z_cara - 0.55), Vector3(0.1, 0.1, 1.2), col, 2)
			for i in 4:
				_add_box(Vector3(d.x, top + 0.3, z_cara - 0.1 - float(i) * 0.3),
					Vector3(ancho + 0.3, 0.06, 0.08), col, 2)
		_:
			for lado in [-1.0, 1.0]:
				_add_box(Vector3(d.x + float(lado) *(ancho * 0.5), 1.05, z_cara - 0.8),
					Vector3(0.12, 2.1, 0.12), col)
			_add_box(Vector3(d.x, top + 0.28, z_cara - 0.45), Vector3(ancho + 0.3, 0.08, 0.9), col, 1)
			_add_box(Vector3(d.x, top + 0.2, z_cara - 0.88), Vector3(ancho + 0.3, 0.14, 0.05),
				col.darkened(0.2), 2)







func _add_arbol(ar: Dictionary, at: Vector3, dim: float, k: int) -> Dictionary:
	var tipo: String = String(ar.get("tipo", "roble"))
	var col: Color = ar.get("col", Color("3f6a34"))
	var col2: Color = ar.get("col2", col)


	if _invierno:
		col = Color("dfe4e8")
		col2 = Color("d2d8dd")
	elif _estacion == "otono" and ARBOLES_CADUCOS.has(tipo):
		col = HOJAS_OTONO[0]
		col2 = HOJAS_OTONO[1]
	elif _estacion == "primavera" and tipo == "jacaranda":
		col = PETALOS_JACARANDA[0]
		col2 = PETALOS_JACARANDA[1]
	elif _estacion == "primavera" and tipo == "limonero":

		col2 = col.lightened(0.18)
	col = col.darkened(dim)
	col2 = col2.darkened(dim)
	var col3: Color =(ar.get("col3", Color("5a4634")) as Color).darkened(dim)
	var copa: MeshInstance3D = null
	var ancho: float = 2.0
	var alto: float = 3.0
	match tipo:
		"palmera":
			copa = _add_cilindro(at + Vector3(0, 1.5, 0), 0.1, 0.15, 3.0, col3, 8)
			_add_esfera(at + Vector3(0, 3.05, 0), 0.3, col, 1.0)
			for i in 6:
				var ang: float = float(i) * TAU / 6.0 + 0.3 * float(k)
				var hoja: MeshInstance3D = _add_box(at + Vector3(cos(ang) * 0.7, 3.0, sin(ang) * 0.7),
					Vector3(1.5, 0.05, 0.3), col if i % 2 == 0 else col2, 2)
				hoja.rotation = Vector3(0.0, - ang, deg_to_rad(-20.0))
			ancho = 2.8
			alto = 3.4
		"abeto":
			_add_cilindro(at + Vector3(0, 0.3, 0), 0.08, 0.11, 0.6, col3, 8)
			copa = _add_cilindro(at + Vector3(0, 1.0, 0), 0.0, 0.8, 1.3, col, 8)
			_add_cilindro(at + Vector3(0, 1.75, 0), 0.0, 0.62, 1.1, col2, 8)
			_add_cilindro(at + Vector3(0, 2.45, 0), 0.0, 0.42, 1.0, col, 8)
			ancho = 1.6
		"cipres":
			_add_cilindro(at + Vector3(0, 0.2, 0), 0.07, 0.09, 0.4, col3, 8)
			copa = _add_cilindro(at + Vector3(0, 2.0, 0), 0.05, 0.42, 3.4, col, 8)
			_add_cilindro(at + Vector3(0.07, 2.3, -0.07), 0.03, 0.3, 2.6, col2, 8)
			ancho = 0.9
			alto = 3.8
		"pino":
			copa = _add_cilindro(at + Vector3(0, 1.3, 0), 0.1, 0.14, 2.6, col3, 8)
			_add_cilindro(at + Vector3(0, 2.9, 0), 0.7, 1.3, 0.7, col, 10)
			_add_esfera(at + Vector3(0, 3.3, 0), 0.8, col2, 1.0)
			ancho = 2.6
			alto = 4.0
		"olivo":
			copa = _add_cilindro(at + Vector3(0, 0.45, 0), 0.11, 0.2, 0.9, col3, 8)
			var rama: MeshInstance3D = _add_cilindro(at + Vector3(0.18, 1.0, 0.05), 0.06, 0.1, 0.6, col3, 8)
			rama.rotation.z = deg_to_rad(-28.0)
			_add_esfera(at + Vector3(0, 1.5, 0), 0.6, col, 1.0)
			_add_esfera(at + Vector3(0.45, 1.3, 0.25), 0.45, col2, 1.0)
			_add_esfera(at + Vector3(-0.4, 1.4, -0.2), 0.42, col2, 1.0)
			alto = 2.2
		"sauce":
			copa = _add_cilindro(at + Vector3(0, 0.8, 0), 0.12, 0.17, 1.6, col3, 8)
			_add_esfera(at + Vector3(0, 2.2, 0), 0.85, col, 1.0)
			for i in 9:
				var ang: float = float(i) * TAU / 9.0
				_add_box(at + Vector3(cos(ang) * 0.78, 1.55, sin(ang) * 0.78),
					Vector3(0.12, 1.3, 0.12), col2 if i % 2 == 0 else col, 2)
		"abedul":
			copa = _add_cilindro(at + Vector3(0, 1.0, 0), 0.06, 0.09, 2.0, col3, 8)
			for y in [0.5, 1.1, 1.6]:
				_add_box(at + Vector3(0.0, float(y), 0.0), Vector3(0.19, 0.05, 0.19),
					Color("3a3634").darkened(dim), 2)
			_add_esfera(at + Vector3(0, 2.35, 0), 0.55, col, 1.0)
			_add_esfera(at + Vector3(0.3, 2.1, 0.2), 0.42, col2, 1.0)
			_add_esfera(at + Vector3(-0.28, 2.55, -0.15), 0.36, col2, 1.0)
			ancho = 1.4
		_:

			var r: float = float({"roble": 0.95, "limonero": 0.6}.get(tipo, 0.75))
			var tr: float = float({"roble": 1.3, "limonero": 0.75}.get(tipo, 1.1))
			copa = _add_cilindro(at + Vector3(0, tr * 0.5, 0), 0.07 + r * 0.08, 0.1 + r * 0.12, tr, col3, 8)
			_add_esfera(at + Vector3(0, tr + r * 0.75, 0), r, col, 1.0)
			_add_esfera(at + Vector3(r * 0.65, tr + r * 0.55, r * 0.35), r * 0.65, col2, 1.0)
			_add_esfera(at + Vector3(- r * 0.6, tr + r * 0.85, - r * 0.3), r * 0.6,
				col if tipo == "roble" else col2, 1.0)
			if tipo == "limonero" and not _invierno:
				var flor: bool = _estacion == "primavera"
				var n_fr: int = 11 if flor else 7
				for i in n_fr:
					var ang: float = float(i) * TAU / float(n_fr) + 0.5
					var fr: MeshInstance3D = _add_esfera(at + Vector3(cos(ang) * r * 0.8,
						tr + r * 0.7 + sin(ang * 2.0) * 0.2, sin(ang) * r * 0.8),
						0.07 if flor else 0.06, Color("f6f1e6").darkened(dim) if flor else col2, 0.6)
					if flor:
						fr.set_meta("jardin", "flor")
			ancho = r * 2.4
			alto = tr + r * 1.8
	if copa != null:
		_registra_estorbo(copa, AABB(at - Vector3(ancho * 0.5, 0.0, ancho * 0.5),
			Vector3(ancho, alto, ancho)))
	return {"alto": alto, "ancho": ancho}



func _suelo_libre(estorbos: Array, x: float, z: float) -> bool:
	for e in estorbos:
		var v: Vector3 = e
		if Vector2(x, z).distance_to(Vector2(v.x, v.z)) < minf(v.y, 0.6):
			return false
	return true


func _jardin_libre(estorbos: Array, x: float, z: float) -> bool:
	for e in estorbos:
		var v: Vector3 = e
		if Vector2(x, z).distance_to(Vector2(v.x, v.z)) < v.y:
			return false
	return true




func _add_caseta(ent: Dictionary, at: Vector3, dim: float) -> void:
	var madera: Color =(ent.get("puerta", Color("8a6f4a")) as Color).darkened(dim)
	var teja: Color =(ent.get("cuarteron", Color("5a4634")) as Color).darkened(dim)
	_add_box(at + Vector3(0, 0.02, 0), Vector3(0.9, 0.04, 0.95), teja.darkened(0.2), 2)
	_add_box(at + Vector3(0, 0.33, 0), Vector3(0.72, 0.62, 0.8), madera, 2)
	_add_box(at + Vector3(0, 0.3, -0.41), Vector3(0.3, 0.42, 0.03), Color("2a2521").darkened(dim), 2)
	for lado in [-1.0, 1.0]:
		var ala: MeshInstance3D = _add_box(at + Vector3(float(lado) * 0.21, 0.8, 0),
			Vector3(0.5, 0.05, 0.9), teja, 2)
		ala.rotation.z = - float(lado) * deg_to_rad(38.0)
	_add_box(at + Vector3(0, 0.96, 0), Vector3(0.08, 0.06, 0.92), teja.darkened(0.25), 2)



func _add_cojin(pl: Dictionary, at: Vector3, dim: float) -> void:
	var tela: Color =(pl.get("col2", Color("c8463c")) as Color).darkened(dim)
	var ribete: Color =(pl.get("col3", Color("5a4634")) as Color).darkened(dim)
	_add_box(at + Vector3(0, 0.03, 0), Vector3(0.48, 0.06, 0.42), ribete, 2)
	_add_box(at + Vector3(0, 0.075, 0), Vector3(0.42, 0.05, 0.36), tela, 2)




func _caja_en(padre: Node3D, at: Vector3, size: Vector3, col: Color) -> MeshInstance3D:
	var m: MeshInstance3D = MeshInstance3D.new()
	var box: BoxMesh = BoxMesh.new()
	box.size = size
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = col
	mat.roughness = 1.0
	box.material = mat
	m.mesh = box
	m.position = at
	padre.add_child(m)
	return m



const LLEGADA_PERRO_MAX: float = 4.0
const ARBOLES_CADUCOS: Array[String] = ["roble", "arce", "abedul", "sauce", "jacaranda"]
const HOJAS_OTONO: Array[Color] = [Color("c0652e"), Color("d9a23a"), Color("9c3d2a"), Color("e0b24a")]
const PETALOS_JACARANDA: Array[Color] = [Color("8d74cf"), Color("a995e0"), Color("7a62bd")]
const FLORES_PRIMAVERA: Array[Color] = [Color("e2555a"), Color("f2c14e"), Color("f1f0ea"), Color("d46a9e")]
const CANCELA_ABRE_DEG: float = 80.0
const CANCELA_CERCA: float = 1.7
const CANCELA_AGUANTA: float = 2.5







func _add_cancela(cer: Dictionary, xa: float, xb: float, z0: float, dim: float) -> void:
	var ent: Dictionary = _jardin.get("entrada", {})
	var tipo: String = String(cer.get("tipo", "seto"))
	var fina: bool = bool(cer.get("fina", false))
	var col: Color
	var alto: float
	match tipo:
		"tapia":
			col = ent.get("farol_col", Color("2a2624"))
			alto = 1.25
		"valla":
			col = cer.get("col", Color("8a6f4a"))
			alto = 1.0 if fina else 0.95
		_:
			col = ent.get("puerta", Color("6f5a44"))
			alto = 0.9
	col = col.darkened(dim)
	var poste_c: Color =(cer.get("col", col) as Color).darkened(dim)
	var padre: Node = _box_parent if _box_parent != null else viewport
	var pw: float = 0.3 if tipo == "tapia" else 0.14
	var ph: float = 0.75 if tipo == "tapia" else alto + 0.12
	for x in [xa, xb]:
		_add_box(Vector3(float(x), ph * 0.5, z0), Vector3(pw, ph, pw), poste_c, 2)
		if tipo == "tapia":
			_add_box(Vector3(float(x), ph + 0.03, z0), Vector3(pw + 0.08, 0.06, pw + 0.08),
				(cer.get("col2", col) as Color).darkened(dim), 2)
		else:
			_add_box(Vector3(float(x), ph + 0.02, z0), Vector3(pw + 0.04, 0.04, pw + 0.04),
				poste_c.darkened(0.2), 2)
	var hoja_w: float =(xb - xa) * 0.5 - pw * 0.5 - 0.03
	var pivotes: Array = []
	for lado in [1.0, -1.0]:
		var piv: Node3D = Node3D.new()
		piv.position = Vector3(xa + pw * 0.5 if lado > 0.0 else xb - pw * 0.5, 0.0, z0)
		padre.add_child(piv)
		var cx: float = lado * hoja_w * 0.5
		match tipo:
			"tapia":
				for y in [0.3, alto - 0.1]:
					_caja_en(piv, Vector3(cx, float(y), 0.0), Vector3(hoja_w, 0.04, 0.04), col)
				var n: int = maxi(2, int(hoja_w / 0.15))
				for i in n:
					var t: float =(float(i) + 0.5) / float(n)
					_caja_en(piv, Vector3(lado * hoja_w * t,(alto + 0.08) * 0.5, 0.0),
						Vector3(0.025, alto + 0.08, 0.025), col)
			"valla":
				var alturas: Array = [0.25, 0.85] if fina else [0.38, 0.72]
				for y in alturas:
					_caja_en(piv, Vector3(cx, float(y), 0.0), Vector3(hoja_w, 0.05, 0.05), col)
				var n: int = maxi(2, int(hoja_w /(0.12 if fina else 0.22)))
				for i in n:
					var t: float =(float(i) + 0.5) / float(n)
					_caja_en(piv, Vector3(lado * hoja_w * t, alto * 0.5, 0.0),
						Vector3(0.025 if fina else 0.09, alto - 0.1, 0.025 if fina else 0.03), col)
			_:
				var n: int = maxi(2, int(hoja_w / 0.15))
				for i in n:
					var t: float =(float(i) + 0.5) / float(n)
					_caja_en(piv, Vector3(lado * hoja_w * t, alto * 0.5, 0.0),
						Vector3(0.12, alto - 0.06, 0.03), col)
				for y in [0.2, alto - 0.12]:
					_caja_en(piv, Vector3(cx, float(y), 0.025), Vector3(hoja_w, 0.06, 0.03),
						col.darkened(0.2))
		pivotes.append(piv)


	_cancela = {"pivotes": pivotes, "abierta": 0.0, "aguanta": CANCELA_AGUANTA,
		"puerta": House.plan_door(_plano()), "hueco": Vector2((xa + xb) * 0.5, z0),
		"calle": Vector2((xa + xb) * 0.5, z0 - 1.6)}
	_cancela_pon(1.0)
	_add_buzon(ent, Vector3(xa - pw * 0.5 - 0.3, 0.0, z0 + 0.25), dim)




func _cancela_pon(abierta: float) -> void:
	if _cancela.is_empty():
		return
	_cancela["abierta"] = abierta
	if abierta <= 0.0:
		_cancela["aguanta"] = 0.0
	var ang: float = deg_to_rad(CANCELA_ABRE_DEG) * smoothstep(0.0, 1.0, abierta)
	var pivs: Array = _cancela["pivotes"]
	for i in pivs.size():
		var piv: Node3D = pivs[i]
		if is_instance_valid(piv):
			piv.rotation.y =(1.0 if i == 0 else -1.0) * ang


func _tick_cancela(delta: float) -> void:
	if _cancela.is_empty():
		return
	var quiere: bool = false
	if float(_cancela["aguanta"]) > 0.0:
		_cancela["aguanta"] = float(_cancela["aguanta"]) - delta
		quiere = true
	elif not _grid_on and _pos.distance_to(_cancela["puerta"]) < CANCELA_CERCA:
		quiere = true
	var fin: float = 1.0 if quiere else 0.0
	var a: float = float(_cancela["abierta"])
	if is_equal_approx(a, fin):
		return
	_cancela_pon(move_toward(a, fin, delta *(1.4 if quiere else 0.8)))







func _add_buzon(ent: Dictionary, at: Vector3, dim: float) -> void:
	var metal: Color =(ent.get("farol_col", Color("2a2624")) as Color).darkened(dim)
	var tapa: Color =(ent.get("puerta", Color("6f5a44")) as Color).darkened(dim)
	var luz: Color = ent.get("luz", Color("ffe3b0"))
	_add_box(at + Vector3(0, 0.45, 0), Vector3(0.06, 0.9, 0.06), metal, 2)
	_add_box(at + Vector3(0, 1.0, 0), Vector3(0.26, 0.2, 0.36), metal, 2)
	_add_box(at + Vector3(0, 1.115, 0), Vector3(0.28, 0.03, 0.38), tapa, 2)
	_add_box(at + Vector3(0, 1.0, -0.185), Vector3(0.2, 0.05, 0.01), tapa, 2)
	var rojo: Color = Color("c8463c").darkened(dim)
	var nodos: Dictionary = {
		"arriba": _add_box(at + Vector3(0.15, 1.16, -0.1), Vector3(0.03, 0.16, 0.05), rojo, 2),
		"abajo": _add_box(at + Vector3(0.15, 1.02, -0.02), Vector3(0.03, 0.05, 0.16), rojo, 2),
		"luz": null}
	if _noche:
		nodos["luz"] = _enciende(_add_box(at + Vector3(0, 1.06, -0.19), Vector3(0.05, 0.05, 0.015), luz, 2), luz)
	_cancela["buzon_nodos"] = nodos
	_buzon_pon(not Cartas.pendientes().is_empty())



func _buzon_pon(hay: bool) -> void:
	_cancela["buzon"] = hay
	var nodos: Dictionary = _cancela.get("buzon_nodos", {})
	for k in nodos:
		var m: Node3D = SceneFade.vivo(nodos[k]) as Node3D
		if m == null or not is_instance_valid(m):
			continue
		m.visible = hay if String(k) != "abajo" else not hay

const JARDIN_SALE_CADA: Vector2 = Vector2(18.0, 36.0)










func _jardin_ocupado(pet: Dictionary, familia: String) -> bool:
	for otra in _pets:
		var o: Dictionary = otra
		if String(o["id"]) != String(pet["id"]) and not (o.get("jardin", {}) as Dictionary).is_empty() \
				and House.pet_familia(String(o["id"])) == familia:
			return true
	return false


func _pet_jardin(pet: Dictionary, delta: float) -> bool:

	var familia: String = House.pet_familia(String(pet["id"]))
	var sitio: Dictionary = _jardin_sitios.get(familia, {})
	var j: Dictionary = pet.get("jardin", {})
	if j.is_empty():
		if (sitio.is_empty() and not _jardin_alt.has(familia)) \
				or not (pet.get("home", {}) as Dictionary).is_empty() \
				or _jardin_ocupado(pet, familia):
			return false
		pet["jardin_wait"] = float(pet.get("jardin_wait", randf_range(5.0, 12.0))) - delta
		if float(pet["jardin_wait"]) > 0.0:
			return false
		pet["jardin_wait"] = randf_range(JARDIN_SALE_CADA.x, JARDIN_SALE_CADA.y)
		var d: Vector2 = House.plan_door(_plano())
		var dentro: Vector2 = Vector2(d.x, d.y + 0.7)
		var pos0: Vector2 = pet["pos"]
		if pos0.distance_to(dentro) > 7.0 or not PetHomeLib._camino_libre(self, pos0, dentro):
			return false


		var alt: Dictionary = _jardin_alt.get(familia, {})
		var al_alt: bool = not alt.is_empty() and _paseo.is_empty() and _columpio_libre() \
				and (sitio.is_empty() or randf() < 0.5)
		var meta_s: Dictionary = alt if al_alt else sitio
		j = {"fase": "va", "dentro": dentro, "fuera": Vector2(d.x, d.y - 0.9),
			"sitio": meta_s["pos"], "alto": float(meta_s["alto"]), "t": 0.0, "cruzo": false,
			"alt": al_alt}
		pet["jardin"] = j
	var recibe: bool = bool(j.get("recibe", false))
	var normal: bool = not recibe and not bool(j.get("alt", false))
	if ((normal and sitio.is_empty()) or _jardin.is_empty()) and String(j["fase"]) != "vuelve":
		j["fase"] = "vuelve"
		j["cruzo"] = false


	if recibe and _llegada.is_empty() and String(j["fase"]) in ["va", "sale", "espera"]:
		if String(j["fase"]) == "va":
			pet.erase("jardin")
			pet["rest"] = 0.3
			return false
		j["fase"] = "vuelve"
		j["cruzo"] = false
	var cfg: Dictionary = pet["cfg"]
	var vel: float = float(cfg["speed"]) * delta
	var pos: Vector2 = pet["pos"]
	pet["target"] = pos
	pet["hold"] = 0.0
	pet["near"] = false
	match String(j["fase"]):
		"va":


			var at: Vector2 = j["dentro"]
			if pos.distance_to(at) < 0.1:
				j["fase"] = "sale"
				return true
			var paso: Vector2 =(at - pos).normalized() * minf(pos.distance_to(at), vel)
			var sig: Vector2 = House.plan_move(_plano(), pos, paso, DOG_R, Career.house_extras)
			j["t"] = float(j["t"]) + delta
			if _pet_blocked(pet, sig) or sig.distance_to(pos) < 0.0001 or float(j["t"]) > 12.0:
				pet.erase("jardin")
				pet["rest"] = 0.3
				return false
			pet["pos"] = sig
			_pet_play(pet, sig - pos)
			_place_pet(pet)
			if sig.distance_to(at) < 0.1:
				j["fase"] = "sale"
		"sale":
			var meta: Vector2 = Vector2(j["sitio"]) if bool(j["cruzo"]) else Vector2(j["fuera"])
			_pet_recto(pet, meta, vel)
			if Vector2(pet["pos"]).distance_to(meta) < 0.05:
				if bool(j["cruzo"]):
					j["fase"] = "espera" if recibe else "echado"
					j["t"] = 0.0 if recibe else randf_range(9.0, 16.0)
					pet["face"] = "south"
					pet["home_y"] = float(j["alto"]) - 0.05
					_pet_play(pet, Vector2.ZERO)
					_place_pet(pet)
				else:
					j["cruzo"] = true
					pet["home_y"] = -0.05
		"echado":
			j["t"] = float(j["t"]) - delta

			if float(j["t"]) <= 0.0 or (bool(j.get("alt", false)) and not _paseo.is_empty()):
				j["fase"] = "vuelve"
				j["cruzo"] = false
				pet["home_y"] = -0.05
		"espera":

			var ppos: Vector2 = pet["pos"]
			if _pos.distance_to(ppos) < 1.1 or _pos.y > ppos.y + 0.2:
				j["fase"] = "acompana"
			else:
				j["t"] = float(j["t"]) - delta
				if float(j["t"]) <= 0.0:
					_pet_gesto(pet, "bark")
					j["t"] = 1.6
		"acompana":


			if _llegada.is_empty() or _pos.y >= float(Vector2(j["fuera"]).y) - 0.1:
				j["fase"] = "vuelve"
				j["cruzo"] = false
			else:
				_pet_recto(pet, Vector2(_pos.x - 0.55, _pos.y - 0.25), vel)
		_:
			var meta: Vector2 = Vector2(j["dentro"]) if bool(j["cruzo"]) else Vector2(j["fuera"])
			_pet_recto(pet, meta, vel)
			if Vector2(pet["pos"]).distance_to(meta) < 0.05:
				if bool(j["cruzo"]):
					pet.erase("jardin")
					pet["home_y"] = 0.0
					pet["rest"] = 0.6
					pet["target"] = _free_near(meta)
					_pet_play(pet, Vector2.ZERO)
					_place_pet(pet)
					return true
				j["cruzo"] = true
				pet["home_y"] = 0.0
	return true



func _pet_recto(pet: Dictionary, meta: Vector2, vel: float) -> void:
	var pos: Vector2 = pet["pos"]
	var sig: Vector2 = pos.move_toward(meta, vel)
	pet["pos"] = sig
	_pet_play(pet, sig - pos)
	_place_pet(pet)



func _pet_gesto(pet: Dictionary, gesto: String) -> void:
	var node: AnimatedSprite3D = pet["node"]
	if node == null or node.sprite_frames == null:
		return
	var anim: String = gesto + "_" + String(pet["face"])
	if node.sprite_frames.has_animation(anim) and node.animation != anim:
		node.play(anim)











func _add_hojas(at: Vector3, radio: float, paleta: Array, meta: String, dim: float, semilla: int) -> void:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("hojas_%d_%.1f_%.1f" % [semilla, at.x, at.z])
	for i in 16:
		var ang: float = rng.randf() * TAU
		var r: float = radio *(0.25 + 0.75 * sqrt(rng.randf()))
		var hoja: MeshInstance3D = _add_box(Vector3(at.x + cos(ang) * r, at.y + 0.01, at.z + sin(ang) * r),
			Vector3(0.14, 0.012, 0.1),(paleta[i % paleta.size()] as Color).darkened(dim), 2)
		hoja.rotation.y = rng.randf() * TAU
		hoja.set_meta("jardin", meta)





func _add_flores(x0: float, x1: float, z0: float, d: Vector2, step: float, estorbos: Array,
		dim: float) -> void:
	var tallo: Color = Color("3f6a34").darkened(dim)
	var x: float = x0 + step * 1.25
	var k: int = 0
	while x <= x1 - step * 0.4:


		if absf(x - d.x) > 1.9 and _suelo_libre(estorbos, x, z0 + 0.4):
			_add_box(Vector3(x, -0.03, z0 + 0.4), Vector3(0.86, 0.05, 0.36), Color("4a3826").darkened(dim), 2)
			for i in 5:
				var at: Vector3 = Vector3(x + float(i - 2) * 0.17, -0.05, z0 + 0.35 + float(i % 2) * 0.1)
				_add_box(at + Vector3(0, 0.1, 0), Vector3(0.025, 0.2, 0.025), tallo, 2)
				var flor: MeshInstance3D = _add_esfera(at + Vector3(0, 0.22, 0), 0.08,
					(FLORES_PRIMAVERA[(k + i) % FLORES_PRIMAVERA.size()] as Color).darkened(dim), 1.0)
				flor.set_meta("jardin", "flor")
			k += 1
		x += step * 1.5





func _add_columpio(at: Vector3, dims: Dictionary, ent: Dictionary, dim: float) -> void:
	var top: float = clampf(float(dims["alto"]) * 0.72, 1.7, 2.7)
	var largo: float = top - 0.5
	var frente: float = at.z - 0.6
	var madera: Color =(ent.get("puerta", Color("8a6f4a")) as Color).darkened(dim)
	var cuerda: Color = Color("c9b48a").darkened(dim)
	var rama: Color =((_jardin.get("arbol", {}) as Dictionary).get("col3", Color("5a4634")) as Color).darkened(dim)
	_add_box(Vector3(at.x, at.y + top + 0.12, at.z - 0.3), Vector3(0.13, 0.13, 0.72), rama, 2)
	_add_box(Vector3(at.x, at.y + top + 0.07, frente), Vector3(0.64, 0.08, 0.1), rama, 2)
	var piv: Node3D = Node3D.new()
	piv.position = Vector3(at.x, at.y + top + 0.04, frente)
	var padre: Node = _box_parent if _box_parent != null else viewport
	padre.add_child(piv)
	for lado in [-0.24, 0.24]:
		_caja_en(piv, Vector3(float(lado), - largo * 0.5, 0.0), Vector3(0.03, largo, 0.03), cuerda)
	var asiento: MeshInstance3D = _caja_en(piv, Vector3(0.0, - largo, 0.0), Vector3(0.6, 0.05, 0.24), madera)
	asiento.set_meta("jardin", "columpio")
	var asiento_y: float = at.y + top + 0.04 - largo + 0.025
	_columpio = {"piv": piv, "largo": largo, "suelo": Vector2(at.x, frente), "asiento_y": asiento_y,
		"amp": 0.0, "t": 0.0, "quien": ""}
	_jardin_alt["mascota_gato"] = {"pos": Vector2(at.x, frente), "alto": asiento_y + 0.05}


func _columpio_libre() -> bool:
	return not _columpio.is_empty() and String(_columpio.get("quien", "")).is_empty()




func _tick_columpio(delta: float) -> void:
	if _columpio.is_empty():
		return
	var piv: Node3D = _columpio["piv"]
	if piv == null or not is_instance_valid(piv):
		_columpio = {}
		return
	var quien: String = "tu" if String(_paseo.get("fase", "")) == "sentado" else ""
	if quien.is_empty():
		for pet in _pets:
			var j: Dictionary =(pet as Dictionary).get("jardin", {})
			if bool(j.get("alt", false)) and String(j.get("fase", "")) == "echado":
				quien = "gato"
	_columpio["quien"] = quien
	var meta: float = 0.42 if quien == "tu" else (0.0 if quien == "gato" else 0.06)
	_columpio["amp"] = move_toward(float(_columpio["amp"]), meta, delta * 0.45)
	_columpio["t"] = float(_columpio["t"]) + delta
	piv.rotation.x = sin(float(_columpio["t"]) * 2.1) * float(_columpio["amp"])
	if quien == "tu" and player != null:
		var tabla: Vector3 = piv.position + piv.transform.basis.y *(- float(_columpio["largo"]))
		player.position = tabla + Vector3(0.0, 0.025 + feet_offset(player.pixel_size) - PLAYER_SINK, 0.0)




func _columpio_ir() -> void:
	if _columpio.is_empty() or not _paseo.is_empty() or not _llegada.is_empty():
		return
	var d: Vector2 = House.plan_door(_plano())
	var suelo: Vector2 = _columpio["suelo"]
	var dentro: Vector2 = Vector2(d.x, d.y + 0.7)
	var fuera: Vector2 = Vector2(d.x, d.y - 0.9)
	var pie: Vector2 = suelo + Vector2(0.0, -0.5)
	_paseo = {"fase": "va", "ruta": [dentro, fuera, pie, suelo], "i": 0, "t": 0.0,
		"vuelta": [pie, fuera, dentro], "dentro": dentro, "fuera": fuera}
	UiAudio.click()
	_use_btn.visible = false



func _paso_recto(meta: Vector2, delta: float) -> Vector2:
	var antes: Vector2 = _pos
	_pos = _pos.move_toward(meta, House.WALK_SPEED * delta)
	_place_player()
	return _pos - antes


func _tick_paseo(delta: float, stick: Vector3) -> Vector3:
	var quieres: bool = Vector2(stick.x, stick.z).length_squared() > 0.0001
	var fase: String = String(_paseo["fase"])
	if fase == "sentado":
		_paseo["t"] = float(_paseo["t"]) + delta
		if quieres or float(_paseo["t"]) > 9.0:
			_paseo["fase"] = "vuelve"
			_paseo["i"] = 0
			_paseo["ruta"] = _paseo["vuelta"]
			_place_player()
		return Vector3.ZERO
	var ruta: Array = _paseo["ruta"]
	var i: int = int(_paseo["i"])
	if fase == "va" and quieres:

		if i == 0:
			_paseo = {}
			return stick
		_paseo["fase"] = "vuelve"
		_paseo["i"] = 0
		_paseo["ruta"] = [_paseo["fuera"], _paseo["dentro"]] if i >= 2 else [_paseo["dentro"]]
		return Vector3.ZERO
	var meta: Vector2 = ruta[i]
	var paso: Vector2 = _paso_recto(meta, delta)
	if _pos.distance_to(meta) < 0.05:
		i += 1
		_paseo["i"] = i
		if i >= ruta.size():
			if fase == "va":
				_paseo["fase"] = "sentado"
				_paseo["t"] = 0.0
			else:
				_pos = _free_near(Vector2(_paseo["dentro"]))
				_place_player()
				_paseo = {}
				_refresh_use(House.plan_nearest_prop(_plano(), _pos))
			return Vector3.ZERO
	return Vector3(paso.x, 0.0, paso.y)







func _llegada_empieza() -> void:
	if _cancela.is_empty() or not _llegada.is_empty() or _grid_on:
		return
	var d: Vector2 = House.plan_door(_plano())
	var spawn: Vector2 = _pos
	var calle: Vector2 = _cancela["calle"]
	var hueco: Vector2 = _cancela["hueco"]
	var fuera: Vector2 = Vector2(d.x, d.y - 0.9)
	var dentro: Vector2 = Vector2(d.x, d.y + 0.7)
	_llegada = {"ruta": [Vector2(d.x, calle.y), Vector2(d.x, hueco.y + 0.1), fuera, spawn], "i": 0,
		"spawn": spawn, "espera": 0.7, "esperado": Vector2(d.x, calle.y)}
	_pos = Vector2(d.x, calle.y)
	_place_player()
	_cancela["aguanta"] = 30.0
	_cancela_pon(1.0)
	for pet in _pets:
		var p: Dictionary = pet


		if House.pet_familia(String(p["id"])) != "mascota" or p.has("jardin") \
				or not (p.get("home", {}) as Dictionary).is_empty() or _llegada.has("perro"):
			continue
		var pos0: Vector2 = p["pos"]
		if pos0.distance_to(dentro) > 7.0 or not PetHomeLib._camino_libre(self, pos0, dentro):
			continue
		p["jardin"] = {"fase": "va", "dentro": dentro, "fuera": fuera,
			"sitio": Vector2(hueco.x + 0.65, hueco.y + 0.55), "alto": 0.0, "t": 0.0, "cruzo": false,
			"recibe": true}
		p["jardin_wait"] = randf_range(JARDIN_SALE_CADA.x, JARDIN_SALE_CADA.y)



		_llegada["espera"] = LLEGADA_PERRO_MAX
		_llegada["perro"] = p


func _tick_llegada(delta: float, stick: Vector3) -> Vector3:


	if _pos != Vector2(_llegada["esperado"]):
		_llegada_fin(false)
		return stick
	if Vector2(stick.x, stick.z).length_squared() > 0.0001:
		_llegada_fin(true)
		return stick
	if float(_llegada["espera"]) > 0.0:
		var espera: float = float(_llegada["espera"]) - delta
		if _llegada.has("perro"):
			var j: Dictionary =(_llegada["perro"] as Dictionary).get("jardin", {})
			if j.is_empty() or not (String(j.get("fase", "")) in ["va", "sale"]):
				espera = minf(espera, 0.25)
		_llegada["espera"] = espera
		return Vector3.ZERO
	var ruta: Array = _llegada["ruta"]
	var i: int = int(_llegada["i"])
	var meta: Vector2 = ruta[i]
	var paso: Vector2 = _paso_recto(meta, delta)
	_llegada["esperado"] = _pos
	if _pos.distance_to(meta) < 0.05:
		i += 1
		_llegada["i"] = i
		if i >= ruta.size():
			_llegada_fin(true)
			return Vector3.ZERO
	return Vector3(paso.x, 0.0, paso.y)


func _llegada_fin(al_spawn: bool) -> void:
	if al_spawn:
		_pos = _llegada["spawn"]
		_place_player()
	_llegada = {}
	if not _cancela.is_empty():
		_cancela["aguanta"] = CANCELA_AGUANTA
	_refresh_use(House.plan_nearest_prop(_plano(), _pos))




func _tick_guest(delta: float) -> void:
	if _guest_ruta.is_empty():
		return
	if _guest == null or not is_instance_valid(_guest):
		_guest_ruta = []
		return
	var pos: Vector2 = Vector2(_guest.position.x, _guest.position.z)
	var meta: Vector2 = _guest_ruta[0]
	var vel: float = House.WALK_SPEED * 0.85 * delta
	var sig: Vector2
	if _guest_ruta.size() == 1:
		sig = House.plan_move(_plano(), pos,(meta - pos).limit_length(vel), House.BODY_R,
			Career.house_extras)
		if sig.distance_to(pos) < vel * 0.2 and sig.distance_to(meta) >= 0.06:
			_guest_atasco += delta
			if _guest_atasco > 0.8:
				sig = _free_near(meta)
				meta = sig
		else:
			_guest_atasco = 0.0
	else:
		sig = pos.move_toward(meta, vel)
	if not _cancela.is_empty() and sig.distance_to(Vector2(_cancela["hueco"])) < CANCELA_CERCA:
		_cancela["aguanta"] = maxf(float(_cancela["aguanta"]), 0.6)
	var paso: Vector2 = sig - pos
	_guest.position = Vector3(sig.x, _guest.position.y, sig.y)
	if sig.distance_to(meta) < 0.06:
		_guest_ruta.pop_front()
	walk_play(_guest, Vector3(paso.x, 0.0, paso.y) if not _guest_ruta.is_empty() else Vector3.ZERO)




func _guest_walk_gala(look: Dictionary) -> void:
	if _guest == null or _guest.sprite_frames == null:
		return
	var cfg: Dictionary = look.duplicate()
	for k in KitRecolor.TEAM_KEYS:
		cfg.erase(k)
	for d in ["south", "east"]:
		var anim: String = "walk_" + d
		var added: int = 0
		for i in range(1, 13):
			var path: String = "res://assets/sprites/anim/gala_walk_%s_%02d.png" % [d, i]
			if not ResourceLoader.exists(path):
				continue
			if added == 0:
				_guest.sprite_frames.add_animation(anim)
				_guest.sprite_frames.set_animation_loop(anim, true)
				_guest.sprite_frames.set_animation_speed(anim, WALK_FPS * 12.0 / float(WALK_FRAMES))
			_guest.sprite_frames.add_frame(anim, KitRecolor.apply(load(path), cfg))
			added += 1




func _leer_cartas() -> void:
	var cartas: Array = Cartas.pendientes()
	if cartas.is_empty():
		return
	await get_tree().process_frame
	if not is_inside_tree():
		return
	var col: VBoxContainer = CareerUi.modal(self)
	if col == null:
		return
	var t: Label = CareerUi.plain(CareerTheme.T_TITLE_MODAL, CareerTheme.TEXT)
	t.text = I18n.t("BUZÓN")
	t.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	col.add_child(t)
	for c in cartas:
		var carta: Dictionary = c
		var de: Label = CareerUi.plain(CareerTheme.T_BODY, carta["col"])
		var nombre: String = String(carta.get("nombre", ""))
		de.text = nombre if not nombre.is_empty() else I18n.t(String(carta["de"]))
		de.clip_text = true
		col.add_child(de)
		CareerUi.dim(col, I18n.tf(String(carta["texto"]), carta["args"]))
	var listo: Button = CareerUi.primary_cta(I18n.t("LISTO"))
	listo.pressed.connect(func() -> void:
		CareerUi.close_modal(listo))
	col.add_child(listo)
	Career.mark_cartas_leidas(Cartas.claves(cartas))
	_buzon_pon(false)
	_refresh_use(House.plan_nearest_prop(_plano(), _pos))


func _add_door() -> void:
	var d: Vector2 = House.plan_door(_plano())













	if _cuarto_exterior_en(d + Vector2(0.0, House.CELDA)):
		return






	var flanco: Vector2 = Vector2(House.DOOR_W * 0.5 + House.CELDA * 0.5, 0.0)
	if House.in_opening(_plano(), d - flanco) and House.in_opening(_plano(), d + flanco):
		_add_camino_entrada(d)
		return
	var jamb: float = 0.14

	var top: float = House.PUERTA_ALTO








	var ent: Dictionary = _jardin.get("entrada", {})
	var marco_c: Color = Color("6f5a44")
	if not ent.is_empty():
		marco_c = _perimetro.get("carpinteria", marco_c)
	var umbral_c: Color = ent.get("piedra", _hoja_col().darkened(0.18))
	var hoja_c: Color = ent.get("puerta", _hoja_col())
	var cuart_c: Color = ent.get("cuarteron", Color("6a523c"))
	var manija_c: Color = ent.get("manija", Color("c9a961"))
	var frame_mats: Array[StandardMaterial3D] = []
	for s in [-1.0, 1.0]:
		frame_mats.append(_box_mat(_add_box(
			Vector3(d.x + s *(House.DOOR_W * 0.5 + jamb * 0.5), top * 0.5, d.y),
			Vector3(jamb, top, WALL_T * 1.4), marco_c, 2)))
	frame_mats.append(_box_mat(_add_box(Vector3(d.x, top + 0.09, d.y),
		Vector3(House.DOOR_W + jamb * 2.0, 0.18, WALL_T * 1.4),
		marco_c, 2)))


	_add_box(Vector3(d.x, 0.012, d.y + 0.06),
		Vector3(House.DOOR_W + jamb, 0.024, 0.22), umbral_c)
	_add_box(Vector3(d.x, 0.014, d.y + 0.5),
		Vector3(House.DOOR_W * 0.8, 0.028, 0.5), _hoja_col().lightened(0.14))














	var hinge: Node3D = Node3D.new()
	hinge.position = Vector3(d.x - House.DOOR_W * 0.5, 0.0, d.y)
	hinge.rotation.y = deg_to_rad(- DOOR_OPEN_DEG)



	(_planta if _planta != null else viewport).add_child(hinge)
	var leaf_w: float = House.DOOR_W * 0.94
	var leaf_mats: Array[StandardMaterial3D] = []
	for piece in [

		[Vector3(leaf_w * 0.5, top * 0.5, 0.0),
			Vector3(leaf_w, top - 0.05, 0.06), hoja_c],
		[Vector3(leaf_w * 0.5, top * 0.5 + 0.35, -0.04),
			Vector3(leaf_w * 0.62, 0.7, 0.02), cuart_c],
		[Vector3(leaf_w * 0.5, top * 0.5 - 0.45, -0.04),
			Vector3(leaf_w * 0.62, 0.55, 0.02), cuart_c],
		[Vector3(leaf_w * 0.86, top * 0.5 - 0.05, -0.07),
			Vector3(0.07, 0.07, 0.09), manija_c],
	]:
		var m: MeshInstance3D = MeshInstance3D.new()
		var box: BoxMesh = BoxMesh.new()
		box.size = piece[1]
		var mat: StandardMaterial3D = StandardMaterial3D.new()
		mat.albedo_color = piece[2]
		mat.roughness = 1.0
		box.material = mat
		m.mesh = box
		m.position = piece[0]
		hinge.add_child(m)
		leaf_mats.append(mat)




	var sweep: AABB = AABB(
		Vector3(d.x - House.DOOR_W * 0.5 - jamb, 0.0, d.y - 0.1),
		Vector3(House.DOOR_W + jamb * 2.0, top + 0.2, House.DOOR_W))




	var padre_puerta: Node = _planta if _planta != null else viewport
	for mat in leaf_mats + frame_mats:
		_walls.append({"mat": mat, "root": padre_puerta, "aabb": sweep,
			"base": 1.0, "a": 1.0})
	if not ent.is_empty():
		_add_entrada_jardin(ent, d, top, jamb)








func _add_back_door() -> void:

	if museo:
		return
	if not House.can_train(_level, Career.house_extras):
		return
	var d: Vector2 = House.back_door_pos(_level)
	if d == Vector2.INF:
		return
	var jamb: float = 0.14

	var top: float = House.PUERTA_ALTO
	var trim: Color = _pal.get("trim", TRIM_COL)



	for s in [-1.0, 1.0]:
		_add_box(Vector3(d.x + s *(House.DOOR_W * 0.5 + jamb * 0.5),
			top * 0.5, d.y - 0.02), Vector3(jamb, top, WALL_T * 1.5), trim)
	_add_box(Vector3(d.x, top + 0.09, d.y - 0.02),
		Vector3(House.DOOR_W + jamb * 2.0, 0.18, WALL_T * 1.5), trim)

	_add_box(Vector3(d.x, top * 0.5 - 0.02, d.y - WALL_T * 0.35),
		Vector3(House.DOOR_W * 0.96, top - 0.04, 0.07), Color("5d7a4a").darkened(0.2))
	_add_box(Vector3(d.x, top * 0.62, d.y - WALL_T * 0.35 - 0.04),
		Vector3(House.DOOR_W * 0.6, 0.55, 0.02), Color("4a6339"))
	_add_box(Vector3(d.x, top * 0.28, d.y - WALL_T * 0.35 - 0.04),
		Vector3(House.DOOR_W * 0.6, 0.55, 0.02), Color("4a6339"))
	_add_box(Vector3(d.x - House.DOOR_W * 0.36, top * 0.45,
		d.y - WALL_T * 0.35 - 0.05), Vector3(0.07, 0.07, 0.09), Color("c9a961"))

	_add_box(Vector3(d.x, 0.014, d.y - 0.5),
		Vector3(House.DOOR_W * 0.8, 0.028, 0.5), _hoja_col().lightened(0.14))



	var label: String = PixelText.normalize(I18n.t("CAMPO DE ENTRENAMIENTO"))
	var px: int = 4
	var w: int = PixelText.text_width(label, px) + px * 4
	var h: int = PixelText.GLYPH_H * px + px * 4
	var img: Image = Image.create(w, h, false, Image.FORMAT_RGBA8)
	img.fill(Color(0, 0, 0, 0))
	PixelText.draw_text(img, px * 2, px * 2, label, Color("f2ead8"), px)
	var tex: ImageTexture = ImageTexture.create_from_image(img)
	var board_w: float = 1.9
	var board_h: float = board_w * float(h) / float(w)
	_add_box(Vector3(d.x, top + 0.28 + board_h * 0.5, d.y - 0.03),
		Vector3(board_w + 0.1, board_h + 0.08, 0.05), trim.darkened(0.25))
	var quad: MeshInstance3D = MeshInstance3D.new()
	var qm: QuadMesh = QuadMesh.new()
	qm.size = Vector2(board_w, board_h)
	quad.mesh = qm
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = tex
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	quad.material_override = mat

	quad.position = Vector3(d.x, top + 0.28 + board_h * 0.5, d.y - 0.065)
	quad.rotate_y(deg_to_rad(180.0))
	(_planta if _planta != null else viewport).add_child(quad)










func _box_mat(m: MeshInstance3D) -> StandardMaterial3D:
	return (m.mesh as BoxMesh).material



















func _add_malla(mesh: Mesh, at: Vector3, col: Color,
		rough: float = 1.0) -> MeshInstance3D:
	var m: MeshInstance3D = MeshInstance3D.new()
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = col
	mat.roughness = rough
	mesh.material = mat
	m.mesh = mesh
	m.position = at
	var padre: Node = _box_parent if _box_parent != null else viewport
	padre.add_child(m)
	return m







func _add_wheel(at: Vector3, radius: float, width: float, col: Color,
		axle_z: bool = true) -> MeshInstance3D:
	var m: MeshInstance3D = _add_cilindro(at, radius, radius, width, col)
	if axle_z:
		m.rotate_x(deg_to_rad(90.0))
	else:
		m.rotate_z(deg_to_rad(90.0))
	return m







func _add_cilindro(at: Vector3, r_top: float, r_bot: float, alto: float,
		col: Color, segs: int = 12, rough: float = 1.0) -> MeshInstance3D:
	var cyl: CylinderMesh = CylinderMesh.new()
	cyl.top_radius = r_top
	cyl.bottom_radius = r_bot
	cyl.height = alto
	cyl.radial_segments = segs
	cyl.rings = 0
	return _add_malla(cyl, at, col, rough)







func _add_esfera(at: Vector3, radio: float, col: Color,
		rough: float = 0.35) -> MeshInstance3D:
	var sm: SphereMesh = SphereMesh.new()
	sm.radius = radio
	sm.height = radio * 2.0
	sm.radial_segments = 12
	sm.rings = 6
	return _add_malla(sm, at, col, rough)






















func _add_diana(padre: Node3D, radio: float) -> void:
	var n: int = Dardos.SECTORES.size()
	var paso: float = TAU / float(n)


	var caras: Dictionary = {}

	_diana_anillo(caras, DardosRoom3D.D_NEGRO, 0.0, TAU, 0.0, 1.06, 0.0, 24)
	for i in n:
		var a0: float = float(i) * paso - paso * 0.5



		var par: bool = i % 2 == 0
		var liso: Color = DardosRoom3D.D_NEGRO if par else DardosRoom3D.D_CREMA
		var aro: Color = DardosRoom3D.D_ROJO if par else DardosRoom3D.D_VERDE
		_diana_anillo(caras, liso, a0, paso, Dardos.BULL_FUERA,
			Dardos.TRIPLE_DE, -0.004, 3)
		_diana_anillo(caras, aro, a0, paso, Dardos.TRIPLE_DE,
			Dardos.TRIPLE_A, -0.004, 3)
		_diana_anillo(caras, liso, a0, paso, Dardos.TRIPLE_A,
			Dardos.DOBLE_DE, -0.004, 3)
		_diana_anillo(caras, aro, a0, paso, Dardos.DOBLE_DE, 1.0, -0.004, 3)

	_diana_anillo(caras, DardosRoom3D.D_VERDE, 0.0, TAU, 0.0,
		Dardos.BULL_FUERA, -0.006, 20)
	_diana_anillo(caras, DardosRoom3D.D_ROJO, 0.0, TAU, 0.0,
		Dardos.BULL_DENTRO, -0.008, 16)




	var g: float = maxf(0.0018, radio * 0.009) / radio
	for i2 in n:
		var a: float =(float(i2) - 0.5) * paso
		_diana_radio(caras, DardosRoom3D.D_ALAMBRE, a, Dardos.BULL_FUERA, 1.0,
			g, -0.009)
	for rr in [Dardos.BULL_FUERA, Dardos.TRIPLE_DE, Dardos.TRIPLE_A,
			Dardos.DOBLE_DE, 1.0]:
		_diana_anillo(caras, DardosRoom3D.D_ALAMBRE, 0.0, TAU,
			maxf(float(rr) - g, 0.0), float(rr) + g, -0.009, 40)


	_diana_anillo(caras, DardosRoom3D.D_NEGRO.lightened(0.06), 0.0, TAU, 1.005,
		1.235, -0.002, 40)
	for col in caras:
		var pts: PackedVector3Array = caras[col]
		if pts.is_empty():
			continue
		var nrm: PackedVector3Array = PackedVector3Array()
		nrm.resize(pts.size())
		nrm.fill(Vector3(0.0, 0.0, -1.0))
		var arr: Array = []
		arr.resize(Mesh.ARRAY_MAX)
		arr[Mesh.ARRAY_VERTEX] = pts
		arr[Mesh.ARRAY_NORMAL] = nrm
		var malla: ArrayMesh = ArrayMesh.new()
		malla.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arr)
		var m: MeshInstance3D = MeshInstance3D.new()
		m.mesh = malla





		m.scale = Vector3(radio, radio, 1.0)
		var mat: StandardMaterial3D = StandardMaterial3D.new()
		mat.albedo_color = col
		mat.roughness = 1.0



		mat.cull_mode = BaseMaterial3D.CULL_DISABLED
		m.material_override = mat
		padre.add_child(m)




func _diana_anillo(caras: Dictionary, col: Color, a0: float, arco: float,
		r0: float, r1: float, z: float, pasos: int) -> void:
	if not caras.has(col):
		caras[col] = PackedVector3Array()
	var pts: PackedVector3Array = caras[col]
	for i in pasos:
		var aa: float = a0 + arco * float(i) / float(pasos)
		var ab: float = a0 + arco * float(i + 1) / float(pasos)



		var ua: Vector2 = Vector2(DardosRoom3D.ESPEJO_X * sin(aa), cos(aa))
		var ub: Vector2 = Vector2(DardosRoom3D.ESPEJO_X * sin(ab), cos(ab))
		var p0: Vector3 = Vector3(ua.x * r0, ua.y * r0, z)
		var p1: Vector3 = Vector3(ua.x * r1, ua.y * r1, z)
		var p2: Vector3 = Vector3(ub.x * r1, ub.y * r1, z)
		var p3: Vector3 = Vector3(ub.x * r0, ub.y * r0, z)
		pts.append_array([p0, p1, p2, p0, p2, p3])
	caras[col] = pts



func _diana_radio(caras: Dictionary, col: Color, a: float, r0: float, r1: float,
		gordo: float, z: float) -> void:
	var u: Vector2 = Vector2(DardosRoom3D.ESPEJO_X * sin(a), cos(a))
	var t: Vector2 = Vector2(u.y, - u.x) * gordo
	if not caras.has(col):
		caras[col] = PackedVector3Array()
	var pts: PackedVector3Array = caras[col]
	var p0: Vector3 = Vector3(u.x * r0 - t.x, u.y * r0 - t.y, z)
	var p1: Vector3 = Vector3(u.x * r1 - t.x, u.y * r1 - t.y, z)
	var p2: Vector3 = Vector3(u.x * r1 + t.x, u.y * r1 + t.y, z)
	var p3: Vector3 = Vector3(u.x * r0 + t.x, u.y * r0 + t.y, z)
	pts.append_array([p0, p1, p2, p0, p2, p3])
	caras[col] = pts







func _add_strip(at: Vector3, size: Vector3) -> void:
	var m: MeshInstance3D = _add_box(at, size, Color("ffe9c2"), 1)
	var mat: StandardMaterial3D =(m.mesh as BoxMesh).material
	mat.emission_enabled = true
	mat.emission = Color("ffdfae")
	mat.emission_energy_multiplier = 1.1
	m.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF








const BALL_M: float = 0.24


const BALLS_PER_TIER: int = 6



const MUSEO_TIERS: int = 4
const MUSEO_PER_TIER: int = 8




const BRONCE_SOMBRA: Color = Color("2b1a0e")
const BRONCE_MEDIO: Color = Color("8a5a28")
const BRONCE_LUZ: Color = Color("e2b869")













const BRONCE_MEM_MAX: int = 4
static var _bronce_mem: Dictionary = {}



























func _bronce_tex(cfg: Dictionary) -> Texture2D:
	var llave: String = var_to_str(cfg)
	if _bronce_mem.has(llave):
		return _bronce_mem[llave] as Texture2D
	var ruta: String = "res://assets/sprites/anim/idle_south_00.png"
	if not ResourceLoader.exists(ruta):
		return null







	var recoloreada: Texture2D = KitRecolor.apply(load(ruta), cfg)
	var cruda: Image = recoloreada.get_image() if recoloreada != null else null
	if cruda == null:
		return null
	var img: Image = cruda.duplicate()
	if img.is_compressed():
		img.decompress()
	if img.get_format() != Image.FORMAT_RGBA8:
		img.convert(Image.FORMAT_RGBA8)
	var datos: PackedByteArray = img.get_data()
	var i: int = 0
	while i < datos.size():




		if datos[i + 3] > 0:
			var lum: float =(0.299 * float(datos[i]) + 0.587 * float(datos[i + 1]) \
					+ 0.114 * float(datos[i + 2])) / 255.0
			var tono: Color = BRONCE_SOMBRA.lerp(BRONCE_MEDIO, lum * 2.0) \
					if lum < 0.5 else BRONCE_MEDIO.lerp(BRONCE_LUZ,(lum - 0.5) * 2.0)
			datos[i] = int(clampf(tono.r, 0.0, 1.0) * 255.0)
			datos[i + 1] = int(clampf(tono.g, 0.0, 1.0) * 255.0)
			datos[i + 2] = int(clampf(tono.b, 0.0, 1.0) * 255.0)
		i += 4
	var out: Texture2D = ImageTexture.create_from_image(
		Image.create_from_data(img.get_width(), img.get_height(), false,
			Image.FORMAT_RGBA8, datos))
	if _bronce_mem.size() >= BRONCE_MEM_MAX:
		_bronce_mem.clear()
	_bronce_mem[llave] = out
	return out



















func _add_keepsake_balls(c: Vector2, r: Rect2, tiers: Array,
		plank: float, por_balda: int = BALLS_PER_TIER,
		desde: int = 0, z_off: float = 0.0) -> void:
	var balls: Array = Keepsakes.of_kind(Career.keepsakes, Keepsakes.BALL)
	if balls.is_empty():
		return
	var cap: int = int(tiers.size()) * por_balda







	var total: int = maxi(_ball_capacity(), cap)
	if balls.size() > total:
		balls = balls.slice(balls.size() - total)
	balls = balls.slice(mini(desde, balls.size()),
		mini(desde + cap, balls.size()))
	if balls.is_empty():
		return


	var usable: float = r.size.x * 0.86
	var step: float = usable / float(por_balda)
	var x0: float = c.x - usable * 0.5 + step * 0.5
	var padre: Node = _box_parent if _box_parent != null else viewport
	for i in balls.size():
		var k: Dictionary = balls[i]









		var frames: SpriteFrames = BallDeco.frames_for(Keepsakes.fixture_of(k), true)
		if frames == null or not frames.has_animation("idle") or frames.get_frame_count("idle") == 0:
			continue
		var spr: Sprite3D = Sprite3D.new()
		spr.texture = frames.get_frame_texture("idle", 0)
		spr.pixel_size = BALL_M / float(maxi(1, spr.texture.get_height()))


		spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
		spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
		var tier: int = i / por_balda
		var slot: int = i % por_balda









		var bx: float = x0 + step * float(slot)
		spr.position = Vector3(bx,
			float(tiers[tier]) + plank * 0.5 + BALL_M * 0.5, c.y - z_off)
		padre.add_child(spr)
		_add_ball_crest(k, bx, float(tiers[tier]) + plank * 0.5, c.y - z_off, padre)


func _add_box(at: Vector3, size: Vector3, col: Color,
		block: int = 0) -> MeshInstance3D:
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







	if block == 1 or (block == 0 and size.y >= BLOCK_MIN_H):
		_walls.append({
			"mat": mat,

			"root": padre,
			"aabb": AABB(at - size * 0.5, size),



			"base": col.a,
			"a": col.a,
		})
	return m








func _fade_walls(delta: float) -> void:
	var from: Vector3 = cam.global_position







	var v: Vector2 = _focus()
	var aims: Array[Vector3] = [
		Vector3(v.x, 0.15, v.y),
		Vector3(v.x, 1.0, v.y),
		Vector3(v.x, 1.7, v.y),
	]











	if _grid_on:
		aims = [Vector3(v.x, CURSOR_Y, v.y)]
	var ghost: float = EDIT_GHOST if _grid_on else WALL_GHOST
	var k: float = 1.0 - exp(- WALL_FADE * delta)
	for w in _walls:
		var box: AABB = w["aabb"]
		var blocks: bool = false
		for aim in aims:
			if box.intersects_segment(from, aim):
				blocks = true
				break
		var base: float = float(w["base"])
		var target: float = base * ghost if blocks else base
		var antes: float = float(w["a"])
		var a: float = lerpf(antes, target, k)







		if absf(a - target) < 0.001:
			a = target
		w["a"] = a
		if a == antes and w.has("puesto"):
			continue
		w["puesto"] = true
		var mat: StandardMaterial3D = w["mat"]



		mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA if a < 0.995 \
				else BaseMaterial3D.TRANSPARENCY_DISABLED


		mat.shading_mode = BaseMaterial3D.SHADING_MODE_PER_PIXEL
		var c: Color = mat.albedo_color
		mat.albedo_color = Color(c.r, c.g, c.b, a)






















const JERSEY_FR_W: float = 0.95
const JERSEY_FR_H: float = 1.2
const JERSEY_FR_D: float = 0.06









const JERSEY_SOLO_W: float = 1.2
const JERSEY_SOLO_H: float = 1.45






func _caja_cara(c: Vector2, lx: bool, dir: Vector2, a: float, y: float, b: float,
		la: float, alto: float, lb: float, col: Color, block: int = 0) -> MeshInstance3D:
	var u: Vector2 = Vector2(1.0, 0.0) if lx else Vector2(0.0, 1.0)
	var p: Vector2 = c + u * a + dir * b
	return _add_box(Vector3(p.x, y, p.y), Vector3(la, alto, lb) if lx
		else Vector3(lb, alto, la), col, block)



func _vuelve_vidrio(m: MeshInstance3D) -> void:
	var gm: StandardMaterial3D =(m.mesh as BoxMesh).material
	gm.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	m.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF







func _jersey_solo_at(r: Rect2, dir: Vector2, y: float) -> Vector3:
	var dep: float = r.size.y if absf(dir.y) > 0.5 else r.size.x
	var back: Vector2 = - dir * maxf(dep * 0.5 - JERSEY_FR_D * 0.5, 0.0)
	var c: Vector2 = r.get_center()
	return Vector3(c.x + back.x, y, c.y + back.y)























func _add_jersey_frame(at: Vector3, along_x: bool, sign: float,
		pano: Color, fr_w: float = JERSEY_FR_W,
		fr_h: float = JERSEY_FR_H) -> void:
	var trim: Color = _pal.get("trim", TRIM_COL)

	for esquina_x in [-1.0, 1.0]:
		for esquina_y in [-1.0, 1.0]:
			var lateral: float = esquina_x *(fr_w * 0.5 - 0.035)
			var normal: float = sign *(JERSEY_FR_D * 0.5 + 0.005)
			_add_box(at + Vector3(lateral if along_x else normal, esquina_y *(fr_h * 0.5 - 0.035), normal if along_x else lateral),
				Vector3(0.05 if along_x else 0.012, 0.05, 0.012 if along_x else 0.05), Color("ad9460"), 1)

	_add_box(at, Vector3(fr_w if along_x else JERSEY_FR_D, fr_h,
		JERSEY_FR_D if along_x else fr_w), trim)
	_add_box(at, Vector3((fr_w - 0.06) if along_x else 0.07, fr_h - 0.06,
		0.07 if along_x else (fr_w - 0.06)), trim.lightened(0.18))
	var back_at: Vector3 = at +(Vector3(0.0, 0.0, sign * 0.045) if along_x
		else Vector3(sign * 0.045, 0.0, 0.0))
	_add_box(back_at, Vector3((fr_w - 0.12) if along_x else 0.02,
		fr_h - 0.12, 0.02 if along_x else (fr_w - 0.12)), pano)
	for borde in [-1.0, 1.0]:
		var u: Vector3 = Vector3.RIGHT if along_x else Vector3.BACK
		var n: Vector3 = Vector3(0, 0, sign) if along_x else Vector3(sign, 0, 0)
		_add_box(at + u *(borde *(fr_w * 0.5 - 0.09)) + n * 0.058,
			u * 0.04 + Vector3.UP *(fr_h - 0.13) + n.abs() * 0.008, Color("d1c8b5"), 1)

	var gl_at: Vector3 = at +(Vector3(0.0, 0.0, sign * 0.07) if along_x
		else Vector3(sign * 0.07, 0.0, 0.0))
	var jg: MeshInstance3D = _add_box(gl_at,
		Vector3((fr_w - 0.1) if along_x else 0.01, fr_h - 0.1,
			0.01 if along_x else (fr_w - 0.1)), Color(0.85, 0.92, 1.0, 0.1))
	var jgm: StandardMaterial3D =(jg.mesh as BoxMesh).material
	jgm.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	jg.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	var jsh: MeshInstance3D = _add_box(gl_at + Vector3(0.0, fr_h * 0.28, 0.0),
		Vector3((fr_w - 0.16) if along_x else 0.008, 0.1,
			0.008 if along_x else (fr_w - 0.16)), Color(0.95, 0.98, 1.0, 0.14))
	var jshm: StandardMaterial3D =(jsh.mesh as BoxMesh).material
	jshm.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	jsh.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF















func _kit_playera(j: Dictionary) -> Dictionary:
	var trade: Dictionary = j.get("trade", {})
	if trade.is_empty():
		return GameState.kit_variant(Teams.by_id(String(j["club"])), 0)
	var riv: Dictionary = Teams.by_id(String(j["club"]))
	if riv.is_empty():
		riv = Nations.as_team(String(j["club"]))
	var t_season: int = int(trade.get("season", 0))
	return GameState.kit_variant(riv, 1, t_season if t_season > 0 else -1)






func _playera_tile(j: Dictionary, pie: String, activa: bool, alto: int = 190) -> Button:
	var b: Button = Button.new()
	b.custom_minimum_size = Vector2(0, alto)
	b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	CareerTheme.apply_button(b, CareerTheme.Kind.PRIMARY if activa
		else CareerTheme.Kind.NEUTRAL, 16)
	var vb: VBoxContainer = VBoxContainer.new()
	vb.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT, Control.PRESET_MODE_MINSIZE, 6)
	vb.mouse_filter = Control.MOUSE_FILTER_IGNORE
	vb.add_theme_constant_override("separation", 2)
	b.add_child(vb)
	var tr: TextureRect = TextureRect.new()
	tr.mouse_filter = Control.MOUSE_FILTER_IGNORE
	tr.size_flags_vertical = Control.SIZE_EXPAND_FILL
	tr.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	tr.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	tr.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	if not String(j.get("club", "")).is_empty():
		var trade: Dictionary = j.get("trade", {})
		var ape: String = Career.nombre_espalda() if trade.is_empty() \
				else Espalda.apellido_de(Keepsakes.quien_pintado(trade))
		tr.texture = JerseyArt.texture_named(_kit_playera(j), int(j.get("number", 0)), ape)
	vb.add_child(tr)
	var lb: Label = CareerUi.plain(16, CareerTheme.TEXT if activa else CareerTheme.TEXT_DIM)
	lb.text = pie
	lb.clip_text = true
	lb.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	lb.mouse_filter = Control.MOUSE_FILTER_IGNORE
	vb.add_child(lb)
	return b


func _add_jersey_cloth(at: Vector3, j: Dictionary, along_x: bool,
		sign: float, tela: float = 0.52,
		fr_h: float = JERSEY_FR_H, placa: bool = true) -> void:





	var trade: Dictionary = j.get("trade", {})
	var kit: Dictionary = _kit_playera(j)
	var num_j: int = int(j.get("number", CasaFoto.dorsal(String(j["club"]))))




















	var ape: String = Career.nombre_espalda() if trade.is_empty() \
			else Espalda.apellido_de(Keepsakes.quien_pintado(trade))
	var con_lam: bool = not ape.is_empty() or num_j > 0
	var spr: Sprite3D = Sprite3D.new()
	spr.texture = JerseyArt.texture(kit, 0 if con_lam else num_j)
	spr.pixel_size = tela / float(JerseyArt.SIZE)
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	spr.position = at +(Vector3(0.0, 0.03, sign * 0.06) if along_x
		else Vector3(sign * 0.06, 0.03, 0.0))
	if not along_x:
		spr.rotate_y(deg_to_rad(90.0 * sign))
	elif sign < 0.0:
		spr.rotate_y(deg_to_rad(180.0))



	_muebles.add_child(spr)
	if con_lam:



		var pecho: Rect2 = Rect2(JerseyArt.BODY_X0, JerseyArt.BODY_Y0 + 5,
			JerseyArt.BODY_X1 - JerseyArt.BODY_X0 + 1, 9)
		var rec: Dictionary = Espalda.receta_para(kit, SceneFade.imagen(spr.texture),
			pecho)
		var lam: ImageTexture = Espalda.textura(ape, num_j, rec)
		if lam != null:
			var nodo: Sprite3D = Espalda.nodo_prenda(lam, spr,
				float(JerseyArt.BODY_X1 - JerseyArt.BODY_X0 - 1),
				float(JerseyArt.BODY_Y0 + JerseyArt.BODY_Y1 + 1) * 0.5,
				float(JerseyArt.SIZE))








			nodo.position += Vector3(0.0, 0.0, 0.004)






	if num_j > 0 and placa:
		_add_box(at +(Vector3(0.0, - fr_h * 0.5 + 0.085, sign * 0.05)
				if along_x
				else Vector3(sign * 0.05, - fr_h * 0.5 + 0.085, 0.0)),
			Vector3(maxf(tela * 0.5, 0.24) if along_x else 0.02, 0.07,
				0.02 if along_x else maxf(tela * 0.5, 0.24)),
			CareerTheme.MONEY.darkened(0.12))


func _add_jerseys() -> void:
	_jerseys = House.plan_jerseys(_plano(), House.cola_camisetas(CasaFoto.clubes(), Career.keepsakes))
	var strips: Dictionary = {}
	for prop in House.plan_slots(_plano(), "camisetas"):
		strips[String(prop["id"])] = prop["rect"]
	for j in _jerseys:
		var r: Rect2 = strips.get(String(j["prop_id"]), Rect2())
		var pos: Vector2 = j["pos"]
		var strip: Dictionary = {}
		for prop in House.plan_slots(_plano(), "camisetas"):
			if String(prop["id"]) == String(j["prop_id"]):
				strip = prop















		var face: int = House.base_face(strip) if strip.is_empty() \
				else int(strip.get("face", House.base_face(strip)))
		var along_x: bool =(face&1) == 0
		var dir: Vector2 = House.FACE_DIR[face&3]
		var sign: float = dir.y if along_x else dir.x







		var solo: bool = String(strip.get("kind", "")) == "playera"
		if String(strip.get("kind", "")) == "perchero_tienda":



			var pt_at: Vector3 = Vector3(pos.x, float(strip.get("y", 1.7))
				- float(j.get("fila", 0)) * House.PERCHERO_FILA_DY, pos.y)
			_add_box(pt_at + Vector3(0.0, 0.33, 0.0), Vector3(0.02, 0.06, 0.02), Color("b8c0c8"))
			_add_box(pt_at + Vector3(0.0, 0.29, 0.0),
				Vector3(0.46, 0.03, 0.03) if along_x else Vector3(0.03, 0.03, 0.46),
				Color("3a3f46"))



			pt_at +=(Vector3(0.0, 0.0, sign * 0.012 * float(int(j.get("idx", 0)) % 12)) if along_x
				else Vector3(sign * 0.012 * float(int(j.get("idx", 0)) % 12), 0.0, 0.0))
			_add_jersey_cloth(pt_at + Vector3(0.0, -0.12, 0.0), j, along_x, sign, 0.92, JERSEY_FR_H, false)
			continue
		var kind_s: String = String(strip.get("kind", ""))
		if kind_s == "urna_playeras" or kind_s == "vitrina_especiales":




			var urna: bool = kind_s == "urna_playeras"
			var u_tela: float = 1.0 if urna else 0.82
			var u_at: Vector3 = Vector3(pos.x, float(strip.get("y", 1.42)), pos.y)
			if not urna:
				u_at -= Vector3(dir.x, 0.0, dir.y) * 0.03
			var u_bar: float = 0.41 if urna else 0.36
			_add_box(u_at + Vector3(0.0, u_bar + 0.04, 0.0), Vector3(0.02, 0.05, 0.02), Color("b8c0c8"))
			_add_box(u_at + Vector3(0.0, u_bar, 0.0),
				Vector3(0.44 * u_tela, 0.03, 0.03) if along_x else Vector3(0.03, 0.03, 0.44 * u_tela),
				Color("3a3f46"))
			_add_jersey_cloth(u_at + Vector3(0.0, -0.03, 0.0), j, along_x, sign, u_tela,
				JERSEY_FR_H, false)
			continue
		if kind_s == "mural_playeras":



			var m_y: float = float(strip.get("y", 1.27)) + House.MURAL_FILA_DY * 0.5 \
					- float(j.get("fila", 0)) * House.MURAL_FILA_DY
			var m_at: Vector3 = Vector3(pos.x + dir.x * 0.06, m_y, pos.y + dir.y * 0.06)
			_add_jersey_frame(m_at, along_x, sign, Color("2b2f36"), House.MURAL_FR.x, House.MURAL_FR.y)
			_add_jersey_cloth(m_at, j, along_x, sign, 0.6, House.MURAL_FR.y)
			continue
		var hang_y: float = float(strip.get("y", 1.3 if solo else 1.55))
		var at: Vector3 = Vector3.ZERO
		if solo:
			at = _jersey_solo_at(r, dir, hang_y)
		else:
			var off: Vector2 = Vector2(0.0, sign * 0.2) if along_x \
					else Vector2(sign * 0.2, 0.0)
			at = Vector3(pos.x + off.x, hang_y, pos.y + off.y)
			_add_jersey_frame(at, along_x, sign, Color("2b2f36"))


		if solo:
			_add_jersey_cloth(at, j, along_x, sign, 1.05, JERSEY_SOLO_H)
		else:
			_add_jersey_cloth(at, j, along_x, sign, 0.82)




func _seasons_tag(seasons: Array) -> String:
	if seasons.is_empty():
		return ""
	var bits: PackedStringArray = []
	var start: int = int(seasons[0])
	var prev: int = start
	for i in range(1, seasons.size() + 1):
		var cur: int = int(seasons[i]) if i < seasons.size() else -99
		if cur == prev + 1:
			prev = cur
			continue
		bits.append("T%d" % start if start == prev
			else "T%d–T%d" % [start, prev])
		start = cur
		prev = cur
	return ", ".join(bits)










func _add_casual_walk() -> void:
	var cfg: Dictionary = KitRecolor.casual_of(GameState.team_custom)
	for d in ["south", "north", "east", "west"]:
		var anim: String = "walk_" + d
		var added: int = 0
		for i in range(1, WALK_FRAMES + 1):
			var path: String = "res://assets/sprites/anim/walk_player_%s_%02d.png" \
					% [d, i]
			if not ResourceLoader.exists(path):
				continue
			if added == 0:
				player.sprite_frames.add_animation(anim)
				player.sprite_frames.set_animation_loop(anim, true)
				player.sprite_frames.set_animation_speed(anim, WALK_FPS)
			player.sprite_frames.add_frame(anim, KitRecolor.apply(load(path), cfg))
			added += 1


func _place_player() -> void:
	player.position = Vector3(_pos.x,
		feet_offset(player.pixel_size) - PLAYER_SINK, _pos.y)






func _move_dir() -> Vector3:
	var stick: Vector2 = _stick
	if stick == Vector2.ZERO:
		stick = _stick_mando()
	if stick == Vector2.ZERO:
		stick = Vector2(
			(1.0 if Input.is_key_pressed(KEY_RIGHT) else 0.0)
				-(1.0 if Input.is_key_pressed(KEY_LEFT) else 0.0),
			(1.0 if Input.is_key_pressed(KEY_DOWN) else 0.0)
				-(1.0 if Input.is_key_pressed(KEY_UP) else 0.0))
	if stick == Vector2.ZERO:
		return Vector3.ZERO
	var basis: Basis = cam.global_transform.basis
	var right: Vector2 = Vector2(basis.x.x, basis.x.z).normalized()
	var into: Vector2 = Vector2(- basis.z.x, - basis.z.z).normalized()
	var flat: Vector2 = right * stick.x + into *(- stick.y)
	var push: float = minf(stick.length(), 1.0)
	flat = flat.normalized() * push if flat.length_squared() > 0.0001 \
			else Vector2.ZERO
	return Vector3(flat.x, 0.0, flat.y)






const ZONA_PASEO_MANDO: float = 0.25

func _stick_mando() -> Vector2:
	if not Entrada.hay_mando() or not _casa_manda():
		return Vector2.ZERO
	var e: Vector2 = Entrada.eje(true)
	return e if e.length() > ZONA_PASEO_MANDO else Vector2.ZERO




func _casa_manda() -> bool:
	var c: Node = Entrada.capa_activa()
	return c != null and (c == self or c.is_ancestor_of(self))










func _input(event: InputEvent) -> void:
	if not (event is InputEventJoypadMotion):
		return
	var ax: int =(event as InputEventJoypadMotion).axis
	if ax != JOY_AXIS_LEFT_X and ax != JOY_AXIS_LEFT_Y:
		return
	if Entrada.hay_mando() and _casa_manda():
		get_viewport().set_input_as_handled()


func _gui_input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		var t_ev: InputEventScreenTouch = event
		if t_ev.pressed and _finger < 0:
			_finger = t_ev.index
			_stick_from = t_ev.position
			_stick = Vector2.ZERO
		elif not t_ev.pressed and t_ev.index == _finger:
			_finger = -1
			_stick = Vector2.ZERO

			_undo_grupo = ""




			_layout_flush()
	elif event is InputEventScreenDrag:
		var d_ev: InputEventScreenDrag = event
		if d_ev.index == _finger:
			_stick =(d_ev.position - _stick_from) / STICK_R





func _train() -> void:
	if TrainingGround.start_home_session():
		SceneFade.to_scene("res://features/match/match.tscn")











func _zoom_btn(txt: String, izq: float, y: float, signo: int) -> Button:
	var b: Button = Button.new()
	b.custom_minimum_size = Vector2(BTN_ZOOM, BTN_ZOOM)
	b.text = txt
	CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, 30)
	b.pressed.connect(func() -> void: _zoom_step(signo))
	b.set_anchors_preset(Control.PRESET_TOP_RIGHT, true)
	b.offset_left = izq
	b.offset_right = izq + BTN_ZOOM
	b.offset_top = y
	b.offset_bottom = y + BTN_ZOOM
	add_child(b)
	return b




func _zoom_step(signo: int) -> void:



	_zoom_user = clampf(_zoom_user - float(signo) * ZOOM_USER_STEP,
		ZOOM_USER_MIN, ZOOM_USER_MAX)
	_zoom_btns_look()




func _zoom_btns_look() -> void:
	if _zoom_in_btn == null or not is_instance_valid(_zoom_in_btn):
		return
	_zoom_in_btn.disabled = _zoom_user <= ZOOM_USER_MIN + 0.001
	_zoom_out_btn.disabled = _zoom_user >= ZOOM_USER_MAX - 0.001


func _edit_zoom_target() -> float:
	var b: Rect2 = House.plan_bounds(_plano())
	var span: float = maxf(b.size.x, b.size.y)
	return clampf(remap(span, 5.5, 33.5, CAM_ZOOM_EDIT, CAM_ZOOM_EDIT_MAX),
		CAM_ZOOM_EDIT, CAM_ZOOM_EDIT_MAX)






func _cam_target() -> Vector3:



	var f: Vector2 = _focus()
	var up: float =(CAM_EDIT_UP if _grid_on else CAM_UP) * _cam_zoom
	var back: float =(CAM_EDIT_BACK if _grid_on else CAM_BACK) * _cam_zoom
	return Vector3(f.x, up, f.y - back)


func _snap_cam() -> void:
	cam.position = _cam_target()
	var mira: Vector2 = _focus()
	var ahead: float = CAM_EDIT_AHEAD if _grid_on else CAM_AHEAD
	cam.look_at(Vector3(mira.x, 0.7, mira.y + ahead))


func _follow_cam(delta: float) -> void:
	var k: float = 1.0 - exp(- CAM_LERP * delta)










	var meta: float =(_edit_zoom_target() if _grid_on else 1.0) * _zoom_user
	_cam_zoom = lerpf(_cam_zoom, meta, k)
	cam.position = cam.position.lerp(_cam_target(), k)
	var mira: Vector2 = _focus()
	var ahead: float = CAM_EDIT_AHEAD if _grid_on else CAM_AHEAD
	cam.look_at(Vector3(mira.x, 0.7, mira.y + ahead))



























const PET_SPECIES: Dictionary = PetFramesLib.SPECIES




const PetSpritesLib := preload("res://ui/house/pet_sprites.gd")

const PetFramesLib := preload("res://ui/house/pet_frames.gd")
const HogarPropsLib := preload("res://ui/house/hogar_props.gd")
const PetHomeLib := preload("res://ui/house/pet_home.gd")
const BanoPropsLib := preload("res://ui/house/bano_props.gd")
const HogarFuncionalPropsLib := preload("res://ui/house/hogar_funcional_props.gd")
const RecuerdosPanelLib := preload("res://ui/house/recuerdos_panel.gd")
const AsientosPulidosLib := preload("res://ui/house/asientos_pulidos.gd")
const DecoPulidaLib := preload("res://ui/house/deco_pulida.gd")
const CasaLotePropsLib := preload("res://ui/house/casa_lote_props.gd")
const CasaLegadoPropsLib := preload("res://ui/house/casa_legado_props.gd")
const BrazaletesPanelLib := preload("res://ui/house/brazaletes_panel.gd")
var _pet_homes: Array = []


const ArcadeScreenLib := preload("res://ui/house/arcade_screen.gd")


const RisingSpriteLib := preload("res://ui/house/rising_sprite.gd")
const PET_FRAMES: int = PetFramesLib.FRAMES
const PET_IDLE_FRAMES: int = PetFramesLib.IDLE_FRAMES
const PET_WALK_FPS: float = PetFramesLib.WALK_FPS
const PET_IDLE_FPS: float = PetFramesLib.IDLE_FPS
const PET_DIRS: Array[String] = PetFramesLib.DIRS


const PET_REACH: float = 1.0
const USE_MSG_SECS: float = 3.0


const DOOR_OPEN_DEG: float = 35.0

const GUEST_SUIT_SHEET: String = "res://assets/sprites/anim/gala_south_"




const ChefCasa := preload("res://ui/house/chef_casa.gd")
var _chef: AnimatedSprite3D = null
var _chef_sitio: Dictionary = {}





func _sync_chef() -> void:
	var s: Dictionary = {}
	if Career.has_investment("chef"):
		s = ChefCasa.sitio(_plano())
	if s.is_empty():
		if _chef != null and is_instance_valid(_chef):
			_chef.queue_free()
		_chef = null
		_chef_sitio = {}
		return
	if _chef == null or not is_instance_valid(_chef):
		_chef = AnimatedSprite3D.new()
		_chef.name = "Chef"


		_chef.pixel_size = PLAYER_HEIGHT_M / PLAYER_METRICS.x
		_chef.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
		_chef.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		_chef.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
		_chef.sprite_frames = ChefCasa.frames()
		_chef.add_child(ChefCasa.vapor(_chef.pixel_size))
		viewport.add_child(_chef)
	_chef_sitio = s
	var at: Vector2 = s["pos"]
	_chef.position = Vector3(at.x, feet_offset(_chef.pixel_size) - PLAYER_SINK, at.y)
	_tick_chef(0.0)






func _tick_chef(_delta: float) -> void:
	if _chef == null or not is_instance_valid(_chef) or _chef_sitio.is_empty():
		return
	if _chef.animation != ChefCasa.REMUEVE or not _chef.is_playing():
		_chef.play(ChefCasa.REMUEVE)






const StaffCasa := preload("res://ui/house/staff_casa.gd")
var _staff: Dictionary = {}


func _sync_staff() -> void:
	for quien in StaffCasa.STAFF:
		var s: Dictionary = {}
		if Career.has_investment(String(quien)):
			s = StaffCasa.sitio(_plano(), String(quien))
		var ficha: Dictionary = _staff.get(quien, {})
		var node: AnimatedSprite3D = ficha.get("node", null)
		if s.is_empty():
			if node != null and is_instance_valid(node):
				node.queue_free()
			_staff.erase(quien)
			continue
		if node == null or not is_instance_valid(node):
			node = AnimatedSprite3D.new()
			node.name = String(quien).capitalize()

			node.pixel_size = StaffCasa.pixel_size(String(quien))
			node.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
			node.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
			node.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
			node.sprite_frames = StaffCasa.frames(String(quien))
			viewport.add_child(node)
			node.play("idle_south")
		var at: Vector2 = s["pos"]
		node.position = Vector3(at.x, feet_offset(node.pixel_size,
			StaffCasa.hoja_pies(String(quien))) - PLAYER_SINK, at.y)
		_staff[quien] = {"node": node, "sitio": s}


func _build_pets() -> void:









	var idx: int = 0
	_build_pareja()
	for species in House.pets_owned(Career.house_extras):

		if Career.house_pets_off.has(String(species)):
			continue
		var cfg: Dictionary = PET_SPECIES.get(String(species), {})
		if cfg.is_empty():
			continue

		var frames: SpriteFrames = PetFramesLib.frames(String(species))
		if frames.get_animation_names().is_empty():


			push_error("casa: falta el arte de la mascota (%s*)" % String(cfg["sheet"]))
			continue
		var node: AnimatedSprite3D = AnimatedSprite3D.new()



		node.pixel_size = float(cfg.get("pixel", 0.0)) if cfg.has("pixel") \
				else PLAYER_HEIGHT_M / PLAYER_METRICS.x
		node.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
		node.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		node.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
		node.sprite_frames = frames
		viewport.add_child(node)




		var ang: float = TAU * float(idx) / 4.0 + PI * 0.25
		var at: Vector2 = _pet_free_near(_pos + Vector2(cos(ang), sin(ang)) * 0.9)
		idx += 1
		var pet: Dictionary = {"id": String(species), "cfg": cfg, "node": node,
			"pos": at, "target": at, "rest": 0.0, "face": "south",
			"near": false, "hold": 0.0}
		_pets.append(pet)
		_pet_play(pet, Vector2.ZERO)
		_place_pet(pet)


		pet["label"] = _pet_name_label(String(species))
		node.add_child(pet["label"])


















func _build_pareja() -> void:
	if not Career.pareja_activa():
		return


	if not Career.pareja_vive_contigo():
		return
	var ficha: Dictionary = Career.pareja_ficha()
	if ficha.is_empty():
		return
	var hoja: String = Pareja.ANIM_DIR + Pareja.hoja_de(ficha)


	hoja = hoja.trim_suffix("idle_")
	if not ResourceLoader.exists(hoja + "walk_south_00.png"):



		return
	var cfg: Dictionary = {
		"sheet": hoja, "desde": 0, "pixel": Ceremony.PAREJA_PIXEL,



		"speed": 0.85, "rest_lo": 3.0, "rest_hi": 7.0, "reacts": [],
		"recolor": Pareja.retrato_cfg(ficha),




		"sigue": false,
	}
	var frames: SpriteFrames = _pet_frames(cfg)
	if frames.get_animation_names().is_empty():
		return
	var node: AnimatedSprite3D = AnimatedSprite3D.new()
	node.pixel_size = Ceremony.PAREJA_PIXEL
	node.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	node.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	node.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	node.sprite_frames = frames
	viewport.add_child(node)


	var at: Vector2 = _pet_free_near(_pos + Vector2(-1.1, 0.4))
	var ella: Dictionary = {"id": "pareja", "cfg": cfg, "node": node,
		"pos": at, "target": at, "rest": 0.0, "face": "south",
		"near": false, "hold": 0.0}
	_pets.append(ella)
	_pet_play(ella, Vector2.ZERO)
	_place_pet(ella)




	var etiqueta: Sprite3D = _pet_name_label("pareja",
		Career.pareja_nombre().split(" ", false)[0]
			if not Career.pareja_nombre().is_empty() else "", 1.05)
	if etiqueta != null:
		ella["label"] = etiqueta
		node.add_child(etiqueta)





func _pet_frames(cfg: Dictionary) -> SpriteFrames:
	return PetFramesLib.build(cfg)








func _pet_react(pet: Dictionary, delta: float) -> void:
	var node: AnimatedSprite3D = pet["node"]
	if node == null or node.sprite_frames == null:
		return
	if float(pet["hold"]) > 0.0:

		pet["hold"] = float(pet["hold"]) - delta
		return
	var cfg: Dictionary = pet["cfg"]
	var pos: Vector2 = pet["pos"]
	var near: bool = pos.distance_to(_pos) < PET_REACH * 1.3
	var to_you: Vector2 = _pos - pos
	var face: String = walk_dir_name(Vector3(to_you.x, 0.0, to_you.y)) \
			if near else String(pet["face"])
	var want: String = ""
	if near and not bool(pet["near"]):


		want = String(cfg.get("greet", ""))
		pet["hold"] = 1.6
	elif near and String(cfg.get("greet", "")) == "bark":

		want = "bark"
	elif not near and cfg.has("settle"):

		want = String(cfg["settle"])
	pet["near"] = near
	if near:
		pet["face"] = face
	var anim: String =(want + "_" + String(pet["face"])) if not want.is_empty() \
			else ""
	if anim.is_empty() or not node.sprite_frames.has_animation(anim):
		anim = "idle_" + String(pet["face"])
	if node.animation != anim and node.sprite_frames.has_animation(anim):
		node.play(anim)






func _pet_play(pet: Dictionary, step: Vector2) -> void:
	var node: AnimatedSprite3D = pet["node"]
	if node == null or node.sprite_frames == null:
		return
	var moving: bool = step.length_squared() > 1e-07
	if moving:
		pet["face"] = walk_dir_name(Vector3(step.x, 0.0, step.y))
	var anim: String =("walk_" if moving else "idle_") + String(pet["face"])
	if not node.sprite_frames.has_animation(anim):
		anim =("idle_" if moving else "walk_") + String(pet["face"])
	if node.animation != anim and node.sprite_frames.has_animation(anim):
		node.play(anim)








func _pet_free_near(want: Vector2) -> Vector2:
	var q: Vector2 = _free_near(want)
	if not _ocupado_por_mascota(q):
		return q
	for ring in range(1, 10):
		for k in 8:
			var a: float = TAU * float(k) / 8.0
			var p2: Vector2 = _free_near(want
				+ Vector2(cos(a), sin(a)) * PET_GAP * 1.2 * float(ring))
			if not _ocupado_por_mascota(p2):
				return p2
	return q



func _ocupado_por_mascota(at: Vector2) -> bool:
	for other in _pets:
		if at.distance_to(Vector2((other as Dictionary)["pos"])) < PET_GAP:
			return true
	return false


func _free_near(want: Vector2) -> Vector2:
	if House.plan_can_stand(_plano(), want, DOG_R, Career.house_extras):
		return want
	for ring in range(1, 12):
		for k in 8:
			var a: float = TAU * float(k) / 8.0
			var q: Vector2 = want + Vector2(cos(a), sin(a)) * 0.3 * float(ring)
			if House.plan_can_stand(_plano(), q, DOG_R, Career.house_extras):
				return q








	return House.plan_spawn(_plano())


const DOG_R: float = 0.14


const DOG_FOLLOW_AT: float = PetFramesLib.DOG_FOLLOW_AT
const PET_GAP: float = PetFramesLib.PET_GAP


func _tick_pets(delta: float) -> void:
	for pet in _pets:
		_tick_pet(pet as Dictionary, delta)


func _tick_pet(pet: Dictionary, delta: float) -> void:
	var node: AnimatedSprite3D = pet["node"]
	if node == null:
		return
	if _pet_jardin(pet, delta):
		return
	if PetHomeLib.tick(self, pet, delta, _pet_homes):
		return
	var cfg: Dictionary = pet["cfg"]
	var pos: Vector2 = pet["pos"]



	if bool(cfg.get("sigue", true)) and pos.distance_to(_pos) > DOG_FOLLOW_AT:
		pet["target"] = _free_near(_pos +(pos - _pos).normalized() * 0.9)
		pet["rest"] = 0.0
	if float(pet["rest"]) > 0.0:
		pet["rest"] = float(pet["rest"]) - delta
		_pet_react(pet, delta)
		return
	var to_go: Vector2 = Vector2(pet["target"]) - pos
	if to_go.length() < 0.12:
		pet["rest"] = randf_range(float(cfg["rest_lo"]), float(cfg["rest_hi"]))
		pet["target"] = _free_near(pos + Vector2(
			randf_range(-2.2, 2.2), randf_range(-2.2, 2.2)))
		_pet_play(pet, Vector2.ZERO)
		return
	var step: Vector2 = to_go.normalized() * float(cfg["speed"]) * delta
	var next: Vector2 = House.plan_move(_plano(), pos, step, DOG_R,
		Career.house_extras)




	if _pet_blocked(pet, next):
		pet["target"] = _free_near(pos + Vector2(
			randf_range(-1.5, 1.5), randf_range(-1.5, 1.5)))
		pet["rest"] = 0.35
		_pet_play(pet, Vector2.ZERO)
		return

	if next.distance_to(pos) < 0.002:
		pet["target"] = _free_near(pos + Vector2(
			randf_range(-1.5, 1.5), randf_range(-1.5, 1.5)))


	var went: Vector2 = next - pos
	pet["pos"] = next
	_pet_play(pet, went)
	_place_pet(pet)



func _pet_blocked(pet: Dictionary, at: Vector2) -> bool:
	var aqui: Vector2 = pet["pos"]
	for other in _pets:
		if other == pet:
			continue
		var o: Vector2 = Vector2((other as Dictionary)["pos"])
		if at.distance_to(o) >= PET_GAP:
			continue










		if at.distance_to(o) > aqui.distance_to(o):
			continue
		return true
	return false




func _nearest_pet() -> Dictionary:
	var best: Dictionary = {}
	var best_d: float = PET_REACH
	for pet in _pets:
		var d: float = Vector2((pet as Dictionary)["pos"]).distance_to(_pos)
		if d < best_d:
			best_d = d
			best = pet
	return best




func _place_pet(pet: Dictionary) -> void:
	var node: AnimatedSprite3D = pet["node"]
	if node == null:
		return
	var pos: Vector2 = pet["pos"]








	var cfg: Dictionary = pet["cfg"]
	if not pet.has("foff") or absf(float(pet.get("foff_px", -1.0))
			- node.pixel_size) > 1e-06:
		if cfg.has("proc"):



			pet["foff"] = _proc_feet_offset(node)
		else:




			pet["foff"] = feet_offset(node.pixel_size, "%sidle_south_%02d.png"
				% [String(cfg["sheet"]), int(cfg.get("desde", 1))])
		pet["foff_px"] = node.pixel_size
	node.position = Vector3(pos.x,
		float(pet["foff"]) - PLAYER_SINK + float(pet.get("home_y", 0.0)), pos.y)



func _proc_feet_offset(node: AnimatedSprite3D) -> float:
	var sf: SpriteFrames = node.sprite_frames
	if sf == null or not sf.has_animation("idle_south") \
			or sf.get_frame_count("idle_south") == 0:
		return PLAYER_METRICS.y * node.pixel_size
	var img: Image = SceneFade.imagen(sf.get_frame_texture("idle_south", 0))
	if img == null:
		return PLAYER_METRICS.y * node.pixel_size
	var used: Rect2i = img.get_used_rect()
	if used.size.y <= 0:
		return PLAYER_METRICS.y * node.pixel_size
	var pad_bottom: float = float(img.get_height() - used.end.y)
	return (float(img.get_height()) * 0.5 - pad_bottom) * node.pixel_size












func _pet_name_label(species: String, nombre: String = "",
		alto: float = 0.6) -> Sprite3D:
	var nm: String = PixelText.normalize(nombre if not nombre.is_empty()
		else House.pet_name(species, Career.pet_names))
	if nm.is_empty():
		return null
	var px: int = 3
	var pad: int = px * 2
	var w: int = PixelText.text_width(nm, px) + pad * 2
	var h: int = PixelText.GLYPH_H * px + pad * 2
	var img: Image = Image.create(w, h, false, Image.FORMAT_RGBA8)
	img.fill(Color("20222a"))
	for x in w:
		img.set_pixel(x, 0, Color("3a3d47"))
		img.set_pixel(x, h - 1, Color("3a3d47"))
	PixelText.draw_text(img, pad, pad, nm, Color("f2ead8"), px)
	var spr: Sprite3D = Sprite3D.new()
	spr.texture = ImageTexture.create_from_image(img)
	spr.pixel_size = 0.008
	spr.billboard = BaseMaterial3D.BILLBOARD_ENABLED
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.shaded = false
	spr.no_depth_test = true
	spr.render_priority = 2
	spr.position = Vector3(0.0, alto, 0.0)
	return spr


func _build_hud() -> void:
	var top: MarginContainer = MarginContainer.new()
	top.set_anchors_preset(Control.PRESET_TOP_WIDE)
	for side in ["left", "right", "top"]:
		top.add_theme_constant_override("margin_" + side, 24)
	add_child(top)
	CareerUi.apply_safe_area(top, get_viewport())
	_hud_top = top
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 8)
	top.add_child(col)





	var back: Button = CareerUi.back_button(col, func() -> void:
		_layout_flush()
		SceneFade.to_scene(destino_salida))





	CareerTheme.style_button(back, CareerTheme.Kind.NEUTRAL, 26)

	var title: Label = CareerUi.plain(30, CareerTheme.TEXT)
	title.text = I18n.t("MUSEO") if museo \
			else I18n.tf("CASA DE {0}", [Career.player_name]) if visita \
			else I18n.t(String(House.level_data(_level)["name"]))

	title.clip_text = visita
	col.add_child(title)
	_room_lbl = CareerUi.plain(20, Color(1, 1, 1, 0.65))
	col.add_child(_room_lbl)













	_grid_btn = Button.new()
	_grid_btn.custom_minimum_size = Vector2(BTN_EDIT_W, BTN_EDIT_H)
	_grid_btn.text = I18n.t("MODO EDICION")
	_edit_btn_look()
	_grid_btn.pressed.connect(_toggle_grid)
	_grid_btn.set_anchors_preset(Control.PRESET_TOP_RIGHT, true)


	var arriba: float = 24.0 + UiKit.top_safe_inset(get_viewport())


	var lado: float = UiKit.side_safe_inset(get_viewport())
	_grid_btn.offset_right = -24.0 - lado
	_grid_btn.offset_left = -24.0 - lado - BTN_EDIT_W
	_grid_btn.offset_top = arriba
	_grid_btn.offset_bottom = arriba + BTN_EDIT_H
	add_child(_grid_btn)










	var zy: float = arriba + BTN_EDIT_H + 12.0
	_zoom_in_btn = _zoom_btn("+", -24.0 - lado - BTN_ZOOM, zy, 1)
	_zoom_out_btn = _zoom_btn("-", -24.0 - lado - BTN_ZOOM * 2.0 - 12.0, zy, -1)
	_zoom_btns_look()


	var bottom: MarginContainer = MarginContainer.new()
	bottom.set_anchors_preset(Control.PRESET_BOTTOM_WIDE)




	bottom.grow_vertical = Control.GROW_DIRECTION_BEGIN
	for side in ["left", "right", "bottom"]:
		bottom.add_theme_constant_override("margin_" + side, 30)
	add_child(bottom)



	if UiKit.es_horizontal():
		var lado_b: float = UiKit.side_safe_inset(get_viewport())
		bottom.offset_left += lado_b
		bottom.offset_right -= lado_b
		bottom.offset_bottom -= UiKit.bottom_safe_inset(get_viewport())


		CareerUi.columna_centrada(bottom, get_viewport(), CASA_PIE_APAISADO_W)
	_hud_bottom = bottom
	var stack: VBoxContainer = VBoxContainer.new()
	stack.add_theme_constant_override("separation", 12)
	bottom.add_child(stack)




	_shelf_card = PanelContainer.new()
	_shelf_card.add_theme_stylebox_override("panel", CareerTheme.plate())
	_shelf_card.visible = false
	_shelf_card.mouse_filter = Control.MOUSE_FILTER_IGNORE
	stack.add_child(_shelf_card)
	_shelf_box = VBoxContainer.new()
	_shelf_box.add_theme_constant_override("separation", 4)
	_shelf_box.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_shelf_card.add_child(_shelf_box)
	_prop_card = PanelContainer.new()
	_prop_card.add_theme_stylebox_override("panel", CareerTheme.plate())
	_prop_card.visible = false
	_prop_card.mouse_filter = Control.MOUSE_FILTER_IGNORE
	stack.add_child(_prop_card)
	_prop_lbl = CareerUi.plain(24, CareerTheme.TEXT)
	_prop_lbl.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_prop_lbl.size_flags_horizontal = Control.SIZE_EXPAND_FILL




	_prop_lbl.clip_text = true
	_prop_card.add_child(_prop_lbl)



	_why_card = PanelContainer.new()
	_why_card.add_theme_stylebox_override("panel", CareerTheme.plate())
	_why_card.visible = false
	_why_card.mouse_filter = Control.MOUSE_FILTER_IGNORE
	stack.add_child(_why_card)
	_why_lbl = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.DANGER)
	_why_lbl.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_why_lbl.size_flags_horizontal = Control.SIZE_EXPAND_FILL




	_why_lbl.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_why_card.add_child(_why_lbl)










	_use_msg = CareerUi.plain(22, CareerTheme.MONEY)
	_use_msg.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_use_msg.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_use_msg.visible = false


	_use_msg.clip_text = true
	stack.add_child(_use_msg)
	_use_btn = Button.new()
	_use_btn.custom_minimum_size = Vector2(0, 104)

	_use_btn.clip_text = true
	CareerTheme.apply_button(_use_btn, CareerTheme.Kind.PRIMARY, 26)
	_use_btn.visible = false
	_use_btn.pressed.connect(_use_prop)
	stack.add_child(_use_btn)






	_play_btn = CareerUi.accion("play", I18n.t("JUGAR AL SNAKE"), CareerTheme.NAV_CASA)
	_play_btn.custom_minimum_size = Vector2(0, 104)
	_play_btn.visible = false
	_play_btn.pressed.connect(_play_snake)
	stack.add_child(_play_btn)



	_jersey_btn = CareerUi.accion("camiseta", I18n.t("COLGAR PLAYERAS"), CareerTheme.NAV_CASA)
	_jersey_btn.custom_minimum_size = Vector2(0, 104)
	_jersey_btn.visible = false
	_jersey_btn.pressed.connect(_jersey_modal)
	stack.add_child(_jersey_btn)






































	_bag_btn = _icon_btn("caja", CareerTheme.Kind.NEUTRAL, _open_bag, "INVENTARIO")





	_vaciar_btn = _icon_btn("escoba", CareerTheme.Kind.WARN, _open_vaciar, "VACIAR")



	_planos_btn = _icon_btn("pared", CareerTheme.Kind.PRIMARY, _open_planos, "PLANOS")
	_other_btn = _icon_btn("otra", CareerTheme.Kind.NEUTRAL, _pick_next, "OTRO")
	_wall_btn = _icon_btn("pared", CareerTheme.Kind.NEUTRAL, _toggle_wall_mode, "PAREDES")
	_spin_btn = _icon_btn("spin", CareerTheme.Kind.NEUTRAL, _spin_prop, "GIRAR")
	_stash_btn = _icon_btn("caja_abierta", CareerTheme.Kind.NEUTRAL, _stash_prop, "GUARDAR")
	_cancel_btn = _icon_btn("cerrar", CareerTheme.Kind.WARN, _cancel_carry, "CANCELAR")
	_move_btn = _icon_btn("mover", CareerTheme.Kind.PRIMARY, _pick_prop, "MOVER ESTO")
	_drop_btn = _icon_btn("check", CareerTheme.Kind.PRIMARY, _drop_prop, "PONER AQUI")



	_wall_do_btn = _icon_btn("check", CareerTheme.Kind.PRIMARY, _do_wall, "LEVANTAR PARED")






	_door_btn = _icon_btn("puerta", CareerTheme.Kind.NEUTRAL,
		func() -> void:
			if _wall_from != Vector2.INF:
				_cancel_wall_trace()
			elif _wall_at(_tabs_hoy() as Array, _wall_a, _wall_b) < 0 \
					and _wall_at(_layout_of().get("aberturas", []) as Array,
						_wall_a, _wall_b) >= 0:


				_shell_tapa()
			else:
				_do_door(), "PONER PUERTA")







	_win_btn = _icon_btn("ventana", CareerTheme.Kind.NEUTRAL, _do_window, "PONER VENTANA")




	_slide_btn = _icon_btn("ventana", CareerTheme.Kind.NEUTRAL, _do_slide,
		"PONER CORREDIZA")
	_mat_btn = _icon_btn("material", CareerTheme.Kind.NEUTRAL, _tap_wall_mat, "MATERIAL")



	_corner_btn = _icon_btn("spin", CareerTheme.Kind.PRIMARY, _wall_corner, "AQUI GIRA")


	_brocha_btn = _icon_btn("material", CareerTheme.Kind.NEUTRAL, _toggle_brocha,
		"PINTAR SUELO")



	_undo_btn = _icon_btn("prestamo", CareerTheme.Kind.NEUTRAL, _undo_pop, "DESHACER")



	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 10)





	fila.alignment = BoxContainer.ALIGNMENT_CENTER
	for b in [_bag_btn, _vaciar_btn, _undo_btn, _other_btn, _wall_btn, _brocha_btn,
			_move_btn, _spin_btn,
			_planos_btn, _door_btn, _win_btn, _slide_btn, _mat_btn, _corner_btn,
			_wall_do_btn,
			_drop_btn,
			_stash_btn, _cancel_btn]:




		b.custom_minimum_size = Vector2(108, 108)
		fila.add_child(b)
	stack.add_child(fila)
	stack.move_child(fila, 0)


	stack.move_child(_why_card, 0)




	_row_libre = fila
	_row_carga = fila
	_train_btn = Button.new()
	_train_btn.custom_minimum_size = Vector2(0, 104)
	_train_btn.text = I18n.t("SALIR A ENTRENAR")
	CareerTheme.apply_button(_train_btn, CareerTheme.Kind.PRIMARY, 26)
	_train_btn.visible = false
	_train_btn.pressed.connect(_train)
	stack.add_child(_train_btn)





	_comeback_btn = Button.new()
	_comeback_btn.custom_minimum_size = Vector2(0, 104)
	_comeback_btn.text = I18n.t("TE QUIEREN DE VUELTA")
	_comeback_btn.clip_text = true

	CareerTheme.apply_button_accent(_comeback_btn, CareerTheme.MONEY, 26)
	_comeback_btn.visible = false
	_comeback_btn.pressed.connect(_pregunta_volver)
	stack.add_child(_comeback_btn)




	if not museo and not visita:
		_calle_btn = CareerUi.accion("local", I18n.t("AL VECINDARIO"), CareerTheme.NAV_CASA)
		_calle_btn.name = "AlVecindario"
		_calle_btn.visible = false
		_calle_btn.pressed.connect(_al_vecindario)
		stack.add_child(_calle_btn)
	_exit_btn = Button.new()
	_exit_btn.custom_minimum_size = Vector2(0, 104)
	_exit_btn.text = I18n.t("SALIR DEL MUSEO") if museo \
			else I18n.t("SALIR") if visita else I18n.t("SALIR DE CASA")
	CareerTheme.apply_button(_exit_btn, CareerTheme.Kind.PRIMARY, 26)
	_exit_btn.visible = false
	_exit_btn.pressed.connect(func() -> void:

		_layout_flush()
		SceneFade.to_scene(destino_salida))
	stack.add_child(_exit_btn)




	_done_btn = Button.new()
	_done_btn.custom_minimum_size = Vector2(0, 104)
	_done_btn.text = I18n.t("TERMINAR")
	_done_btn.clip_text = true
	CareerTheme.apply_button_accent(_done_btn, CareerTheme.GOOD.darkened(0.32), 26)
	_done_btn.visible = false
	_done_btn.pressed.connect(_toggle_grid)
	stack.add_child(_done_btn)


func _refresh_labels() -> void:

	var room: Dictionary = House.plan_room_at(_plano(), _focus())
	_room_lbl.text = I18n.t(String(room.get("label", "")))



	_exit_btn.visible = \
			_pos.distance_to(House.plan_door(_plano())) <= House.DOOR_ZONE
	if _comeback_btn != null:
		_comeback_btn.visible = _exit_btn.visible and not visita and Career.can_unretire()
	if _calle_btn != null:
		_calle_btn.visible = _exit_btn.visible

	_train_btn.visible = not museo and not visita and House.at_train_door(_level, _pos) \
			and House.can_train(_level, Career.house_extras)
	var prop: Dictionary = House.plan_nearest_prop(_plano(), _pos)
	var pid: String = String(prop.get("id", ""))


	_acepta_actual = prop.get("acepta", []) as Array
	_vitrina_pid = pid if not visita and House.vitrina_elegible(prop) else ""
	_refresh_use(prop)
	var shelf: Array = House.shelf_of(_plan, pid) if not pid.is_empty() else []


	var wall: Array = []
	if shelf.is_empty() and not pid.is_empty():
		for j in _jerseys:
			if String(j["prop_id"]) == pid:
				wall.append(j)







	var _k_kind: String = String(prop.get("kind", ""))
	_keeps_prop = _k_kind == "balones" or _k_kind == "balones_museo"




	var exhibit: bool =(not shelf.is_empty() or not wall.is_empty() or _keeps_prop
		or (not _vitrina_pid.is_empty() and not Career.awards.is_empty())) and not visita
	var focus: Dictionary = _focus_trophy(shelf)

	_place_focus_halo(focus if exhibit else {})


	var key: String = "%s|%s|%d" % [pid, String(focus.get("name", "")),
		Career.keepsakes.size() if _keeps_prop else -1]
	if key != _shelf_for:
		_shelf_for = key
		if exhibit:




			if _repage:
				_page = _page_of(focus, _exhibit_items(wall))
			_repage = true
			_fill_exhibit(wall, focus)
	_shelf_card.visible = exhibit







	if not _grid_on:
		_prop_set(I18n.t(House.kind_name(prop)) \
				if not exhibit and not prop.is_empty() else "")






	_done_btn.visible = _grid_on


	_grid_btn.visible = not _grid_on and not museo and not visita
	if _grid_on:
		_use_btn.visible = false
		_play_btn.visible = false
		_jersey_btn.visible = false
		_train_btn.visible = false





		_exit_btn.visible = false
		if _calle_btn != null:
			_calle_btn.visible = false




		if _mode_sig() != _mode_last:
			_refresh_mode()









func _refresh_use(prop: Dictionary) -> void:
	_use_now = {}


	if visita:
		_use_kind = ""
		_jersey_prop = ""
		_use_btn.visible = false
		_play_btn.visible = false
		_jersey_btn.visible = false
		return










	if _llegada.is_empty() and _paseo.is_empty() and not _cancela.is_empty():
		var d_puerta: Vector2 = House.plan_door(_plano())
		if _pos.distance_to(Vector2(d_puerta.x, d_puerta.y + 0.7)) < 2.2:
			if not Cartas.pendientes().is_empty():
				_use_now = {"id": "buzon", "name": "BUZÓN"}
			elif not _columpio.is_empty():
				_use_now = {"id": "columpio", "name": "COLUMPIO"}
	var _cerca: Dictionary = _nearest_pet()
	if not _use_now.is_empty():
		pass
	elif not _cerca.is_empty():
		_use_now = House.use_by_id(
			"pareja" if String(_cerca.get("id", "")) == "pareja" else "perro")
	elif not prop.is_empty():



		var req: String = String(prop.get("req", ""))
		if req.is_empty() or Career.house_extras.has(req):
			_use_now = House.use_for_kind(String(prop.get("kind", "")))




	if _use_now.is_empty() and String(prop.get("kind", "")) in ["sofa", "sofa_penthouse"]:
		_use_now = {"id": "visita", "name": "RECIBIR VISITA"}
	_use_btn.visible = not _use_now.is_empty()




	var kind_j: String = String(prop.get("kind", ""))



	_use_kind = kind_j
	_juego_prop = prop.duplicate(true)








	var req_j: String = String(prop.get("req", ""))
	_play_btn.visible = JUGABLES.has(kind_j) and not House.kind_vetado(kind_j) \
			and (req_j.is_empty() or Career.house_extras.has(req_j)) \
			and _juego_ofrecible(kind_j)
	if _play_btn.visible:

		CareerUi.pinta_accion(_play_btn, String(ICONO_JUGAR.get(kind_j, "play")),
			I18n.t(String(JUGABLES[kind_j])), CareerTheme.NAV_CASA, false)







	_jersey_prop = String(prop.get("id", "")) \
			if kind_j in ["camisetas", "playera", "perchero_tienda", "urna_playeras",
			"mural_playeras", "vitrina_especiales"] else ""
	_jersey_btn.visible = not _jersey_prop.is_empty() \
			and not CasaFoto.clubes().is_empty()



	if _jersey_btn.visible:
		CareerUi.pinta_accion(_jersey_btn, "camiseta", I18n.t("COLGAR PLAYERA")
			if kind_j == "playera" else I18n.t("COLGAR PLAYERAS"), CareerTheme.NAV_CASA, false)
	if not _use_btn.visible:
		return
	var id: String = String(_use_now["id"])


	var done: bool = Career.house_used_now().has(House.use_sello(id))



	_use_btn.disabled = done or not Career.house_use_time(id)
	if done:
		_use_btn.text = I18n.t("YA LO HICISTE ESTA SEMANA") if id != "visita" \
				else I18n.t("YA RECIBISTE ESTA SEMANA")
	elif not Career.house_use_time(id):
		_use_btn.text = I18n.t("NO TE QUEDA TIEMPO ESTA SEMANA")
	elif not Career.house_use_block_reason(id).is_empty():

		_use_btn.text = I18n.t("VER CONDICIÓN")
	else:
		_use_btn.text = I18n.t(String(_use_now["name"]))





func _play_snake() -> void:
	if _snake_on != null and is_instance_valid(_snake_on):
		return



	if not _juego_ofrecible(_use_kind):
		return
	if _use_kind in ["canasta_basket", "pingpong", "simulador"] and _contexto_juego().is_empty():
		return
	if _use_kind == "vestidor":
		UiAudio.click()
		_layout_flush()
		CareerPage.abrir_vestidor_casa = true
		GameState.career_page = "aspecto"
		SceneFade.to_scene("res://ui/career_page.tscn")
		return
	if _use_kind == "brazalete_capitan":
		UiAudio.click()
		BrazaletesPanelLib.abrir(self)
		return
	if _use_kind in ["espejo_inteligente", "mesa_holografica"]:
		if not Career.house_extras.has(_use_kind): return
		UiAudio.click()
		_snake_on = load("res://ui/house/tecnologia_panel.gd").new()
		_snake_on.set("kind", _use_kind)
		add_child(_snake_on)
		return
	if _use_kind == "canasta_basket":
		if not Career.house_extras.has("canasta_basket"): return
		UiAudio.click()
		_snake_on = load("res://ui/house/basket_game.gd").new()
		_snake_on.set("contexto_casa", _contexto_juego())


		_snake_on.add_to_group(Settings.AHORRO_HOLD_GROUP)
		add_child(_snake_on)
		return
	if _use_kind == "pingpong":
		if not Career.house_extras.has("mesa_pingpong"):
			return
		UiAudio.click()
		_snake_on = load("res://ui/house/pingpong_game.gd").new()
		_snake_on.set("contexto_casa", _contexto_juego())


		_snake_on.add_to_group(Settings.AHORRO_HOLD_GROUP)
		add_child(_snake_on)
		return





	if _use_kind == "pared_reflejos":
		if not Career.house_extras.has("pared_reflejos"):
			return
		UiAudio.click()
		_snake_on = load("res://ui/house/reflejos_game.gd").new()


		_snake_on.add_to_group(Settings.AHORRO_HOLD_GROUP)
		add_child(_snake_on)
		return
	if _use_kind == "memorama":
		if not Career.house_extras.has("memorama"):
			return
		UiAudio.click()
		_snake_on = load("res://ui/house/memorama_game.gd").new()


		_snake_on.add_to_group(Settings.AHORRO_HOLD_GROUP)
		add_child(_snake_on)
		return
	if _use_kind in House.CONSULTA_KINDS:
		UiAudio.click()
		RecuerdosPanelLib.abrir(self, _use_kind)
		return
	if _use_kind == "piano":
		if not Career.house_extras.has("piano"):
			return
		UiAudio.click()
		_snake_on = PianoGame.new()


		_snake_on.add_to_group(Settings.AHORRO_HOLD_GROUP)
		add_child(_snake_on)
		return


	if _use_kind == "poker":


		if not House.kind_vetado("poker"):
			_pick_poker()
		return
	if _use_kind == "dardos":



		UiAudio.click()
		var dd: DardosRoom3D = DardosRoom3D.new()
		add_child(dd)
		return
	if _use_kind == "billar":
		_pick_reto(_use_kind)
		return
	if _use_kind == "simulador":
		if not Career.house_extras.has("simulador"):
			return
		UiAudio.click()
		_snake_on = preload("res://ui/house/simulador_game.gd").new()
		_snake_on.set("contexto_casa", _contexto_juego())


		_snake_on.add_to_group(Settings.AHORRO_HOLD_GROUP)
		add_child(_snake_on)
		return
	UiAudio.click()
	_snake_on = SnakeGame.new()
	add_child(_snake_on)







func _juego_ofrecible(kind: String) -> bool:
	return not MINIJUEGO_KINDS.has(kind) or Entrada.juego_jugable(kind)


















func atras() -> bool:
	var mesa: PokerRoom3D = _poker_abierto()
	if mesa != null:
		mesa.levantarse()
		return true
	if _snake_on != null and is_instance_valid(_snake_on):
		if _snake_on.has_method("_cerrar"):
			_snake_on._cerrar()
		elif _snake_on.has_method("_close"):
			_snake_on._close()
		return true
	return false





func _poker_abierto() -> PokerRoom3D:
	for c in get_children():
		if c is PokerRoom3D and not c.is_queued_for_deletion():
			return c
	return null




func _contexto_juego() -> Dictionary:
	var id: String = String(_juego_prop.get("id", ""))
	for prop: Dictionary in _plano()["props"]:
		if String(prop.get("id", "")) == id and String(prop.get("kind", "")) == _use_kind \
				and _prop_visible(prop):
			return {"viewport": viewport, "prop": prop.duplicate(true), "casa": self}
	return {}




func _pick_poker() -> void:
	var col: VBoxContainer = CareerUi.modal(self)
	if col == null:
		return
	var t: Label = CareerUi.plain(28, CareerTheme.TEXT)
	t.text = I18n.t("¿CON QUIÉN JUEGAS?")
	col.add_child(t)
	for m in House.poker_mesas(Career.house_level):
		var entrada: int = int(m["fichas"]) * PokerRoom3D.FICHA
		var b: Button = Button.new()
		b.custom_minimum_size = Vector2(0, 104)
		b.clip_text = true
		b.text = "%s  ·  %s" % [I18n.t(String(m["name"])),
			CareerUi.money(entrada)]
		CareerTheme.apply_button(b, CareerTheme.Kind.PRIMARY, 22)
		b.disabled = not Career.can_afford(entrada)
		b.pressed.connect(_sentarse.bind(String(m["id"]), b))
		col.add_child(b)


	var ent_t: int = TORNEO_FICHAS * PokerRoom3D.FICHA

	var tb: Button = CareerUi.accion("torneos",
		"%s  ·  %s" % [I18n.t("TORNEO DE LA TEMPORADA"), CareerUi.money(ent_t)] \
				if Career.poker_torneo_abierto() else I18n.t("TORNEO: YA JUGADO ESTA TEMPORADA"),
		CareerTheme.MONEY)
	tb.custom_minimum_size = Vector2(0, 104)
	tb.disabled = not Career.poker_torneo_abierto() or not Career.can_afford(ent_t)
	tb.pressed.connect(_sentarse_torneo.bind(tb))
	col.add_child(tb)
	var no: Button = Button.new()
	no.custom_minimum_size = Vector2(0, 88)
	no.text = I18n.t("HOY NO")
	CareerTheme.apply_button(no, CareerTheme.Kind.GHOST, 22)
	no.pressed.connect(func() -> void: CareerUi.close_modal(no))
	_atras_tumbado(no)
	col.add_child(no)





func _sentarse(mesa_id: String, from: Button) -> void:
	var m: Dictionary = House.poker_mesa_by_id(mesa_id)
	if m.is_empty():
		return
	var entrada: int = int(m["fichas"]) * PokerRoom3D.FICHA
	if not Career.can_afford(entrada):
		return
	CareerUi.close_modal(from)
	Career.money -= entrada





	Career._save()
	var gente: Array = []
	var nombres: Array = Career.poker_invitados(mesa_id)
	var cars: Array = m["caracteres"]
	for i in nombres.size():
		gente.append({"nombre": String(nombres[i]),
			"fichas": int(m["fichas"]),
			"caracter": String(cars[i % cars.size()])})
	var juego: PokerRoom3D = PokerRoom3D.new()
	add_child(juego)
	juego.cerrada.connect(_poker_fin.bind(mesa_id))
	juego.abrir(gente, int(m["fichas"]))




const TORNEO_FICHAS: int = 200
const TORNEO_CARACTERES: Array = ["roca", "farol", "loco"]




func _sentarse_torneo(from: Button) -> void:
	var entrada: int = TORNEO_FICHAS * PokerRoom3D.FICHA
	if not Career.poker_torneo_abierto() or not Career.can_afford(entrada):
		return
	CareerUi.close_modal(from)
	Career.money -= entrada
	Career.poker_torneo_sella()
	Career._save()
	var gente: Array = []
	var nombres: Array = Career.poker_invitados("rivales")
	for i in nombres.size():
		gente.append({"nombre": String(nombres[i]), "fichas": TORNEO_FICHAS,
			"caracter": String(TORNEO_CARACTERES[i % TORNEO_CARACTERES.size()])})
	var juego: PokerRoom3D = PokerRoom3D.new()
	juego.torneo = true
	add_child(juego)
	juego.cerrada.connect(func(saldo: int) -> void:
		Career.settle_poker_torneo(entrada + saldo, juego.campeon())
		_refresh_labels())
	juego.abrir(gente, TORNEO_FICHAS)




func _poker_fin(saldo: int, mesa_id: String) -> void:
	var m: Dictionary = House.poker_mesa_by_id(mesa_id)
	var entrada: int = int(m.get("fichas", 0)) * PokerRoom3D.FICHA
	Career.settle_poker(mesa_id, entrada + saldo, saldo)
	_refresh_labels()













func _pick_reto(kind: String) -> void:
	var col: VBoxContainer = CareerUi.modal(self)
	if col == null:
		return
	var t: Label = CareerUi.plain(CareerTheme.T_TITLE_MODAL, CareerTheme.TEXT)
	t.text = I18n.t("¿CONTRA QUIEN?")
	col.add_child(t)
	var cobrado: bool = Career.reto_casa_cobrado(kind)
	if cobrado:
		var av: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
		av.text = I18n.t("Ya ganaste química esta semana. Se juega por el récord.")
		av.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		col.add_child(av)
	var solo: Button = CareerUi.accion("play", I18n.t("UNA PARTIDA SOLO"), CareerTheme.NAV_CASA)
	solo.pressed.connect(_abre_reto.bind(kind, {}, solo))
	col.add_child(solo)











	var lista: Array = Billar.RIVALES
	for r in lista:
		var b: Button = Button.new()
		b.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
		b.clip_text = true
		b.text = "%s  ·  %s" % [I18n.t(String(r["name"])),
			I18n.t(String(r.get("dif", "")))]
		CareerTheme.apply_button(b, CareerTheme.Kind.PRIMARY, CareerTheme.T_BODY)
		b.pressed.connect(_abre_reto.bind(kind, r, b))
		col.add_child(b)
	var no: Button = Button.new()
	no.custom_minimum_size = Vector2(0, 88)
	no.text = I18n.t("HOY NO")
	CareerTheme.apply_button(no, CareerTheme.Kind.GHOST, CareerTheme.T_BODY)
	no.pressed.connect(func() -> void: CareerUi.close_modal(no))
	_atras_tumbado(no)
	col.add_child(no)







func _abre_reto(kind: String, rival: Dictionary, from: Button) -> void:
	CareerUi.close_modal(from)
	UiAudio.click()
	var por_premio: bool = not rival.is_empty() \
			and not Career.reto_casa_cobrado(kind)



	var j: BillarRoom3D = BillarRoom3D.new()
	j.abrir(rival, por_premio)
	add_child(j)





func _use_prop() -> void:
	if _use_now.is_empty():
		return
	if String(_use_now["id"]) == "visita":
		_pick_guest()
		return
	if String(_use_now["id"]) == "buzon":
		_leer_cartas()
		return
	if String(_use_now["id"]) == "columpio":
		_columpio_ir()
		return
	var razon: String = Career.house_use_block_reason(String(_use_now["id"]))
	if not razon.is_empty():
		_vaciar_aviso(I18n.t("NO DISPONIBLE"), razon)
		return
	var before: float = Career.energy
	var animo_antes: int = Career.form
	var quien_libre: String = Career.staff_libre(String(_use_now["id"]))
	if not Career.use_house(String(_use_now["id"])):
		return
	UiAudio.click()
	var won: PackedStringArray = []


	if quien_libre == "chef":
		won.append(I18n.t("TU CHEF COCINÓ · SIN GASTAR ACCIÓN"))
	elif quien_libre == "entrenador":
		won.append(I18n.t("CON TU ENTRENADOR · SIN GASTAR ACCIÓN"))
	var got: float = Career.energy - before
	if got > 0.05:
		won.append("+" + String.num(got, 1) + " " + I18n.t("de energía"))
	if Career.form > animo_antes:
		won.append("+%d %s" % [Career.form - animo_antes, I18n.t("de ánimo")])
	if String(_use_now.get("next_match", "")) == Career.HOUSE_TACTICAL_FX:
		won.append(I18n.t("PRECISIÓN +3 · PRÓXIMO PARTIDO"))


	for k in Career.house_use_rel(String(_use_now["id"])):
		won.append(I18n.t(String(k).to_upper()) + " ↑")
	_use_msg.text = " · ".join(won)
	_use_msg.visible = not won.is_empty()
	_use_msg_left = USE_MSG_SECS
	_refresh_use(House.plan_nearest_prop(_plano(), _pos))




	_maybe_act(_use_now)

























const ACT_KINDS: Array = ["cinta", "gimnasio", "cama", "cocina", "piscina",
	"bici_estatica", "tina_hielo", "rincon_lectura", "tele"]


func _maybe_act(uso: Dictionary) -> void:
	var prop: Dictionary = House.plan_nearest_prop(_plano(), _pos)
	if prop.is_empty() or not ACT_KINDS.has(String(prop.get("kind", ""))):
		return
	var acto: HouseAct = HouseAct.new()
	acto.setup(self, prop, _use_msg.text)
	add_child(acto)













func _maybe_surprise_guest() -> void:
	if _guest != null:
		return
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("sorpresa_%d_%d" % [GameState.season_num,
		GameState.season_day])
	var gid: String = ""
	var line: String = ""
	var gf: int = int(GameState.last_match.get("gf", 0))
	var gc: int = int(GameState.last_match.get("gc", 0))
	if not Career.pending_offers.is_empty() and rng.randf() < 0.5:
		gid = "agente"
		line = I18n.t("Tu agente te esperaba: hay ofertas sobre la mesa.")
	elif gf - gc >= 3 and rng.randf() < 0.5:
		gid = "companero"
		line = I18n.t("Un compañero vino a revivir la goleada.")
	elif rng.randf() < 0.12:
		gid = "companero"
		line = I18n.t("Un compañero pasó a saludar.")
	if gid.is_empty():
		return

	var sofa_at: Vector2 = _pos + Vector2(-0.9, 0.3)
	for prop in (_plano()["props"] as Array):
		if String(prop.get("kind", "")) in ["sofa", "sofa_penthouse"]:
			var sr: Rect2 = prop["rect"]
			sofa_at = sr.get_center() + Vector2(0.7, 0.4)
	_spawn_guest(gid, sofa_at)



	if not _guest_socio.is_empty():
		line = I18n.tf("{0} vino a revivir la goleada." if gf - gc >= 3
			else "{0} pasó a saludar.", [_guest_socio])
	_use_msg.text = line
	_use_msg.visible = true
	_use_msg_left = USE_MSG_SECS * 2.0










class TvReplay extends Control:
	var pts: PackedVector2Array = PackedVector2Array()


	var eye_z: float = 16.0
	var _t: float = 0.0
	const LOOP_PAUSE: float = 1.1
	const PLAY_SPEED: float = 22.0

	func _process(delta: float) -> void:
		_t += delta
		queue_redraw()

	func _draw() -> void:
		var w: float = size.x
		var h: float = size.y


		draw_rect(Rect2(0, 0, w, h * 0.42), Color("101820"))
		draw_rect(Rect2(0, h * 0.42, w, h * 0.3), Color("2e5a2e"))
		draw_rect(Rect2(0, h * 0.72, w, h * 0.28), Color("275026"))


		var gl: Vector2 = _proj(Vector3(-3.66, 0.0, 0.0))
		var gr: Vector2 = _proj(Vector3(3.66, 0.0, 0.0))
		var tl: Vector2 = _proj(Vector3(-3.66, 2.44, 0.0))
		var tr_: Vector2 = _proj(Vector3(3.66, 2.44, 0.0))
		var white: Color = Color("e8e8e2")
		draw_line(gl, tl, white, 2.0)
		draw_line(gr, tr_, white, 2.0)
		draw_line(tl, tr_, white, 2.0)

		for i in range(1, 4):
			var k: float = float(i) / 4.0
			draw_line(tl.lerp(tr_, k), gl.lerp(gr, k), Color(1, 1, 1, 0.12), 1.0)
		if pts.is_empty():


			var midy: float = h * 0.6
			var bx: float = fmod(_t * 70.0, w + 40.0) - 20.0
			for i in range(8):
				var tx: float = bx - float(i) * 6.0
				draw_circle(Vector2(tx, midy), 2.0,
					Color(1.0, 1.0, 0.9,(1.0 - float(i) / 8.0) * 0.4))
			draw_circle(Vector2(bx, midy), 3.5, Color("f2f0e8"))
			if fmod(_t, 1.0) < 0.65:
				draw_circle(Vector2(12, 12), 4.0, Color("46c07a"))
			return


		var span: float = float(pts.size() - 1) / PLAY_SPEED
		var cycle: float = fmod(_t, span + LOOP_PAUSE)
		var f: float = clampf(cycle * PLAY_SPEED, 0.0, float(pts.size() - 1))
		var idx: int = int(f)
		for i in range(maxi(0, idx - 10), idx):
			var a: float = 1.0 - float(idx - i) / 10.0
			draw_circle(pts[i], 2.0, Color(1.0, 1.0, 0.9, a * 0.5))
		var ball: Vector2 = pts[idx].lerp(pts[mini(idx + 1, pts.size() - 1)],
			f - float(idx))
		draw_circle(ball, 3.5, Color("f2f0e8"))

		if fmod(_t, 1.0) < 0.65:
			draw_circle(Vector2(12, 12), 4.0, Color("d84040"))



	func _proj(p: Vector3) -> Vector2:
		var eye: Vector3 = Vector3(0.0, 1.6, eye_z)
		var dz: float = maxf(eye.z - p.z, 1.0)
		var fpx: float = size.x * 1.1
		return Vector2(size.x * 0.5 +(p.x - eye.x) * fpx / dz,
			size.y * 0.46 +(eye.y - p.y) * fpx / dz)











var _tv_vivas: int = 0


const TV_VIVAS_MAX: int = 3









func _add_tv_screen(reel: Dictionary, at: Vector3, scr: Vector2,
		along_x: bool, mira: Vector2 = Vector2.ZERO) -> bool:





	if _box_parent == _muebles:
		if _tv_vivas >= TV_VIVAS_MAX:
			return false
		_tv_vivas += 1
	var vp: SubViewport = SubViewport.new()
	vp.size = Vector2i(256, 160)
	vp.disable_3d = true
	vp.render_target_update_mode = SubViewport.UPDATE_ALWAYS
	add_child(vp)
	var tv: TvReplay = TvReplay.new()



	tv.size = Vector2(256, 160)
	vp.add_child(tv)
	var flat: PackedFloat32Array = reel.get("path", PackedFloat32Array())
	for i in range(2, flat.size(), 3):
		tv.eye_z = maxf(tv.eye_z, flat[i] + 4.0)
	for i in range(0, flat.size() - 2, 3):
		tv.pts.append(tv._proj(Vector3(flat[i], flat[i + 1], flat[i + 2])))
	var quad: MeshInstance3D = MeshInstance3D.new()
	var qm: QuadMesh = QuadMesh.new()
	qm.size = scr
	quad.mesh = qm
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = vp.get_texture()
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST

	mat.emission_enabled = true
	mat.emission_energy_multiplier = 0.35
	mat.emission_texture = vp.get_texture()
	mat.emission = Color(1, 1, 1)
	quad.material_override = mat




	if mira != Vector2.ZERO:


		var d: Vector2 = mira.normalized()
		quad.position = at + Vector3(d.x, 0.0, d.y) * 0.06
		quad.rotate_y(atan2(d.x, d.y))
	else:
		var sign: float = -1.0
		if not along_x:
			var room: Dictionary = House.plan_room_at(_plano(),
				Vector2(at.x, at.z) + Vector2(1, 0))
			sign = 1.0 if not room.is_empty() else -1.0
		quad.position = at +(Vector3(0.0, 0.0, sign * 0.06) if along_x
			else Vector3(sign * 0.06, 0.0, 0.0))
		if not along_x:
			quad.rotate_y(deg_to_rad(90.0 * sign))
		elif sign < 0.0:
			quad.rotate_y(deg_to_rad(180.0))



	var padre: Node = _box_parent if _box_parent != null else viewport
	padre.add_child(quad)
	return true








func _moment_cards() -> Array:
	var out: Array = []
	var pres: Dictionary = Career.best_presentation
	if int(pres.get("fans", 0)) > 0:
		out.append({"big": _miles(int(pres["fans"])),
			"small": I18n.t("TU PRESENTACION")})
	var debut: Dictionary = Career.nat_debut
	if not debut.is_empty():
		out.append({"big": I18n.t("DEBUT"),
			"small": I18n.tf("SELECCION T{0}", [int(debut.get("season", 1))])})
	var dist: Dictionary = Career.best_goal_dist
	if float(dist.get("m", 0.0)) > 0.0:
		out.append({"big": "%d m" % int(round(float(dist["m"]))),
			"small": I18n.t("TU MEJOR GOL")})
	var marks: Dictionary = Records.personal(Career.season_history)
	var best_g: Dictionary = marks.get("goals", {})
	if int(best_g.get("v", 0)) > 0:
		out.append({"big": I18n.tf("{0} GOLES", [int(best_g["v"])]),
			"small": I18n.tf("TEMPORADA {0}", [int(best_g.get("season", 1))])})
	if GameState.career_goals >= 50:
		out.append({"big": _miles(GameState.career_goals),
			"small": I18n.t("GOLES DE CARRERA")})
	return out


func _miles(v: int) -> String:
	return I18n.num(v)





const LAMINA_PAPEL: Dictionary = {
	"cartel_partido": Color("15202b"),
	"portada_prensa": Color("e6e0d0"),
	"placa_fichaje": Color("3a3026"),
}
const LAMINA_TINTA: Dictionary = {
	"cartel_partido": Color("e8e2d2"),
	"portada_prensa": Color("1c1a17"),
	"placa_fichaje": Color("d8b25a"),
}


const LAMINA_ORO: Color = Color("d8b25a")









func _lamina_lineas(kind: String) -> Array:
	match kind:
		"cartel_partido":
			return _cartel_lineas()
		"portada_prensa":
			return _portada_lineas()
		"placa_fichaje":
			return _placa_lineas()
	return []





func _cartel_lineas() -> Array:
	var best: Dictionary = Career.season_best
	var temp: int = GameState.season_num
	for row in Career.season_history:
		var bm: Dictionary =(row as Dictionary).get("best_match", {})
		if bm.is_empty():
			continue
		if best.is_empty() or float(bm.get("rating", 0.0)) \
				> float(best.get("rating", 0.0)):
			best = bm
			temp = int((row as Dictionary).get("season", temp))
	if best.is_empty():
		return [{"t": I18n.t("TU MEJOR PARTIDO"), "px": 3},
			{"t": I18n.t("AUN NO SE JUEGA"), "px": 2}]
	var goles: int = int(best.get("goals", 0))




	var rival: String = _club_label(String(best.get("opp", "")))
	return [
		{"t": I18n.tf("VS {0}", [rival]) if not rival.strip_edges().is_empty()
			else I18n.t("TU MEJOR PARTIDO"), "px": 3},
		{"t": I18n.tf("{0} GOLES · NOTA {1}",
			[goles, String.num(float(best.get("rating", 0.0)), 1)]), "px": 2},
		{"t": I18n.tf("TEMPORADA {0}", [temp]), "px": 2},
	]





func _portada_lineas() -> Array:
	var titulo: String = ""
	var temp: int = 0
	var cur: Array = Career.current_season_awards()
	if not cur.is_empty():
		titulo = String(cur[cur.size() - 1])
		temp = GameState.season_num
	else:
		for i in range(Career.season_history.size() - 1, -1, -1):
			var aw: Array =(Career.season_history[i] as Dictionary).get("awards", [])
			if aw.is_empty():
				continue
			titulo = String(aw[aw.size() - 1])
			temp = int((Career.season_history[i] as Dictionary).get("season", 0))
			break
	if titulo.is_empty():
		var casa: String = _club_label(GameState.player_team_id)
		var out: Array = [{"t": I18n.t("\"EL QUE VIENE PISANDO FUERTE\""), "px": 2}]
		if not casa.strip_edges().is_empty():
			out.append({"t": casa, "px": 2})
		return out
	return [
		{"t": "\"" + I18n.t(titulo) + "\"", "px": 3},
		{"t": I18n.tf("TEMPORADA {0}", [temp]), "px": 2},
	]




func _placa_lineas() -> Array:
	if Career.transfers.is_empty():


		var cantera: String = _club_label(GameState.player_team_id)
		if cantera.strip_edges().is_empty():
			return [{"t": I18n.t("DE LA CANTERA"), "px": 3}]
		return [{"t": cantera, "px": 3}, {"t": I18n.t("DE LA CANTERA"), "px": 2}]
	var t: Dictionary = Career.transfers[Career.transfers.size() - 1]
	var fee: int = int(t.get("fee", 0))


	var club: String = _club_label(String(t.get("id", "")))
	return [
		{"t": club if not club.strip_edges().is_empty() else I18n.t("TU FICHAJE"),
			"px": 3},
		{"t": I18n.tf("TEMPORADA {0}", [int(t.get("season", 0))]), "px": 2},
		{"t": I18n.t("LIBRE") if fee <= 0 else CareerUi.money(fee), "px": 2},
	]









func _add_map_lamina(at: Vector3, tam: Vector2, mira: Vector2, paises: Array) -> void:
	var cols: int = MAPA_MUNDI[0].length()
	var filas: int = MAPA_MUNDI.size()
	var w: int = cols * MAPA_ESC
	var alto: int = filas * MAPA_ESC
	var img: Image = Image.create(w, alto, false, Image.FORMAT_RGBA8)
	img.fill(MAPA_MAR)



	for gx in range(0, cols, 8):
		img.fill_rect(Rect2i(gx * MAPA_ESC, 0, 1, alto), MAPA_MERIDIANO)
	for gy in range(0, filas, 4):
		img.fill_rect(Rect2i(0, gy * MAPA_ESC, w, 1), MAPA_MERIDIANO)



	for fy in filas:
		var ln: String = MAPA_MUNDI[fy]
		var abajo: String = MAPA_MUNDI[fy + 1] if fy + 1 < filas else ""
		for fx in cols:
			if ln[fx] != "#":
				continue
			img.fill_rect(Rect2i(fx * MAPA_ESC, fy * MAPA_ESC,
				MAPA_ESC, MAPA_ESC), MAPA_TIERRA)
			if abajo.is_empty() or abajo[fx] != "#":
				img.fill_rect(Rect2i(fx * MAPA_ESC,
					fy * MAPA_ESC + MAPA_ESC - 1, MAPA_ESC, 1), MAPA_COSTA)



	for pais in paises:
		var ll: Vector2 = MAPA_PAIS_LATLON.get(String(pais), Vector2.ZERO)
		if ll == Vector2.ZERO:
			continue
		var px: int = int(round((ll.y + 180.0) / 360.0 * float(w)))
		var py: int = int(round((90.0 - ll.x) / 180.0 * float(alto)))
		px = clampi(px, 2, w - 3)
		py = clampi(py, 2, alto - 3)
		img.fill_rect(Rect2i(px - 2, py - 2, 5, 5), Color("2a1512"))
		img.fill_rect(Rect2i(px - 1, py - 1, 3, 3), Color("c0392b"))
		img.set_pixel(px - 1, py - 1, Color("e8785f"))


	img.fill_rect(Rect2i(0, 0, w, 1), Color("8fb0c2"))
	img.fill_rect(Rect2i(0, alto - 1, w, 1), Color("13242c"))
	var quad: MeshInstance3D = MeshInstance3D.new()
	var qm: QuadMesh = QuadMesh.new()
	qm.size = tam
	quad.mesh = qm
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = ImageTexture.create_from_image(img)
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	quad.material_override = mat
	var d: Vector2 = mira.normalized()
	quad.position = at + Vector3(d.x, 0.0, d.y) * 0.02
	quad.rotate_y(atan2(d.x, d.y))

	var padre: Node = _box_parent if _box_parent != null else viewport
	padre.add_child(quad)

















func _crest_tex() -> Texture2D:
	var clave: String = "%s|%d|%d" % [GameState.player_team_id,
		CrestLogos.count(), CrestLogos.version]
	if clave == _crest_key and _crest_tex_mem != null:
		return _crest_tex_mem
	if _crest_vp != null and is_instance_valid(_crest_vp):
		_crest_vp.queue_free()
	var vp: SubViewport = SubViewport.new()
	vp.size = Vector2i(CREST_PX, CREST_PX)
	vp.transparent_bg = true
	vp.render_target_update_mode = SubViewport.UPDATE_ONCE


	vp.disable_3d = true
	add_child(vp)
	var cv: CrestView = CrestView.new()
	cv.set_anchors_preset(Control.PRESET_FULL_RECT)
	cv.custom_minimum_size = Vector2(CREST_PX, CREST_PX)
	cv.set_team(Teams.by_id(GameState.player_team_id))
	vp.add_child(cv)
	_crest_vp = vp
	_crest_tex_mem = vp.get_texture()
	_crest_key = clave
	return _crest_tex_mem














func _crest_tex_de(team_id: String) -> Texture2D:
	if team_id.is_empty():
		return null
	var clave: String = "%s|%d|%d" % [team_id, CrestLogos.count(),
		CrestLogos.version]
	if _crest_pool.has(clave):
		return _crest_pool[clave]
	var eq: Dictionary = Teams.by_id(team_id)
	if eq.is_empty():
		eq = Nations.as_team(team_id)
	if eq.is_empty():
		return null
	var vp: SubViewport = SubViewport.new()
	vp.size = Vector2i(CREST_PX, CREST_PX)
	vp.transparent_bg = true
	vp.render_target_update_mode = SubViewport.UPDATE_ONCE
	vp.disable_3d = true
	add_child(vp)
	var cv: CrestView = CrestView.new()
	cv.set_anchors_preset(Control.PRESET_FULL_RECT)
	cv.custom_minimum_size = Vector2(CREST_PX, CREST_PX)
	cv.set_team(eq)
	vp.add_child(cv)
	_crest_pool[clave] = vp.get_texture()
	return _crest_pool[clave]





func _add_crest_sprite(at: Vector3, lx: bool, fd: Vector2, alto: float,
		plano: bool = false) -> void:
	var tex: Texture2D = _crest_tex()
	if tex == null:
		return
	var spr: Sprite3D = Sprite3D.new()
	spr.texture = tex
	spr.pixel_size = alto / float(CREST_PX)
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	spr.position = at
	if plano:
		spr.rotate_x(deg_to_rad(-90.0))
	elif not lx:
		spr.rotate_y(deg_to_rad(90.0 * signf(fd.x if fd.x != 0.0 else 1.0)))
	elif fd.y < 0.0:
		spr.rotate_y(deg_to_rad(180.0))


	var padre: Node = _box_parent if _box_parent != null else viewport
	padre.add_child(spr)











func _add_lamina(lineas: Array, at: Vector3, tam: Vector2, mira: Vector2,
		papel: Color, tinta: Color) -> void:
	if lineas.is_empty():
		return



	var w: int = clampi(int(round(tam.x * 110.0)), 48, 320)
	var alto: int = clampi(int(round(tam.y * 110.0)), 24, 320)
	var img: Image = Image.create(w, alto, false, Image.FORMAT_RGBA8)
	img.fill(papel)


	for x in w:
		img.set_pixel(x, 0, tinta.lerp(papel, 0.35))
		img.set_pixel(x, alto - 1, papel.darkened(0.35))



	var pxs: Array = []
	var total: int = 0
	for ln in lineas:
		var txt: String = PixelText.normalize(String((ln as Dictionary)["t"]))
		var px: int = int((ln as Dictionary).get("px", 2))
		while px > 1 and PixelText.text_width(txt, px) > w - 6:
			px -= 1
		pxs.append({"t": txt, "px": px})
		total += PixelText.GLYPH_H * px + 3




	while total > alto - 2:
		var gordo: int = -1
		for i in pxs.size():
			var px3: int = int((pxs[i] as Dictionary)["px"])
			if px3 > 1 and (gordo < 0 or px3 > int((pxs[gordo] as Dictionary)["px"])):
				gordo = i
		if gordo < 0:
			break
		(pxs[gordo] as Dictionary)["px"] = int((pxs[gordo] as Dictionary)["px"]) - 1
		total -= PixelText.GLYPH_H
	var y: int = maxi((alto - total) / 2, 1)



	for i2 in pxs.size():
		var txt2: String = String((pxs[i2] as Dictionary)["t"])
		var px2: int = int((pxs[i2] as Dictionary)["px"])


		var col2: Color = tinta
		if i2 == 0 and papel.get_luminance() < 0.4:
			col2 = LAMINA_ORO
		PixelText.draw_text(img, maxi((w - PixelText.text_width(txt2, px2)) / 2, 2),
			y, txt2, col2, px2)
		y += PixelText.GLYPH_H * px2 + 3
	var quad: MeshInstance3D = MeshInstance3D.new()
	var qm: QuadMesh = QuadMesh.new()
	qm.size = tam
	quad.mesh = qm
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = ImageTexture.create_from_image(img)
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	quad.material_override = mat
	var d: Vector2 = mira.normalized()
	quad.position = at + Vector3(d.x, 0.0, d.y) * 0.02
	quad.rotate_y(atan2(d.x, d.y))


	var padre: Node = _box_parent if _box_parent != null else viewport
	padre.add_child(quad)





func _add_moment_photo(card: Dictionary, at: Vector3, along_x: bool,
		sign: float) -> void:
	var big: String = PixelText.normalize(String(card["big"]))
	var small: String = PixelText.normalize(String(card["small"]))


	var w: int = 104
	var h: int = 128
	var img: Image = Image.create(w, h, false, Image.FORMAT_RGBA8)
	img.fill(Color("241f1a"))

	for x in w:
		img.set_pixel(x, 0, Color("c9a961"))
		img.set_pixel(x, h - 1, Color("6a5a3e"))
	var big_px: int = 3
	while PixelText.text_width(big, big_px) > w - 8 and big_px > 1:
		big_px -= 1
	var small_px: int = 2
	while PixelText.text_width(small, small_px) > w - 8 and small_px > 1:
		small_px -= 1
	PixelText.draw_text(img,(w - PixelText.text_width(big, big_px)) / 2,
		h / 2 - PixelText.GLYPH_H * big_px - 4, big, Color("d8b25a"), big_px)
	PixelText.draw_text(img,(w - PixelText.text_width(small, small_px)) / 2,
		h / 2 + 8, small, Color("e8e2d2"), small_px)
	var quad: MeshInstance3D = MeshInstance3D.new()
	var qm: QuadMesh = QuadMesh.new()
	qm.size = Vector2(0.26, 0.32)
	quad.mesh = qm
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = ImageTexture.create_from_image(img)
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	quad.material_override = mat
	quad.position = at

	if not along_x:
		quad.rotate_y(deg_to_rad(90.0 * sign))
	elif sign < 0.0:
		quad.rotate_y(deg_to_rad(180.0))


	var padre: Node = _box_parent if _box_parent != null else viewport
	padre.add_child(quad)








func _pick_guest() -> void:
	var col: VBoxContainer = CareerUi.modal(self)
	if col == null:
		return
	var title: Label = CareerUi.plain(28, CareerTheme.TEXT)
	title.text = I18n.t("¿A QUIÉN RECIBES?")
	col.add_child(title)
	var hosp: float = House.hospitality(Career.house_level, Career.house_extras)
	var hint: Label = CareerUi.plain(20, Color(1, 1, 1, 0.65))
	hint.text = I18n.tf("Tu casa de hoy rinde {0} de hospitalidad.",
		[String.num(hosp, 1)])


	hint.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	col.add_child(hint)


	for g in House.guests_for(Career.house_level):
		var b: Button = Button.new()
		b.custom_minimum_size = Vector2(0, 96)
		var won: int = Career.projected_delta(String(g["rel"]),
			Career._div_decision_scale(House.guest_value(
				String(g["id"]), Career.house_level, Career.house_extras)))











		var price: int = int(g.get("price", 0))
		var pad: MarginContainer = MarginContainer.new()
		pad.set_anchors_preset(Control.PRESET_FULL_RECT)
		pad.mouse_filter = Control.MOUSE_FILTER_IGNORE
		for side in ["left", "right"]:
			pad.add_theme_constant_override("margin_" + side, 18)
		b.add_child(pad)
		var fila: HBoxContainer = HBoxContainer.new()
		fila.add_theme_constant_override("separation", 14)
		fila.mouse_filter = Control.MOUSE_FILTER_IGNORE
		pad.add_child(fila)
		var nm: Label = CareerUi.plain(24, CareerTheme.TEXT)
		nm.text = I18n.t(String(g["name"]))
		nm.clip_text = true
		nm.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		nm.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		nm.mouse_filter = Control.MOUSE_FILTER_IGNORE
		fila.add_child(nm)
		var gana: Label = CareerUi.plain(22, CareerTheme.MONEY)
		gana.text = I18n.t(CareerTheme.caps(String(g["rel"]))) + " +" + str(won)
		gana.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		gana.mouse_filter = Control.MOUSE_FILTER_IGNORE
		fila.add_child(gana)


		if price > 0:
			var pr: Label = CareerUi.plain(22, CareerTheme.MONEY)
			pr.text = "$ " + CareerUi.money(price)
			pr.size_flags_vertical = Control.SIZE_SHRINK_CENTER
			pr.mouse_filter = Control.MOUSE_FILTER_IGNORE
			fila.add_child(pr)
		CareerTheme.apply_button(b, CareerTheme.Kind.PRIMARY, 24)
		b.disabled = price > 0 and not Career.can_afford(price)
		b.pressed.connect(_receive.bind(String(g["id"]), b))
		col.add_child(b)
	var back: Button = Button.new()
	back.custom_minimum_size = Vector2(0, 88)
	back.text = I18n.t("HOY NO")
	CareerTheme.apply_button(back, CareerTheme.Kind.GHOST, 22)
	back.pressed.connect(func() -> void: CareerUi.close_modal(back))
	_atras_tumbado(back)
	col.add_child(back)


func _receive(gid: String, from: Button) -> void:
	var g: Dictionary = House.guest_by_id(gid)
	var won: int = Career.invite_home(gid)
	CareerUi.close_modal(from)
	if won <= 0 and not Career.house_used_now().has("visita"):
		return
	UiAudio.click()
	_spawn_guest(gid)


	var line: String = I18n.t(String(g.get("line", "")))
	if not _guest_socio.is_empty():
		line = I18n.tf("{0} se queda hasta tarde. El vestuario se entera de cómo vives.",
			[_guest_socio])
	_use_msg.text = line + "  (" \
			+ I18n.t(String(g["rel"]).to_upper()) + " +" + str(won) + ")"
	_use_msg.visible = true
	_use_msg_left = USE_MSG_SECS * 2.0
	_refresh_use(House.plan_nearest_prop(_plano(), _pos))




















func _spawn_guest(gid: String, near: Variant = null) -> void:
	if _guest != null:
		_guest.queue_free()
	_guest = AnimatedSprite3D.new()
	_guest.pixel_size = PLAYER_HEIGHT_M / PLAYER_METRICS.x
	_guest.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	_guest.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	_guest.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	_guest_socio = ""
	var look: Dictionary = {}
	if gid == "companero":
		var plantel: Array = squad_people(GameState.player_team_id, PEOPLE_MAX, true)
		var quien: Dictionary = House.companero_de_visita(plantel,
			Career.socios_top(3), GameState.season_num)
		if bool(quien.get("socio", false)):
			_guest_socio = CareerUi.surname(String(quien.get("name", "")))
		look = person_look(quien, KitRecolor.team_only(GameState.player_kit()))
		_guest.sprite_frames = player_frames(look, "south")
	else:
		look = KitRecolor.appearance_for(
			"visita_%s_%d" % [gid, GameState.season_num], {})
		_guest.sprite_frames = player_frames(look, "south", GUEST_SUIT_SHEET, true)
	var at: Vector2 = _free_near((near if near != null else
		_pos + Vector2(-0.9, 0.3)))




	_guest_ruta = []
	_guest_atasco = 0.0
	if not _cancela.is_empty() and not museo:
		var d: Vector2 = House.plan_door(_plano())
		var calle: Vector2 = _cancela["calle"]
		var hueco: Vector2 = _cancela["hueco"]
		_guest_ruta = [calle + Vector2(4.0, 0.0), calle, Vector2(d.x, hueco.y + 0.1),
			Vector2(d.x, d.y - 0.9), Vector2(d.x, d.y + 0.7), at]
		at = _guest_ruta[0]
		if gid == "companero":
			for dd in WALK_DIRS:
				_walk_dir(_guest, look, 1, String(dd))
		else:
			_guest_walk_gala(look)
	_guest.position = Vector3(at.x,
		feet_offset(_guest.pixel_size) - PLAYER_SINK, at.y)
	_guest.play("idle")
	viewport.add_child(_guest)






















func _fill_exhibit(wall: Array, focus: Dictionary) -> void:
	for child in _shelf_box.get_children():
		_shelf_box.remove_child(child)
		child.queue_free()
	var items: Array = _exhibit_items(wall)
	_pages = maxi(1, int(ceil(float(items.size()) / float(PAGE_ROWS))))
	_page = clampi(_page, 0, _pages - 1)
	_shelf_box.add_child(_exhibit_totals(wall))
	var note: Control = _overflow_note(wall)
	if note != null:
		_shelf_box.add_child(note)



	if wall.is_empty() and not _keeps_prop and Career.vitrina_picks.has(_vitrina_pid):
		var auto: Button = CareerUi.accion("girar", I18n.t("DEJARLA AUTOMÁTICA"),
			UiKit.BTN_BLUE["bg"] as Color)
		auto.pressed.connect(func() -> void:
			Career.clear_vitrina_picks(_vitrina_pid)
			_build_furniture()
			_repage = false
			_shelf_for = "")
		_shelf_box.add_child(auto)
	if items.is_empty():
		var none: Label = CareerUi.plain(20, CareerTheme.TEXT_DIM)
		none.text = I18n.t("Aún no hay nada que exponer")
		none.mouse_filter = Control.MOUSE_FILTER_IGNORE
		_shelf_box.add_child(none)
		return
	if UiKit.es_horizontal():
		var explorar: Button = CareerUi.menu_row(I18n.t("TROFEOS") if wall.is_empty() and not _keeps_prop else I18n.t("HAT-TRICKS") if _keeps_prop else I18n.t("CAMISETAS"), "×%d" % items.size(), CareerTheme.NAV_LEGADO, "vitrina", null, I18n.t("TOCA PARA EXPLORAR"))
		explorar.pressed.connect(func() -> void:
			var modal: VBoxContainer = CareerUi.modal_pantalla(self)
			if modal == null:
				return
			CareerUi.back_button(modal, func() -> void: CareerUi.close_modal(modal))
			_exhibit_selector(modal, items, wall))
		_shelf_box.add_child(explorar)
		return
	var from: int = _page * PAGE_ROWS
	for it in items.slice(from, from + PAGE_ROWS):
		_shelf_box.add_child(_exhibit_row(it as Dictionary, wall))
	if _pages > 1:
		_shelf_box.add_child(_exhibit_pager())




func _exhibit_selector(parent: VBoxContainer, items: Array, wall: Array) -> void:
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 24)
	fila.size_flags_vertical = Control.SIZE_EXPAND_FILL
	parent.add_child(fila)
	var detalle: VBoxContainer = VBoxContainer.new()
	detalle.custom_minimum_size.x = 500.0
	detalle.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	detalle.size_flags_stretch_ratio = 1.0
	detalle.add_theme_constant_override("separation", 18)
	var botones: Array[Button] = []
	var nombres: Array = []
	for i in items.size():
		var item: Dictionary = items[i]
		var texto: String = I18n.t(String(item.get("name", "")))
		if _keeps_prop:
			texto = "T%d · %s" % [int(item.get("season", 0)), String(item.get("club", ""))]
		elif not wall.is_empty() and not (item.get("trade", {}) as Dictionary).is_empty():
			texto = Keepsakes.quien_pintado(item["trade"])
		elif not wall.is_empty():
			texto = Competitions.demarca(String(Teams.by_id(String(item["club"])).get("name", item["club"])))
		nombres.append(texto)
	var limpiar: Callable = func() -> void:
		botones.clear()
		for n in detalle.get_children():
			detalle.remove_child(n)
			n.queue_free()
	var rejilla: GridContainer = SELECTOR_COLECCION.crear(fila, nombres,
		func(i: int, filtrada: bool) -> Control:
			var item: Dictionary = items[i]
			var texto: String =("#%d · " % [i + 1] if filtrada else "") + String(nombres[i])
			var b: Button = _bag_selector(texto, false, func() -> void: pass)
			b.custom_minimum_size = Vector2(170, 72)
			b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
			b.pressed.connect(func() -> void:
				for n in detalle.get_children():
					detalle.remove_child(n)
					n.queue_free()
				var ficha: Control = _exhibit_row(item, wall)
				ficha.size_flags_horizontal = Control.SIZE_EXPAND_FILL
				detalle.add_child(ficha)
				for boton in botones:
					CareerTheme.apply_button(boton, CareerTheme.Kind.PRIMARY if boton == b else CareerTheme.Kind.NEUTRAL, CareerTheme.T_CAPTION))
			botones.append(b)
			return b,
		SELECTOR_COLECCION.columnas(self, 612.0, 170.0), 10, Vector2(170, 72), limpiar)
	rejilla.size_flags_stretch_ratio = 1.6
	fila.add_child(detalle)





func _exhibit_items(wall: Array) -> Array:




	if _keeps_prop:
		var keeps: Array = Career.keepsakes.duplicate()
		keeps.reverse()
		return keeps
	if not wall.is_empty():

		var clubs: Array = []
		for j in wall:
			var jd: Dictionary = j
			clubs.append({"club": String(jd["club"]), "trade": jd.get("trade", {}),
				"number": int(jd.get("number", 0))})
		return clubs
	var cab: Dictionary = Trophies.cabinet(Career.awards)
	var out: Array = []
	out.append_array(cab["team"])
	out.append_array(cab["individual"])





	if _acepta_actual.is_empty():
		return out
	var propios: Array = []
	for it in out:
		for k in (it as Dictionary).get("keys", []):
			if _acepta_actual.has(String(k)):
				propios.append(it)
				break
	return propios





func _exhibit_totals(wall: Array) -> Control:
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 16)
	row.mouse_filter = Control.MOUSE_FILTER_IGNORE
	if _keeps_prop:
		row.add_child(_total_chip(I18n.t("BALONES"),
			Keepsakes.total_of(Career.keepsakes, Keepsakes.BALL)))
		row.add_child(_total_chip(I18n.t("PLAYERAS"),
			Keepsakes.total_of(Career.keepsakes, Keepsakes.SHIRT)))
		return row
	if not wall.is_empty():
		row.add_child(_total_chip(I18n.t("CAMISETAS"), wall.size()))
		row.add_child(_total_chip(I18n.t("CLUBES"),
			CasaFoto.clubes().size()))
		return row
	var cab: Dictionary = Trophies.cabinet(Career.awards)
	var team: int = 0
	var ind: int = 0
	for t in cab["team"]:
		team += int((t as Dictionary)["count"])
	for t in cab["individual"]:
		ind += int((t as Dictionary)["count"])
	row.add_child(_total_chip(I18n.t("TROFEOS"), team + ind))
	row.add_child(_total_chip(I18n.t("EN EQUIPO"), team))
	row.add_child(_total_chip(I18n.t("INDIVIDUALES"), ind))
	return row












func _overflow_note(wall: Array) -> Control:


	if not wall.is_empty():
		return null






	var bolas: int = maxi(0,
		Keepsakes.total_of(Career.keepsakes, Keepsakes.BALL) - _ball_capacity())
	var copas: int = House.plan_display_unplaced(_plano(),
		Trophies.cabinet(Career.awards), Career.trophy_pins, Career.vitrina_picks)
	var faltas: Array = []
	if copas > 0:
		faltas.append([copas, I18n.t("sin sitio · pon otra vitrina o repisa")])
	if bolas > 0:
		faltas.append([bolas, I18n.t("sin sitio · pon otro estante de balones")])
	if faltas.is_empty():
		return null
	if _keeps_prop and faltas.size() > 1:
		faltas.reverse()
	var plate: PanelContainer = CareerUi.plate()
	var box: VBoxContainer = VBoxContainer.new()
	box.add_theme_constant_override("separation", 4)
	box.mouse_filter = Control.MOUSE_FILTER_IGNORE
	plate.add_child(box)
	for f in faltas:
		var row: HBoxContainer = HBoxContainer.new()
		row.add_theme_constant_override("separation", 8)
		row.mouse_filter = Control.MOUSE_FILTER_IGNORE
		box.add_child(row)
		var n: Label = CareerUi.plain(24, CareerTheme.BENCH)
		n.text = str(int((f as Array)[0]))
		n.mouse_filter = Control.MOUSE_FILTER_IGNORE
		row.add_child(n)
		var txt: Label = CareerUi.plain(18, CareerTheme.BENCH)
		txt.text = String((f as Array)[1])
		txt.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		txt.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		txt.clip_text = true
		txt.mouse_filter = Control.MOUSE_FILTER_IGNORE
		row.add_child(txt)






	var pista: Label = CareerUi.plain(18, CareerTheme.BENCH)
	pista.text = I18n.t("Se compran en MI JUGADOR ▸ CASA.")
	pista.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	pista.mouse_filter = Control.MOUSE_FILTER_IGNORE
	box.add_child(pista)
	return plate





func _ball_capacity() -> int:
	var total: int = 0
	for prop in (_plano()["props"] as Array):
		total += _ball_cap_of(prop as Dictionary)
	return total




func _ball_cap_of(prop: Dictionary) -> int:
	if bool(prop.get("guardado", false)):
		return 0
	match String(prop.get("kind", "")):
		"balones":
			return 2 * BALLS_PER_TIER
		"balones_museo":
			return MUSEO_TIERS * MUSEO_PER_TIER
	return 0





func _ball_offset(prop: Dictionary) -> int:
	var mio: String = String(prop.get("id", ""))
	var antes: Array[String] = []
	for p in (_plano()["props"] as Array):
		var pid: String = String((p as Dictionary).get("id", ""))
		if pid != mio and _ball_cap_of(p as Dictionary) > 0:
			antes.append(pid)
	antes.sort()
	var n: int = 0
	for p in (_plano()["props"] as Array):
		var pid: String = String((p as Dictionary).get("id", ""))
		if pid < mio and antes.has(pid):
			n += _ball_cap_of(p as Dictionary)
	return n


func _total_chip(title: String, n: int) -> Control:
	var box: VBoxContainer = VBoxContainer.new()
	box.add_theme_constant_override("separation", 0)
	box.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var t: Label = CareerUi.plain(15, CareerTheme.TEXT_DIM)
	t.text = title
	t.mouse_filter = Control.MOUSE_FILTER_IGNORE
	box.add_child(t)
	var v: Label = CareerUi.plain(28, CareerTheme.MONEY)
	v.text = str(n)
	v.mouse_filter = Control.MOUSE_FILTER_IGNORE
	box.add_child(v)
	return box







func _exhibit_row(it: Dictionary, wall: Array) -> Control:
	var box: VBoxContainer = VBoxContainer.new()
	box.add_theme_constant_override("separation", 4)
	box.mouse_filter = Control.MOUSE_FILTER_IGNORE
	if _keeps_prop:
		box.add_child(_keepsake_row(it))
		return box
	if not wall.is_empty():
		box.add_child(_jersey_row(String(it["club"]), it.get("trade", {}),
			int(it.get("number", 0))))
		return box
	var nm: String = String(it["name"])
	var head: HBoxContainer = HBoxContainer.new()
	head.add_theme_constant_override("separation", 12)
	head.mouse_filter = Control.MOUSE_FILTER_IGNORE
	box.add_child(head)
	var ic: TrophyIcon = TrophyIcon.new()
	ic.custom_minimum_size = Vector2(52, 52)
	ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	ic.mouse_filter = Control.MOUSE_FILTER_IGNORE
	ic.set_type(String(it.get("type", "")))
	head.add_child(ic)
	var title: Label = CareerUi.plain(24, CareerTheme.TEXT)


	title.text = I18n.t(nm)

	if UiKit.es_horizontal() or not _vitrina_pid.is_empty():
		title.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	title.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	title.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	title.mouse_filter = Control.MOUSE_FILTER_IGNORE
	head.add_child(title)
	var n: Label = CareerUi.plain(24, CareerTheme.MONEY)
	n.text = "×%d" % int(it.get("count", 1))
	n.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	n.mouse_filter = Control.MOUSE_FILTER_IGNORE
	head.add_child(n)








	var fijado: bool = Career.trophy_pins.has(nm)
	var pin: Button = Button.new()
	pin.text = "★" if fijado else "☆"
	pin.custom_minimum_size = Vector2(64, 56)
	pin.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	CareerTheme.apply_button(pin,
		CareerTheme.Kind.PRIMARY if fijado else CareerTheme.Kind.GHOST, 24)
	pin.pressed.connect(func() -> void:
		Career.toggle_trophy_pin(nm)



		_build_furniture()
		_repage = false
		_shelf_for = "")

	pin.disabled = visita
	if not _vitrina_pid.is_empty():
		head.add_child(_chip_vitrina(it, wall, box))
	head.add_child(pin)
	var origins: Array = Trophies.provenance(nm,
		Career.season_history, Career.season_awards_now(),
		GameState.player_team_id, GameState.season_num, GameState.player_div())
	var flow: HFlowContainer = HFlowContainer.new()
	flow.add_theme_constant_override("h_separation", 6)
	flow.add_theme_constant_override("v_separation", 4)
	flow.mouse_filter = Control.MOUSE_FILTER_IGNORE
	box.add_child(flow)
	for g in _group_origins(origins):
		flow.add_child(_shelf_stamp(g as Dictionary, nm))
	if origins.is_empty():


		flow.add_child(_shelf_stamp_label(I18n.t("Sin registro del año"),
			CareerTheme.TEXT_DIM))
	return box








func _chip_vitrina(it: Dictionary, wall: Array, box: Control) -> Button:
	var nm: String = String(it["name"])


	var pid: String = _vitrina_pid
	var actuales: Array = []
	for pl in House.shelf_of(_plan, pid):
		if not actuales.has(String(pl["name"])):
			actuales.append(String(pl["name"]))
	var lista: Array = Career.vitrina_picks.get(pid, actuales) as Array
	var aqui: bool = lista.has(nm)
	var rotulo: String = I18n.t("AQUÍ") if aqui \
			else (I18n.t("TRAER AQUÍ") if not Career.vitrina_de(nm).is_empty() else I18n.t("PONER AQUÍ"))
	var chip: Button = CareerUi.icon_chip("vitrina", rotulo, CareerTheme.NAV_LEGADO,
		aqui, func() -> void:
			Career.toggle_vitrina_pick(pid, nm, actuales)

			_build_furniture()
			_repage = false
			_shelf_for = ""


			var padre: Node = box.get_parent()
			if padre != null and padre != _shelf_box:
				var nueva: Control = _exhibit_row(it, wall)
				nueva.size_flags_horizontal = box.size_flags_horizontal
				padre.add_child(nueva)
				padre.move_child(nueva, box.get_index())
				padre.remove_child(box)
				box.queue_free())
	chip.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	return chip








func _jersey_row(club: String, trade: Dictionary = {}, numero: int = 0) -> Control:
	var team: Dictionary = Teams.by_id(club)
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 12)
	row.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var crest: CrestView = CrestView.new()
	crest.custom_minimum_size = Vector2(38, 38)
	crest.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	crest.mouse_filter = Control.MOUSE_FILTER_IGNORE
	crest.set_team(team)
	row.add_child(crest)
	var nm: Label = CareerUi.plain(24, CareerTheme.TEXT)
	nm.text = String(team.get("name", "?")) if trade.is_empty() \
			else Keepsakes.quien_pintado(trade)
	if UiKit.es_horizontal():
		nm.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	else:
		nm.clip_text = true
	nm.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	nm.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	nm.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row.add_child(nm)

	var tag: String = _seasons_tag(CasaFoto.temporadas(club)) if trade.is_empty() \
			else (_seasons_tag([int(trade["season"])]) if int(trade.get("season", 0)) > 0 else "")
	if not tag.is_empty():
		var st: Label = CareerUi.plain(20, CareerTheme.TEXT_DIM)
		st.text = tag
		st.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		st.mouse_filter = Control.MOUSE_FILTER_IGNORE
		row.add_child(st)
	var num: int = CasaFoto.dorsal(club) if trade.is_empty() else numero
	if num > 0:
		var nl: Label = CareerUi.plain(24, CareerTheme.MONEY)
		nl.text = "#%d" % num
		nl.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		nl.mouse_filter = Control.MOUSE_FILTER_IGNORE
		row.add_child(nl)
	return row








func _keepsake_row(k: Dictionary) -> Control:
	var box: VBoxContainer = VBoxContainer.new()
	box.add_theme_constant_override("separation", 2)
	box.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 12)
	row.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var rival: Dictionary = Teams.by_id(String(k.get("rival", "")))




	if rival.is_empty():
		rival = Nations.as_team(String(k.get("rival", "")))
	var crest: CrestView = CrestView.new()
	crest.custom_minimum_size = Vector2(38, 38)
	crest.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	crest.mouse_filter = Control.MOUSE_FILTER_IGNORE
	crest.set_team(rival)
	row.add_child(crest)
	var nm: Label = CareerUi.plain(24, CareerTheme.TEXT)
	var is_ball: bool = String(k.get("kind", "")) == Keepsakes.BALL
	if is_ball:



		var gl: int = int(k.get("goals", 3))
		nm.text = I18n.tf(Keepsakes.feat_label(gl), [str(gl)])


		if Keepsakes.is_socio(k):
			nm.text = "%s · %s" % [nm.text, CareerTheme.caps(Competitions.demarca(
				Career.espalda_de(String(k.get("socio", "")))))]
	else:





		var who: String = Keepsakes.quien_pintado(k)
		var num: int = int(k.get("who_num", 0))
		nm.text = "%s #%d" % [who, num] if num > 0 else who


	nm.clip_text = true
	if UiKit.es_horizontal():
		nm.clip_text = false
		nm.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	nm.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	nm.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	nm.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row.add_child(nm)


	var pair: Array = Keepsakes.score_pair(k)
	var sc: Label = CareerUi.plain(24, CareerTheme.MONEY \
			if Keepsakes.was_win(k) else CareerTheme.TEXT_DIM)
	sc.text = "%d-%d" % [int(pair[0]), int(pair[1])]
	sc.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	sc.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row.add_child(sc)
	box.add_child(row)
	var sub: Label = CareerUi.plain(18, CareerTheme.TEXT_DIM)


	var name_r: String = Nations.team_label(rival)










	var torneo: String = Competitions.comp_name(
		Competitions.id_of(Keepsakes.fixture_of(k)))





	if Keepsakes.is_nat(k):
		var rnd: String = String(k.get("round", ""))
		if rnd == Keepsakes.NAT_FRIENDLY:
			torneo = I18n.t("AMISTOSO")
		elif rnd != "qual":
			torneo = NatTeam.tournament_name(
				int(k.get("season", 1)), String(k.get("club", "")))





	sub.text = "%s · %s · %s" % [
		I18n.tf("T{0}", [str(int(k.get("season", 1)))]), torneo, name_r]
	sub.clip_text = true
	if UiKit.es_horizontal():
		sub.clip_text = false
		sub.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	sub.mouse_filter = Control.MOUSE_FILTER_IGNORE
	box.add_child(sub)
	return box





func _exhibit_pager() -> Control:
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 12)
	row.alignment = BoxContainer.ALIGNMENT_CENTER
	row.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row.add_child(_page_btn("‹", -1))
	var lbl: Label = CareerUi.plain(20, CareerTheme.TEXT_DIM)
	lbl.text = "%d / %d" % [_page + 1, _pages]
	lbl.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	lbl.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row.add_child(lbl)
	row.add_child(_page_btn("›", 1))
	return row


func _page_btn(text: String, step: int) -> Button:
	var b: Button = Button.new()
	b.text = text
	b.custom_minimum_size = Vector2(96, 64)
	CareerTheme.apply_button(b, CareerTheme.Kind.GHOST, 26)
	b.pressed.connect(func() -> void:


		_page =(_page + step + _pages) % _pages


		_repage = false
		_shelf_for = "")
	return b











func _place_focus_halo(focus: Dictionary) -> void:
	if _focus_halo == null:
		var m: MeshInstance3D = MeshInstance3D.new()
		var cyl: CylinderMesh = CylinderMesh.new()


		cyl.top_radius = 0.15
		cyl.bottom_radius = 0.15
		cyl.height = 0.01
		cyl.radial_segments = 16
		cyl.rings = 0
		var mat: StandardMaterial3D = StandardMaterial3D.new()
		mat.albedo_color = Color(CareerTheme.MONEY.r, CareerTheme.MONEY.g,
			CareerTheme.MONEY.b, 0.5)
		mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
		mat.emission_enabled = true
		mat.emission = CareerTheme.MONEY
		mat.emission_energy_multiplier = 1.6
		mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
		cyl.material = mat
		m.mesh = cyl
		m.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		var padre: Node = _box_parent if _box_parent != null else viewport
		padre.add_child(m)
		_focus_halo = m
	if focus.is_empty() or not focus.has("pos"):
		_focus_halo.visible = false
		return




	var pid: String = String(focus.get("prop_id", ""))
	var top: float = 0.8
	for prop in (_plano()["props"] as Array):
		if String((prop as Dictionary).get("id", "")) != pid:
			continue
		var k: String = String((prop as Dictionary).get("kind", ""))
		top = float((PROP_LOOK.get(k, {}) as Dictionary).get(
			"top", House.prop_alto(k)))
		break
	var fp: Vector2 = focus["pos"]
	_focus_halo.position = Vector3(fp.x,
		top + float(int(focus.get("tier", 0))) * House.TIER_H + 0.05, fp.y)
	_focus_halo.visible = true


func _focus_trophy(shelf: Array) -> Dictionary:
	var best: Dictionary = {}
	var best_d: float = INF
	for p in shelf:
		var d: float =(Vector2(p["pos"]) - _pos).length()
		if d < best_d:
			best_d = d
			best = p
	if best.is_empty():
		return {}






	return {"name": String(best["name"]), "type": String(best.get("type", "")),
		"count": int(best.get("count", 1)), "pos": Vector2(best["pos"]),
		"prop_id": String(best.get("prop_id", "")), "tier": int(best.get("tier", 0))}



func _page_of(focus: Dictionary, items: Array) -> int:
	var nm: String = String(focus.get("name", ""))
	if nm.is_empty():
		return _page
	for i in items.size():
		if String((items[i] as Dictionary).get("name", "")) == nm:
			return i / PAGE_ROWS
	return _page
















const MAX_STAMPS: int = 8


func _group_origins(origins: Array) -> Array:
	var by_key: Dictionary = {}
	var order: Array = []
	for o in origins:
		var d: Dictionary = o as Dictionary
		var k: String = "%d|%s|%d" % [int(d.get("season", 0)),
			String(d.get("club", "")), int(d.get("div", 0))]
		if not by_key.has(k):
			var copy: Dictionary = d.duplicate()
			copy["veces"] = 0
			by_key[k] = copy
			order.append(k)
		(by_key[k] as Dictionary)["veces"] = \
				int((by_key[k] as Dictionary)["veces"]) + 1
	var out: Array = []
	for k in order:
		out.append(by_key[k])
	if out.size() <= MAX_STAMPS:
		return out
	var extra: int = out.size() - MAX_STAMPS
	out = out.slice(0, MAX_STAMPS)
	out.append({"mas": extra})
	return out





func _shelf_stamp(o: Dictionary, nm: String) -> Control:
	var parts: Array = []

	if o.has("mas"):
		parts.append(_shelf_stamp_label(
			I18n.tf("+{0} más", [int(o["mas"])]), CareerTheme.TEXT_DIM))
		return _shelf_stamp_box(parts)
	parts.append(_shelf_stamp_label(
		I18n.tf("T{0}", [int(o.get("season", 0))]), CareerTheme.accent_text()))
	if Trophies.is_national(nm):


		parts.append(Flags.make_rect(Career.nationality, 16.0))
		parts.append(_shelf_stamp_label(
			CareerTheme.caps(Nations.display_name(Career.nationality)), CareerTheme.TEXT))
	else:
		var team: Dictionary = Teams.by_id(String(o.get("club", "")))
		if not team.is_empty():
			var crest: CrestView = CrestView.new()
			crest.custom_minimum_size = Vector2(20, 20)
			crest.size_flags_vertical = Control.SIZE_SHRINK_CENTER
			crest.set_team(team)
			parts.append(crest)
			parts.append(_shelf_stamp_label(
				String(team.get("name", "?")), CareerTheme.TEXT))
	var div: int = int(o.get("div", 0))
	if div > 0 and Trophies.div_matters(nm):

		parts.append(_shelf_stamp_label(Teams.div_short(div),
			CareerTheme.TEXT_DIM))



	var veces: int = int(o.get("veces", 1))
	if veces > 1:
		parts.append(_shelf_stamp_label("×%d" % veces, CareerTheme.MONEY))
	return _shelf_stamp_box(parts)






func _shelf_stamp_label(text: String, color: Color) -> Label:
	var l: Label = CareerUi.plain(17, color)
	l.text = text
	l.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	return l






func _shelf_stamp_box(parts: Array) -> PanelContainer:
	var p: PanelContainer = PanelContainer.new()
	p.add_theme_stylebox_override("panel",
		CareerTheme.tag(Color(1, 1, 1, 0.06)))
	p.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var h: HBoxContainer = HBoxContainer.new()
	h.add_theme_constant_override("separation", 6)
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	p.add_child(h)
	for part in parts:
		var ctl: Control = part as Control
		ctl.mouse_filter = Control.MOUSE_FILTER_IGNORE
		h.add_child(ctl)
	return p



















func _desarma_vender(boton: Variant, armado: Array, vale: int) -> void:
	if not is_instance_valid(boton) or not armado[0]:
		return
	var v: Button = boton as Button
	if v.is_pressed() and _vende_manteniendo() and v.is_inside_tree():
		SceneFade.timer(VENDER_HOLD_S).timeout.connect(
			_desarma_vender.bind(v, armado, vale))
		return
	armado[0] = false
	CareerUi.pinta_accion(v, "moneda", I18n.tf("VENDER {0}", [CareerUi.money(vale)]),
		CareerTheme.DANGER, false)



























const BALL_CREST: float = 0.5

func _add_ball_crest(k: Dictionary, x: float, balda: float, z: float,
		padre: Node) -> void:
	var tex: Texture2D = _crest_tex_de(String(k.get("rival", "")))
	if tex == null:
		return
	var chapa: Sprite3D = Sprite3D.new()
	chapa.texture = tex
	chapa.pixel_size = BALL_M * BALL_CREST / float(CREST_PX)
	chapa.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	chapa.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	chapa.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD

















	chapa.position = Vector3(x, balda + BALL_M * 0.21, z - BALL_M * 0.52)
	padre.add_child(chapa)







func _pregunta_volver() -> void:









	Career.queue_ceremony(Ceremonies.VUELTA)
	SceneFade.to_scene("res://ui/ceremonies/vuelta.tscn")



















func _build_fans() -> void:
	for f in _fans:
		var spr0: Variant =(f as Dictionary).get("spr")
		if spr0 != null and is_instance_valid(spr0):
			(spr0 as Node).queue_free()
	_fans = []
	_fan_puestos = []
	var props: Array = _plano()["props"] as Array



	for prop in props:
		if String((prop as Dictionary).get("kind", "")) == Museo.KIND_FAN:
			_fan_puestos.append(((prop as Dictionary)["rect"] as Rect2).get_center())
	var i: int = 0
	for prop in props:
		var p: Dictionary = prop as Dictionary
		if String(p.get("kind", "")) != Museo.KIND_FAN:
			continue
		var look: String = FAN_LOOKS[i % FAN_LOOKS.size()]
		var spr: AnimatedSprite3D = AnimatedSprite3D.new()




		spr.pixel_size = Ceremony.PAREJA_PIXEL if look.begins_with("mujer") \
				else PLAYER_HEIGHT_M / PLAYER_METRICS.x

		spr.speed_scale = 0.9 + 0.05 * float(i % 5)
		spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
		spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD


		spr.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		var at: Vector2 =(p["rect"] as Rect2).get_center()
		spr.position = Vector3(at.x, feet_offset(spr.pixel_size) - PLAYER_SINK, at.y)
		viewport.add_child(spr)
		var fan: Dictionary = {
			"spr": spr, "prop": p, "pos": at, "look": look,
			"destino": at, "espera": 0.0,
			"anim": "", "dir": "south", "tinte": _fan_tinte(i),
		}
		_fans.append(fan)





		if randf() < 0.5:
			fan["destino"] = _otro_puesto(at)


			_fan_adelanta(fan, 0.15 + randf() * 0.7)
		elif _fan_mira_su_pieza(fan):
			fan["espera"] = randf() * 9.0
		else:


			fan["destino"] = _otro_puesto(at)
			_fan_adelanta(fan, 0.15 + randf() * 0.7)
		i += 1



func _tick_fans(delta: float) -> void:
	var pl: Dictionary = _plano()
	for f in _fans:
		var fan: Dictionary = f as Dictionary
		var spr: AnimatedSprite3D = fan["spr"]
		if not is_instance_valid(spr):
			continue
		if float(fan["espera"]) > 0.0:
			fan["espera"] = float(fan["espera"]) - delta
			_pon_frames(fan, "idle", String(fan["dir"]))
			continue
		var pos: Vector2 = fan["pos"]
		var destino: Vector2 = fan["destino"]
		if pos.distance_to(destino) < 0.18:







			fan["destino"] = _otro_puesto(destino)
			fan["espera"] =(3.0 + randf() * 11.0) if _fan_mira_su_pieza(fan) else 0.0
			continue




		var prop: Dictionary = fan["prop"]
		prop["guardado"] = true
		var paso: Vector2 =(destino - pos).normalized() * FAN_VEL * delta
		var nuevo: Vector2 = House.plan_move(pl, pos, paso, Museo.FAN_R)
		prop["guardado"] = false
		if nuevo.distance_to(pos) < FAN_VEL * delta * 0.25:





			fan["destino"] = _otro_puesto(destino)
			fan["espera"] =(0.5 + randf()) if _fan_mira_su_pieza(fan) else 0.0
			continue
		fan["pos"] = nuevo


		var r: Rect2 = prop["rect"]
		r.position = nuevo - Vector2(Museo.FAN_R, Museo.FAN_R)
		prop["rect"] = r
		spr.position = Vector3(nuevo.x, spr.position.y, nuevo.y)
		_pon_frames(fan, "walk", _dir_de(nuevo - pos))














func _fan_mira_su_pieza(fan: Dictionary) -> bool:
	var pos: Vector2 = fan["pos"]
	var mejor: float = FAN_MIRA_R * FAN_MIRA_R
	var hacia: Vector2 = Vector2.ZERO
	for prop in (_plano()["props"] as Array):
		var p: Dictionary = prop as Dictionary
		if String(p.get("kind", "")) == Museo.KIND_FAN:
			continue
		var v: Vector2 =(p["rect"] as Rect2).get_center() - pos
		var d2: float = v.length_squared()
		if d2 < mejor and d2 > 0.0001:
			mejor = d2
			hacia = v
	if hacia == Vector2.ZERO:
		return false
	_pon_frames(fan, "idle", _dir_de(hacia))
	return true





const FAN_MIRA_R: float = 4.0





func _fan_adelanta(fan: Dictionary, frac: float) -> void:
	var pl: Dictionary = _plano()
	var prop: Dictionary = fan["prop"]
	var destino: Vector2 = fan["destino"]
	var pos: Vector2 = fan["pos"]
	var total: float = pos.distance_to(destino) * clampf(frac, 0.0, 0.9)
	if total < 0.2:
		return
	prop["guardado"] = true
	var andado: float = 0.0
	while andado < total:
		var paso: Vector2 =(destino - pos).normalized() * 0.25
		var nuevo: Vector2 = House.plan_move(pl, pos, paso, Museo.FAN_R)
		if nuevo.distance_to(pos) < 0.02:
			break
		andado += nuevo.distance_to(pos)
		pos = nuevo
	prop["guardado"] = false
	fan["pos"] = pos
	var r: Rect2 = prop["rect"]
	r.position = pos - Vector2(Museo.FAN_R, Museo.FAN_R)
	prop["rect"] = r
	var spr: AnimatedSprite3D = fan["spr"]
	spr.position = Vector3(pos.x, spr.position.y, pos.y)
	_pon_frames(fan, "walk", _dir_de(destino - pos))


	if spr.sprite_frames != null:
		spr.frame = randi() % maxi(spr.sprite_frames.get_frame_count("idle"), 1)




func _otro_puesto(actual: Vector2) -> Vector2:
	if _fan_puestos.size() <= 1:
		return actual
	for intento in 6:
		var q: Vector2 = _fan_puestos[randi() % _fan_puestos.size()]
		if q.distance_to(actual) > 1.0:
			return q
	return actual











func _dir_de(v: Vector2) -> String:
	return walk_dir_name(Vector3(v.x, 0.0, v.y))





func _pon_frames(fan: Dictionary, anim: String, dir: String) -> void:
	if String(fan["anim"]) == anim and String(fan["dir"]) == dir:
		return
	var frames: SpriteFrames = _fan_frames(String(fan["look"]), anim, dir,
		fan["tinte"] as Dictionary)
	if frames == null:
		return
	fan["anim"] = anim
	fan["dir"] = dir
	var spr: AnimatedSprite3D = fan["spr"]
	spr.sprite_frames = frames
	spr.play("idle")















func _fan_tinte(i: int) -> Dictionary:






	var base: Dictionary = {
		"casual_shirt": KitRecolor.CASUAL_SHIRTS[
			(i * 3 + 1) % KitRecolor.CASUAL_SHIRTS.size()],
		"casual_pants": KitRecolor.CASUAL_PANTS[
			(i * 2) % KitRecolor.CASUAL_PANTS.size()],
	}
	var cfg: Dictionary = KitRecolor.casual_of(base)


	cfg["skin"] = KitRecolor.SKIN_TONES[(i * 5) % KitRecolor.SKIN_TONES.size()]
	cfg["hair"] = KitRecolor.HAIR_COLORS[(i * 3) % KitRecolor.HAIR_COLORS.size()]

	return KitRecolor.sin_pelirrojo_oscuro(cfg)






static var _fan_frames_mem: Dictionary = {}


func _fan_frames(look: String, anim: String, dir: String,
		tinte: Dictionary) -> SpriteFrames:





	var key: String = "%s|%s|%s|%s|%s|%s|%s|%s|%s" % [look, anim, dir,
		str(tinte.get("skin", Color.WHITE)), str(tinte.get("hair", Color.WHITE)),
		str(tinte.get("kit", Color.WHITE)), str(tinte.get("long_pants", Color.WHITE)),
		str(tinte.get("kit_b", Color.WHITE)), str(tinte.get("pattern", "solid"))]
	if _fan_frames_mem.has(key):
		return _fan_frames_mem[key]
	var frames: SpriteFrames = SpriteFrames.new()
	frames.add_animation("idle")
	frames.set_animation_loop("idle", true)
	frames.set_animation_speed("idle", 4.5 if anim == "idle" else 9.0)
	var n: int = 0
	for i in 8:



		var path: String = ""
		if look.is_empty():
			path =("res://assets/sprites/anim/walk_player_%s_%02d.png" % [dir, i + 1]) \
					if anim == "walk" \
					else ("res://assets/sprites/anim/idle_%s_%02d.png" % [dir, i])
		else:
			path = "res://assets/sprites/anim/%s_%s_%s_%02d.png" % [look, anim, dir, i]
		if not ResourceLoader.exists(path):
			break
		frames.add_frame("idle", KitRecolor.apply(load(path), tinte))
		n += 1
	if n == 0:


		_fan_frames_mem[key] = null
		return null
	_fan_frames_mem[key] = frames
	return frames




var _acepta_actual: Array = []


var _vitrina_pid: String = ""

























const FAN_LOOKS: Array[String] = [
	"", "mujer_look_blusa", "", "mujer_look_cuero",
	"", "mujer_look_jersey", "mujer_look_camisa",
]


const FAN_VEL: float = 0.85

var _fans: Array = []

var _fan_puestos: Array = []














func _add_museo_escudos() -> void:
	var clubes: Array = []
	for h in Career.season_history:
		var cid: String = String((h as Dictionary).get("club", ""))
		if not cid.is_empty() and not clubes.has(cid):
			clubes.append(cid)


	if not GameState.player_team_id.is_empty() \
			and not clubes.has(GameState.player_team_id):
		clubes.append(GameState.player_team_id)
	if clubes.is_empty():
		return






	var nave: Rect2 = Museo.VESTIBULO
	for r in (_plano()["rooms"] as Array):
		if String((r as Dictionary).get("id", "")) == "nave":
			nave =(r as Dictionary)["rect"] as Rect2


	var z0: float = nave.position.y + 1.6
	var z1: float = nave.end.y - 1.6
	var pais: String = Career.nationality if Career.nat_caps > 0 else ""
	var total: int = clubes.size() +(1 if not pais.is_empty() else 0)

	var paso: float =(z1 - z0) / float(maxi(total - 1, 1))


	var lado: float = clampf(minf(paso * 0.82, 2.1), 0.8, 2.1)





	for i in total:
		var es_pais: bool = not pais.is_empty() and i == clubes.size()
		var tex: Texture2D = Flags.texture(pais) if es_pais \
				else _crest_tex_de(String(clubes[i]))
		if tex == null:
			continue
		var quad: MeshInstance3D = MeshInstance3D.new()
		var qm: QuadMesh = QuadMesh.new()
		qm.size = Vector2(lado, lado)
		quad.mesh = qm
		var mat: StandardMaterial3D = StandardMaterial3D.new()
		mat.albedo_texture = tex
		mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
		mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST



		mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA_SCISSOR
		mat.alpha_scissor_threshold = 0.5
		quad.material_override = mat
		quad.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF








		quad.rotation_degrees = Vector3(-90.0, 180.0, 0.0)
		var z: float = z0 + paso * float(i) if total > 1 else (z0 + z1) * 0.5
		quad.position = Vector3(nave.get_center().x, 0.02, z)
		_planta.add_child(quad)




		var etiqueta: String = ""
		if es_pais:
			etiqueta = "%d" % Career.nat_caps
		else:
			for h in Career.season_history:
				var f: Dictionary = h as Dictionary
				if String(f.get("club", "")) == String(clubes[i]) \
						and int(f.get("number", 0)) > 0:
					etiqueta = "%d" % int(f["number"])
					break
		if etiqueta.is_empty():
			continue
		var placa: MeshInstance3D = _placa_suelo(etiqueta, lado * 0.42)
		if placa != null:
			placa.position = Vector3(nave.get_center().x + lado * 0.85, 0.02, z)
			_planta.add_child(placa)







func _placa_suelo(texto: String, alto: float) -> MeshInstance3D:
	var px: int = 4
	var ancho_px: int = PixelText.text_width(texto, px)
	if ancho_px <= 0:
		return null
	var img: Image = Image.create(ancho_px + 8, PixelText.GLYPH_H * px + 8,
		false, Image.FORMAT_RGBA8)
	img.fill(Color(0, 0, 0, 0))


	PixelText.draw_text(img, 4, 4, texto, Color("caa04e"), px)
	var quad: MeshInstance3D = MeshInstance3D.new()
	var qm: QuadMesh = QuadMesh.new()
	qm.size = Vector2(alto * float(img.get_width()) / float(img.get_height()), alto)
	quad.mesh = qm
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = ImageTexture.create_from_image(img)
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA_SCISSOR
	mat.alpha_scissor_threshold = 0.5
	quad.material_override = mat
	quad.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	quad.rotation_degrees = Vector3(-90.0, 180.0, 0.0)
	return quad
