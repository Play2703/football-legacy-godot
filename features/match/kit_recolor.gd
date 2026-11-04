class_name KitRecolor
extends RefCounted





















































const REF_KIT: Color = Color("05a6e9")
const REF_KIT2: Color = Color("fbfafa")
const REF_SKIN: Color = Color("fcb49e")
const REF_HAIR: Color = Color("090603")


const HEAD_FRAC: float = 0.3



















const KIT_COLORS: Array[Color] = [
	Color("f5f5f5"), Color("d9d9de"), Color("9a9aa4"), Color("4a4a55"),
	Color("1c1c22"), Color("f0e4c8"),
	Color("c8102e"), Color("8e1420"), Color("ee7f00"), Color("ffc72c"),
	Color("ffe667"), Color("7a5c12"),
	Color("0b8a3c"), Color("14532d"), Color("2fbf71"), Color("00a3a3"),
	Color("05a6e9"), Color("1d74d0"),
	Color("133a7c"), Color("0a2340"), Color("5b2ea6"), Color("a50044"),
	Color("d94f97"), Color("7b3f2e"),
]






















const LOOK_REGION_ODDS: Dictionary = {
	"europa_nor": {
		"skin": [31, 31, 14, 8, 10, 6],
		"hair": [8, 14, 34, 20, 18, 5, 1],
	},
	"europa_mixta": {
		"skin": [17, 20, 15, 13, 19, 16],
		"hair": [22, 28, 28, 10, 8, 3, 1],
	},
	"europa_sur": {
		"skin": [17, 25, 30, 14, 10, 4],
		"hair": [17, 25, 37, 12, 5, 3, 1],
	},
	"europa_este": {
		"skin": [26, 32, 20, 10, 8, 4],
		"hair": [10, 17, 40, 16, 12, 4, 1],
	},
	"magreb_oriente": {
		"skin": [7, 20, 34, 22, 12, 5],
		"hair": [22, 34, 32, 6, 3, 2, 1],
	},
	"africa_sub": {
		"skin": [2, 4, 8, 16, 34, 36],
		"hair": [46, 43, 6, 2, 1, 1, 1],
	},
	"asia_este": {
		"skin": [14, 30, 30, 15, 8, 3],
		"hair": [45, 44, 6, 2, 1, 1, 1],
	},
	"asia_sur": {
		"skin": [3, 8, 24, 30, 24, 11],
		"hair": [40, 46, 9, 2, 1, 1, 1],
	},
	"latam_mestiza": {
		"skin": [8, 20, 33, 23, 11, 5],
		"hair": [36, 38, 18, 4, 2, 1, 1],
	},
	"cono_sur": {
		"skin": [22, 32, 26, 12, 5, 3],
		"hair": [22, 26, 34, 10, 5, 2, 1],
	},
	"brasil": {
		"skin": [11, 18, 22, 21, 17, 11],
		"hair": [32, 34, 22, 6, 3, 2, 1],
	},
	"caribe": {
		"skin": [3, 6, 12, 20, 30, 29],
		"hair": [42, 42, 9, 3, 2, 1, 1],
	},
	"anglo_nuevo": {
		"skin": [24, 25, 17, 12, 13, 9],
		"hair": [12, 19, 35, 15, 13, 5, 1],
	},
	"pacifico": {
		"skin": [2, 5, 14, 27, 30, 22],
		"hair": [38, 40, 12, 4, 4, 1, 1],
	},
	"global": {
		"skin": [14, 20, 22, 18, 15, 11],
		"hair": [26, 32, 24, 9, 5, 3, 1],
	},
}


const NAT_REGION: Dictionary = {
	"Alemania": "europa_nor", "Inglaterra": "europa_nor", "irl": "europa_nor",
	"nir": "europa_nor", "sco": "europa_nor", "wal": "europa_nor", "isl": "europa_nor",
	"fin": "europa_nor", "swe": "europa_nor", "NOR": "europa_nor", "din": "europa_nor",
	"aut": "europa_nor", "sui": "europa_nor", "lux": "europa_nor", "fro": "europa_nor",
	"liec": "europa_nor",
	"FRA": "europa_mixta", "ned": "europa_mixta", "bel": "europa_mixta",
	"España": "europa_sur", "Italia": "europa_sur", "Portugal": "europa_sur", "gre": "europa_sur",
	"mlt": "europa_sur", "cyp": "europa_sur", "smr": "europa_sur", "andr": "europa_sur",
	"gib": "europa_sur",
	"pol": "europa_este", "cze": "europa_este", "svk": "europa_este", "hun": "europa_este",
	"rou": "europa_este", "bul": "europa_este", "srb": "europa_este", "cro": "europa_este",
	"svn": "europa_este", "bih": "europa_este", "mne": "europa_este", "mkd": "europa_este",
	"alba": "europa_este", "kos": "europa_este", "ukr": "europa_este", "rus": "europa_este",
	"blr": "europa_este", "mda": "europa_este", "ltu": "europa_este", "lva": "europa_este",
	"esto": "europa_este", "geo": "europa_este", "arm": "europa_este",
	"MAR": "magreb_oriente", "alg": "magreb_oriente", "tun": "magreb_oriente",
	"lby": "magreb_oriente", "egy": "magreb_oriente", "tur": "magreb_oriente",
	"irn": "magreb_oriente", "irq": "magreb_oriente", "syr": "magreb_oriente",
	"lbn": "magreb_oriente", "jor": "magreb_oriente", "pse": "magreb_oriente",
	"isr": "magreb_oriente", "ksa": "magreb_oriente", "qat": "magreb_oriente",
	"uae": "magreb_oriente", "kuw": "magreb_oriente", "bhr": "magreb_oriente",
	"omn": "magreb_oriente", "yem": "magreb_oriente", "uzb": "magreb_oriente",
	"kaz": "magreb_oriente", "kgz": "magreb_oriente", "tjk": "magreb_oriente",
	"tkm": "magreb_oriente", "afg": "magreb_oriente", "aze": "magreb_oriente",
	"nga": "africa_sub", "sen": "africa_sub", "gha": "africa_sub", "civ": "africa_sub",
	"cmr": "africa_sub", "mli": "africa_sub", "bfa": "africa_sub", "gin": "africa_sub",
	"cod": "africa_sub", "cog": "africa_sub", "zam": "africa_sub", "agl": "africa_sub",
	"rsa": "africa_sub", "cpv": "africa_sub", "gab": "africa_sub", "uga": "africa_sub",
	"ken": "africa_sub", "zim": "africa_sub", "moz": "africa_sub", "bni": "africa_sub",
	"tog": "africa_sub", "sdn": "africa_sub", "mad": "africa_sub", "gam": "africa_sub",
	"tan": "africa_sub", "nam": "africa_sub", "nig": "africa_sub", "cta": "africa_sub",
	"sle": "africa_sub", "rwa": "africa_sub", "bdi": "africa_sub", "bots": "africa_sub",
	"eth": "africa_sub", "lbr": "africa_sub", "chad": "africa_sub", "mtn": "africa_sub",
	"comr": "africa_sub", "mwi": "africa_sub", "gnb": "africa_sub", "les": "africa_sub",
	"swz": "africa_sub", "ssd": "africa_sub", "mri": "africa_sub", "stp": "africa_sub",
	"dji": "africa_sub", "som": "africa_sub", "sey": "africa_sub", "eri": "africa_sub",
	"eqg": "africa_sub",
	"jpn": "asia_este", "kor": "asia_este", "prk": "asia_este", "chn": "asia_este",
	"tpe": "asia_este", "hkg": "asia_este", "mac": "asia_este", "mng": "asia_este",
	"vie": "asia_este", "tha": "asia_este", "mas": "asia_este", "sgp": "asia_este",
	"idn": "asia_este", "fil": "asia_este", "camb": "asia_este", "lao": "asia_este",
	"mya": "asia_este", "bru": "asia_este", "tls": "asia_este",
	"idi": "asia_sur", "pak": "asia_sur", "bang": "asia_sur", "sri": "asia_sur",
	"nep": "asia_sur", "bhu": "asia_sur", "mdv": "asia_sur",
	"México": "latam_mestiza", "gtm": "latam_mestiza", "slv": "latam_mestiza",
	"hon": "latam_mestiza", "nca": "latam_mestiza", "crc": "latam_mestiza",
	"pan": "latam_mestiza", "col": "latam_mestiza", "VEN": "latam_mestiza",
	"ecu": "latam_mestiza", "per": "latam_mestiza", "bov": "latam_mestiza",
	"PAR": "latam_mestiza",
	"arg": "cono_sur", "uru": "cono_sur", "chi": "cono_sur",
	"BRA": "brasil",
	"jam": "caribe", "hai": "caribe", "tto": "caribe", "cub": "caribe", "dom": "caribe",
	"pur": "caribe", "cuw": "caribe", "aru": "caribe", "bhs": "caribe", "brb": "caribe",
	"grn": "caribe", "lca": "caribe", "vin": "caribe", "dma": "caribe", "atg": "caribe",
	"skn": "caribe", "msr": "caribe", "aia": "caribe", "cay": "caribe", "tca": "caribe",
	"vgb": "caribe", "vir": "caribe", "ber": "caribe", "blz": "caribe", "guy": "caribe",
	"sur": "caribe",
	"usa": "anglo_nuevo", "can": "anglo_nuevo", "aus": "anglo_nuevo", "nzl": "anglo_nuevo",
	"ncal": "pacifico", "sol": "pacifico", "fij": "pacifico", "tah": "pacifico",
	"van": "pacifico", "png": "pacifico", "samo": "pacifico", "tga": "pacifico",
	"cok": "pacifico", "asa": "pacifico", "gum": "pacifico", "nmi": "pacifico",
}

const SKIN_TONES: Array[Color] = [
	Color("ffd6c4"), Color("fcb49e"), Color("e09a72"),
	Color("c07e50"), Color("8a5232"), Color("5c3620"),
]
const HAIR_COLORS: Array[Color] = [
	Color("17141a"), Color("090603"), Color("6b4226"),
	Color("c9852d"), Color("e8d06a"), Color("a83a24"), Color("9a9aa4"),
]





















const PIEL_OSCURA_LUMA: float = 0.6


static func piel_oscura(skin: Color) -> bool:
	return skin.get_luminance() < PIEL_OSCURA_LUMA



static func pelirrojo(hair: Color) -> bool:
	return hair.s > 0.55 and hair.v > 0.35 and (hair.h < 0.05 or hair.h > 0.95)



static func pelo_claro(hair: Color) -> bool:
	return pelirrojo(hair) or hair.get_luminance() > REGEN_PELO_OSCURO_LUMA


static func pelo_para_piel(skin: Color, hair: Color) -> Color:
	if piel_oscura(skin) and pelo_claro(hair):
		return HAIR_COLORS[2] if skin.get_luminance() > 0.45 else HAIR_COLORS[1]
	return hair



static func sin_pelirrojo_oscuro(cfg: Dictionary) -> Dictionary:
	if cfg.has("skin") and cfg.has("hair"):
		cfg["hair"] = pelo_para_piel(Color(cfg["skin"]), Color(cfg["hair"]))
	return cfg
const PATTERNS: Array[String] = [
	"solid", "stripes", "hoops", "half", "sleeves",
	"pinstripes", "sash", "diagonal", "checkers", "band_h",






	"band_v",
	"quarters", "chevron", "gradient", "gradient_h", "diag_thin", "yoke",





	"sash_r",
	"flank", "arrows", "waves", "speckle",




	"rombos", "chevron_up", "escamas", "trenza",

	"raglan",

	"rayas_desig", "aros_desig", "rayas_duo", "aros_duo",






	"stripes_yoke", "hoops_sash", "half_stripes", "band_h_stripes",
	"gradient_stripes", "quarters_pin", "rombos_half", "escamas_half",
	"speckle_half",
	"hoops_yoke", "pin_yoke", "hoops_half", "checkers_half", "trenza_half",
	"waves_half", "stripes_sash", "pin_sash_r", "stripes_chevron",
	"quarters_hoops", "stripes_diagonal", "gradient_hoops",
	"arrows_yoke", "rayas_desig_yoke", "aros_desig_half", "gradient_h_hoops",





	"aspa", "half_h", "aros_fino", "rayas_diag", "galon_doble",
	"cintura", "gradient_diag",



	"waves_fino", "waves_v", "zigzag", "lineas_pares", "aros_pares",
	"rejilla_diag", "punteado", "contornos", "lluvia", "espiga_fina",


	"grad_waves_fino", "grad_waves_v", "grad_zigzag", "grad_lineas_pares",
	"grad_aros_pares", "grad_rejilla_diag", "grad_punteado", "grad_contornos",
	"grad_lluvia", "grad_espiga_fina",
	"gradh_waves_v", "gradh_lineas_pares", "gradh_lluvia", "gradh_contornos",


	"waves_v_yoke", "lineas_pares_yoke", "espiga_fina_yoke", "lluvia_half",
	"zigzag_half", "rejilla_diag_half", "punteado_sash", "contornos_cintura",
	"waves_fino_half_h",


	"gradient_cintura",
	"gradient_galon_doble", "gradient_aspa",
	"gradient_half_h", "stripes_half_h", "aros_fino_half_h",
	"aros_fino_yoke", "rayas_diag_yoke", "gradient_diag_half", "gradient_diag_yoke",

	"gradient_waves", "gradient_yoke", "gradient_half", "gradient_sash",
	"gradient_pin", "gradient_checkers", "gradient_h_half",
]







const SHORT_PATTERNS: Array[String] = [
	"solid", "side_stripe", "side_panel", "hem", "waistband", "trim",
	"stripes", "hoops", "split",
]
const HAIR_STYLES: Array[String] = ["normal", "bald", "buzz", "mohawk"]














const OVERLAY_HAIR: Array[String] = []
const FACIAL_HAIR: Array[String] = [
	"none", "beard", "goatee", "mustache", "stubble",
]














const EXTRA_HAIR_STYLES: Array[String] = [
	"undercut", "taper", "entradas", "crest_wide", "part", "lines",
	"raya_medio", "coronilla", "herradura", "cepillo", "lado_rapado", "mullet",
	"fade_alto", "fade_bajo", "crop", "caesar", "crew_cut", "flequillo",
	"slick_back", "quiff_corto", "coleta", "coleta_alta", "bun_corto",
	"liga_coleta", "banda_pelo",
]
const EXTRA_FACIAL_HAIR: Array[String] = [
	"sideburns", "soul", "chinstrap", "full", "handlebar",
]
const EXTRA_HAIR_COLORS: Array[Color] = [
	Color("f0ece4"),
	Color("d1341f"),
	Color("2f6fd0"),
	Color("d94f97"),
]



const HAIR_TIPS: Array[Color] = [
	Color("f2ede0"),
	Color("e8c86a"),
]






















const REF_EYE: Color = Color("082f59")
const EYE_COLORS: Array[Color] = [
	Color("082f59"),
	Color("6b4226"),
	Color("3f7d3a"),
	Color("8d9298"),
	Color("c9852d"),
	Color("22201e"),
]





























const NPC_EYE_ODDS: Array[Dictionary] = [


	{"col": Color("3b2114"), "peso": 50, "tonos": [
		Color("22201e"),
		Color("2b1c14"),
		Color("3b2114"),
		Color("472a18"),
	]},

	{"col": Color("6b4226"), "peso": 25, "tonos": [
		Color("57351d"), Color("6b4226"), Color("7d5030"),
	]},


	{"col": Color("082f59"), "peso": 9, "tonos": [
		Color("082f59"), Color("14507f"), Color("2f74a6"),
	]},

	{"col": Color("7a5a2e"), "peso": 8, "tonos": [
		Color("6b4f28"), Color("7a5a2e"), Color("8a6a38"),
	]},

	{"col": Color("c9852d"), "peso": 5, "tonos": [
		Color("b0722a"), Color("c9852d"), Color("d5913a"),
	]},

	{"col": Color("3f7d3a"), "peso": 2, "tonos": [
		Color("2c5a2a"), Color("3f7d3a"), Color("55a05b"),
	]},


	{"col": Color("8d9298"), "peso": 1, "tonos": [
		Color("6e747a"), Color("8d9298"), Color("9ea4aa"),
	]},
]













const EYE_TONE_SALT: int = 1869246323

const REF_BROW: Color = Color("090603")
























const BROW_DARKEN_MIN: float = 0.1
const BROW_DARKEN_MAX: float = 0.45



static func brow_for(hair: Color) -> Color:
	return hair.darkened(lerpf(BROW_DARKEN_MIN, BROW_DARKEN_MAX,
		clampf(hair.get_luminance(), 0.0, 1.0)))


const BROW_COLORS: Array[Color] = [
	Color("090603"),
	Color("49281e"),
	Color("8a5a2b"),
	Color("c8a06a"),
	Color("d1341f"),
	Color("d9d4cc"),
]

const REF_BOOT: Color = Color("17140f")
const BOOT_COLORS: Array[Color] = [
	Color("17140f"),
	Color("f0f0f0"),
	Color("d1341f"),
	Color("2f6fd0"),
	Color("e8c86a"),
	Color("d94f97"),
	Color("7bd12f"),
	Color("ff7a1a"),
]







const BOOT_MAX_V: float = 0.35





const BOOT_FRAC: float = 0.38








const BOOT_H: int = 4







const BOOT_MAX_ASPECT: float = 1.0






const BOOT_SOCK_LOOKUP: int = 4



const BOOT_MIN_W: int = 3






const BOOT_GROW_DY: int = 1






const BOOT_OUTLINE_V: float = 0.1
const BOOT_OUTLINE_MUL: float = 0.3












const CASUAL_SHIRTS: Array[Color] = [
	Color("e8e6ea"),
	Color("17161a"),
	Color("2b3a55"),
	Color("8f2d3a"),
	Color("d1341f"),
	Color("e8c86a"),
	Color("41584a"),
	Color("d94f97"),
	Color("6f7683"),
]
const CASUAL_PANTS: Array[Color] = [
	Color("32405e"),
	Color("17161a"),
	Color("6f7683"),
	Color("b5a684"),
	Color("4a3421"),
	Color("2c3b31"),
	Color("e8e6ea"),
]






const CASUAL_PANTS_TOP: float = 0.55
const CASUAL_LEG_TOP: float = 0.71






const CASUAL_CORTE_POR_CUADRO: Dictionary = {
	"reverencia_south_01": [0.47, 0.65, 0.0, 1.0],
	"reverencia_south_04": [0.47, 0.65, 0.0, 1.0],
	"reverencia_south_02": [0.47, 0.65, 0.0, 0.17],
	"reverencia_south_03": [0.47, 0.65, 0.0, 0.17],
}





const BERMUDA_DROP: int = 5




const CASUAL_PRINTS: Array[String] = ["solid", "stripes", "hoops", "pinstripes",
	"half"]










const STREET_FACE: Array[String] = ["none", "gafas", "lentes", "redondos", "aviador", "rectangulares", "deportivos"]


const STREET_HEAD: Array[String] = ["none", "gorra", "sombrero", "gorra_atras", "tejido", "bucket"]















const ACC_SPRITES: Dictionary = {
	"lentes": {
		"front": "res://assets/sprites/acc/lentes.png",
		"right": "res://assets/sprites/acc/lentes_east.png",
		"left": "res://assets/sprites/acc/lentes_west.png",
	},
	"gafas": {
		"front": "res://assets/sprites/acc/gafas.png",
		"right": "res://assets/sprites/acc/gafas_east.png",
		"left": "res://assets/sprites/acc/gafas_west.png",
	},
}

















const ACC_REF_FACE: Dictionary = {
	"front": Vector2i(44, 38),
	"right": Vector2i(49, 37),
	"left": Vector2i(41, 36),
}



const ACC_REF_SHEETS: Dictionary = {
	"front": "res://assets/sprites/anim/idle_south_00.png",
	"right": "res://assets/sprites/anim/idle_east_00.png",
	"left": "res://assets/sprites/anim/idle_west_00.png",
	"back": "res://assets/sprites/anim/idle_north_00.png",
}










const HEAD_SPRITES: Dictionary = {
	"gorra": {
		"front": "res://assets/sprites/acc/gorra.png",
		"right": "res://assets/sprites/acc/gorra_east.png",
		"left": "res://assets/sprites/acc/gorra_west.png",
		"back": "res://assets/sprites/acc/gorra_north.png",
	},
	"sombrero": {
		"front": "res://assets/sprites/acc/sombrero.png",
		"right": "res://assets/sprites/acc/sombrero_east.png",
		"left": "res://assets/sprites/acc/sombrero_west.png",
		"back": "res://assets/sprites/acc/sombrero_north.png",
	},
}






const HEAD_REF: Dictionary = {
	"front": Vector2i(45, 21),
	"right": Vector2i(48, 19),
	"left": Vector2i(42, 18),
	"back": Vector2i(46, 19),
}



const REF_HEAD_ACC: Color = Color("56647e")



const CASUAL_TOPS: Array[String] = ["playera", "polo", "camisa", "sueter", "oversize", "sin_mangas", "cuello_alto", "camisa_abierta", "entrenamiento", "grafica", "jersey_retro", "polo_tejido", "lino", "cuarto_cierre", "rugby"]
const CASUAL_OUTERS: Array[String] = ["none", "chamarra", "hoodie", "chaleco", "abrigo", "bomber", "mezclilla", "cuero", "rompevientos", "blazer", "varsity", "gabardina", "acolchada", "sobrecamisa", "parka"]
const CASUAL_LONG_TOPS: Array[String] = ["camisa", "sueter", "cuello_alto", "lino", "cuarto_cierre", "rugby"]
const CASUAL_PANT_STYLES: Array[String] = ["recto", "jeans", "cargo", "jogger", "chinos", "ancho", "vestir", "deportivo", "short_denim", "short_cargo", "short_chino", "bano", "pants", "pinzas", "barril", "tecnico"]
const CASUAL_EARRINGS: Array[String] = ["none", "stud", "hoop", "diamante", "doble_aro", "colgante", "ear_cuff"]
const CASUAL_SHOES: Array[String] = ["bajos", "altos", "botas", "mocasines", "sandalias", "oxford", "chelsea", "slides", "retro", "running", "charol", "gruesos"]
const CLOTHING_ANCHORS = preload("res://features/match/clothing_anchors.gd")
const CASUAL_DETAILS = preload("res://features/match/casual_details.gd")
const CASUAL_TAILORING = preload("res://features/match/casual_tailoring.gd")
const WARDROBE = preload("res://features/match/wardrobe_collection.gd")













const STYLE_KEYS: Array[String] = ["pattern", "short_pat", "hair_style", "facial_hair",
	"modular_hair", "modular_brows", "modular_beard", "modular_hair_accessory", "modular_mask",
	"modular_face_tattoo", "modular_face_tattoo_side",
	"gala_outfit", "casual_print", "casual_top", "casual_outer", "casual_pants_style", "acc_ear", "acc_neck",
	"casual_sleeves", "casual_pants_len", "casual_outer_state", "casual_shoes", "acc_watch", "acc_bracelet",
	"acc_belt", "acc_neckwear", "acc_pocket", "gala_neckwear", "gala_pocket", "gala_belt", "gala_watch", "gala_chain",
	"acc_face", "acc_head", "kit_sleeves", "tattoo", "tattoo_style", "tattoo_pattern",
	"wristband_style", "arm_sleeve_style", "arm_wrap_style", "sock_style",
	"tights_style", "knee_style", "knee_kind",
	"tattoo_leg", "tattoo_leg_style", "tattoo_leg_pattern",
	"crest_shape", "crest_letter", "num_font", "num_style", "num_size", "num_fill",
	"local_trim", "sock_pat",




	"acc_torso", "modular_head_acc", "modular_face_acc", "modular_neck_acc", "modular_torso_acc",
	"print_asset"]








const PIEZAS_PROPIAS = preload("res://features/match/piezas_propias.gd")
const ESTAMPADO_PROPIO = preload("res://features/match/estampado_propio.gd")
const FILAS_PROPIAS: Dictionary = {
	"acc_head": "head_acc", "acc_face": "face_acc", "acc_neck": "neck_acc",
	"acc_torso": "torso_acc", "casual_top": "prendas",
}


const CAPA_PROPIA: Dictionary = {
	"acc_head": "modular_head_acc", "acc_face": "modular_face_acc",
	"acc_neck": "modular_neck_acc", "acc_torso": "modular_torso_acc",
}



const TOP_SPRITES: Dictionary = {
	"capucha": {
		"front": "res://assets/sprites/acc/capucha.png",
		"right": "res://assets/sprites/acc/capucha_east.png",
		"left": "res://assets/sprites/acc/capucha_west.png",
		"back": "res://assets/sprites/acc/capucha_north.png",
	},
	"cremallera": {
		"front": "res://assets/sprites/acc/cremallera.png",
		"right": "res://assets/sprites/acc/cremallera_east.png",
		"left": "res://assets/sprites/acc/cremallera_west.png",
	},












	"abrigo": {
		"front": "res://assets/sprites/acc/abrigo.png",
		"right": "res://assets/sprites/acc/abrigo_east.png",
		"left": "res://assets/sprites/acc/abrigo_west.png",
		"back": "res://assets/sprites/acc/abrigo_north.png",
	},
}

const HEAD_ACC_COLORS: Array[Color] = [
	Color("2f3542"), Color("e8e6ea"), Color("c1121f"), Color("2f6fd0"),
	Color("1f7a5a"), Color("e8c86a"), Color("8a5a3c"), Color("7a1226"),
]






static func head_anchor(img: Image, bb: Rect2i, head_bottom: int) -> Vector2i:
	var izq: int = 1<<30
	var der: int = -1
	for y in range(bb.position.y, mini(head_bottom, img.get_height())):
		for x in img.get_width():
			if img.get_pixel(x, y).a >= 0.5:
				izq = mini(izq, x)
				der = maxi(der, x)
	if der < 0:
		return Vector2i(bb.position.x + bb.size.x / 2, bb.position.y)
	return Vector2i((izq + der) / 2, bb.position.y)





static func acc_anchor(face_bb: Rect2i) -> Vector2i:
	return Vector2i(face_bb.position.x + face_bb.size.x / 2,
		face_bb.position.y + face_bb.size.y)







const TAT_TOP: float = 0.4
const TAT_BOTTOM: float = 0.57









const TAT_LEG_TOP: float = 0.74
const TAT_LEG_BOTTOM: float = 0.9










const WRIST_COLORS: Array[Color] = [Color("f4f4f4"), Color("111111"), Color("c0392b"),
	Color("1f3a93"), Color("f1c40f"), Color("2ecc71"), Color("e84393"), Color("ff7f11")]
const ARM_SLEEVE_COLORS: Array[Color] = [Color("111111"), Color("f4f4f4"), Color("c0392b"),
	Color("1f3a93"), Color("f1c40f"), Color("7f8c8d"), Color("e84393"), Color("2ecc71")]


const WRAP_COLOR: Color = Color("e8e2d6")


const FIELD_GLOVE_COLORS: Array[Color] = [Color("111111"), Color("f4f4f4"), Color("c0392b"),
	Color("1f3a93"), Color("f1c40f"), Color("ff7f11")]




const SOCK_TAPE_BAND: Vector2 = Vector2(0.855, 0.875)
const SOCK_DOWN_BAND: Vector2 = Vector2(0.82, 0.86)
const SOCK_TAPE_COLORS: Array[Color] = [Color("f4f4f4"), Color("111111"), Color("c0392b"),
	Color("1f3a93"), Color("f1c40f")]









const TIGHTS_STYLES: Array[String] = ["none", "on"]
const TIGHTS_COBERTURA: float = 0.55
const TIGHTS_OSCURO_V: float = 0.3









const KNEE_SIDES: Array[String] = ["none", "left", "right", "both"]
const KNEE_KINDS: Array[String] = ["neopreno", "vendaje"]
const KNEE_NEO: Array[Color] = [Color("18181e"), Color("2c2c34"), Color("4a4a56")]
const KNEE_NEO_LEJOS: Array[Color] = [Color("18181e"), Color("18181e"), Color("2c2c34")]
const KNEE_WRAP: Array[Color] = [Color("c9c3b5"), Color("ece8de"), Color("ece8de")]
const KNEE_WRAP_LEJOS: Array[Color] = [Color("a39d90"), Color("c9c3b5"), Color("c9c3b5")]







const SLEEVE_HAND: float = 0.09
const SLEEVE_HIP: float = 0.6



const CASUAL_ZAPATO_FILAS: int = 6
const SLEEVE_COLLAR_PAD: int = 6







const SLEEVE_PUNO_MAX: int = 16






const SLEEVE_PRENDA_FRAC: float = 0.04






const SLEEVE_PIEZA_MIN: int = 6




const SLEEVE_MANO_ABIERTA: int = 3









const SLEEVE_HEAD_FRAC: float = 0.2







const SLEEVE_CUFF_W: int = 2





const SLEEVE_ODDS_NIEVE: float = 0.85
const SLEEVE_ODDS_LLUVIA: float = 0.6
const SLEEVE_ODDS_GRIS: float = 0.3
const SLEEVE_ODDS_SOL: float = 0.08

const SLEEVE_SUN_GRIS: float = 0.7









static var npc_sleeve_chance: float = SLEEVE_ODDS_SOL



static func sleeve_odds(weather: Dictionary) -> float:
	if bool(weather.get("snow", false)):
		return SLEEVE_ODDS_NIEVE
	if bool(weather.get("rain", false)):
		return SLEEVE_ODDS_LLUVIA
	if float(weather.get("sun_energy", 1.0)) < SLEEVE_SUN_GRIS:
		return SLEEVE_ODDS_GRIS
	return SLEEVE_ODDS_SOL
const TAT_INK: Color = Color("31404f")





const TAT_PATTERNS: Array[String] = ["damero", "lineas", "banda", "tribal",
	"solido", "espina", "puntos", "estrellas", "doble_banda", "zigzag",
	"rombos", "espiga", "malla", "media_manga",


	"manga_entera", "antebrazo", "biceps", "muneca",
	"manga_degradada", "escamas", "cadena", "ondas", "cuadros", "aros_finos",
	"salpicado", "triple_banda"]













const TAT_BANDS: Dictionary = {
	"manga_entera": Vector2(0.44, 0.73),
	"manga_degradada": Vector2(0.44, 0.73),
	"escamas": Vector2(0.44, 0.73),
	"cadena": Vector2(0.44, 0.73),
	"aros_finos": Vector2(0.44, 0.73),
	"salpicado": Vector2(0.44, 0.73),
	"antebrazo": Vector2(0.57, 0.73),
	"ondas": Vector2(0.57, 0.73),
	"cuadros": Vector2(0.57, 0.73),
	"biceps": Vector2(0.45, 0.56),
	"muneca": Vector2(0.67, 0.73),
	"triple_banda": Vector2(0.45, 0.73),
}
const TAT_INKS: Array[Color] = [
	Color("31404f"),
	Color("101114"),
	Color("35494a"),
	Color("4a2a35"),
	Color("403052"),
	Color("59321e"),
]





const TEAM_KEYS: Array[String] = ["bib", "kit", "kit2", "kit_b", "pattern",
	"comp_parche", "parche_vigente",
	"kit2_b", "short_pat", "num_ink", "num_style", "num_font", "num_fill", "num_size", "red_base",

	"keeper_base", "gloves", "crest_rim", "crest_fill", "crest_shape", "crest_letter",
	"crest_flag", "club", "pat_ink", "fab_ink", "retro", "kit_slot",




	"local_trim", "trim_col", "pat_w", "sock", "sock_b", "sock_pat", "mojado",

	"cuello_col", "puno_col"]

































const REF_KIT_RED: Color = Color("c23d21")














const REF_KIT_KEEPER: Color = Color("fad80b")





const KEEPER_KITS: Array[Color] = [
	Color("13c265"),
	Color("1a1a1f"),
	Color("e8811d"),
	Color("14a8a0"),
	Color("b13ac2"),
	Color("e6c419"),


	Color("ff3d9a"),
	Color("1fd6f0"),
	Color("b8f01f"),
	Color("ff6a1f"),
]


const KEEPER_GLOVE_KITS: Array[Color] = [
	Color("111111"), Color("13c265"), Color("111111"), Color("f4f4f4"),
	Color("f4f4f4"), Color("111111"), Color("111111"), Color("111111"),
	Color("111111"), Color("ff3d9a"),
]






static func keeper_idx(team_id: String, temporada: int = -1) -> int:
	var t: int = temporada if temporada >= 0 else GameState.season_num


	var rng := RandomNumberGenerator.new()
	rng.seed = hash(team_id + ":gk")^(t * 104729)
	return int(rng.randf() * KEEPER_KITS.size()) % KEEPER_KITS.size()












static var _keeper_pats: Array[String] = []












static func familia_2d(pattern: String) -> String:









	if pattern.begins_with("grad_"):
		return familia_2d(pattern.substr(5))
	if pattern.begins_with("gradh_"):
		return familia_2d(pattern.substr(6))
	match pattern:
		"aspa", "rayas_diag", "galon_doble":
			return "sash"
		"lineas_pares", "waves_v":
			return "v"
		"cintura", "aros_pares", "waves_fino", "zigzag", "contornos", "punteado":
			return "h"
		"lluvia", "espiga_fina", "rejilla_diag":
			return "sash"
	if pattern.begins_with("stripes") or pattern.begins_with("pin") or pattern.begins_with("rayas"):
		return "v"
	if pattern.begins_with("hoops") or pattern.begins_with("aros") or pattern.begins_with("band_h"):
		return "h"
	if pattern.begins_with("half") or pattern.begins_with("quarters") or pattern == "split":
		return "half"
	if pattern.begins_with("sash") or pattern.begins_with("diagonal") or pattern.begins_with("chevron"):
		return "sash"
	if pattern.begins_with("sleeves") or pattern.begins_with("yoke"):
		return "hombros"
	if pattern.begins_with("band_v"):
		return "banda"






	if KitPatternGeo.COMBOS.has(pattern):
		var combo: Array = KitPatternGeo.COMBOS[pattern]
		var trama: String = familia_2d(String(combo[1]))
		return trama if trama != "solid" else familia_2d(String(combo[0]))
	return "solid"


static func keeper_patterns() -> Array[String]:
	if not _keeper_pats.is_empty():
		return _keeper_pats
	for pool in [Teams.SIGNATURE_PATTERNS, Teams.AWAY_PATTERNS, Teams.THIRD_PATTERNS]:
		for pat in pool:
			var p: String = String(pat)
			if p != "solid" and not _keeper_pats.has(p):
				_keeper_pats.append(p)
	return _keeper_pats




















const KEEPER_GLOVE: Color = Color("e9ecef")
const KEEPER_SHORT: Color = Color("1b1b20")

















static func keeper_field_cfg(look: Dictionary) -> Dictionary:
	var out: Dictionary = look.duplicate()
	out.erase("keeper_base")
	out["long_sleeves"] = true

	out["gloves"] = look.get("gloves", KEEPER_GLOVE)
	out["kit2"] = KEEPER_SHORT
	return out








static func keeper_cfg(team_id: String, kit_idx: int = -1,
		worn_pat: String = "") -> Dictionary:
	var idx: int = kit_idx if kit_idx >= 0 else keeper_idx(team_id)
	var kit: Color = KEEPER_KITS[idx]














	var team_pat: String = worn_pat
	if team_pat.is_empty():

		team_pat = String(GameState.kit_variant(Teams.by_id(team_id), 0)
			.get("pattern", "solid"))
	var pats: Array[String] = keeper_patterns()
	var p: int = absi(hash(team_id + ":pat")) % pats.size()
	for _i in pats.size():
		if pats[p] != team_pat:
			break
		p =(p + 1) % pats.size()
	return {
		"kit": kit,
		"keeper_base": true,
		"pattern": pats[p],
		"kit_b": kit.lightened(0.42) if kit.v < 0.5 else kit.darkened(0.38),
		"gloves": KEEPER_GLOVE_KITS[idx],
	}

















const KEEPER_PECHO_KEYS: Array[String] = ["crest_rim", "crest_fill", "crest_shape",
	"crest_letter", "crest_flag", "crest_logo", "club", "retro", "kit_slot",
	"comp_parche", "parche_vigente"]

static func keeper_con_pecho(gk: Dictionary, de_campo: Dictionary) -> Dictionary:
	var out: Dictionary = gk.duplicate()
	for k in KEEPER_PECHO_KEYS:
		if de_campo.has(k):
			out[k] = de_campo[k]
	return out













const CACHE_MAX: int = 4000
static var _cache: Dictionary = {}























static var candado: Mutex = Mutex.new()


static var lecturas_gpu_en_hilo: int = 0

static var lecturas_gpu_detalle: Dictionary = {}


static var fuente_disco: bool = false






static var disco_en_principal: bool = OS.has_feature("android")

static var lecturas_gpu_principal: int = 0

static var lecturas_gpu_principal_detalle: Dictionary = {}


static func en_hilo_principal() -> bool:
	return OS.get_thread_caller_id() == OS.get_main_thread_id()


static func candado_toma() -> void:
	if not en_hilo_principal():
		candado.lock()
		return
	if candado.try_lock():



		if principal_pide_hasta_us != 0:
			var ahora: int = Time.get_ticks_usec()
			principal_pide_hasta_us = ahora + PIDE_PASO_US if ahora < principal_pide_hasta_us else 0
		return



	pide_paso_principal()
	while not candado.try_lock():
		RenderingServer.force_sync()
		OS.delay_usec(100)























static var principal_pide_hasta_us: int = 0

const PIDE_PASO_US: int = 33000


static func pide_paso_principal() -> void:
	principal_pide_hasta_us = Time.get_ticks_usec() + PIDE_PASO_US


static func suelta_paso_principal() -> void:
	principal_pide_hasta_us = 0


static func candado_suelta() -> void:
	candado.unlock()



















static var _por_look: Dictionary = {}
static var _look_abierto: String = ""


const POR_LOOK_MAX: int = 6000
















static var _epoca: Dictionary = {}
static var _epoca_abierta: bool = false




static func _apunta_clave(key: String, compuesta: bool) -> void:
	var marcada: String =("M" if compuesta else "K") + key
	if _epoca_abierta:
		_epoca[marcada] = true
	if _look_abierto.is_empty():
		return
	if _por_look.size() >= POR_LOOK_MAX and not _por_look.has(_look_abierto):
		_por_look.clear()
	var d: Dictionary = _por_look.get(_look_abierto, {})
	d[marcada] = true
	_por_look[_look_abierto] = d


static func abre_epoca() -> void:
	candado_toma()
	if not _epoca_abierta:
		_epoca.clear()
	_epoca_abierta = true
	candado_suelta()






static func cierra_epoca(conserva: Array) -> int:
	candado_toma()
	var fuera: int = _cierra_epoca_sin_candado(conserva)
	candado_suelta()
	return fuera


static func _cierra_epoca_sin_candado(conserva: Array) -> int:
	if not _epoca_abierta:
		return 0
	_epoca_abierta = false
	var vivas: Dictionary = {}
	for cs in conserva:
		for k in _por_look.get(cs, {}):
			vivas[k] = true
	var modular: Script = _modular()
	var fuera: int = 0
	for k in _epoca:
		if vivas.has(k):
			continue
		var clave: String =(k as String).substr(1)
		if (k as String).begins_with("M"):
			if modular.expulsa_compuesta(clave):
				fuera += 1
		elif _cache.erase(clave):
			fuera += 1
	_epoca.clear()
	for cs in _por_look.keys():
		if not conserva.has(cs):
			_por_look.erase(cs)
	return fuera



















static func marca_sesion() -> int:
	candado_toma()
	var n: int = _cache.size()
	candado_suelta()
	return n




static func poda_desde(marca: int, minimo: int = 16) -> int:
	candado_toma()
	var fuera: int = _poda_desde_sin_candado(marca, minimo)
	candado_suelta()
	return fuera


static func _poda_desde_sin_candado(marca: int, minimo: int) -> int:
	if marca < 0 or marca > _cache.size():
		return 0
	var ks: Array = _cache.keys()
	if ks.size() - marca < minimo:
		return 0
	var fuera: int = 0
	for i in range(marca, ks.size()):
		_cache.erase(ks[i])
		fuera += 1
	return fuera


static func evict_cfgs(cfg_strs: Array) -> int:
	if cfg_strs.is_empty():
		return 0
	candado_toma()
	var fuera: int = _evict_cfgs_sin_candado(cfg_strs)
	candado_suelta()
	return fuera


static func _evict_cfgs_sin_candado(cfg_strs: Array) -> int:
	var fuera: int = 0
	for k in _cache.keys():
		for cs in cfg_strs:
			if (k as String).ends_with(cs):
				_cache.erase(k)
				fuera += 1
				break



	var modular: Script = _modular()
	for cs in cfg_strs:
		if not _por_look.has(cs):
			continue
		for k in _por_look[cs]:
			var clave: String =(k as String).substr(1)
			if (k as String).begins_with("M"):
				if modular.expulsa_compuesta(clave):
					fuera += 1
			elif _cache.erase(clave):
				fuera += 1
		_por_look.erase(cs)
	return fuera
















static func _style(cfg: Dictionary, key: String, def: String) -> String:
	var v: Variant = cfg.get(key, def)
	return v if v is String else def




static func casual_parts(base: Dictionary) -> Dictionary:
	var out: Dictionary = base.duplicate()
	var old: String = _style(out, "casual_top", "playera")
	if old in CASUAL_OUTERS and old != "none":
		if not out.has("casual_outer"):
			out["casual_outer"] = old
			out["casual_outer_color"] = out.get("casual_shirt", CASUAL_SHIRTS[0])
			out["casual_shirt"] = out.get("casual_shirt2", CASUAL_SHIRTS[1])
		out["casual_top"] = "playera"
	return out


static func casual_of(base: Dictionary) -> Dictionary:
	var cfg: Dictionary = casual_parts(base)

	var appearance = load("res://features/match/appearance_catalog.gd")
	for spec in [["modular_hair", "hair_style", LookMigracion.PELO_POR_DEFECTO], ["modular_brows", "brows", "natural"], ["modular_beard", "facial_hair", "none"]]:
		if not cfg.has(spec[0]):

			var legacy: String = LookMigracion.barba(LookMigracion.pelo(_style(cfg, spec[1], spec[2])))
			cfg[spec[0]] = legacy if appearance.valid(spec[0], legacy) else spec[2]

	for key in ["long_sleeves", "short_pants", "street_top", "street_face", "street_head",
			"modular_head_acc", "modular_face_acc", "modular_neck_acc", "modular_torso_acc"]:
		cfg.erase(key)








	for fila in CAPA_PROPIA:
		var id_propio: String = _style(cfg, fila, "none")
		if id_propio.begins_with("p_") and PIEZAS_PROPIAS.es_propia(FILAS_PROPIAS[fila], id_propio):
			cfg[CAPA_PROPIA[fila]] = id_propio



	var top_propio: String = _style(cfg, "casual_top", "playera")
	if top_propio.begins_with("p_") and PIEZAS_PROPIAS.es_propia("prendas", top_propio):
		cfg["casual_top"] = str(PIEZAS_PROPIAS.group("prendas")[top_propio].get("base", "playera"))
		cfg["print_asset"] = top_propio
	elif cfg.has("print_asset"):



		var ya: String = _style(cfg, "print_asset", "")
		var su_base: String = str(PIEZAS_PROPIAS.group("prendas").get(ya, {}).get("base", ""))
		if su_base.is_empty() or su_base != _style(cfg, "casual_top", "playera"):
			cfg.erase("print_asset")
	cfg["kit"] = cfg.get("casual_shirt", CASUAL_SHIRTS[0])
	cfg["boots"] = cfg.get("casual_shoes_color", BOOT_COLORS[0])


	var print_id: String = _style(cfg, "casual_print", "solid")
	if print_id != "solid":
		cfg["kit_b"] = cfg.get("casual_shirt2", CASUAL_SHIRTS[1])
		cfg["pattern"] = print_id
	else:



		cfg.erase("kit_b")
		cfg.erase("pattern")





	var pants: Color = cfg.get("casual_pants", CASUAL_PANTS[0])
	if _style(cfg, "casual_pants_len", "largo") == "corto" or _style(cfg, "casual_pants_style", "recto") in ["deportivo", "short_denim", "short_cargo", "short_chino", "bano"]:




		cfg["short_pants"] = pants
		cfg.erase("long_pants")
	else:
		cfg["long_pants"] = pants

	cfg.erase("number")
	cfg.erase("crest_fill")
	cfg.erase("crest_logo")




	cfg.erase("mask")
	cfg.erase("headband")






	cfg.erase("kit_sleeves")


	for k_eq in ["wristband_style", "arm_sleeve_style", "arm_wrap_style",
			"field_gloves_color", "sock_style", "tights_style", "knee_style", "knee_kind"]:
		cfg.erase(k_eq)







	var top: String = _style(cfg, "casual_top", "playera")
	if top not in CASUAL_TOPS:
		top = "playera"
	var outer: String = _style(cfg, "casual_outer", "none")
	if outer not in CASUAL_OUTERS:
		outer = "none"
	cfg["street_garment"] = top
	cfg["street_outer"] = outer
	if _style(cfg, "casual_sleeves", "corta") == "larga" or top in CASUAL_LONG_TOPS:
		cfg["long_sleeves"] = cfg["kit"]
	if top in ["sin_mangas", "camisa_abierta"]:
		cfg.erase("long_sleeves")
	if outer != "none" and outer != "chaleco":
		cfg["long_sleeves"] = cfg.get("casual_outer_color", CASUAL_SHIRTS[0])
	if outer == "varsity":
		cfg["long_sleeves"] = cfg.get("casual_shirt2", CASUAL_SHIRTS[1])
	if outer in ["hoodie", "parka"]:
		cfg["street_top"] = "capucha"

	var face_acc: String = _style(cfg, "acc_face", "none")

	if face_acc != "none" and not face_acc.begins_with("p_"):
		cfg["street_face"] = face_acc




	var head_acc: String = _style(cfg, "acc_head", "none")
	if head_acc != "none" and not head_acc.begins_with("p_"):
		cfg["street_head"] = head_acc
		cfg["street_head_color"] = cfg.get("acc_head_color", HEAD_ACC_COLORS[0])


	return cfg




static func team_only(cfg: Dictionary) -> Dictionary:
	var out: Dictionary = {}
	for k in TEAM_KEYS:
		if cfg.has(k):
			out[k] = cfg[k]




	if not clima_tela.is_empty() and out.has("kit"):
		out.merge(clima_tela)
	return out





static var clima_tela: Dictionary = {}

static var npc_glove_chance: float = 0.0

static var capitanes: Dictionary = {}

const TERMICA_COLORS: Array[Color] = [Color("111111"), Color("f4f4f4"), Color("2a2d33"),
	Color("c9ccd1")]
const GLOVE_ODDS_NIEVE: float = 0.5
const GLOVE_ODDS_GRIS: float = 0.12





static func pon_clima(weather: Dictionary) -> void:
	candado_toma()
	npc_sleeve_chance = sleeve_odds(weather)
	clima_tela = {}
	npc_glove_chance = 0.0
	if bool(weather.get("snow", false)):
		clima_tela = {"mojado": true}
		npc_glove_chance = GLOVE_ODDS_NIEVE
	elif bool(weather.get("rain", false)):
		clima_tela = {"mojado": true, "barro": 1}
		npc_glove_chance = GLOVE_ODDS_GRIS
	elif float(weather.get("sun_energy", 1.0)) < SLEEVE_SUN_GRIS:
		npc_glove_chance = GLOVE_ODDS_GRIS
	candado_suelta()




static func quita_clima() -> void:
	candado_toma()
	npc_sleeve_chance = SLEEVE_ODDS_SOL
	clima_tela = {}
	npc_glove_chance = 0.0
	capitanes = {}
	candado_suelta()







static func _tono_de_ojo(familia: Dictionary, person: String) -> Color:
	var tonos: Array = familia.get("tonos", [])
	if tonos.is_empty():
		return familia["col"]
	var r := RandomNumberGenerator.new()
	r.seed = PlayerLooks.semilla(person)^EYE_TONE_SALT
	return tonos[r.randi() % tonos.size()]













static func traits_for(person: String) -> Dictionary:
	var fixed: Dictionary = PlayerLooks.of(person)
	if not fixed.is_empty():






		if fixed.has("hair") and not fixed.has("brows"):
			fixed["brows"] = brow_for(fixed["hair"])



		return LookMigracion.al_dia(fixed)
	var rng := RandomNumberGenerator.new()



	rng.seed = PlayerLooks.semilla(person)





	var nat: String = PlayerNations.of(person)
	var out: Dictionary = {
		"skin": _weighted(SKIN_TONES, _region_odds(nat, "skin"), rng),
		"hair": _weighted(HAIR_COLORS, _region_odds(nat, "hair"), rng),
	}


	sin_pelirrojo_oscuro(out)




	out["brows"] = brow_for(out["hair"])


	var roll_style: float = rng.randf()
	var style: String = HAIR_STYLES[rng.randi() % HAIR_STYLES.size()]
	if roll_style < 0.35:
		out["hair_style"] = style
	var roll_facial: float = rng.randf()
	var facial: String = FACIAL_HAIR[rng.randi() % FACIAL_HAIR.size()]
	if roll_facial < 0.4:
		out["facial_hair"] = facial








	out["boots"] = BOOT_COLORS[rng.randi() % BOOT_COLORS.size()]









	var tirada: int = rng.randi() % 100
	var acum: int = 0
	var familia: Dictionary = NPC_EYE_ODDS[NPC_EYE_ODDS.size() - 1]
	for o in NPC_EYE_ODDS:
		acum += int(o["peso"])
		if tirada < acum:
			familia = o
			break



	out["eyes"] = _tono_de_ojo(familia, person)
















	out["modular_hair"] = _npc_pool("hair", rng)






	out["modular_brows"] = _weighted(NPC_BROWS, NPC_BROW_ODDS, rng)

	var roll_beard: float = rng.randf()
	var beard: String = _npc_pool("beard", rng)
	out["modular_beard"] = beard if roll_beard < 0.4 else "none"
	return barba_por_edad(out, person)











const REGEN_BARBA_EDAD: int = 21
const REGEN_SIN_PELO: Array[Color] = [Color("a83a24"), Color("9a9aa4")]

const REGEN_PIEL_MIN: int = 10


static func _sorteo_regen(opciones: Array, pesos: Array, minimo: int, semilla: String) -> Variant:
	var cand: Array = []
	var ws: Array = []
	var total: int = 0
	for i in mini(opciones.size(), pesos.size()):
		if int(pesos[i]) >= minimo:
			cand.append(opciones[i])
			ws.append(int(pesos[i]))
			total += int(pesos[i])
	if cand.is_empty():
		return opciones[0]
	var rng := RandomNumberGenerator.new()
	rng.seed = hash(semilla)
	var tiro: int = rng.randi_range(0, total - 1)
	for i in cand.size():
		tiro -= int(ws[i])
		if tiro < 0:
			return cand[i]
	return cand[cand.size() - 1]


const REGEN_PELO_OSCURO_LUMA: float = 0.35
const BARBAS_NORMALES: Array[String] = ["p_sombra_de_tres_dias", "p_barba_recortada",
	"p_barba_perfilada", "p_barba_desvanecida", "p_barba_rala", "p_barba_hollywood"]





const CORTES_NORMALES: Array[String] = ["p_afro_corto", "p_afro_desvanecido",
	"p_atras_con_rapado", "p_burst_fade", "p_capas_medianas", "p_cepillado_hacia_arriba",
	"p_cesar_clasico", "p_copete_con_degradado", "p_corte_ejecutivo", "p_crew_cut_clasico",
	"p_crop_frances", "p_degradado_alto", "p_degradado_bajo", "p_despeinado", "p_drop_fade",
	"p_edgar", "p_flequillo_de_lado", "p_flow_hacia_atras", "p_gentleman_raya_clasica",
	"p_high_and_tight", "p_ivy_league_peinado", "p_ondas_360", "p_ondas_al_ras",
	"p_ondas_cortas", "p_peinado_mojado", "p_quiff_bajo", "p_rapado_al_uno",
	"p_rapado_perfilado", "p_rastas_cortas", "p_raya_al_medio_hacia_atras",
	"p_raya_marcada_con_degradado", "p_rizos_al_ras", "p_rizos_con_degradado",
	"p_taper_texturizado", "p_tupe_ladeado", "p_twists_con_degradado"]

static func barba_por_edad(out: Dictionary, person: String) -> Dictionary:
	var nace: int = PlayerLooks.nace_regen(person)
	if nace == PlayerLooks.SIN_NACER:
		return out


	if out.has("modular_hair") and not CORTES_NORMALES.has(String(out["modular_hair"])):
		out["modular_hair"] = CORTES_NORMALES[
			absi(hash(person + "|corte")) % CORTES_NORMALES.size()]











	var nat: String = PlayerNations.of(person)
	var odds_piel: Array = _region_odds(nat, "skin")
	var ip: int = SKIN_TONES.find(out.get("skin", Color.WHITE))
	if ip >= 0 and ip < odds_piel.size() and int(odds_piel[ip]) < REGEN_PIEL_MIN:
		out["skin"] = _sorteo_regen(SKIN_TONES, odds_piel, REGEN_PIEL_MIN, person + "|piel")
		sin_pelirrojo_oscuro(out)
		out["brows"] = brow_for(out["hair"])
	var oscura: bool = piel_oscura(out.get("skin", Color.WHITE))
	if out.has("hair") and (REGEN_SIN_PELO.has(out["hair"]) or (oscura
			and Color(out["hair"]).get_luminance() > REGEN_PELO_OSCURO_LUMA)):
		var odds: Array = _region_odds(nat, "hair")
		var tonos: Array = []
		var pesos: Array = []
		for i in HAIR_COLORS.size():
			var c: Color = HAIR_COLORS[i]
			if REGEN_SIN_PELO.has(c) or (oscura and c.get_luminance() > REGEN_PELO_OSCURO_LUMA):
				continue
			tonos.append(c)
			pesos.append(float(odds[i]) if i < odds.size() else 1.0)
		var total: float = 0.0
		for w in pesos:
			total += w
		var rng_p := RandomNumberGenerator.new()
		rng_p.seed = hash(person + "|pelo")
		var tiro: float = rng_p.randf() * total
		var elegido: Color = tonos[tonos.size() - 1]
		for i in tonos.size():
			tiro -= float(pesos[i])
			if tiro < 0.0:
				elegido = tonos[i]
				break
		if total <= 0.0:
			elegido = tonos[0]
		out["hair"] = elegido
		out["brows"] = brow_for(out["hair"])
	if GameState.season_num - nace < REGEN_BARBA_EDAD:
		out["facial_hair"] = "none"
		out["modular_beard"] = "none"
	elif String(out.get("modular_beard", "none")) != "none" \
			and not BARBAS_NORMALES.has(String(out["modular_beard"])):
		out["modular_beard"] = BARBAS_NORMALES[
			absi(hash(person + "|barba")) % BARBAS_NORMALES.size()]
	return out




static func infantil(cfg: Dictionary) -> Dictionary:
	var out: Dictionary = cfg.duplicate(true)
	out["facial_hair"] = "none"
	out["modular_beard"] = "none"




	if out.has("hair") and Color(out["hair"]).is_equal_approx(HAIR_COLORS[6]):
		var piel: Color = Color(out.get("skin", SKIN_TONES[0]))
		out["hair"] = HAIR_COLORS[1] if piel_oscura(piel) else HAIR_COLORS[2]
		if out.has("brows"):
			out["brows"] = brow_for(out["hair"])
	return out








const NPC_BROWS: Array[String] = ["natural", "arqueadas", "finas", "inclinadas"]
const NPC_BROW_ODDS: Array[int] = [55, 17, 14, 14]










static func _region_odds(nat: String, rasgo: String) -> Array:
	if nat.is_empty():
		return []
	var region: String = String(NAT_REGION.get(nat, "global"))
	var fila: Dictionary = LOOK_REGION_ODDS.get(region, LOOK_REGION_ODDS["global"])
	return fila.get(rasgo, [])








static func _weighted(opciones: Array, pesos: Array, rng: RandomNumberGenerator) -> Variant:
	if opciones.is_empty():
		return null
	if pesos.size() != opciones.size():
		return opciones[rng.randi() % opciones.size()]
	var total: int = 0
	for w in pesos:
		total += int(w)
	if total <= 0:
		return opciones[rng.randi() % opciones.size()]
	var tirada: int = rng.randi() % total
	var acum: int = 0
	var fuera: Variant = opciones[opciones.size() - 1]
	for i in opciones.size():
		acum += int(pesos[i])
		if tirada < acum:
			fuera = opciones[i]
			break
	return fuera







static func piel_y_pelo(nat: String, rng: RandomNumberGenerator) -> Dictionary:
	var out: Dictionary = {
		"skin": _weighted(SKIN_TONES, _region_odds(nat, "skin"), rng),
		"hair": _weighted(HAIR_COLORS, _region_odds(nat, "hair"), rng),
	}
	return sin_pelirrojo_oscuro(out)






static var _npc_pools: Dictionary = {}


static func _npc_pool(grupo: String, rng: RandomNumberGenerator) -> String:
	if not _npc_pools.has(grupo):
		var appearance = load("res://features/match/appearance_catalog.gd")
		var ks: Array = appearance.group(grupo).keys()
		ks.sort()
		_npc_pools[grupo] = ks
	var pool: Array = _npc_pools[grupo]
	if pool.is_empty():
		return "none"
	return String(pool[rng.randi() % pool.size()])




static func appearance_for(person: String, base: Dictionary) -> Dictionary:
	var cfg: Dictionary = team_only(base)
	var traits: Dictionary = traits_for(person)
	for k in traits:
		cfg[k] = traits[k]





	var rng_m := RandomNumberGenerator.new()
	rng_m.seed = hash(person + "|manga")






	var arbitro: bool = bool(base.get("arbitro", false))
	if rng_m.randf() < npc_sleeve_chance and not arbitro:






		var termica: bool = rng_m.randf() < 0.33 and not base.has("keeper_base")
		if termica:
			var col: Color = TERMICA_COLORS[rng_m.randi() % TERMICA_COLORS.size()]
			cfg["long_sleeves"] = col
			cfg["termica"] = col
		else:
			cfg["long_sleeves"] = true

			if rng_m.randf() < npc_glove_chance:
				cfg["field_gloves_color"] = Color("111111") if rng_m.randf() < 0.7 \
						else Color("f4f4f4")
	if arbitro:
		return cfg


	if int(cfg.get("barro", 0)) > 0:
		cfg["barro_sem"] = posmod(hash(person + "|barro"), BARRO_PLAYERA.size())



	if capitanes.has(person):
		cfg["banda_capitan"] = true
		cfg["cinta_lamina"] = true
	return cfg




static func _casual_head(source_tex: Texture2D, composed: Texture2D, cfg: Dictionary) -> Texture2D:
	if _style(cfg, "acc_head", "none") == "none" and _style(cfg, "acc_face", "none") == "none" and _style(cfg, "acc_ear", "none") == "none":
		return composed
	var key: String = source_tex.resource_path + ":casual_head:" + str(composed.get_instance_id()) + var_to_str(cfg)
	if _cache.has(key):
		return _cache[key]
	var out: Image = lee_imagen(composed, "casual")
	var layer: Image = CLOTHING_ANCHORS.head_layer(source_tex.resource_path, cfg)
	var modular = _modular()
	var occlusion: Image = modular._occlusion(modular._frame(source_tex.resource_path), out)
	out.blend_rect(layer, Rect2i(0, 0, 92, 92), Vector2i.ZERO)

	out.blend_rect(occlusion, Rect2i(0, 0, 92, 92), Vector2i.ZERO)
	var result: Texture2D = ImageTexture.create_from_image(out)


	if en_meta():
		result.set_meta(META_IMG_ATLAS, out)
		result.set_meta(META_KR_LLAVE, key)
	if _cache.size() >= CACHE_MAX:
		_cache.clear()
	_cache[key] = result
	_apunta_clave(key, false)
	return result



const GALA_WEAR = preload("res://features/match/gala_wear.gd")
const LookMigracion = preload("res://features/match/look_migracion.gd")








static var _modular_script: Script = null




static var cabezas_viejas: Dictionary = {}

static func _modular() -> Script:
	if _modular_script == null:
		_modular_script = load("res://features/match/modular_appearance.gd")
	return _modular_script




static func apply(tex: Texture2D, cfg: Dictionary) -> Texture2D:
	candado_toma()
	var out: Texture2D = _apply_sin_candado(tex, cfg)
	candado_suelta()
	return out


static func _apply_sin_candado(tex: Texture2D, cfg: Dictionary) -> Texture2D:

	if bool(cfg.get("chamarra", false)) and tex != null:
		var vestido: Texture2D = apply(tex, Chamarra.sin(cfg))
		return Chamarra.viste(vestido, tex.resource_path, cfg)



	if not _look_abierto.is_empty() or cfg.is_empty():
		return _apply_cuerpo(tex, cfg)
	_look_abierto = var_to_str(cfg)
	var out: Texture2D = _apply_cuerpo(tex, cfg)
	_look_abierto = ""
	if en_meta():
		_cuelga_imagen(out)
	return out


static func _apply_cuerpo(tex: Texture2D, cfg: Dictionary) -> Texture2D:
	var canonical: String = GALA_WEAR.base_path(tex.resource_path)
	if canonical != tex.resource_path:
		return apply(load(canonical), GALA_WEAR.preview_cfg(cfg))
	if cfg.is_empty():
		return tex





	var es_persona: bool = _modular().supports(tex.resource_path)
	if LookMigracion.hace_falta(cfg, es_persona):
		cfg = LookMigracion.al_dia(cfg, es_persona)


	if cfg.has("modular_hair") or cfg.has("modular_brows") or cfg.has("modular_beard") \
			or cfg.has("modular_hair_accessory") or cfg.has("modular_mask") \
			or cfg.has("modular_face_tattoo") or cfg.has("modular_neck_tattoo"):
		var modular = _modular()
		var body_cfg: Dictionary = cfg
		if cfg.has("street_garment"):


			body_cfg = cfg.duplicate()
			for part in ["street_head", "street_face", "acc_head", "acc_face", "acc_ear"]:
				body_cfg.erase(part)
		var composed: Texture2D = modular.compose(tex.resource_path, body_cfg)
		if composed != null:
			return _casual_head(tex, composed, cfg) if cfg.has("street_garment") else composed





		cabezas_viejas[tex.resource_path] = true
	var key: String = tex.resource_path + var_to_str(cfg)
	if _cache.has(key):
		return _cache[key]
	var img: Image = _hornea(tex, cfg)


	if img == null:
		return tex
	var out: ImageTexture = ImageTexture.create_from_image(img)
	if en_hilo_principal():
		_ultima_tex = out
		_ultima_img = img
		_ultima_llave = key
	else:
		_ultima_tex_h = out
		_ultima_img_h = img
		_ultima_llave_h = key
	if _cache.size() >= CACHE_MAX:
		_cache.clear()
	_cache[key] = out
	_apunta_clave(key, false)
	return out




























static var _base_directa: bool = true

static func base_imagen(tex: Texture2D, cfg: Dictionary) -> Image:
	if not _base_directa or tex == null or cfg.is_empty():
		return null
	candado_toma()
	var img: Image = _base_imagen_sin_candado(tex, cfg)
	candado_suelta()
	return img


static func _base_imagen_sin_candado(tex: Texture2D, cfg: Dictionary) -> Image:
	if GALA_WEAR.base_path(tex.resource_path) != tex.resource_path:
		return null
	if _modular().supports(tex.resource_path):
		return null
	if LookMigracion.hace_falta(cfg, false):
		cfg = LookMigracion.al_dia(cfg, false)
	if _cache.has(tex.resource_path + var_to_str(cfg)):
		return null
	return _hornea(tex, cfg)




static func _hornea(tex: Texture2D, cfg: Dictionary) -> Image:






	var img: Image = _fuente_rgba(tex)





	if img == null:
		return null
	var view: String = _view_of(tex.resource_path)








	if tex.resource_path.get_file().get_basename().begins_with("shirtoff_"):
		cfg = cfg.duplicate()
		cfg.erase("long_sleeves")
		cfg.erase("kit_sleeves")








		cfg.erase("tattoo")
		cfg.erase("tattoo_style")





		cfg.erase("comp_parche")
		cfg.erase("parche_vigente")






	_tapa_placa(img, tex.resource_path.get_file().get_basename(), REF_KIT)
	_recolor(img, cfg, view, tex.resource_path)
	_stamp_number(img, cfg, tex.resource_path)
	_stamp_crest(img, cfg, tex.resource_path)









	if bool(cfg.get("banda_capitan", false)) and not bool(cfg.get("cinta_lamina", false)):
		ArmbandArt.bake(img, cfg, view)







	SleevePatch.bake(img, cfg, view,
		tex.resource_path.get_file().get_basename())








	if cfg.has("bib"):


		var source_path: String = String(cfg.get("_sprite_source_path", tex.resource_path))
		var bpath: String = source_path.get_base_dir() + "/casaca/" \
				+ source_path.get_file()
		if ResourceLoader.exists(bpath):
			var bimg: Image = lee_imagen(load(bpath) as Texture2D, "bpath")
			var tint: Color = cfg.get("bib", Color.WHITE)
			for y in bimg.get_height():
				for x in bimg.get_width():
					var c: Color = bimg.get_pixel(x, y)
					if c.a > 0.0:
						bimg.set_pixel(x, y, Color(c.r * tint.r,
							c.g * tint.g, c.b * tint.b, c.a))
			img.blend_rect(bimg,
				Rect2i(Vector2i.ZERO, bimg.get_size()), Vector2i.ZERO)
	return img















const DORSAL_BOXES: String = "res://assets/sprites/dorsal_boxes.json"


const DORSAL_PX: int = 2






























const NUM_STYLES: Array[String] = ["auto", "plano", "sombra", "club", "relieve"]

const NUM_SHADOW_OFF: int = 1



const NUM_MIN_CONTRASTE: float = 0.25








const NUM_BG_RANGO: float = 0.18







const NUM_BG_RANGO_RELLENO: float = 0.38


























const NUM_GAPS: Dictionary = {"normal": 1, "compacto": 0}





static func _dorsal_width(text: String, gap: int) -> int:
	if text.is_empty():
		return 0
	return text.length() *(PixelText.GLYPH_W + gap) * DORSAL_PX - gap * DORSAL_PX











const NUM_FILLS: Array[String] = ["solido", "bicolor", "rayado", "degradado"]

const NUM_FONTS: Dictionary = {








	"serif": {



		"1": [6, 2, 2, 2, 7],


		"4": [4, 5, 7, 1, 1],
		"7": [7, 1, 2, 2, 2],
	},
	"palo": {



		"1": [2, 2, 2, 2, 2],
		"7": [7, 1, 1, 1, 1],
		"9": [7, 5, 7, 1, 1],
	},
}

static var _boxes: Dictionary = {}
static var _boxes_loaded: bool = false




static func _dorsal_boxes() -> Dictionary:
	if _boxes_loaded:
		return _boxes
	_boxes_loaded = true
	if FileAccess.file_exists(DORSAL_BOXES):
		var raw: Variant = JSON.parse_string(
			FileAccess.get_file_as_string(DORSAL_BOXES))
		if raw is Dictionary:
			_boxes = raw
	return _boxes


































const ROLES_PATH: String = "res://assets/sprites/palette_roles.json"






















enum RolZona{BLINDADO, KIT, KIT2, PIEL}

static var _roles: Dictionary = {}
static var _roles_ref: Dictionary = {}








static var _tela_ref: Dictionary = {}
static var _roles_loaded: bool = false


static func _rol_zona(rol: String) -> RolZona:
	if rol.begins_with("piel"):
		return RolZona.PIEL


	if rol.begins_with("playera") or rol.begins_with("kit") \
			or rol.begins_with("media") or rol.begins_with("tela"):
		return RolZona.KIT
	if rol.begins_with("short"):
		return RolZona.KIT2

	return RolZona.BLINDADO


static func _parse_roles(raw: Dictionary) -> void:
	_roles = {}
	_roles_ref = {}
	_tela_ref = {}
	var telas: PackedInt32Array = PackedInt32Array()
	var tela1: Variant = null
	for hexs in raw:
		if not (hexs is String) or not (raw[hexs] is String):
			continue
		if not Color.html_is_valid(String(hexs)):
			continue
		var col: Color = Color.html(String(hexs))
		var rol: String = String(raw[hexs])
		var rgb24: int =(col.r8<<16)|(col.g8<<8)|col.b8
		_roles[rgb24] = _rol_zona(rol)
		if rol.begins_with("tela"):
			telas.append(rgb24)

		match rol:
			"playera1", "kit1":
				_roles_ref[RolZona.KIT] = col
			"shorts1":
				_roles_ref[RolZona.KIT2] = col
			"piel1":
				_roles_ref[RolZona.PIEL] = col
			"tela1":
				tela1 = col


	if tela1 != null:
		for t in telas:
			_tela_ref[t] = tela1





static func _ref_kit_de(rgb24: int, por_defecto: Color) -> Color:
	return _tela_ref.get(rgb24, por_defecto)



static func _roles_map() -> Dictionary:
	if _roles_loaded:
		return _roles
	_roles_loaded = true
	if FileAccess.file_exists(ROLES_PATH):
		var raw: Variant = JSON.parse_string(
			FileAccess.get_file_as_string(ROLES_PATH))
		if raw is Dictionary:
			_parse_roles(raw)
	return _roles




static func _test_set_roles(map: Dictionary) -> void:
	_parse_roles(map)
	_roles_loaded = true
	_cache.clear()

	olvida_analisis()












static var _vello_override: Dictionary = {}
static func _test_set_vello(tabla: Dictionary) -> void:
	_vello_override = tabla
	_cache.clear()


	olvida_analisis()



static func _test_reset_roles() -> void:
	_roles = {}
	_roles_ref = {}
	_tela_ref = {}
	_roles_loaded = false
	_cache.clear()
	olvida_analisis()






















static func dorsal_receta(cfg: Dictionary, bg: float, rango: float) -> Dictionary:
	var revuelto: bool = rango > NUM_BG_RANGO
	var claro: Color = Color(0.98, 0.98, 1.0)
	var oscuro: Color = Color(0.06, 0.07, 0.09)



	var ink: Color = cfg["num_ink"] if cfg.has("num_ink") \
			else (oscuro if bg > 0.5 else claro)



	var halo: Color = claro if bg > 0.5 else oscuro
	var estilo: String = String(cfg.get("num_style", "auto"))



	if estilo == "hueco":
		estilo = "auto"




	if revuelto and (estilo == "plano"
			or estilo == "sombra" or estilo == "relieve"):
		estilo = "auto"


	if estilo == "club" and not cfg.has("kit_b"):
		estilo = "auto"
	var sombra: int = 0
	var cuerpo: bool = true
	var relieve: bool = false
	match estilo:
		"plano":
			halo = Color(0, 0, 0, 0)
		"sombra":





			if ink.get_luminance() < 0.5:
				estilo = "auto"
			else:
				halo = Color(0, 0, 0, 0)
				sombra = NUM_SHADOW_OFF
		"club":
			ink = cfg["kit_b"]



			halo = oscuro if ink.get_luminance() > 0.5 else claro
		"relieve":



			halo = Color(0, 0, 0, 0)
			relieve = true





	if absf(ink.get_luminance() - bg) < NUM_MIN_CONTRASTE:
		ink = Color.from_hsv(ink.h, ink.s,
			clampf(bg - 0.55, 0.05, 1.0) if bg > 0.5 else clampf(bg + 0.55, 0.0, 1.0),
			1.0)





	if halo.a > 0.0 \
			and absf(ink.get_luminance() - halo.get_luminance()) < NUM_MIN_CONTRASTE:
		halo = oscuro if ink.get_luminance() > 0.5 else claro












	var relleno: String = String(cfg.get("num_fill", "solido"))











	if rango > NUM_BG_RANGO_RELLENO:
		relleno = "solido"
	var tinta_oscura: bool = ink.get_luminance() < 0.5











	var base2: Color = cfg.get("kit_b", ink)
	var ink2: Color = Color.from_hsv(base2.h, maxf(base2.s, 0.15),
		clampf(ink.v +(0.34 if tinta_oscura else -0.34), 0.08, 1.0), 1.0)




	if absf(ink2.get_luminance() - bg) < NUM_MIN_CONTRASTE:

		ink2 = Color.from_hsv(ink2.h, ink2.s,
			clampf(bg - 0.3 if tinta_oscura else bg + 0.3, 0.05, 1.0), 1.0)




		if absf(ink2.get_luminance() - bg) < NUM_MIN_CONTRASTE:
			relleno = "solido"
	return {"tinta": ink, "halo": halo, "tinta2": ink2, "relleno": relleno,
		"estilo": estilo, "cuerpo": cuerpo, "sombra": sombra, "relieve": relieve}


static func _stamp_number(img: Image, cfg: Dictionary, path: String) -> void:
	var n: int = int(cfg.get("number", 0))
	if n <= 0 or path.is_empty():
		return





	if bool(cfg.get("num_lamina", false)):
		return
	var box: Variant = _dorsal_boxes().get(path.get_file().get_basename())
	if not (box is Array) or (box as Array).size() < 4:
		return
	var b: Array = box.duplicate()
	var text: String = str(n)
	var gap: int = int(NUM_GAPS.get(String(cfg.get("num_size", "compacto")), 0))




	var _e0: String = String(cfg.get("num_style", "auto"))
	if _e0 == "sombra" or _e0 == "relieve":
		gap = maxi(gap, 1)
	var w: int = _dorsal_width(text, gap)
	var h: int = PixelText.GLYPH_H * DORSAL_PX








	var x0: int = int(b[0]) + int(floor(float(int(b[2]) - w) / 2.0))
	var y0: int = int(b[1]) + int(floor(float(int(b[3]) - h) / 2.0))









	var fondo: Vector3 = _luminance_stats(img, x0, y0, w, h)


	var r: Dictionary = dorsal_receta(cfg, fondo.x, fondo.z)
	var ink: Color = r["tinta"]
	var halo: Color = r["halo"]
	var ink2: Color = r["tinta2"]
	var relleno: String = String(r["relleno"])
	var estilo: String = String(r["estilo"])
	var cuerpo: bool = r["cuerpo"]
	var sombra: int = int(r["sombra"])
	var relieve: bool = r["relieve"]
	var tinta_oscura: bool = ink.get_luminance() < 0.5



	var fuente: Dictionary = NUM_FONTS.get(String(cfg.get("num_font", "")), {})
	for i in text.length():
		var glyph_x: int = x0 + i *(PixelText.GLYPH_W + gap) * DORSAL_PX
		var glyph: Array = fuente.get(text[i], PixelText.FONT.get(text[i], []))
		_stamp_glyph(img, glyph_x, y0, glyph, ink, halo, sombra, cuerpo,
			relleno, ink2, relieve)





static func _stamp_glyph(img: Image, x0: int, y0: int, glyph: Array,
		ink: Color, halo: Color = Color(0, 0, 0, 0), sombra: int = 0,
		cuerpo: bool = true, relleno: String = "solido",
		ink2: Color = Color(0, 0, 0, 0), relieve: bool = false) -> void:
	if glyph.is_empty():
		return



	if sombra > 0:
		var tono: Color = Color(0.06, 0.07, 0.09) \
				if ink.get_luminance() > 0.5 else Color(0.98, 0.98, 1.0)
		for row_s in PixelText.GLYPH_H:
			var sbits: int = glyph[row_s]
			for col_s in PixelText.GLYPH_W:
				if not (sbits&(4>>col_s)):
					continue
				for dy_s in DORSAL_PX:
					for dx_s in DORSAL_PX:
						var sx: int = x0 + col_s * DORSAL_PX + dx_s \
								+ sombra * DORSAL_PX
						var sy: int = y0 + row_s * DORSAL_PX + dy_s \
								+ sombra * DORSAL_PX
						if sx < 0 or sy < 0 or sx >= img.get_width() \
								or sy >= img.get_height():
							continue
						if img.get_pixel(sx, sy).a > 0.0:
							img.set_pixel(sx, sy, tono)




	if relieve:
		for lado in 2:
			var off: int = -1 if lado == 0 else 1
			var tono: Color = Color(0.98, 0.98, 1.0) if lado == 0 \
					else Color(0.06, 0.07, 0.09)
			for row_r in PixelText.GLYPH_H:
				var rbits: int = glyph[row_r]
				for col_r in PixelText.GLYPH_W:
					if not (rbits&(4>>col_r)):
						continue
					for dy_r in DORSAL_PX:
						for dx_r in DORSAL_PX:
							var rx: int = x0 + col_r * DORSAL_PX + dx_r + off
							var ry: int = y0 + row_r * DORSAL_PX + dy_r + off
							if rx < 0 or ry < 0 or rx >= img.get_width() \
									or ry >= img.get_height():
								continue
							if img.get_pixel(rx, ry).a > 0.0:
								img.set_pixel(rx, ry, tono)
	if halo.a > 0.0:





		var body: Dictionary = {}
		for row_b in PixelText.GLYPH_H:
			var bbits: int = glyph[row_b]
			for col_b in PixelText.GLYPH_W:
				if not (bbits&(4>>col_b)):
					continue
				for dy_b in DORSAL_PX:
					for dx_b in DORSAL_PX:
						body[Vector2i(x0 + col_b * DORSAL_PX + dx_b,
							y0 + row_b * DORSAL_PX + dy_b)] = true
		for row in PixelText.GLYPH_H:
			var hbits: int = glyph[row]
			for col in PixelText.GLYPH_W:
				if not (hbits&(4>>col)):
					continue
				for dy in range(-1, DORSAL_PX + 1):
					for dx in range(-1, DORSAL_PX + 1):
						var hx: int = x0 + col * DORSAL_PX + dx
						var hy: int = y0 + row * DORSAL_PX + dy
						if hx < 0 or hy < 0 or hx >= img.get_width() \
								or hy >= img.get_height():
							continue
						if body.has(Vector2i(hx, hy)):
							continue
						if img.get_pixel(hx, hy).a > 0.0:
							img.set_pixel(hx, hy, halo)
	if not cuerpo:
		return
	var alto: int = PixelText.GLYPH_H * DORSAL_PX
	for row in PixelText.GLYPH_H:
		var bits: int = glyph[row]
		for col in PixelText.GLYPH_W:
			if not (bits&(4>>col)):
				continue
			for dy in DORSAL_PX:




				var fy: int = row * DORSAL_PX + dy
				var tinta: Color = ink
				match relleno:
					"bicolor":
						if fy >= alto / 2:
							tinta = ink2
					"rayado":
						if (fy / DORSAL_PX) % 2 == 1:
							tinta = ink2
					"degradado":
						tinta = ink.lerp(ink2,
							float(fy) / maxf(float(alto - 1), 1.0))
				for dx in DORSAL_PX:
					var x: int = x0 + col * DORSAL_PX + dx
					var y: int = y0 + row * DORSAL_PX + dy
					if x < 0 or y < 0 or x >= img.get_width() \
							or y >= img.get_height():
						continue
					if img.get_pixel(x, y).a > 0.0:
						img.set_pixel(x, y, tinta)






static func _luminance_stats(img: Image, x0: int, y0: int, w: int, h: int) -> Vector3:
	var vals: PackedFloat32Array = PackedFloat32Array()
	var total: float = 0.0
	for y in range(y0, y0 + h):
		for x in range(x0, x0 + w):
			if x < 0 or y < 0 or x >= img.get_width() or y >= img.get_height():
				continue
			var c: Color = img.get_pixel(x, y)
			if c.a <= 0.0:
				continue
			vals.append(c.get_luminance())
			total += c.get_luminance()
	if vals.is_empty():
		return Vector3.ZERO
	var media: float = total / float(vals.size())
	var acc: float = 0.0
	var lo: float = 1.0
	var hi: float = 0.0
	for v in vals:
		acc +=(v - media) *(v - media)
		lo = minf(lo, v)
		hi = maxf(hi, v)
	return Vector3(media, sqrt(acc / float(vals.size())), hi - lo)





static func _mean_luminance(img: Image, x0: int, y0: int, w: int, h: int) -> float:
	var total: float = 0.0
	var n: int = 0
	for y in range(y0, y0 + h):
		for x in range(x0, x0 + w):
			if x < 0 or y < 0 or x >= img.get_width() or y >= img.get_height():
				continue
			var c: Color = img.get_pixel(x, y)
			if c.a <= 0.0:
				continue
			total += c.get_luminance()
			n += 1
	return total / float(n) if n > 0 else 0.0
























const CREST_MASKS: Dictionary = {
	"shield": [
		["11111", "11111", "11111", "11111", "01110", "00100"],
		["00000", "01110", "01110", "01110", "00100", "00000"]],
	"round": [
		["01110", "11111", "11111", "11111", "01110"],
		["00000", "01110", "01110", "01110", "00000"]],
	"diamond": [
		["00100", "01110", "11111", "11111", "01110", "00100"],
		["00000", "00100", "01110", "01110", "00100", "00000"]],
	"square": [
		["11111", "11111", "11111", "11111", "11111"],
		["00000", "01110", "01110", "01110", "00000"]],
}


const CREST_LETTER_PX: int = 1




const CREST_PLATE: Array[String] = ["01110", "11111", "11111", "11111", "11111",
	"11111", "01110"]




















const PECHO_PLACAS: String = "res://assets/sprites/pecho_placa.json"
static var _placas: Dictionary = {}
static var _placas_leidas: bool = false


static func _tapa_placa(img: Image, base: String, kit: Color) -> void:
	if not _placas_leidas:
		_placas_leidas = true
		var txt: String = FileAccess.get_file_as_string(PECHO_PLACAS)
		if not txt.is_empty():
			var d: Variant = JSON.parse_string(txt)
			if d is Dictionary:
				_placas = d
	var v: Variant = _placas.get(base)
	if not (v is Array) or (v as Array).is_empty():
		return




	var rects: Array = v if (v as Array)[0] is Array else [v]
	for r in rects:
		if not (r is Array) or (r as Array).size() != 4:
			continue
		var a: Array = r
		for y in range(int(a[1]), int(a[1]) + int(a[3])):
			for x in range(int(a[0]), int(a[0]) + int(a[2])):
				if x < 0 or y < 0 or x >= img.get_width() or y >= img.get_height():
					continue
				if img.get_pixel(x, y).a > 0.0:
					img.set_pixel(x, y, kit)




















static func pecho_de_frente(base: String) -> bool:
	if base.contains("south"):
		return true
	return base.begins_with("idle_keeper_") and not base.contains("north")











static func parada_de_frente(base: String) -> bool:
	if base.contains("north"):
		return false
	return base.begins_with("dive_") or base.begins_with("jump_") \
			or base.begins_with("chest_catch_") or base.begins_with("pie_raso_") \
			or base.begins_with("pie_lateral_") or base.begins_with("blocaje_") \
			or base.begins_with("parada_")


















static var _parches: Dictionary = {}

static func parche_lamina(cfg: Dictionary) -> ImageTexture:
	if cfg.has("crest_logo") or cfg.has("bib"):
		return null
	var pais: String = String(cfg.get("crest_flag", ""))
	if pais.is_empty() and (not cfg.has("crest_rim") or not cfg.has("crest_fill")):
		return null
	var forma: String = "shield" if not pais.is_empty() else forma_parche(cfg)
	var kit: Color = cfg.get("kit", REF_KIT)
	var llave: String = var_to_str([pais, forma, kit, cfg.get("crest_rim"),
		cfg.get("crest_fill"), cfg.get("crest_shape"), cfg.get("crest_letter")])
	if _parches.has(llave):
		return _parches[llave]
	var mask: Array = CREST_PLATE if forma == "plate" else CREST_MASKS[forma][0]
	var img: Image = Image.create(String(mask[0]).length(), mask.size(), false,
		Image.FORMAT_RGBA8)


	img.fill(Color(0.0, 0.0, 0.0, 0.5))
	var pinto: bool = true
	if pais.is_empty():
		pinto = stamp_patch(img, cfg, Vector2i.ZERO)
	else:
		var bandera: Image = lee_imagen(Flags.texture(pais), "bandera")
		if bandera.get_width() <= 0 or bandera.get_height() <= 0:
			pinto = false
		else:
			_pinta_bandera(img, bandera, kit, Vector2i.ZERO)
	if not pinto:
		return null
	for y in img.get_height():
		for x in img.get_width():
			if img.get_pixel(x, y).a < 0.99:
				img.set_pixel(x, y, Color(0.0, 0.0, 0.0, 0.0))
	var tex: ImageTexture = ImageTexture.create_from_image(img)
	tex.set_meta("forma_parche", forma)
	_parches[llave] = tex
	return tex









static func parche_rect(base: String, tex: Texture2D) -> Rect2:
	if tex == null or not parada_de_frente(base):
		return Rect2()
	var o: Vector2i = _patch_origin_ancla(base, String(tex.get_meta("forma_parche", "shield")))
	if o.x < 0:
		return Rect2()
	return Rect2(Vector2(o), tex.get_size())


static func _stamp_crest(img: Image, cfg: Dictionary, path: String) -> void:
	if path.is_empty():
		return














	var base: String = path.get_file().get_basename()
	if base.begins_with("chilena_player_"):
		if not base.contains("south") or int(base.right(2)) > 3:
			return
	if not pecho_de_frente(base):
		return





	if path.get_file().get_basename().begins_with("shirtoff_"):
		return







	if cfg.has("bib"):
		return





	if cfg.has("crest_logo"):
		return




	if cfg.has("crest_flag"):
		_stamp_flag(img, String(cfg["crest_flag"]), cfg.get("kit", REF_KIT), base)
		return
	if not cfg.has("crest_rim") or not cfg.has("crest_fill"):
		return
	var bb: Rect2i = _body_rect(img)
	if bb.size.x <= 0 or bb.size.y <= 0:
		return












	if _sin_escudo(base):
		return
	var o: Vector2i = _patch_origin_ancla(base, forma_parche(cfg))
	if o.x >= 0:
		if stamp_patch(img, cfg, o):
			return
	stamp_patch(img, cfg, _patch_origin(bb))


















const PECHO_PARCHE: String = "res://assets/sprites/pecho_parche.json"
static var _huecos: Dictionary = {}
static var _huecos_leidos: bool = false

static func _patch_origin_ancla(base: String, forma: String) -> Vector2i:
	if not _huecos_leidos:
		_huecos_leidos = true
		var d: Variant = JSON.parse_string(FileAccess.get_file_as_string(PECHO_PARCHE))
		_huecos = d if d is Dictionary else {}
	var sitio: Variant =(_huecos.get(base, {}) as Dictionary).get(forma)
	if not (sitio is Array) or (sitio as Array).size() != 2:
		return Vector2i(-1, -1)
	return Vector2i(int(sitio[0]), int(sitio[1]))



static func _sin_escudo(base: String) -> bool:
	_patch_origin_ancla(base, "shield")
	var v: Variant = _huecos.get(base)
	return v is Dictionary and (v as Dictionary).is_empty()






static func forma_parche(cfg: Dictionary) -> String:
	if not String(cfg.get("crest_letter", "")).is_empty():
		return "plate"
	var forma: String = String(cfg.get("crest_shape", "shield"))
	return forma if CREST_MASKS.has(forma) else "shield"















static func stamp_patch(img: Image, cfg: Dictionary, o: Vector2i) -> bool:
	if not cfg.has("crest_rim") or not cfg.has("crest_fill"):
		return false
	var letter: String = String(cfg.get("crest_letter", ""))
	var pair: Array = CREST_MASKS.get(String(cfg.get("crest_shape", "shield")),
		CREST_MASKS["shield"])
	var mask: Array = pair[0]
	var fill_mask: Array = pair[1]
	if not letter.is_empty():
		mask = CREST_PLATE
		fill_mask = []
	var w: int = String(mask[0]).length()
	var h: int = mask.size()



	var x0: int = o.x
	var y0: int = o.y
	for dy in h:
		for dx in w:
			var p: Vector2i = Vector2i(x0 + dx, y0 + dy)
			if p.x < 0 or p.y < 0 or p.x >= img.get_width() \
					or p.y >= img.get_height():
				return false
			if img.get_pixel(p.x, p.y).a <= 0.0:
				return false



	var kit: Color = cfg.get("kit", REF_KIT)
	var rim: Color = _vs_kit(cfg["crest_rim"], kit)
	var fill: Color = _vs_kit(cfg["crest_fill"], kit)



	if absf(rim.get_luminance() - fill.get_luminance()) < 0.18:
		rim = rim.darkened(0.6) if fill.get_luminance() > 0.5 \
				else rim.lightened(0.6)
	for dy in mask.size():
		var row: String = mask[dy]
		for dx in row.length():
			if row[dx] == "1":
				img.set_pixel(x0 + dx, y0 + dy, rim)
	for dy in fill_mask.size():
		var frow: String = fill_mask[dy]
		for dx in frow.length():
			if frow[dx] == "1":
				img.set_pixel(x0 + dx, y0 + dy, fill)
	if not letter.is_empty():


		_stamp_letter(img, x0 + 1, y0 + 1, letter, fill)
	return true










static func _patch_origin(bb: Rect2i) -> Vector2i:
	return Vector2i(
		bb.position.x + int(bb.size.x * 0.5) + int(bb.size.x * 0.08),
		bb.position.y + int(bb.size.y * 0.36))
















static var _parche: Dictionary = {}

static func crest_patch_rect(sheet: Texture2D) -> Rect2i:
	if sheet == null:
		return Rect2i()
	candado_toma()
	var r: Rect2i = _crest_patch_rect_sin_candado(sheet)
	candado_suelta()
	return r


static func _crest_patch_rect_sin_candado(sheet: Texture2D) -> Rect2i:
	var clave: String = sheet.resource_path
	if clave.is_empty():
		clave = str(sheet.get_instance_id())
	if _parche.has(clave):
		return _parche[clave]
	var img: Image = lee_imagen(sheet, "sheet")
	var r: Rect2i = Rect2i()
	if img != null:
		if img.is_compressed():
			img.decompress()
		var bb: Rect2i = _body_rect(img)
		if bb.size.x > 0 and bb.size.y > 0:
			r = Rect2i(_patch_origin(bb), Vector2i(5, 6))
	_parche[clave] = r
	return r





static func _patch_fits(img: Image, x0: int, y0: int, pw: int, ph: int) -> bool:
	for oy in range(-1, ph + 1):
		for ox in range(-1, pw + 1):
			var x: int = x0 + ox
			var y: int = y0 + oy
			if x < 0 or y < 0 or x >= img.get_width() or y >= img.get_height():
				return false
			if img.get_pixel(x, y).a <= 0.0:
				return false
	return true



























static func _stamp_flag(img: Image, nation_id: String, cfg_kit: Color, base: String = "") -> void:
	var flag: Image = lee_imagen(Flags.texture(nation_id), "flag")
	if flag.get_width() <= 0 or flag.get_height() <= 0:
		return
	var bb: Rect2i = _body_rect(img)
	if bb.size.x <= 0 or bb.size.y <= 0:
		return


	var mask: Array = CREST_MASKS["shield"][0]
	var w: int = String(mask[0]).length()
	var h: int = mask.size()


	var o: Vector2i = _patch_origin_ancla(base, "shield")
	if o.x < 0:
		o = _patch_origin(bb)



	for dy0 in h:
		for dx0 in w:
			var p := Vector2i(o.x + dx0, o.y + dy0)
			if p.x < 0 or p.y < 0 or p.x >= img.get_width() \
					or p.y >= img.get_height():
				return
			if img.get_pixel(p.x, p.y).a <= 0.0:
				return
	_pinta_bandera(img, flag, cfg_kit, o)







static func _pinta_bandera(img: Image, flag: Image, kit: Color, o: Vector2i) -> void:
	var fw: int = flag.get_width()
	var fh: int = flag.get_height()




	var ix: int = 1 if fw > 2 else 0
	var iy: int = 1 if fh > 2 else 0
	var iw: int = fw - ix * 2
	var ih: int = fh - iy * 2
	var mask: Array = CREST_MASKS["shield"][0]
	var w: int = String(mask[0]).length()
	var h: int = mask.size()
	var x0: int = o.x
	var y0: int = o.y
	var visible := 0
	var total := 0
	for dy in h:
		var row: String = mask[dy]
		for dx in w:
			if row[dx] != "1":
				continue
			var sx: int = ix + mini(int(float(dx) * float(iw) / float(w)), iw - 1)
			var sy: int = iy + mini(int(float(dy) * float(ih) / float(h)), ih - 1)
			var col: Color = flag.get_pixel(sx, sy)
			if col.a <= 0.0:
				continue
			col = Color(col.r, col.g, col.b, 1.0)
			total += 1


			if absf(col.get_luminance() - kit.get_luminance()) >= 0.1 \
					or _rgb_dist(col, kit) >= 0.25:
				visible += 1
			img.set_pixel(x0 + dx, y0 + dy, col)
	if visible * 2 >= total:
		return

	var edge: Color = Color(0.1, 0.11, 0.13) if kit.get_luminance() > 0.45 \
			else Color(0.92, 0.93, 0.96)
	for dy in h:
		var row2: String = mask[dy]
		for dx in w:
			if row2[dx] == "1" and _mask_border(mask, dx, dy):
				img.set_pixel(x0 + dx, y0 + dy, edge)




static func _mask_border(mask: Array, dx: int, dy: int) -> bool:
	for d in [Vector2i(1, 0), Vector2i(-1, 0), Vector2i(0, 1), Vector2i(0, -1)]:
		var ny: int = dy + d.y
		if ny < 0 or ny >= mask.size():
			return true
		var row: String = mask[ny]
		var nx: int = dx + d.x
		if nx < 0 or nx >= row.length() or row[nx] != "1":
			return true
	return false





static func _rgb_dist(a: Color, b: Color) -> float:
	return Vector3(a.r - b.r, a.g - b.g, a.b - b.b).length()




static func _stamp_letter(img: Image, x0: int, y0: int, ch: String,
		ink: Color) -> void:
	var glyph: Array = PixelText.FONT.get(ch, [])
	if glyph.is_empty():
		return
	for row in PixelText.GLYPH_H:
		var bits: int = glyph[row]
		for col in PixelText.GLYPH_W:
			if not (bits&(4>>col)):
				continue
			for dy in CREST_LETTER_PX:
				for dx in CREST_LETTER_PX:
					var x: int = x0 + col * CREST_LETTER_PX + dx
					var y: int = y0 + row * CREST_LETTER_PX + dy
					if img.get_pixel(x, y).a > 0.0:
						img.set_pixel(x, y, ink)




static func _vs_kit(col: Color, kit: Color) -> Color:
	if absf(col.get_luminance() - kit.get_luminance()) >= 0.18:
		return col
	return col.lightened(0.5) if kit.get_luminance() < 0.5 else col.darkened(0.5)








static func _view_of(path: String) -> String:
	var f: String = path.get_file()
	if f.contains("north"):
		return "back"
	if f.contains("east"):
		return "right"
	if f.contains("west"):
		return "left"
	return "front"









static var _acota_recolor: bool = true


static func _recolor(img: Image, cfg: Dictionary, view: String = "front", fuente: String = "") -> void:


	var bb: Rect2i
	var bb_c: Variant = _memo_lee(_caja, fuente) if not fuente.is_empty() else null
	if bb_c == null:
		bb = _body_rect(img)
		if _memo_guarda > 0 and not fuente.is_empty():
			_memo_pon(_caja, fuente, bb, ANA_MAX)
	else:
		bb = bb_c
	if bb.size.x <= 0 or bb.size.y <= 0:
		return







	var head_bottom: int = maxi(bb.position.y + int(bb.size.y * HEAD_FRAC),
		int(cfg.get("_cabeza_hasta", 0)))






	var head_at: Vector2i = head_anchor(img, bb, head_bottom) \
			if cfg.has("street_head") or cfg.has("street_top") or cfg.has("street_garment") else Vector2i.ZERO
	var has_pattern: bool = cfg.has("kit") and cfg.has("kit_b") \
			and String(cfg.get("pattern", "solid")) != "solid"




	var has_trim: bool = cfg.has("local_trim")
	var trim_name: String = String(cfg.get("local_trim", ""))
	var trim_col: Color = cfg.get("trim_col",
		cfg.get("kit_b", cfg.get("kit", Color.WHITE)))
	var base: KitBase = _kit_base(cfg)
	var style: String = String(cfg.get("hair_style", "normal"))
	var facial: String = String(cfg.get("facial_hair", "none"))








	var wants_hair: bool = cfg.has("hair") or style != "normal" \
			or cfg.has("hair_tips") or cfg.has("headband")




	var face_px: Array[Vector2i] = []
	var face_orig: Array[Color] = []
	var face_bb: Rect2i = Rect2i()
	var hair_px: Array[Vector2i] = []
	var hair_orig: Array[Color] = []
	var hair_set: Dictionary = {}
	var head_set: Dictionary = {}
	var vals: Array[float] = []
	var sats: Array[float] = []
	var src: Dictionary = {}
	var skin_set: Dictionary = {}
	var has_face: bool = false
	var fw_margin: int = 0
	var hair_bb: Rect2i = Rect2i()
	var has_hair_bb: bool = false




	var clave_ana: String = "" if fuente.is_empty() \
			else "%s|%d|%d|%s|%s" % [fuente, head_bottom, base, wants_hair, _acota_recolor]
	var ana: Variant = _memo_lee(_ana, clave_ana) if not fuente.is_empty() else null
	if ana == null:
		face_bb = _largest_skin_component(img, head_bottom,
			face_px, face_orig)











		has_face = face_bb.size.y > 0










		fw_margin = maxi(int(face_bb.size.x * 0.5), 4)






		hair_bb = Rect2i() if has_face \
				else _largest_dark_component(img, head_bottom)
		has_hair_bb = hair_bb.size.x > 0











		var w1: int = img.get_width()
		var data1: PackedByteArray = img.get_data()



		var caja1: Rect2i = img.get_used_rect() if _acota_recolor else Rect2i(0, 0, w1, img.get_height())
		for y in range(caja1.position.y, mini(head_bottom, mini(caja1.end.y, img.get_height()))):
			var row1: int = y * w1
			for x in range(caja1.position.x, mini(caja1.end.x, w1)):
				var o1: int =(row1 + x) * 4
				if data1[o1 + 3] < 128:
					continue
				var c: Color = Color8(data1[o1], data1[o1 + 1], data1[o1 + 2],
					data1[o1 + 3])
				if has_face:
					if x < face_bb.position.x - fw_margin \
							or x > face_bb.end.x + fw_margin \
							or y > face_bb.end.y:
						continue
				if has_face and y < face_bb.end.y:















					var fuera_cara: bool = x < face_bb.position.x \
							or x > face_bb.end.x
					var de_tela: bool = _es_kit_origen(c.h * 360.0, c, base)
					if not (de_tela and (fuera_cara
							or _cuello_de_tela(data1, w1, x, y, face_bb.end.y, base))):
						head_set[Vector2i(x, y)] = true




				var deg_h: float = c.h * 360.0
				src[Vector2i(x, y)] = c
				if _is_skin(deg_h, c):
					skin_set[Vector2i(x, y)] = true
				var is_h: bool = _is_hair(deg_h, c)
				if not is_h and c.v < 0.1:
					is_h =(not has_face and _en_la_mata(hair_bb, has_hair_bb, x, y)) \
							or (has_face and y < face_bb.position.y)



				if is_h and not has_face and not _en_la_mata(hair_bb, has_hair_bb, x, y):
					is_h = false












				if is_h and has_face and y >= face_bb.position.y \
						and x >= face_bb.position.x and x <= face_bb.end.x:
					is_h = false
				if is_h and wants_hair:
					hair_px.append(Vector2i(x, y))
					hair_orig.append(c)
					hair_set[Vector2i(x, y)] = true
					vals.append(c.v)
					sats.append(c.s)
		if _memo_guarda > 0 and not fuente.is_empty():
			_memo_pon(_ana, clave_ana, [face_bb, face_px.duplicate(), face_orig.duplicate(),
				hair_bb, hair_px.duplicate(), hair_orig.duplicate(), hair_set.duplicate(),
				head_set.duplicate(), vals.duplicate(), sats.duplicate(), src.duplicate(),
				skin_set.duplicate()], ANA_MAX)
	else:


		face_bb = ana[0]
		face_px =(ana[1] as Array[Vector2i]).duplicate()
		face_orig =(ana[2] as Array[Color]).duplicate()
		hair_bb = ana[3]
		hair_px =(ana[4] as Array[Vector2i]).duplicate()
		hair_orig =(ana[5] as Array[Color]).duplicate()
		hair_set =(ana[6] as Dictionary).duplicate()
		head_set =(ana[7] as Dictionary).duplicate()
		vals =(ana[8] as Array[float]).duplicate()
		sats =(ana[9] as Array[float]).duplicate()
		src =(ana[10] as Dictionary).duplicate()
		skin_set =(ana[11] as Dictionary).duplicate()
		has_face = face_bb.size.y > 0
		fw_margin = maxi(int(face_bb.size.x * 0.5), 4)
		has_hair_bb = hair_bb.size.x > 0
	var ref_v: float = _median(vals, REF_HAIR.v)
	var ref_s: float = _median(sats, REF_HAIR.s)
















	var has_hair_cfg: bool = cfg.has("hair")
	var has_kit_cfg: bool = cfg.has("kit")
	var has_kit2_cfg: bool = cfg.has("kit2")
	var has_skin_cfg: bool = cfg.has("skin")
	var hair_col: Color = cfg.get("hair", REF_HAIR)
	var kit_col: Color = cfg.get("kit", REF_KIT)
	var kit2_col: Color = cfg.get("kit2", REF_KIT2)
	var skin_col: Color = cfg.get("skin", REF_SKIN)
	var base_ref: Color = _base_ref(base)


	var roles: Dictionary = _roles_map()
	var sin_roles: bool = roles.is_empty()
	var rol_ref_kit: Color = _roles_ref.get(RolZona.KIT, base_ref)
	var rol_ref_kit2: Color = _roles_ref.get(RolZona.KIT2, REF_KIT2)
	var rol_ref_piel: Color = _roles_ref.get(RolZona.PIEL, REF_SKIN)
	var pattern_top: int = bb.position.y + int(bb.size.y * 0.62)



	var shirt_bb: Rect2i = Rect2i(bb.position.x, head_bottom,
		bb.size.x, maxi(pattern_top - head_bottom, 1))






	var has_short_pat: bool = has_kit2_cfg and cfg.has("kit2_b") \
			and String(cfg.get("short_pat", "solid")) != "solid"
	var casual_boots: Dictionary = {}
	var casual_mask: Dictionary = {}




	var quien_pierna: PackedByteArray = PackedByteArray()
	var tailoring: bool = cfg.has("street_garment")
	var short_px: PackedInt32Array = PackedInt32Array()
	var sb_min := Vector2i(1<<30, 1<<30)
	var sb_max := Vector2i(-1, -1)
	var w2: int = img.get_width()
	var h2: int = img.get_height()
	var data2: PackedByteArray = img.get_data()
	var hair_mask: PackedByteArray = _flat_mask(hair_set, w2, h2)
	var head_mask: PackedByteArray = _flat_mask(head_set, w2, h2)


	var caja2: Rect2i = img.get_used_rect() if _acota_recolor else Rect2i(0, 0, w2, h2)





	var mangas: PackedByteArray = PackedByteArray()
	var bb_pat: Rect2i = bb
	if has_pattern:
		if fuente.get_file().get_basename().begins_with("shirtoff_"):
			bb_pat = _caja_playera_suelta(data2, w2, h2, caja2, base, head_mask,
				pattern_top, bb)
		elif _dibujo_de_brazos(String(cfg.get("pattern", "solid"))):
			var clave_m: String = "%s|%d|%d" % [fuente, base, head_bottom]
			var m_c: Variant = _memo_lee(_mangas, clave_m) if not fuente.is_empty() else null
			if m_c == null:
				mangas = _mangas_de(data2, w2, h2, caja2, bb, base, head_mask, face_bb,
					pattern_top)
				if _memo_guarda > 0 and not fuente.is_empty():
					_memo_pon(_mangas, clave_m, mangas, ANA_MAX)
			else:
				mangas = m_c





















	var cl: Array = _clasifica(fuente, data2, caja2, w2, h2, base, sin_roles, roles)
	if cl.is_empty():
		for y in range(caja2.position.y, mini(caja2.end.y, h2)):
			var row2: int = y * w2
			for x in range(caja2.position.x, mini(caja2.end.x, w2)):
				var i2: int = row2 + x
				var o2: int = i2 * 4
				if data2[o2 + 3] < 128:
					continue
				var c: Color = Color8(data2[o2], data2[o2 + 1], data2[o2 + 2],
					data2[o2 + 3])
				var deg: float = c.h * 360.0


				var zona_rol: int = -1
				var rgb24_2: int = 0
				if not sin_roles:
					rgb24_2 =(data2[o2]<<16)|(data2[o2 + 1]<<8)|data2[o2 + 2]
					zona_rol = roles.get(rgb24_2, -1)
				if has_hair_cfg and hair_mask[i2] == 1:




					var corona: bool = y + 1 < h2 and hair_mask[i2 + w2] == 1 \
							and (y == 0 or hair_mask[i2 - w2] == 0)
					img.set_pixel(x, y, _toned_hair(hair_col, ref_v, ref_s, c,
						CORONA_PISO if corona else 0.0))
				elif zona_rol >= 0:





					match zona_rol:
						RolZona.KIT:
							if has_kit_cfg and head_mask[i2] == 0:
								if tailoring and y < pattern_top:
									casual_mask[Vector2i(x, y)] = true
								var target_rol: Color = kit_col
								if has_pattern and y < pattern_top:
									target_rol = _pattern_color(cfg, x, y, bb_pat, -1 if mangas.is_empty() else mangas[i2])
								if has_trim and KitPatternGeo.trim_hit(trim_name, x, y, shirt_bb):
									target_rol = trim_col


								img.set_pixel(x, y, _toned(target_rol,
									_ref_kit_de(rgb24_2, rol_ref_kit), c))
						RolZona.KIT2:
							if has_kit2_cfg and head_mask[i2] == 0:
								if has_short_pat:
									short_px.append(i2)
									sb_min = sb_min.min(Vector2i(x, y))
									sb_max = sb_max.max(Vector2i(x, y))
								else:
									img.set_pixel(x, y,
										_toned_neutral(kit2_col, rol_ref_kit2, c))
						RolZona.PIEL:
							if has_skin_cfg:
								img.set_pixel(x, y, _toned_skin(skin_col, rol_ref_piel, c))
				elif has_kit_cfg and head_mask[i2] == 0 \
						and _is_kit_px(deg, c, base):
					if tailoring and y < pattern_top:
						casual_mask[Vector2i(x, y)] = true
					var target: Color = kit_col
					if has_pattern and y < pattern_top:
						target = _pattern_color(cfg, x, y, bb_pat, -1 if mangas.is_empty() else mangas[i2])
					if has_trim and KitPatternGeo.trim_hit(trim_name, x, y, shirt_bb):
						target = trim_col
					img.set_pixel(x, y, _toned(target, base_ref, c))
				elif has_kit2_cfg and head_mask[i2] == 0 \
						and c.s < 0.18 and c.v > 0.5:



					if has_short_pat:
						short_px.append(i2)
						sb_min = sb_min.min(Vector2i(x, y))
						sb_max = sb_max.max(Vector2i(x, y))
					else:
						img.set_pixel(x, y, _toned_neutral(kit2_col, REF_KIT2, c))
				elif has_skin_cfg and _is_skin(deg, c):
					img.set_pixel(x, y, _toned_skin(skin_col, REF_SKIN, c))
	var cl_idx: PackedInt32Array = cl[0] if not cl.is_empty() else PackedInt32Array()
	var cl_col: PackedColorArray = cl[1] if not cl.is_empty() else PackedColorArray()
	var cl_rgb: PackedInt32Array = cl[2] if not cl.is_empty() else PackedInt32Array()
	var cl_rol: PackedInt32Array = cl[3] if not cl.is_empty() else PackedInt32Array()
	var cl_flag: PackedByteArray = cl[4] if not cl.is_empty() else PackedByteArray()
	var cl_key: PackedInt64Array = cl[5] if not cl.is_empty() else PackedInt64Array()
	var memo: Dictionary = {}
	for j in cl_idx.size():
		var i2: int = cl_idx[j]
		var c: Color = cl_col[j]
		var zona_rol: int = cl_rol[j]
		var rgb24_2: int = cl_rgb[j]
		var fl: int = cl_flag[j]
		var x: int = i2 % w2
		var y: int = i2 / w2


		if has_hair_cfg and hair_mask[i2] == 1:



			var corona: bool = y + 1 < h2 and hair_mask[i2 + w2] == 1 \
					and (y == 0 or hair_mask[i2 - w2] == 0)
			img.set_pixel(x, y, _toned_hair(hair_col, ref_v, ref_s, c,
				CORONA_PISO if corona else 0.0))
		elif zona_rol >= 0:






			match zona_rol:
				RolZona.KIT:
					if has_kit_cfg and head_mask[i2] == 0:
						if tailoring and y < pattern_top:
							casual_mask[Vector2i(x, y)] = true
						var target_rol: Color = kit_col
						var fijo_rol: bool = true
						if has_pattern and y < pattern_top:
							target_rol = _pattern_color(cfg, x, y, bb_pat, -1 if mangas.is_empty() else mangas[i2])
							fijo_rol = false
						if has_trim and KitPatternGeo.trim_hit(trim_name, x, y, shirt_bb):
							target_rol = trim_col
							fijo_rol = false
						if fijo_rol:
							var k1: int = cl_key[j]|(1<<40)
							var m1: Variant = memo.get(k1)
							if m1 == null:
								m1 = _toned(target_rol, _ref_kit_de(rgb24_2, rol_ref_kit), c)
								memo[k1] = m1
							img.set_pixel(x, y, m1)
						else:
							img.set_pixel(x, y, _toned(target_rol,
								_ref_kit_de(rgb24_2, rol_ref_kit), c))
				RolZona.KIT2:
					if has_kit2_cfg and head_mask[i2] == 0:
						if has_short_pat:
							short_px.append(i2)
							sb_min = sb_min.min(Vector2i(x, y))
							sb_max = sb_max.max(Vector2i(x, y))
						else:
							var k2: int = cl_key[j]|(2<<40)
							var m2: Variant = memo.get(k2)
							if m2 == null:
								m2 = _toned_neutral(kit2_col, rol_ref_kit2, c)
								memo[k2] = m2
							img.set_pixel(x, y, m2)
				RolZona.PIEL:
					if has_skin_cfg:
						var k3: int = cl_key[j]|(3<<40)
						var m3: Variant = memo.get(k3)
						if m3 == null:
							m3 = _toned_skin(skin_col, rol_ref_piel, c)
							memo[k3] = m3
						img.set_pixel(x, y, m3)
		elif has_kit_cfg and head_mask[i2] == 0 and (fl&1) != 0:
			if tailoring and y < pattern_top:
				casual_mask[Vector2i(x, y)] = true
			var target: Color = kit_col
			var fijo: bool = true
			if has_pattern and y < pattern_top:
				target = _pattern_color(cfg, x, y, bb_pat, -1 if mangas.is_empty() else mangas[i2])
				fijo = false
			if has_trim and KitPatternGeo.trim_hit(trim_name, x, y, shirt_bb):
				target = trim_col
				fijo = false
			if fijo:
				var k4: int = cl_key[j]|(4<<40)
				var m4: Variant = memo.get(k4)
				if m4 == null:
					m4 = _toned(target, base_ref, c)
					memo[k4] = m4
				img.set_pixel(x, y, m4)
			else:
				img.set_pixel(x, y, _toned(target, base_ref, c))
		elif has_kit2_cfg and head_mask[i2] == 0 and (fl&2) != 0:



			if has_short_pat:
				short_px.append(i2)
				sb_min = sb_min.min(Vector2i(x, y))
				sb_max = sb_max.max(Vector2i(x, y))
			else:
				var k5: int = cl_key[j]|(5<<40)
				var m5: Variant = memo.get(k5)
				if m5 == null:
					m5 = _toned_neutral(kit2_col, REF_KIT2, c)
					memo[k5] = m5
				img.set_pixel(x, y, m5)
		elif has_skin_cfg and (fl&4) != 0:
			var k6: int = cl_key[j]|(6<<40)
			var m6: Variant = memo.get(k6)
			if m6 == null:
				m6 = _toned_skin(skin_col, REF_SKIN, c)
				memo[k6] = m6
			img.set_pixel(x, y, m6)













	if has_short_pat and sb_max.x >= 0:
		var fila: PackedInt32Array = PackedInt32Array()
		fila.resize(h2)
		fila.fill(0)
		for i3 in short_px:
			fila[i3 / w2] += 1
		var y_top: int = sb_min.y
		var y_bot: int = sb_max.y
		var mejor: int = -1
		var yy: int = sb_min.y
		while yy <= sb_max.y:
			if fila[yy] == 0:
				yy += 1
				continue
			var y0: int = yy
			var suma: int = 0
			var hueco: int = 0
			var y1: int = yy
			while yy <= sb_max.y:
				if fila[yy] > 0:
					suma += fila[yy]
					y1 = yy
					hueco = 0
				else:
					hueco += 1
					if hueco > 1:
						break
				yy += 1
			if suma > mejor:
				mejor = suma
				y_top = y0
				y_bot = y1
		var sx0: int = 1<<30
		var sx1: int = -1
		for i3 in short_px:
			if i3 / w2 >= y_top and i3 / w2 <= y_bot:
				sx0 = mini(sx0, i3 % w2)
				sx1 = maxi(sx1, i3 % w2)
		var sb := Rect2i(sx0, y_top, sx1 - sx0 + 1, y_bot - y_top + 1)




		var bordes: Dictionary = {}
		if String(cfg.get("short_pat", "")) in SHORT_BORDES:
			bordes = _short_bordes(short_px, w2, y_top, y_bot)
		for i3 in short_px:
			var o3: int = i3 * 4
			var c3: Color = Color8(data2[o3], data2[o3 + 1], data2[o3 + 2],
				data2[o3 + 3])
			var x3: int = i3 % w2
			var y3: int = i3 / w2
			var col3: Color = kit2_col
			if y3 >= y_top and y3 <= y_bot:
				col3 = _short_borde_color(cfg, x3, y3, bordes) if not bordes.is_empty() \
						else _short_color(cfg, x3, y3, sb)
			img.set_pixel(x3, y3, _toned_neutral(col3, rol_ref_kit2, c3))


	if has_kit_cfg and (cfg.has("sock") or cfg.has("sock_pat") or cfg.has("barro") \
			or cfg.has("mojado") or cfg.has("pasto")):
		_pinta_medias_y_desgaste(img, data2, cfg, bb, caja2, head_mask, base, base_ref,
			rol_ref_kit, pattern_top)



	if has_kit_cfg and (cfg.get("cuello_col") is Color or cfg.get("puno_col") is Color):
		_pinta_cuello_y_punos(img, data2, cfg, bb, caja2, head_mask, base, base_ref,
			rol_ref_kit)


	if has_kit_cfg and cfg.get("termica") is Color:
		_pinta_cuello_termico(img, data2, cfg["termica"], bb, caja2, head_mask, base)


	if bool(cfg.get("keeper_base", false)) and cfg.get("gloves") is Color:
		_pinta_guantes_portero(img, data2, cfg["gloves"], caja2, head_mask,
			face_bb if has_face else Rect2i(), fuente)

	if bool(cfg.get("keeper_base", false)) and has_kit_cfg:
		_pinta_ribete_portero(img, data2, cfg["kit"], caja2, base)









	if cfg.has("boots") and float(bb.size.x) / maxf(bb.size.y, 1.0) <= BOOT_MAX_ASPECT:
		var boot_col: Color = cfg["boots"]
		var boot_top: int = maxi(bb.end.y - int(bb.size.y * BOOT_FRAC), 0)


		var col_bot: PackedInt32Array = PackedInt32Array()
		col_bot.resize(w2)
		col_bot.fill(-1)
		for y in range(boot_top, h2):
			var rf: int = y * w2
			for x in w2:
				if data2[(rf + x) * 4 + 3] >= 128:
					col_bot[x] = y


		var boot_topy: PackedInt32Array = PackedInt32Array()
		boot_topy.resize(w2)
		boot_topy.fill(-1)
		for x in w2:
			if col_bot[x] < 0:
				continue
			for y in range(maxi(col_bot[x] - BOOT_H + 1, boot_top), col_bot[x] + 1):
				var o: int =(y * w2 + x) * 4
				if data2[o + 3] < 128:
					continue
				var cc: Color = Color8(data2[o], data2[o + 1], data2[o + 2],
					data2[o + 3])
				if cc.v <= BOOT_MAX_V and cc.s <= 0.75:
					boot_topy[x] = y
					break



		var keep: PackedByteArray = PackedByteArray()
		keep.resize(w2)
		for x in w2:
			if boot_topy[x] < 0:
				continue
			for y in range(maxi(boot_topy[x] - BOOT_SOCK_LOOKUP, 0), boot_topy[x]):
				var os: int =(y * w2 + x) * 4
				if data2[os + 3] < 128:
					continue
				var cs: Color = Color8(data2[os], data2[os + 1], data2[os + 2],
					data2[os + 3])
				if _es_kit_origen(cs.h * 360.0, cs, base):
					keep[x] = 1
					break




		var crecio: bool = true
		while crecio:
			crecio = false
			for x in w2:
				if keep[x] == 1 or boot_topy[x] < 0:
					continue
				for nx in [x - 1, x + 1]:
					if nx < 0 or nx >= w2 or keep[nx] == 0 or boot_topy[nx] < 0:
						continue
					if boot_topy[x] >= boot_topy[nx] - BOOT_GROW_DY:
						keep[x] = 1
						crecio = true
						break



		var x0: int = 0
		while x0 < w2:
			if keep[x0] == 0:
				x0 += 1
				continue
			var x1: int = x0
			while x1 + 1 < w2 and keep[x1 + 1] == 1:
				x1 += 1
			if x1 - x0 + 1 >= BOOT_MIN_W:
				for x in range(x0, x1 + 1):
					for y in range(boot_topy[x], col_bot[x] + 1):
						var ob: int =(y * w2 + x) * 4
						if data2[ob + 3] < 128:
							continue
						var cb: Color = Color8(data2[ob], data2[ob + 1],
							data2[ob + 2], data2[ob + 3])
						if cb.v > BOOT_MAX_V or cb.s > 0.75:
							continue
						if tailoring:
							casual_boots[Vector2i(x, y)] = true


						if cb.v <= BOOT_OUTLINE_V:
							img.set_pixel(x, y, Color.from_hsv(boot_col.h,
								boot_col.s,
								maxf(boot_col.v * BOOT_OUTLINE_MUL, 0.05), cb.a))
						else:
							img.set_pixel(x, y,
								Color(boot_col.r, boot_col.g, boot_col.b, cb.a))
			x0 = x1 + 1












	if cfg.has("long_pants") or cfg.has("short_pants"):


		var corto: bool = cfg.has("short_pants")
		var pants_col: Color = cfg.get("short_pants", cfg.get("long_pants", REF_KIT2))
		var skin_leg: Color = cfg.get("skin", REF_SKIN)
		var corte: Array = CASUAL_CORTE_POR_CUADRO.get(
			fuente.get_file().get_basename(), [CASUAL_PANTS_TOP, CASUAL_LEG_TOP, 0.0, 1.0])
		var pants_top: int = bb.position.y + int(bb.size.y * float(corte[0]))
		var leg_top: int = bb.position.y + int(bb.size.y * float(corte[1]))


		var cx0: int = bb.position.x + int(bb.size.x * float(corte[2]))
		var cx1: int = bb.position.x + int(ceilf(bb.size.x * float(corte[3])))
		var sin_corte: Image = img.duplicate() if cx0 > bb.position.x or cx1 < bb.end.x else null



		if sin_corte != null:
			corto = false















		var hem: PackedInt32Array = PackedInt32Array()
		hem.resize(w2)
		for i in w2:
			hem[i] = -1








		var LEG: int = 1
		var ARM: int = 2
		var quien: PackedByteArray = PackedByteArray()
		quien.resize(w2 * h2)
		for x in w2:
			var estado: int = 0











			var hem_cerrado: bool = false
			for y in range(maxi(pants_top, 0), h2):
				var i_q: int = y * w2 + x
				var oh: int = i_q * 4
				if data2[oh + 3] >= 128:
					var ch: Color = Color8(data2[oh], data2[oh + 1], data2[oh + 2],
						data2[oh + 3])
					if ch.s < 0.18 and ch.v > 0.5:
						estado = LEG
						if not hem_cerrado:
							hem[x] = y
					elif hem[x] >= 0 and (_is_skin(ch.h * 360.0, ch) \
							or (y >= leg_top and _es_kit_origen(ch.h * 360.0, ch, base))):
						hem_cerrado = true
					elif _es_kit_origen(ch.h * 360.0, ch, base) and y < leg_top:



						estado = ARM
				quien[i_q] = estado












			var sigue: bool = leg_top > 0
			for dy in range(1, 9):
				var o_k: int =((leg_top + dy) * w2 + x) * 4
				if leg_top + dy >= h2 or data2[o_k + 3] < 128:
					break
				var c_k: Color = Color8(data2[o_k], data2[o_k + 1], data2[o_k + 2])
				if _es_kit_origen(c_k.h * 360.0, c_k, base) or _es_pantalon_gris(c_k):
					break
				if c_k.s < 0.18 and c_k.v > 0.5:
					sigue = false
					break
			if sigue:
				var y_j: int = leg_top
				while y_j >= maxi(pants_top, 0):
					var o_j: int =(y_j * w2 + x) * 4
					if data2[o_j + 3] < 128:
						break
					var c_j: Color = Color8(data2[o_j], data2[o_j + 1], data2[o_j + 2])
					if not _es_kit_origen(c_j.h * 360.0, c_j, base) \
							and not _es_pantalon_gris(c_j):
						break
					quien[y_j * w2 + x] = LEG
					y_j -= 1

























		var y_cad: int = maxi(pants_top, 1)
		var pila: PackedInt32Array = PackedInt32Array()
		var visto: PackedByteArray = PackedByteArray()
		visto.resize(w2 * h2)
		for x in w2:
			var o_a: int =((y_cad - 1) * w2 + x) * 4
			var o_b: int =(y_cad * w2 + x) * 4
			if data2[o_a + 3] < 128 or data2[o_b + 3] < 128:
				continue
			var c_a: Color = Color8(data2[o_a], data2[o_a + 1], data2[o_a + 2])
			var c_b: Color = Color8(data2[o_b], data2[o_b + 1], data2[o_b + 2])
			if _is_skin(c_a.h * 360.0, c_a) and _is_skin(c_b.h * 360.0, c_b):
				quien[y_cad * w2 + x] = ARM
				visto[y_cad * w2 + x] = 1
				pila.push_back(y_cad * w2 + x)
		while not pila.is_empty():
			var i_p: int = pila[pila.size() - 1]
			pila.resize(pila.size() - 1)
			var px: int = i_p % w2
			var py: int = i_p / w2
			for v in [[px - 1, py], [px + 1, py], [px, py + 1], [px, py - 1]]:
				var vx: int = v[0]
				var vy: int = v[1]
				if vx < 0 or vx >= w2 or vy < y_cad or vy >= h2:
					continue
				var i_v: int = vy * w2 + vx
				if visto[i_v] != 0 or (quien[i_v] == LEG and vy > leg_top) \
						or data2[i_v * 4 + 3] < 128:
					continue
				var c_v: Color = Color8(data2[i_v * 4], data2[i_v * 4 + 1], data2[i_v * 4 + 2])
				if _is_skin(c_v.h * 360.0, c_v):
					quien[i_v] = ARM
					visto[i_v] = 1
					pila.push_back(i_v)
		for y in range(maxi(pants_top, 0), h2):
			var r_q: int = y * w2
			var fila: PackedByteArray = quien.slice(r_q, r_q + w2)
			for x in w2:
				if fila[x] != 0:
					continue
				for d in [-3, -2, -1, 1, 2, 3]:
					var xx: int = x + d
					if xx >= 0 and xx < w2 and fila[xx] == LEG:
						quien[r_q + x] = LEG
						break
		quien_pierna = quien
		for y in range(maxi(pants_top, 0), h2):
			var rp: int = y * w2
			for x in w2:
				var op: int =(rp + x) * 4
				if data2[op + 3] < 128:
					continue
				var cp: Color = Color8(data2[op], data2[op + 1], data2[op + 2],
					data2[op + 3])


				var es_pierna: bool = quien[rp + x] == LEG
				var viste: bool = es_pierna and (not corto \
						or hem[x] < 0 or y <= hem[x] + BERMUDA_DROP)
				if cp.s < 0.18 and cp.v > 0.5:
					if corto and y >= leg_top and hem[x] >= 0 \
							and y > hem[x] + BERMUDA_DROP and y <= hem[x] + BERMUDA_DROP + 3:








						img.set_pixel(x, y, _toned_skin(skin_leg, _base_ref(base), cp))
					else:
						img.set_pixel(x, y, _toned_neutral(pants_col, REF_KIT2, cp))
				elif viste and _is_skin(cp.h * 360.0, cp):



					var kp: float = clampf(cp.v / 0.98, 0.55, 1.0)
					img.set_pixel(x, y, Color(pants_col.r * kp, pants_col.g * kp,
						pants_col.b * kp, 1.0))
				elif corto and y >= leg_top \
						and _es_kit_origen(cp.h * 360.0, cp, base):





					img.set_pixel(x, y, _toned_skin(skin_leg, _base_ref(base), cp))
				elif not corto and (y >= leg_top or es_pierna) \
						and y < bb.end.y - CASUAL_ZAPATO_FILAS and _es_pantalon_gris(cp):






					var kg: float = clampf(cp.v / 0.5, 0.55, 1.0)
					img.set_pixel(x, y, Color(pants_col.r * kg, pants_col.g * kg,
						pants_col.b * kg, 1.0))
				elif (y >= leg_top or (es_pierna and not corto)) \
						and _es_kit_origen(cp.h * 360.0, cp, base):






















					var km: float = clampf(cp.v / 0.98, 0.55, 1.0)
					img.set_pixel(x, y, Color(pants_col.r * km, pants_col.g * km,
						pants_col.b * km, 1.0))




























		for x in range(1, w2 - 1):
			if hem[x] < 0:
				continue
			var tela: Color = img.get_pixel(x, hem[x])
			for y in range(hem[x] + 1, mini(hem[x] + 3, h2)):
				var rh: int = y * w2
				var oh: int =(rh + x) * 4
				if data2[oh + 3] < 128:
					continue


				if data2[(rh + x - 1) * 4 + 3] < 128 \
						or data2[(rh + x + 1) * 4 + 3] < 128:
					continue
				var ch: Color = Color8(data2[oh], data2[oh + 1], data2[oh + 2],
					data2[oh + 3])
				if ch.v < 0.15:
					img.set_pixel(x, y, tela)
				elif quien[rh + x] != ARM and img.get_pixel(x, y).v < tela.v:
					img.set_pixel(x, y, tela)
		if sin_corte != null:


			for pb: Vector2i in casual_boots.keys():
				if pb.x < cx0 or pb.x >= cx1:
					casual_boots.erase(pb)
			for y in range(maxi(pants_top, 0), h2):
				for x in w2:
					if x < cx0 or x >= cx1:
						img.set_pixel(x, y, sin_corte.get_pixel(x, y))


















	var zonas: Array = []
	var arm_pat: String = String(cfg.get("tattoo_pat",
		cfg.get("tattoo_pattern", "damero")))
	var side: String = String(cfg.get("tattoo", cfg.get("tattoo_style", "")))
	if side == "left" or side == "right" or side == "both":
		zonas.append({"lado": side, "pat": arm_pat,
			"ink": cfg.get("tattoo_ink", cfg.get("tattoo_color", TAT_INK)),
			"franja": TAT_BANDS.get(arm_pat, Vector2(TAT_TOP, TAT_BOTTOM))})



	var leg: String = String(cfg.get("tattoo_leg", cfg.get("tattoo_leg_style", "")))
	if leg == "left" or leg == "right" or leg == "both":
		zonas.append({"lado": leg,
			"pat": String(cfg.get("tattoo_leg_pat",
				cfg.get("tattoo_leg_pattern", "damero"))),
			"ink": cfg.get("tattoo_leg_ink", cfg.get("tattoo_leg_color", TAT_INK)),
			"franja": Vector2(TAT_LEG_TOP, TAT_LEG_BOTTOM)})




	var wb: String = String(cfg.get("wristband_style", "none"))
	if wb == "left" or wb == "right" or wb == "both":
		zonas.append({"lado": wb, "pat": "solido", "tela": true,
			"ink": cfg.get("wristband_color", WRIST_COLORS[0]),
			"franja": TAT_BANDS["muneca"]})
	var asl: String = String(cfg.get("arm_sleeve_style", "none"))
	if asl == "left" or asl == "right" or asl == "both":
		zonas.append({"lado": asl, "pat": "solido", "tela": true,
			"ink": cfg.get("arm_sleeve_color", ARM_SLEEVE_COLORS[0]),
			"franja": TAT_BANDS["manga_entera"]})
	var wrap: String = String(cfg.get("arm_wrap_style", "none"))
	if wrap == "left" or wrap == "right" or wrap == "both":
		zonas.append({"lado": wrap, "pat": "vendaje", "tela": true,
			"ink": WRAP_COLOR, "franja": TAT_BANDS["biceps"]})







	var upright: bool = bb.size.y >= bb.size.x
	if not upright:
		zonas.clear()
	for zona in zonas:



		var z_side: String = String(zona["lado"])
		var pat: String = String(zona["pat"])
		var ink: Color = zona["ink"]
		var franja: Vector2 = zona["franja"]
		var tela: bool = bool(zona.get("tela", false))
		var t_top: int = bb.position.y + int(bb.size.y * franja.x)
		var t_bottom: int = bb.position.y + int(bb.size.y * franja.y)
		var mid_x: float = bb.position.x + bb.size.x * 0.5




		var has_face_tat: bool = face_bb.size.y > 0
		var fm: int = maxi(int(face_bb.size.x * 0.25), 2)


		var band_a: int = t_top + int(float(t_bottom - t_top) * 0.33)
		var band_b: int = t_top + int(float(t_bottom - t_top) * 0.67)


		var band_1: int = t_top + int(float(t_bottom - t_top) * 0.15)
		var band_2: int = t_top + int(float(t_bottom - t_top) * 0.5)
		var band_3: int = t_top + int(float(t_bottom - t_top) * 0.85)
		for y in range(maxi(t_top, 0), mini(t_bottom, h2)):
			var rt: int = y * w2
			for x in w2:




				var rx: int = absi(x - int(mid_x))
				if z_side == "left" and float(x) >= mid_x:
					continue
				if z_side == "right" and float(x) < mid_x:
					continue

























				match pat:





					"manga_entera", "biceps", "muneca":
						pass
					"antebrazo":
						if (x + y * 2) % 3 == 0:
							continue
					"manga_degradada":



						var prog: float = float(y - t_top) \
								/ float(maxi(t_bottom - t_top, 1))
						if float((x * 7 + y * 13) % 10) >= prog * 10.0:
							continue
					"escamas":


						if posmod(y - t_top, 3) != 0 \
								and posmod(x + 2 *((y - t_top) / 3), 4) != 0:
							continue
					"cadena":

						if posmod(y - t_top, 3) == 1 and posmod(x, 2) == 0:
							continue
					"ondas":


						if posmod(rx + int(1.5 + 1.5 * sin(float(y - t_top) * 0.9)), 3) != 0:
							continue
					"cuadros":
						if posmod(rx / 2 +(y - t_top) / 2, 2) == 1:
							continue
					"aros_finos":
						if posmod(y - t_top, 3) != 0:
							continue
					"salpicado":
						if (x * 11 + y * 5) % 3 == 0:
							continue
					"triple_banda":
						if y != band_1 and y != band_2 and y != band_3:
							continue
					"doble_banda":
						if y not in [band_a, band_b]:
							continue
					"zigzag":
						if posmod(x - absi(posmod(y - t_top, 6) - 3), 4) != 0:
							continue
					"rombos":
						if absi(posmod(x, 4) - 2) + absi(posmod(y - t_top, 4) - 2) != 2:
							continue
					"espiga":
						if posmod(y - t_top - absi(posmod(x, 6) - 3), 3) != 0:
							continue
					"malla":
						if posmod(x + y, 4) != 0 and posmod(x - y, 4) != 0:
							continue
					"media_manga":
						if y < band_a or (x + y * 2) % 4 == 0:
							continue
					"solido":
						pass
					"vendaje":


						pass
					"espina":
						if (x + y) % 3 != 0:
							continue
					"puntos":
						if (x * 7 + y * 13) % 5 != 0:
							continue
					"estrellas":
						if x % 3 != 1 or y % 3 != 1:
							continue
					"lineas":
						if y % 2 == 1:
							continue
					"banda":
						if y < band_a or y > band_b:
							continue
					"tribal":
						if (x + y * 2) % 3 == 0:
							continue
					_:
						if (x + y) % 2 == 1:
							continue


				if has_face_tat \
						and x >= face_bb.position.x - fm \
						and x <= face_bb.end.x + fm \
						and y >= face_bb.position.y - fm \
						and y <= face_bb.end.y + fm:
					continue
				var ot: int =(rt + x) * 4
				if data2[ot + 3] < 128:
					continue
				var ct: Color = Color8(data2[ot], data2[ot + 1], data2[ot + 2],
					data2[ot + 3])
				if not _is_skin(ct.h * 360.0, ct):
					continue
				if tela:


					var tc: Color = ink
					if pat == "vendaje" and posmod(y - t_top, 3) == 2:
						tc = ink.darkened(0.22)
					img.set_pixel(x, y, _toned(tc, REF_SKIN, ct))
					continue
				var kt: float = clampf(ct.v / 0.98, 0.6, 1.0)
				img.set_pixel(x, y, Color(ink.r * kt, ink.g * kt,
					ink.b * kt, 1.0))







































	if str(cfg.get("kit_sleeves", "")) == "larga":
		cfg["long_sleeves"] = true









	var slv_val: Variant = cfg.get("long_sleeves", false)



	var fg_val: Variant = cfg.get("field_gloves_color", null)
	var gloves_only: bool = typeof(fg_val) == TYPE_COLOR \
			and not (typeof(slv_val) != TYPE_BOOL or bool(slv_val))
	if (typeof(slv_val) != TYPE_BOOL or bool(slv_val) or gloves_only) \
			and bb.size.y >= bb.size.x:


		var slv_kit: bool = typeof(slv_val) != TYPE_COLOR



		var slv: Color = cfg.get("kit", REF_KIT)
		if not slv_kit:
			slv = slv_val
		var cadera: int = bb.position.y + int(bb.size.y * SLEEVE_HIP)


		var cand: PackedByteArray = PackedByteArray()
		cand.resize(w2 * h2)







		var tiene_cara: bool = face_bb.size.y > 0
		var cara_x0: int = face_bb.position.x - 2
		var cara_x1: int = face_bb.end.x + 2
		for y in h2:
			var rs: int = y * w2
			for x in w2:
				var i_s: int = rs + x
				var o_s: int = i_s * 4
				if data2[o_s + 3] < 128:
					continue
				var en_franja: bool = tiene_cara and x >= cara_x0 and x <= cara_x1
				if en_franja and y <= face_bb.end.y + 2:
					continue
				var c_s: Color = Color8(data2[o_s], data2[o_s + 1],
					data2[o_s + 2], data2[o_s + 3])
				var piel_s: bool = _is_skin(c_s.h * 360.0, c_s)
				if head_mask[i_s] == 1 and (en_franja or not tiene_cara or not piel_s):
					continue
				if piel_s:
					cand[i_s] = 1
				elif y < cadera and c_s.s < 0.35 and c_s.v > 0.45:




					if en_franja and y <= face_bb.end.y + SLEEVE_COLLAR_PAD:
						continue
					cand[i_s] = 2





		var visto: PackedByteArray = PackedByteArray()
		visto.resize(w2 * h2)
		for i_b in w2 * h2:
			if cand[i_b] != 2 or visto[i_b] == 1:
				continue
			var claro: PackedInt32Array = PackedInt32Array([i_b])
			visto[i_b] = 1
			var cur_b: int = 0
			while cur_b < claro.size():
				var i_q: int = claro[cur_b]
				cur_b += 1
				for d_b in [-1, 1, - w2, w2]:
					var i_r: int = i_q + d_b
					if i_r < 0 or i_r >= w2 * h2:
						continue
					if absi(d_b) == 1 and i_r / w2 != i_q / w2:
						continue
					if cand[i_r] == 2 and visto[i_r] == 0:
						visto[i_r] = 1
						claro.append(i_r)
			if claro.size() > SLEEVE_PUNO_MAX \
					and claro.size() < int(bb.size.x * bb.size.y * SLEEVE_PRENDA_FRAC):
				for i_z in claro:
					cand[i_z] = 0
		visto.fill(0)

		for y0 in h2:
			for x0 in w2:
				var raiz: int = y0 * w2 + x0
				if cand[raiz] == 0 or visto[raiz] == 1:
					continue
				var pieza: PackedInt32Array = PackedInt32Array()
				var cola: PackedInt32Array = PackedInt32Array([raiz])
				visto[raiz] = 1
				var min_y: int = h2
				var toca_playera: bool = false
				var cabeza_px: int = 0
				var cabeza_franja: int = 0
				while not cola.is_empty():
					var i_p: int = cola[cola.size() - 1]
					cola.remove_at(cola.size() - 1)
					pieza.append(i_p)
					min_y = mini(min_y, i_p / w2)
					var pega_cabeza: bool = false
					var pega_franja: bool = false
					for d in [-1, 1, - w2, w2]:
						var i_v: int = i_p + d
						if i_v < 0 or i_v >= w2 * h2:
							continue
						if absi(d) == 1 and i_v / w2 != i_p / w2:
							continue
						var o_v: int = i_v * 4
						if data2[o_v + 3] < 128:
							continue





						if head_mask[i_v] == 1:
							pega_cabeza = true
							if not tiene_cara or (i_v % w2 >= cara_x0 and i_v % w2 <= cara_x1):
								pega_franja = true
						if cand[i_v] == 0:
							var c_v: Color = Color8(data2[o_v], data2[o_v + 1],
								data2[o_v + 2], data2[o_v + 3])
							if _es_kit_origen(c_v.h * 360.0, c_v, base):
								toca_playera = true
							continue
						if visto[i_v] == 0:
							visto[i_v] = 1
							cola.append(i_v)
					if pega_cabeza:
						cabeza_px += 1
					if pega_franja:
						cabeza_franja += 1
				var tiene_piel: bool = false
				var tiene_puno: bool = false
				for i_t in pieza:
					if cand[i_t] == 1:
						tiene_piel = true
					elif cand[i_t] == 2:
						tiene_puno = true
					if tiene_piel and tiene_puno:
						break




















				if not toca_playera or min_y >= cadera or not tiene_piel \
						or cabeza_franja > int(pieza.size() * SLEEVE_HEAD_FRAC) \
						or (not tiene_puno and cabeza_px > 0) \
						or pieza.size() < SLEEVE_PIEZA_MIN:
					continue


				var dist: Dictionary = {}
				var frente: PackedInt32Array = PackedInt32Array()
				for i_cf in pieza:
					if cand[i_cf] != 2:
						continue







					var linda_kit: bool = false
					for d_k in [-1, 1, - w2, w2]:
						var i_k: int = i_cf + d_k
						if i_k < 0 or i_k >= w2 * h2:
							continue
						if absi(d_k) == 1 and i_k / w2 != i_cf / w2:
							continue
						var o_k: int = i_k * 4
						if data2[o_k + 3] < 128 or cand[i_k] != 0:
							continue
						var c_k: Color = Color8(data2[o_k], data2[o_k + 1],
							data2[o_k + 2], data2[o_k + 3])
						if _es_kit_origen(c_k.h * 360.0, c_k, base):
							linda_kit = true
							break
					if linda_kit:
						dist[i_cf] = 0
						frente.append(i_cf)
				if frente.is_empty():
					for i_p2 in pieza:
						for d2 in [-1, 1, - w2, w2]:
							var i_v2: int = i_p2 + d2
							if i_v2 < 0 or i_v2 >= w2 * h2:
								continue
							if absi(d2) == 1 and i_v2 / w2 != i_p2 / w2:
								continue
							if cand[i_v2] != 0 or data2[i_v2 * 4 + 3] < 128:
								continue
							var c_v2: Color = Color8(data2[i_v2 * 4],
								data2[i_v2 * 4 + 1], data2[i_v2 * 4 + 2], 255)
							if _es_kit_origen(c_v2.h * 360.0, c_v2, base):
								dist[i_p2] = 0
								frente.append(i_p2)
								break
					var hombro_y: int = h2
					for i_h in frente:
						hombro_y = mini(hombro_y, i_h / w2)
					var solo_hombro: PackedInt32Array = PackedInt32Array()
					for i_h2 in frente:
						if i_h2 / w2 <= hombro_y + 1:
							solo_hombro.append(i_h2)
						else:
							dist.erase(i_h2)
					frente = solo_hombro
				if frente.is_empty():
					continue








				var ax: int = 0
				for i_a in frente:
					ax += i_a % w2
				ax = int(ax / frente.size())
				var slv_dx: int = bb.position.x - ax
				var orden: PackedInt32Array = PackedInt32Array()
				var cursor: int = 0
				orden.append_array(frente)
				var lejos: int = 0
				while cursor < orden.size():
					var i_c: int = orden[cursor]
					cursor += 1
					var d_c: int = dist[i_c]
					lejos = maxi(lejos, d_c)
					for d3 in [-1, 1, - w2, w2]:
						var i_n: int = i_c + d3
						if i_n < 0 or i_n >= w2 * h2:
							continue
						if absi(d3) == 1 and i_n / w2 != i_c / w2:
							continue
						if cand[i_n] == 0 or dist.has(i_n):
							continue
						dist[i_n] = d_c + 1
						orden.append(i_n)

				var d_mano: Dictionary = {}
				var orden_m: PackedInt32Array = PackedInt32Array()
				for i_l in orden:
					if dist[i_l] == lejos:
						d_mano[i_l] = 0
						orden_m.append(i_l)
				var cur_m: int = 0
				while cur_m < orden_m.size():
					var i_m: int = orden_m[cur_m]
					cur_m += 1
					for d4 in [-1, 1, - w2, w2]:
						var i_n2: int = i_m + d4
						if i_n2 < 0 or i_n2 >= w2 * h2:
							continue
						if absi(d4) == 1 and i_n2 / w2 != i_m / w2:
							continue
						if cand[i_n2] == 0 or d_mano.has(i_n2) \
								or not dist.has(i_n2):
							continue
						d_mano[i_n2] = int(d_mano[i_m]) + 1
						orden_m.append(i_n2)
				var mano: int = maxi(int(bb.size.y * SLEEVE_HAND), 4)







				mano = mini(mano, maxi(int(lejos * 0.4), 3))








				var mano_set: Dictionary = {}
				for i_h in orden:
					if int(d_mano.get(i_h, 99)) <= mano:
						mano_set[i_h] = true
				var dedos: Dictionary = {}
				var no_dedo: Dictionary = {}
				for i_h in mano_set.keys():
					for oy in range(-2, 3):
						for ox in range(-2, 3):
							var gx: int = i_h % w2 + ox
							var gy: int = i_h / w2 + oy
							if gx < 0 or gy < 0 or gx >= w2 or gy >= h2:
								continue
							var i_g: int = gy * w2 + gx
							if cand[i_g] != 1 or dist.has(i_g) or dedos.has(i_g) \
									or no_dedo.has(i_g):
								continue


							var isla: PackedInt32Array = PackedInt32Array([i_g])
							var en_isla: Dictionary = {i_g: true}
							var cur_i: int = 0
							while cur_i < isla.size() and isla.size() < SLEEVE_PIEZA_MIN:
								var i_k2: int = isla[cur_i]
								cur_i += 1
								for d6 in [-1, 1, - w2, w2]:
									var i_n6: int = i_k2 + d6
									if i_n6 < 0 or i_n6 >= w2 * h2:
										continue
									if absi(d6) == 1 and i_n6 / w2 != i_k2 / w2:
										continue
									if cand[i_n6] == 1 and not en_isla.has(i_n6):
										en_isla[i_n6] = true
										isla.append(i_n6)
							for i_k3 in isla:
								if isla.size() < SLEEVE_PIEZA_MIN:
									dedos[i_k3] = true
								else:
									no_dedo[i_k3] = true
				if not dedos.is_empty():







					var muneca: int = lejos
					for i_h in mano_set:
						muneca = mini(muneca, int(dist[i_h]))
					var nucleo: Array = dedos.keys()
					for i_f in orden:
						if mano_set.has(i_f) or int(dist[i_f]) < muneca - 1:
							continue
						for i_u in nucleo:
							if absi(int(i_u) % w2 - i_f % w2) <= SLEEVE_MANO_ABIERTA \
									and absi(int(i_u) / w2 - i_f / w2) <= SLEEVE_MANO_ABIERTA:
								mano_set[i_f] = true
								break


				var puno_d: Dictionary = {}
				var cola_p: PackedInt32Array = PackedInt32Array()
				for i_h in mano_set:
					puno_d[i_h] = 0
					cola_p.append(i_h)
				var cur_p: int = 0
				while cur_p < cola_p.size():
					var i_cp: int = cola_p[cur_p]
					cur_p += 1
					if int(puno_d[i_cp]) >= SLEEVE_CUFF_W:
						continue
					for d7 in [-1, 1, - w2, w2]:
						var i_n7: int = i_cp + d7
						if i_n7 < 0 or i_n7 >= w2 * h2:
							continue
						if absi(d7) == 1 and i_n7 / w2 != i_cp / w2:
							continue
						if not dist.has(i_n7) or puno_d.has(i_n7):
							continue
						puno_d[i_n7] = int(puno_d[i_cp]) + 1
						cola_p.append(i_n7)











				var glove_val: Variant = cfg.get("gloves", null)

				if typeof(glove_val) != TYPE_COLOR and typeof(fg_val) == TYPE_COLOR:
					glove_val = fg_val
				var glove: Color = glove_val if typeof(glove_val) == TYPE_COLOR \
						else Color.WHITE



				var cuff_c: Color = cfg.get("kit2", REF_KIT2) if slv_kit \
						else slv.darkened(0.25)
				for i_f in orden:
					if mano_set.has(i_f):
						if typeof(glove_val) != TYPE_COLOR or cand[i_f] != 1:
							continue
						var og: int = i_f * 4
						var cg: Color = Color8(data2[og], data2[og + 1],
							data2[og + 2], data2[og + 3])


						img.set_pixel(i_f % w2, i_f / w2,
							_toned(glove, REF_SKIN, cg))
						continue
					if gloves_only:
						continue
					var xf: int = i_f % w2
					var yf: int = i_f / w2
					var of: int = i_f * 4
					var cf: Color = Color8(data2[of], data2[of + 1],
						data2[of + 2], data2[of + 3])
					var slv_px: Color = slv
					if puno_d.has(i_f):
						slv_px = cuff_c
					elif slv_kit and cfg.has("kit_b") \
							and String(cfg.get("pattern", "solid")) != "solid":



						slv_px = _pattern_color(cfg, xf + slv_dx, yf, bb,
							1 if _dibujo_de_brazos(String(cfg["pattern"])) else -1)


					img.set_pixel(xf, yf, _toned(slv_px, REF_SKIN, cf) \
							if cand[i_f] == 1 else _toned_neutral(slv_px, REF_KIT2, cf))




	var sock_style: String = String(cfg.get("sock_style", "none"))
	if (sock_style == "cinta" or sock_style == "bajadas") and bb.size.y >= bb.size.x:
		var sk_band: Vector2 = SOCK_TAPE_BAND if sock_style == "cinta" else SOCK_DOWN_BAND
		var sk_top: int = bb.position.y + int(bb.size.y * sk_band.x)
		var sk_bot: int = bb.position.y + int(ceil(bb.size.y * sk_band.y))
		var sk_col: Color = cfg.get("sock_tape_color", SOCK_TAPE_COLORS[0])
		var skin_sk: Color = cfg.get("skin", REF_SKIN)
		for y in range(maxi(sk_top, 0), mini(sk_bot, h2)):
			for x in w2:
				var osk: int =(y * w2 + x) * 4
				if data2[osk + 3] < 128:
					continue
				var csk: Color = Color8(data2[osk], data2[osk + 1], data2[osk + 2],
					data2[osk + 3])
				if not _es_kit_origen(csk.h * 360.0, csk, base):
					continue
				if sock_style == "cinta":
					img.set_pixel(x, y, _toned(sk_col, _base_ref(base), csk))
				else:
					img.set_pixel(x, y, _toned_skin(skin_sk, _base_ref(base), csk))






	if String(cfg.get("tights_style", "none")) == "on" and not cfg.has("long_pants") \
			and not cfg.has("short_pants") and not tailoring:
		_pinta_mallas(img, data2, w2, h2, bb, base, kit2_col)
	if String(cfg.get("knee_style", "none")) in ["left", "right", "both"] \
			and not cfg.has("long_pants") and not cfg.has("short_pants") and not tailoring:
		_pinta_rodillera(img, data2, w2, h2, bb, base, view, String(cfg.get("knee_style")),
			String(cfg.get("knee_kind", "neopreno")) == "vendaje")



	var skin_c: Color = cfg.get("skin", REF_SKIN)
	var hair_c: Color = cfg.get("hair", REF_HAIR)



	var kept: Dictionary = {}
	if OVERLAY_HAIR.has(style):




		for p in hair_px:
			kept[p] = 1.0
	elif style != "normal":






		if not _shave_skull(img, style, hair_px, face_px, src, skin_set,
				face_bb, skin_c, base, kept):
			_apply_hair_style(img, style, hair_px, hair_orig, ref_v, ref_s,
				face_bb, skin_c, kept, view)
	elif cfg.has("hair_tips"):
		for p in hair_px:
			kept[p] = 1.0
	if cfg.has("hair_tips") and not hair_px.is_empty():
		_apply_hair_tips(img, cfg["hair_tips"], hair_px, hair_orig, kept,
			ref_v, ref_s, face_bb)
	if OVERLAY_HAIR.has(style) and not hair_px.is_empty():





		_stamp_hair_overlay(img, style, hair_px, view,
			cfg.get("hair", Color.TRANSPARENT))
	if _hair_style_acc.has(style) and not hair_px.is_empty():
		_stamp_hair_style_acc(img, style, hair_px, hair_c, face_bb, view)
	if facial != "none" and face_bb.size.y > 0:
		_apply_facial_hair(img, facial, face_px, face_orig, face_bb, hair_c,
			view)











	var ojos_bb: Rect2i = face_bb
	var ojos_src: Dictionary = src
	if (cfg.has("eyes") or cfg.has("brows")) and face_bb.size.y <= 0:
		var t_px: Array[Vector2i] = []
		var t_col: Array[Color] = []
		ojos_bb = _largest_skin_component(img, img.get_height(), t_px, t_col)
		if ojos_bb.size.y > 0:
			ojos_src = {}


			for yy in range(maxi(ojos_bb.position.y - 1, 0),
					mini(ojos_bb.end.y + 2, img.get_height())):
				for xx in range(maxi(ojos_bb.position.x - 1, 0),
						mini(ojos_bb.end.x + 2, img.get_width())):
					ojos_src[Vector2i(xx, yy)] = img.get_pixel(xx, yy)
	if cfg.has("eyes") and ojos_bb.size.y > 0:
		_tint_eyes(img, cfg["eyes"], ojos_src, ojos_bb, base)
	if cfg.has("brows") and ojos_bb.size.y > 0:
		_tint_brows(img, cfg["brows"], ojos_src, ojos_bb)



	if cfg.has("mask"):
		if not face_px.is_empty():
			_stamp_mask(img, face_px)
	elif cfg.has("headband"):
		_stamp_headband(img, cfg["headband"], hair_px, face_px, face_bb)






	if cfg.has("street_top"):
		var top_acc: Dictionary = TOP_SPRITES.get(String(cfg["street_top"]), {})
		var tpath: String = String(top_acc.get(view, ""))
		if not tpath.is_empty():


			var before_top: Image = img.duplicate()
			_blit_acc(img, tpath, head_at - Vector2i(HEAD_REF[view]),
				cfg.get("casual_outer_color", CASUAL_SHIRTS[0]))
			for p: Vector2i in head_set:
				img.set_pixelv(p, before_top.get_pixelv(p))
			for p: Vector2i in face_px:
				img.set_pixelv(p, before_top.get_pixelv(p))
	if tailoring:
		var cloth_source: Image = Image.create_from_data(w2, h2, false, Image.FORMAT_RGBA8, data2)







		if cfg.has("print_asset") or ESTAMPADO_PROPIO.capturando:
			ESTAMPADO_PROPIO.paint(img, cloth_source, casual_mask, cfg, view, head_at)
		CASUAL_DETAILS.base_garments(img, cloth_source, casual_mask, cfg, view, head_at, face_bb)



		CASUAL_TAILORING.paint(img, casual_mask, cfg, view, head_at.x)
		CASUAL_TAILORING.layers(img, cloth_source, casual_mask, cfg, view, head_at.x,
			quien_pierna)
		CASUAL_DETAILS.shoes(img, cloth_source, casual_boots, cfg)
		if cfg.get("_gala_preview", false):
			GALA_WEAR.paint(img, cloth_source, casual_mask, cfg, view, head_at)
		WARDROBE.paint(img, cloth_source, casual_mask, cfg, view, head_at)
		CASUAL_DETAILS.wrists(img, cloth_source, cfg, bb, view)
		CASUAL_TAILORING.earrings(img, cfg, view, face_bb)








	if cfg.has("street_head"):
		var head: Dictionary = HEAD_SPRITES.get(String(cfg["street_head"]), {})
		var hpath: String = String(head.get(view, ""))
		if not hpath.is_empty():
			_blit_acc(img, hpath, head_at - Vector2i(HEAD_REF[view]),
				cfg.get("street_head_color", HEAD_ACC_COLORS[0]))







	if cfg.has("street_face") and face_bb.size.y > 0:
		var acc: Dictionary = ACC_SPRITES.get(String(cfg["street_face"]), {})
		var gpath: String = String(acc.get(view, ""))
		if not gpath.is_empty():
			_blit_acc(img, gpath,
				acc_anchor(face_bb) - Vector2i(ACC_REF_FACE[view]))

	if tailoring:
		CASUAL_DETAILS.headwear(img, cfg, view, head_at, face_bb)







































const ANA_MAX: int = 128
static var _memo_guarda: int = 0
static var _ana: Dictionary = {}
static var _cls: Dictionary = {}
static var _caja: Dictionary = {}

static var _mangas: Dictionary = {}





static func memo_abre() -> void:
	_memo_guarda += 1


static func memo_cierra() -> void:
	_memo_guarda = maxi(_memo_guarda - 1, 0)




static func apply_recordando(tex: Texture2D, cfg: Dictionary) -> Texture2D:


	candado_toma()
	memo_abre()
	var out: Texture2D = _apply_sin_candado(tex, cfg)
	memo_cierra()
	candado_suelta()
	return out



static func olvida_analisis() -> void:
	candado_toma()
	_ana.clear()
	_cls.clear()
	_caja.clear()
	_mangas.clear()
	_src.clear()

	if en_hilo_principal():
		_ultima_tex = null
		_ultima_img = null
		_ultima_comp_tex = null
		_ultima_comp_img = null
	else:
		_ultima_tex_h = null
		_ultima_img_h = null
		_ultima_comp_tex_h = null
		_ultima_comp_img_h = null
	candado_suelta()























const SRC_MAX: int = 128
static var _src: Dictionary = {}









static var _ultima_tex: ImageTexture = null
static var _ultima_img: Image = null





static var _ultima_tex_h: ImageTexture = null
static var _ultima_img_h: Image = null
static var _ultima_llave_h: String = ""
static var _ultima_comp_tex_h: ImageTexture = null
static var _ultima_comp_img_h: Image = null
static var _ultima_comp_llave_h: String = ""









static var _ultima_comp_tex: ImageTexture = null
static var _ultima_comp_img: Image = null


static func imagen_de(tex: Texture2D) -> Image:
	if tex == null:
		return null
	candado_toma()
	var img: Image = null
	if en_hilo_principal():
		if tex == _ultima_tex and _ultima_img != null:
			img = _ultima_img.duplicate()
		elif tex == _ultima_comp_tex and _ultima_comp_img != null:
			img = _ultima_comp_img.duplicate()
	else:
		if tex == _ultima_tex_h and _ultima_img_h != null:
			img = _ultima_img_h.duplicate()
		elif tex == _ultima_comp_tex_h and _ultima_comp_img_h != null:
			img = _ultima_comp_img_h.duplicate()
	candado_suelta()
	return img





static func imagen_cpu(tex: Texture2D) -> Image:
	var img: Image = imagen_de(tex)
	if img != null or tex == null:
		return img
	for meta in [META_IMG_ATLAS, META_IMG_FUENTE]:
		if tex.has_meta(meta) and tex.get_meta(meta) is Image:
			return (tex.get_meta(meta) as Image).duplicate()
	return null




static func apunta_compuesta(tex: ImageTexture, img: Image, llave: String = "") -> void:
	if en_hilo_principal():
		_ultima_comp_tex = tex
		_ultima_comp_img = img
		_ultima_comp_llave = llave
	else:
		_ultima_comp_tex_h = tex
		_ultima_comp_img_h = img
		_ultima_comp_llave_h = llave















static var imagen_en_meta: bool = false






static var _imagen_en_meta_hilo: bool = false
const META_IMG_ATLAS: String = "img_atlas"



const META_IMG_FUENTE: String = "kr_fuente"


static func pon_imagen_en_meta(v: bool) -> void:
	if en_hilo_principal():
		imagen_en_meta = v
	else:
		_imagen_en_meta_hilo = v


static func en_meta() -> bool:
	return imagen_en_meta if en_hilo_principal() else _imagen_en_meta_hilo
const META_KR_LLAVE: String = "kr_llave"
const META_MA_LLAVE: String = "ma_llave"

static var _ultima_llave: String = ""
static var _ultima_comp_llave: String = ""





static func _cuelga_imagen(out: Texture2D) -> void:
	if out == null or out.has_meta(META_IMG_ATLAS):
		return
	var u_tex: ImageTexture = _ultima_tex if en_hilo_principal() else _ultima_tex_h
	var u_img: Image = _ultima_img if en_hilo_principal() else _ultima_img_h
	var u_llave: String = _ultima_llave if en_hilo_principal() else _ultima_llave_h
	var c_tex: ImageTexture = _ultima_comp_tex if en_hilo_principal() else _ultima_comp_tex_h
	var c_img: Image = _ultima_comp_img if en_hilo_principal() else _ultima_comp_img_h
	var c_llave: String = _ultima_comp_llave if en_hilo_principal() else _ultima_comp_llave_h
	if is_same(out, u_tex) and u_img != null:
		out.set_meta(META_IMG_ATLAS, u_img)
		if is_same(_cache.get(u_llave), out):
			out.set_meta(META_KR_LLAVE, u_llave)
	elif is_same(out, c_tex) and c_img != null:
		out.set_meta(META_IMG_ATLAS, c_img)
		if not c_llave.is_empty():
			out.set_meta(META_MA_LLAVE, c_llave)








static func suelta(tex: Texture2D) -> void:
	if tex == null:
		return
	candado_toma()
	var k: String = String(tex.get_meta(META_KR_LLAVE, ""))
	if not k.is_empty() and is_same(_cache.get(k), tex):
		_cache.erase(k)
	var m: String = String(tex.get_meta(META_MA_LLAVE, ""))
	if not m.is_empty():
		_modular().expulsa_compuesta_si(m, tex)
	if is_same(tex, _ultima_tex):
		_ultima_tex = null
		_ultima_img = null
	if is_same(tex, _ultima_comp_tex):
		_ultima_comp_tex = null
		_ultima_comp_img = null
	if is_same(tex, _ultima_tex_h):
		_ultima_tex_h = null
		_ultima_img_h = null
	if is_same(tex, _ultima_comp_tex_h):
		_ultima_comp_tex_h = null
		_ultima_comp_img_h = null
	for meta in [META_IMG_ATLAS, META_KR_LLAVE, META_MA_LLAVE]:
		if tex.has_meta(meta):
			tex.remove_meta(meta)
	candado_suelta()




static func _es_pantalon_gris(c: Color) -> bool:
	return c.s < 0.08 and c.v > 0.3 and c.v < 0.48


static func _fuente_rgba(tex: Texture2D) -> Image:
	var ruta: String = tex.resource_path
	var guarda: bool = not ruta.is_empty()
	if guarda:
		var hecha: Variant = _memo_lee(_src, ruta)
		if hecha != null:
			return (hecha as Image).duplicate()
	var img: Image = lee_imagen(tex, "fuente")
	if img == null:
		return null
	if guarda and _memo_guarda > 0:
		_memo_pon(_src, ruta, img.duplicate(), SRC_MAX)
	return img











static func lee_imagen(tex: Texture2D, de: String = "") -> Image:
	if tex == null:
		return null
	var img: Image = null
	if tex is ImageTexture:
		img = imagen_de(tex)
		if img == null and tex.has_meta(META_IMG_ATLAS) and tex.get_meta(META_IMG_ATLAS) is Image:
			img =(tex.get_meta(META_IMG_ATLAS) as Image).duplicate()
		if img == null and tex.has_meta(META_IMG_FUENTE) and tex.get_meta(META_IMG_FUENTE) is Image:
			img =(tex.get_meta(META_IMG_FUENTE) as Image).duplicate()
	elif tex is CompressedTexture2D and (fuente_disco or disco_en_principal or not en_hilo_principal()):
		img = _imagen_de_disco(tex as CompressedTexture2D)
	if img == null:
		if not en_hilo_principal():
			lecturas_gpu_en_hilo += 1
			var quien: String = tex.get_class() + " " +(tex.resource_path if not tex.resource_path.is_empty()
				else (String((tex as CompressedTexture2D).load_path) if tex is CompressedTexture2D else "(sin ruta)"))
			lecturas_gpu_detalle[quien] = int(lecturas_gpu_detalle.get(quien, 0)) + 1
		else:
			lecturas_gpu_principal += 1
			if lecturas_gpu_principal_detalle.size() < 16:
				var cual: String = de + " " + tex.get_class() + " " +(tex.resource_path if not tex.resource_path.is_empty()
					else (String((tex as CompressedTexture2D).load_path) if tex is CompressedTexture2D else "(sin ruta)"))
				lecturas_gpu_principal_detalle[cual] = int(lecturas_gpu_principal_detalle.get(cual, 0)) + 1
		img = tex.get_image()
		if img == null:
			return null
		img = img.duplicate()
	if img.is_compressed():
		img.decompress()
	if img.get_format() != Image.FORMAT_RGBA8:
		img.convert(Image.FORMAT_RGBA8)
	return img









static func _imagen_de_disco(tex: CompressedTexture2D) -> Image:
	var ruta: String = tex.load_path
	if ruta.is_empty():
		return null
	var f: FileAccess = FileAccess.open(ruta, FileAccess.READ)
	if f == null:
		return null
	if f.get_buffer(4).get_string_from_ascii() != "GST2":
		return null
	f.get_32()
	var tw: int = f.get_32()
	var th: int = f.get_32()
	f.get_32()
	f.get_32()
	f.get_32()
	f.get_32()
	f.get_32()
	var formato_datos: int = f.get_32()
	f.get_16()
	f.get_16()
	var mipmaps: int = f.get_32()
	var formato: int = f.get_32()
	var img: Image = Image.new()
	if formato_datos == 1 or formato_datos == 2:
		var n: int = f.get_32()
		var buf: PackedByteArray = f.get_buffer(n)
		var err: int = img.load_png_from_buffer(buf) if formato_datos == 1 \
				else img.load_webp_from_buffer(buf)
		if err != OK:
			return null
	elif formato_datos == 0 and mipmaps == 0:
		var bpp: int = {Image.FORMAT_L8: 1, Image.FORMAT_LA8: 2, Image.FORMAT_RGB8: 3,
			Image.FORMAT_RGBA8: 4}.get(formato, 0)
		if bpp == 0 or tw <= 0 or th <= 0:
			return null
		var datos: PackedByteArray = f.get_buffer(tw * th * bpp)
		if datos.size() != tw * th * bpp:
			return null
		img = Image.create_from_data(tw, th, false, formato, datos)
	else:
		return null
	if img == null or img.is_empty() or img.get_size() != Vector2i(tex.get_size()):
		return null
	return img




static func _memo_lee(d: Dictionary, clave: String) -> Variant:
	if not d.has(clave):
		return null
	var v: Variant = d[clave]
	d.erase(clave)
	d[clave] = v
	return v



static func _memo_pon(d: Dictionary, clave: String, v: Variant, tope: int) -> void:
	while d.size() >= tope:
		var vieja: Variant = null
		for k in d:
			vieja = k
			break
		d.erase(vieja)
	d[clave] = v





static func _clasifica(fuente: String, data2: PackedByteArray, caja2: Rect2i, w2: int,
		h2: int, base: KitBase, sin_roles: bool, roles: Dictionary) -> Array:
	if fuente.is_empty():
		return []
	var clave: String = "%s|%d|%s" % [fuente, base, caja2]
	var hecha: Variant = _memo_lee(_cls, clave)
	if hecha != null:
		return hecha

	if _memo_guarda <= 0:
		return []


	var tope: int = maxi(caja2.size.x * caja2.size.y, 0)
	var idx: PackedInt32Array = PackedInt32Array()
	var col: PackedColorArray = PackedColorArray()
	var rgb: PackedInt32Array = PackedInt32Array()
	var rol: PackedInt32Array = PackedInt32Array()
	var flag: PackedByteArray = PackedByteArray()
	var key: PackedInt64Array = PackedInt64Array()
	idx.resize(tope)
	col.resize(tope)
	rgb.resize(tope)
	rol.resize(tope)
	flag.resize(tope)
	key.resize(tope)
	var n: int = 0
	for y in range(caja2.position.y, mini(caja2.end.y, h2)):
		var row2: int = y * w2
		for x in range(caja2.position.x, mini(caja2.end.x, w2)):
			var i2: int = row2 + x
			var o2: int = i2 * 4
			if data2[o2 + 3] < 128:
				continue
			var c: Color = Color8(data2[o2], data2[o2 + 1], data2[o2 + 2],
				data2[o2 + 3])
			var zona_rol: int = -1
			var rgb24_2: int = 0
			if not sin_roles:
				rgb24_2 =(data2[o2]<<16)|(data2[o2 + 1]<<8)|data2[o2 + 2]
				zona_rol = roles.get(rgb24_2, -1)
			var deg: float = c.h * 360.0
			var f: int = 0
			if _is_kit_px(deg, c, base):
				f |= 1
			if c.s < 0.18 and c.v > 0.5:
				f |= 2
			if _is_skin(deg, c):
				f |= 4
			idx[n] = i2
			col[n] = c
			rgb[n] = rgb24_2
			rol[n] = zona_rol
			flag[n] = f
			key[n] =(data2[o2]<<24)|(data2[o2 + 1]<<16)|(data2[o2 + 2]<<8)|data2[o2 + 3]
			n += 1
	idx.resize(n)
	col.resize(n)
	rgb.resize(n)
	rol.resize(n)
	flag.resize(n)
	key.resize(n)
	var out: Array = [idx, col, rgb, rol, flag, key]
	_memo_pon(_cls, clave, out, ANA_MAX)
	return out

















static func _flat_mask(set_px: Dictionary, w: int, h: int) -> PackedByteArray:
	var m: PackedByteArray = PackedByteArray()
	m.resize(w * h)
	for key in set_px:
		var p: Vector2i = key
		if p.x >= 0 and p.x < w and p.y >= 0 and p.y < h:
			m[p.y * w + p.x] = 1
	return m




const NEIGHBORS: Array[Vector2i] = [Vector2i(1, 0), Vector2i(-1, 0),
	Vector2i(0, 1), Vector2i(0, -1)]












static func _body_rect(img: Image) -> Rect2i:
	var used: Rect2i = img.get_used_rect()
	if used.size.x <= 0 or used.size.y <= 0:
		return used
	var w: int = img.get_width()
	var data: PackedByteArray = img.get_data()
	var visited: PackedByteArray = PackedByteArray()
	visited.resize(w * img.get_height())
	var best: Rect2i = Rect2i()
	var best_n: int = 0
	for sy in range(used.position.y, used.end.y):
		for sx in range(used.position.x, used.end.x):
			var si: int = sy * w + sx
			if visited[si] == 1 or data[si * 4 + 3] < 128:
				continue
			var n: int = 0
			var bb := Rect2i(Vector2i(sx, sy), Vector2i.ONE)
			var queue: Array[int] = [si]
			visited[si] = 1
			while not queue.is_empty():
				var pi: int = queue.pop_back()
				var px: int = pi % w
				var py: int = pi / w
				n += 1
				bb = bb.expand(Vector2i(px, py))
				for off in NEIGHBORS:
					var qx: int = px + off.x
					var qy: int = py + off.y
					if not used.has_point(Vector2i(qx, qy)):
						continue
					var qi: int = qy * w + qx
					if visited[qi] == 1 or data[qi * 4 + 3] < 128:
						continue
					visited[qi] = 1
					queue.append(qi)
			if n > best_n:
				best_n = n
				best = bb
	return best if best_n > 0 else used


static func _is_hair(deg: float, c: Color) -> bool:


	if (deg >= 295.0 or deg <= 34.0) and c.v < 0.42 \
			and c.s >= 0.1 and c.s <= 0.75:
		return true


	return (deg >= 295.0 or deg <= 34.0) and c.s >= 0.04 and c.s <= 0.14 \
			and c.v >= 0.55 and c.v <= 0.9


static func _median(vals: Array[float], fallback: float) -> float:
	if vals.is_empty():
		return fallback
	var sorted_vals: Array[float] = vals.duplicate()
	sorted_vals.sort()
	return sorted_vals[sorted_vals.size() / 2]













const CORONA_PISO: float = 0.75




static func _toned_hair(target: Color, ref_v: float, ref_s: float,
		c: Color, piso: float = 0.0) -> Color:
	var v: float = clampf(
		target.v * minf(maxf(c.v / maxf(ref_v, 0.05), piso), 1.35), 0.03, 1.0)
	var s: float = clampf(target.s * clampf(c.s / maxf(ref_s, 0.05), 0.55, 1.35), 0.0, 1.0)
	return Color.from_hsv(target.h, s, v, c.a)











enum KitBase{AZUL, ROJA, PORTERO}


static func _kit_base(cfg: Dictionary) -> KitBase:
	if bool(cfg.get("keeper_base", false)):
		return KitBase.PORTERO
	if bool(cfg.get("red_base", false)):
		return KitBase.ROJA
	return KitBase.AZUL





static func _base_ref(base: KitBase) -> Color:
	match base:
		KitBase.PORTERO:
			return REF_KIT_KEEPER
		KitBase.ROJA:
			return REF_KIT_RED
		_:
			return REF_KIT










static func _is_kit_px(deg: float, c: Color, base: KitBase) -> bool:
	match base:
		KitBase.PORTERO:
			return deg >= 40.0 and deg <= 60.0 and c.s > 0.6 and c.v > 0.3
		KitBase.ROJA:
			return (deg >= 340.0 or deg <= 15.0) and c.s > 0.6 and c.v > 0.3
		_:
			return deg >= 195.0 and deg <= 245.0 and c.s > 0.25




















const SOCK_TOP_FRAC: float = 0.75
const SOCK_MIN_PX: int = 3
const SOCK_PATTERNS: Array[String] = ["solid", "vuelta", "franja", "aros", "dos_franjas"]
const BARRO_COL: Color = Color("5b4630")



const BARRO_MEDIA: Array[int] = [0, 30, 50, 65]
const BARRO_SHORT: Array[int] = [0, 10, 24, 36]
const MOJADO_V: float = 0.85


const REF_GLOVE_KEEPER: Color = Color("e9ded7")




























static func _pinta_guantes_portero(img: Image, data2: PackedByteArray, glove: Color,
		caja2: Rect2i, head_mask: PackedByteArray, face_bb: Rect2i, fuente: String = "") -> void:
	var w2: int = img.get_width()
	var h2: int = img.get_height()
	var cara: Rect2i = Rect2i()
	var cara_medida: bool = false
	var balon: PackedByteArray = mascara_balon(fuente, data2, w2, h2)
	for y in range(maxi(caja2.position.y, 0), mini(caja2.end.y, h2)):
		for x in range(maxi(caja2.position.x, 0), mini(caja2.end.x, w2)):
			var i: int = y * w2 + x
			var o: int = i * 4
			if data2[o + 3] < 128:
				continue
			if not balon.is_empty() and balon[i] != 0:
				continue
			if head_mask[i] != 0 and (face_bb.size.x == 0
					or (x >= face_bb.position.x and x <= face_bb.end.x)):
				continue
			var c: Color = Color8(data2[o], data2[o + 1], data2[o + 2], data2[o + 3])
			if not (c.s < 0.18 and c.v > 0.5):
				continue
			if _junto_al_iris(data2, w2, h2, x, y):
				if not cara_medida:
					cara_medida = true
					var sin_px: Array[Vector2i] = []
					var sin_orig: Array[Color] = []
					cara = _largest_skin_component(
						Image.create_from_data(w2, h2, false, Image.FORMAT_RGBA8, data2),
						h2, sin_px, sin_orig)
				if cara.grow(1).has_point(Vector2i(x, y)):
					continue
			img.set_pixel(x, y, _toned(glove, REF_GLOVE_KEEPER, c))










const BALON_PINTADO: Dictionary = {
	"chest_catch_02": [Vector2i(43, 38), Rect2i(41, 38, 10, 5)],
	"chest_catch_03": [Vector2i(43, 41), Rect2i(38, 41, 13, 13)],
	"chest_catch_04": [Vector2i(43, 42), Rect2i(41, 42, 8, 4), Vector2i(43, 50), Rect2i(42, 50, 6, 4)],
	"chest_catch_05": [Vector2i(43, 42), Rect2i(41, 42, 8, 4), Vector2i(44, 50), Rect2i(44, 50, 1, 1),
		Vector2i(43, 52), Rect2i(43, 52, 5, 2)],
	"chest_catch_06": [Vector2i(43, 40), Rect2i(41, 40, 8, 4), Vector2i(44, 48), Rect2i(44, 48, 1, 1),
		Vector2i(43, 51), Rect2i(43, 50, 5, 2)],
	"chest_catch_07": [Vector2i(43, 40), Rect2i(41, 40, 8, 4), Vector2i(44, 48), Rect2i(44, 48, 1, 1),
		Vector2i(43, 51), Rect2i(43, 50, 5, 2)],
	"jump_catch_05": [Vector2i(42, 17), Rect2i(41, 17, 8, 2)],
	"jump_catch_06": [Vector2i(44, 40), Rect2i(42, 40, 7, 3)],
	"jump_catch_07": [Vector2i(40, 43), Rect2i(38, 43, 15, 12)],
	"jump_catch_north_04": [Vector2i(42, 10), Rect2i(41, 10, 9, 10)],
	"jump_catch_north_05": [Vector2i(42, 14), Rect2i(42, 14, 7, 9), Vector2i(48, 14), Rect2i(42, 14, 7, 9)],
	"jump_catch_north_06": [Vector2i(42, 17), Rect2i(42, 17, 7, 6)],
}




static func mascara_balon(fuente: String, data2: PackedByteArray, w2: int, h2: int) -> PackedByteArray:
	var pares: Array = BALON_PINTADO.get(fuente.get_file().get_basename(), [])
	var mask := PackedByteArray()
	if pares.is_empty():
		return mask
	mask.resize(w2 * h2)
	for k in range(0, pares.size(), 2):
		var zona: Rect2i =(pares[k + 1] as Rect2i).intersection(Rect2i(0, 0, w2, h2))
		var pila: Array[Vector2i] = [pares[k]]
		while not pila.is_empty():
			var p: Vector2i = pila.pop_back()
			if not zona.has_point(p):
				continue
			var i: int = p.y * w2 + p.x
			var o: int = i * 4
			if mask[i] != 0 or data2[o + 3] < 128:
				continue
			var c: Color = Color8(data2[o], data2[o + 1], data2[o + 2], 255)
			if not (c.s < 0.18 and c.v > 0.5):
				continue
			mask[i] = 1
			pila.append_array([p + Vector2i.LEFT, p + Vector2i.RIGHT, p + Vector2i.UP, p + Vector2i.DOWN])
	return mask





static func _junto_al_iris(data2: PackedByteArray, w2: int, h2: int, x: int, y: int) -> bool:
	for dy in [-1, 0, 1]:
		for dx in [-1, 0, 1]:
			var qx: int = x + dx
			var qy: int = y + dy
			if (dx == 0 and dy == 0) or qx < 0 or qy < 0 or qx >= w2 or qy >= h2:
				continue
			var o: int =(qy * w2 + qx) * 4
			if data2[o + 3] < 128:
				continue
			var c: Color = Color8(data2[o], data2[o + 1], data2[o + 2], 255)
			var deg: float = c.h * 360.0
			if deg >= 195.0 and deg <= 235.0 and c.s >= 0.6 and c.v >= 0.12 and c.v <= 0.7:
				return true
	return false










static func _pinta_ribete_portero(img: Image, data2: PackedByteArray, kit: Color,
		caja2: Rect2i, base: KitBase) -> void:
	var w2: int = img.get_width()
	var h2: int = img.get_height()
	for y in range(maxi(caja2.position.y, 0), mini(caja2.end.y, h2)):
		for x in range(maxi(caja2.position.x, 0), mini(caja2.end.x, w2)):
			var o: int =(y * w2 + x) * 4
			if data2[o + 3] < 128:
				continue
			var c: Color = Color8(data2[o], data2[o + 1], data2[o + 2], 255)
			var deg: float = c.h * 360.0
			if deg < 185.0 or deg > 215.0 or c.s <= 0.6 or c.v <= 0.6:
				continue
			var col: Color = _toned(kit, REF_KIT, c)
			var hallado: bool = false
			for r in [1, 2]:
				for dy in range(- r, r + 1):
					for dx in range(- r, r + 1):
						var qx: int = x + dx
						var qy: int = y + dy
						if hallado or qx < 0 or qy < 0 or qx >= w2 or qy >= h2:
							continue
						var oq: int =(qy * w2 + qx) * 4
						var cq: Color = Color8(data2[oq], data2[oq + 1], data2[oq + 2], 255)
						if data2[oq + 3] >= 128 and _is_kit_px(cq.h * 360.0, cq, base):
							col = img.get_pixel(qx, qy)
							hallado = true
				if hallado:
					break
			img.set_pixel(x, y, Color(col.r, col.g, col.b, data2[o + 3] / 255.0))








const TERMICA_LADO_PX: int = 6

static func _pinta_cuello_termico(img: Image, data2: PackedByteArray, col: Color,
		bb: Rect2i, caja2: Rect2i, head_mask: PackedByteArray, base: KitBase) -> void:
	var w2: int = img.get_width()
	var h2: int = img.get_height()
	var y0: int = maxi(caja2.position.y, 0)
	var y_max: int = mini(bb.position.y + int(bb.size.y * 0.45), h2)
	var x0: int = maxi(caja2.position.x, 0)
	var x1: int = mini(caja2.end.x, w2)
	var sin_roles: bool = _roles_map().is_empty()

	var zona := PackedByteArray()
	zona.resize(w2 * h2)
	for y in range(y0, y_max):
		for x in range(x0, x1):
			var i: int = y * w2 + x
			var o: int = i * 4
			if data2[o + 3] < 128 or head_mask[i] != 0:
				continue
			var c: Color = Color8(data2[o], data2[o + 1], data2[o + 2], data2[o + 3])
			var rol: int = -1 if sin_roles \
					else int(_roles.get((data2[o]<<16)|(data2[o + 1]<<8)|data2[o + 2], -1))
			if rol == RolZona.PIEL or (rol < 0 and _is_skin(c.h * 360.0, c)):
				zona[i] = 1
			elif rol == RolZona.KIT or (rol < 0 and _is_kit_px(c.h * 360.0, c, base)):
				zona[i] = 2
	var cola: Array[int] = []
	var puesto := PackedByteArray()
	puesto.resize(w2 * h2)
	for y in range(y0, y_max):
		for x in range(x0, x1):
			var i: int = y * w2 + x
			if zona[i] != 1:
				continue
			var izq: bool = false
			var der: bool = false
			for d in range(1, TERMICA_LADO_PX + 1):
				if x - d >= x0 and zona[i - d] == 2:
					izq = true
				if x + d < x1 and zona[i + d] == 2:
					der = true
			if izq and der:
				puesto[i] = 1
				cola.append(i)

	var k: int = 0
	while k < cola.size():
		var i: int = cola[k]
		k += 1
		for n in [i - w2, i - 1, i + 1]:
			if n < 0 or n >= w2 * h2 or puesto[n] != 0 or zona[n] != 1:
				continue
			if absi((n % w2) -(i % w2)) > 1:
				continue
			puesto[n] = 1
			cola.append(n)
	for i in cola:
		var o: int = i * 4
		var c: Color = Color8(data2[o], data2[o + 1], data2[o + 2], data2[o + 3])
		img.set_pixel(i % w2, i / w2, _toned(col, REF_SKIN, c))

















const POLO_SOLAPA: Array[int] = [3, 2, 2, 2, 2, 1]
const POLO_SOMBRA: float = 0.7
const POLO_ABERTURA: float = 0.55

static func _pinta_cuello_y_punos(img: Image, data2: PackedByteArray, cfg: Dictionary,
		bb: Rect2i, caja2: Rect2i, head_mask: PackedByteArray, base: KitBase,
		base_ref: Color, rol_ref_kit: Color) -> void:
	var w2: int = img.get_width()
	var h2: int = img.get_height()
	var y0: int = maxi(caja2.position.y, 0)
	var y1: int = mini(caja2.end.y, h2)
	var x0: int = maxi(caja2.position.x, 0)
	var x1: int = mini(caja2.end.x, w2)
	var sin_roles: bool = _roles_map().is_empty()

	var zona := PackedByteArray()
	zona.resize(w2 * h2)
	for y in range(y0, y1):
		for x in range(x0, x1):
			var i: int = y * w2 + x
			var o: int = i * 4
			if data2[o + 3] < 128 or head_mask[i] != 0:
				continue
			var c: Color = Color8(data2[o], data2[o + 1], data2[o + 2], data2[o + 3])
			var rol: int = -1 if sin_roles \
					else int(_roles.get((data2[o]<<16)|(data2[o + 1]<<8)|data2[o + 2], -1))
			if rol == RolZona.KIT or (rol < 0 and _is_kit_px(c.h * 360.0, c, base)):
				zona[i] = 1
			elif rol == RolZona.KIT2 or (rol < 0 and c.s < 0.18 and c.v > 0.5):
				zona[i] = 2
	var grupos: Array = []
	var visto := PackedByteArray()
	visto.resize(w2 * h2)
	for y in range(y0, y1):
		for x in range(x0, x1):
			var s: int = y * w2 + x
			if zona[s] != 2 or visto[s] != 0:
				continue
			var px: Array[int] = [s]
			visto[s] = 1
			var k: int = 0
			var top: int = y
			var bot: int = y
			var sx: int = 0
			while k < px.size():
				var i: int = px[k]
				k += 1
				var ix: int = i % w2
				var iy: int = i / w2
				top = mini(top, iy)
				bot = maxi(bot, iy)
				sx += ix
				for dy in [-1, 0, 1]:
					for dx in [-1, 0, 1]:
						var nx: int = ix + dx
						var ny: int = iy + dy
						if nx < x0 or nx >= x1 or ny < y0 or ny >= y1:
							continue
						var n: int = ny * w2 + nx
						if zona[n] == 2 and visto[n] == 0:
							visto[n] = 1
							px.append(n)
			grupos.append({"px": px, "top": top, "bot": bot, "cx": float(sx) / px.size()})
	if grupos.is_empty():
		return

	var techo: int = bb.position.y + int(bb.size.y * 0.6)
	var mayor: Dictionary = {}
	for g in grupos:
		if mayor.is_empty() or (g["px"] as Array).size() >(mayor["px"] as Array).size():
			mayor = g
	if (mayor["px"] as Array).size() >= 30:
		techo = int(mayor["top"])
	var centro: float = bb.position.x + bb.size.x * 0.5
	var cuello: Dictionary = {}
	var punos: Array = []
	for g in grupos:
		if int(g["bot"]) >= techo or (g["px"] as Array).size() > 40:
			continue
		if absf(float(g["cx"]) - centro) <= bb.size.x * 0.2 \
				and (cuello.is_empty() or int(g["top"]) < int(cuello["top"])):
			if not cuello.is_empty():
				punos.append(cuello)
			cuello = g
		else:
			punos.append(g)
	var puno: Variant = cfg.get("puno_col")
	if puno is Color:
		for g in punos:
			for i in g["px"]:
				var o: int = i * 4
				var c: Color = Color8(data2[o], data2[o + 1], data2[o + 2], data2[o + 3])
				img.set_pixel(i % w2, i / w2, _toned_neutral(puno, REF_KIT2, c))
	var col: Variant = cfg.get("cuello_col")
	if not (col is Color) or cuello.is_empty():
		return
	var top: int = int(cuello["top"])
	var puesto := PackedByteArray()
	puesto.resize(w2 * h2)
	for i in cuello["px"]:
		puesto[i] = 1
		var o: int = i * 4
		var c: Color = Color8(data2[o], data2[o + 1], data2[o + 2], data2[o + 3])
		img.set_pixel(i % w2, i / w2, _toned_neutral(col, REF_KIT2, c))

	var tela: Array[int] = []
	if int(cuello["bot"]) - top >= 3:
		var izq: Dictionary = {}
		var der: Dictionary = {}
		for i in cuello["px"]:
			var y: int = i / w2
			var x: int = i % w2
			izq[y] = mini(int(izq.get(y, x)), x)
			der[y] = maxi(int(der.get(y, x)), x)
		var fondo: int = mini(POLO_SOLAPA.size(), int(cuello["bot"]) - top)
		for r in fondo:
			var y: int = top + r
			if not izq.has(y):
				continue
			for d in range(1, POLO_SOLAPA[r]):
				tela.append(y * w2 + int(izq[y]) - d)
				tela.append(y * w2 + int(der[y]) + d)


		var punta: int = top + fondo
		if izq.has(punta):
			var cx: int =(int(izq[punta]) + int(der[punta])) / 2
			tela.append(punta * w2 + cx - 1)
			tela.append(punta * w2 + cx + 1)
			var hueco: Color =(cfg.get("kit", REF_KIT) as Color).darkened(1.0 - POLO_ABERTURA)
			for y in range(punta - 1, punta + 1):
				var i: int = y * w2 + cx
				if puesto[i] == 1:
					puesto[i] = 3
					img.set_pixel(cx, y, hueco)
	else:
		for i in cuello["px"]:
			tela.append(i + w2)
	for i in tela:
		if i < 0 or i >= w2 * h2 or zona[i] != 1 or puesto[i] != 0:
			continue
		puesto[i] = 2
		var o: int = i * 4
		var rgb: int =(data2[o]<<16)|(data2[o + 1]<<8)|data2[o + 2]
		var c: Color = Color8(data2[o], data2[o + 1], data2[o + 2], data2[o + 3])
		var ref: Color = base_ref if sin_roles else _ref_kit_de(rgb, rol_ref_kit)
		img.set_pixel(i % w2, i / w2, _toned(col, ref, c))

	var sombra: Array[int] = tela.duplicate()
	for i in cuello["px"]:
		if puesto[i] == 1:
			sombra.append(i)
	for i in sombra:
		var n: int = i + w2
		if i < 0 or n >= w2 * h2 or (puesto[i] != 1 and puesto[i] != 2) \
				or puesto[n] != 0 or head_mask[n] != 0 or data2[n * 4 + 3] < 128:
			continue
		puesto[n] = 3
		var bajo: Color = img.get_pixel(n % w2, n / w2)
		img.set_pixel(n % w2, n / w2, Color(bajo.r * POLO_SOMBRA, bajo.g * POLO_SOMBRA,
			bajo.b * POLO_SOMBRA, bajo.a))


static func _pinta_medias_y_desgaste(img: Image, data2: PackedByteArray, cfg: Dictionary,
		bb: Rect2i, caja2: Rect2i, head_mask: PackedByteArray, base: KitBase,
		base_ref: Color, rol_ref_kit: Color, pattern_top: int) -> void:
	var w2: int = img.get_width()
	var h2: int = img.get_height()
	var de_pie: bool = bb.size.y >= bb.size.x
	var y0: int = maxi(caja2.position.y, 0)
	var y1: int = mini(caja2.end.y, h2)
	var x0: int = maxi(caja2.position.x, 0)
	var x1: int = mini(caja2.end.x, w2)
	var sin_roles: bool = _roles_map().is_empty()

	var zona := PackedByteArray()
	zona.resize(w2 * h2)
	for y in range(y0, y1):
		for x in range(x0, x1):
			var i: int = y * w2 + x
			var o: int = i * 4
			if data2[o + 3] < 128 or head_mask[i] != 0:
				continue
			var c: Color = Color8(data2[o], data2[o + 1], data2[o + 2], data2[o + 3])
			var rol: int = -1 if sin_roles \
					else int(_roles.get((data2[o]<<16)|(data2[o + 1]<<8)|data2[o + 2], -1))
			if rol == RolZona.KIT or (rol < 0 and _is_kit_px(c.h * 360.0, c, base)):
				zona[i] = 1
			elif rol == RolZona.KIT2 or (rol < 0 and c.s < 0.18 and c.v > 0.5):
				zona[i] = 2
	var nivel: int = clampi(int(cfg.get("barro", 0)), 0, BARRO_MEDIA.size() - 1)

	if de_pie and (cfg.has("sock") or cfg.has("sock_pat") or nivel > 0):
		var linea: int = bb.position.y + int(bb.size.y * SOCK_TOP_FRAC)
		var vuelta_px: Dictionary = _media_vuelta_y_rodilla(img, zona, w2, h2, x0, x1,
			maxi(linea, y0), y1)
		var visto := PackedByteArray()
		visto.resize(w2 * h2)
		var sock: Color = cfg.get("sock", cfg.get("kit", REF_KIT))
		var sock_b: Color = cfg.get("sock_b", sock)
		var pat: String = String(cfg.get("sock_pat", "solid"))
		for y in range(maxi(pattern_top, y0), y1):
			for x in range(x0, x1):
				var s: int = y * w2 + x
				if zona[s] != 1 or visto[s] != 0:
					continue
				var grupo: PackedInt32Array = PackedInt32Array([s])
				visto[s] = 1
				var k: int = 0
				var top: int = y
				var bot: int = y
				while k < grupo.size():
					var p: int = grupo[k]
					k += 1
					var py: int = p / w2
					top = mini(top, py)
					bot = maxi(bot, py)
					for d in [-1, 1, - w2, w2]:
						var q: int = p + d
						if q < 0 or q >= w2 * h2 or visto[q] != 0 or zona[q] != 1:
							continue
						if (d == 1 or d == -1) and q / w2 != py:
							continue
						if q / w2 < pattern_top:
							continue
						visto[q] = 1
						grupo.append(q)
				if top < linea or grupo.size() < SOCK_MIN_PX:
					continue
				var alto: int = bot - top + 1
				for p in grupo:
					var px: int = p % w2
					var py2: int = p / w2
					var r: int = py2 - top
					var col: Color = sock
					match pat:
						"vuelta":
							if r < 2:
								col = sock_b
						"franja":
							var f0: int = int(alto * 0.35)
							if r == f0 or r == f0 + 1:
								col = sock_b
						"aros":
							if r % 3 == 1:
								col = sock_b
						"dos_franjas":
							if r == 1 or r == 3:
								col = sock_b



						"vuelta_fina":
							if r == 0:
								col = sock_b
						"vuelta_dos":

							if r == 0 or r == 2:
								col = sock_b
						"dos_rayas":

							if r == 1 or r == 3:
								col = sock_b
						"raya_alta":
							if r == 1:
								col = sock_b
						"banda":

							if r <= alto / 2:
								col = sock_b
						"aros_anchos":


							if (r / 2) % 2 == 1:
								col = sock_b
					var o2: int = p * 4
					var c2: Color = Color8(data2[o2], data2[o2 + 1], data2[o2 + 2], data2[o2 + 3])
					var rgb: int =(data2[o2]<<16)|(data2[o2 + 1]<<8)|data2[o2 + 2]
					var ref: Color = base_ref if sin_roles or int(_roles.get(rgb, -1)) < 0 \
							else _ref_kit_de(rgb, rol_ref_kit)


					var out: Color = _toned_neutral(col, REF_KIT2, c2) if vuelta_px.has(p) \
							else _toned(col, ref, c2)

					if nivel > 0 and r >= alto / 3 \
							and _mancha(px - grupo[0] % w2, r) < BARRO_MEDIA[nivel]:
						out = out.lerp(BARRO_COL * Color(c2.v, c2.v, c2.v, 1.0) * 1.2, 0.7)
					img.set_pixel(px, py2, out)

	var pasto: int = clampi(int(cfg.get("pasto", 0)), 0, 2)
	if (nivel > 0 or pasto > 0) and de_pie:
		var sx0: int = 1<<30
		var sx1: int = -1
		var sy0: int = 1<<30
		var sy1: int = -1
		for y in range(maxi(pattern_top, y0), y1):
			for x in range(x0, x1):
				if zona[y * w2 + x] == 2:
					sx0 = mini(sx0, x)
					sx1 = maxi(sx1, x)
					sy0 = mini(sy0, y)
					sy1 = maxi(sy1, y)
		if sy1 >= 0 and nivel >= 2:
			_pinta_barro_playera(img, zona, cfg, nivel, x0, y0, sx0, sx1, sy0)
		if sy1 >= 0 and pasto > 0 and cfg.has("gloves"):


			var izq: bool = posmod(int(cfg.get("barro_sem", 0)), 2) == 0
			var manchas: Array = [PASTO_PORTERO[0] if izq else PASTO_PORTERO[1]]
			if pasto >= 2:
				manchas = PASTO_PORTERO.duplicate()
			_pinta_barro_playera(img, zona, cfg, 0, x0, y0, sx0, sx1, sy0, manchas,
				PASTO_COL, 0.7)
		elif sy1 >= 0 and pasto > 0:
			_pinta_pasto_short(img, zona, cfg, pasto, x0, x1, sx0, sx1, sy0, sy1)
		if sy1 >= 0 and nivel > 0:
			var corte: int = sy0 +(sy1 - sy0) / 2
			for y in range(corte, sy1 + 1):
				for x in range(x0, x1):
					if zona[y * w2 + x] != 2:
						continue
					if _mancha(x - sx0, y - sy0) < BARRO_SHORT[nivel]:
						var cur: Color = img.get_pixel(x, y)
						img.set_pixel(x, y, cur.lerp(BARRO_COL * Color(cur.v, cur.v, cur.v, 1.0)
							* 1.3, 0.6))

	if bool(cfg.get("mojado", false)):
		for y in range(y0, y1):
			for x in range(x0, x1):
				if zona[y * w2 + x] == 0:
					continue
				var cur2: Color = img.get_pixel(x, y)
				img.set_pixel(x, y, Color.from_hsv(cur2.h, minf(cur2.s * 1.06, 1.0),
					cur2.v * MOJADO_V, cur2.a))









static func _media_vuelta_y_rodilla(img: Image, zona: PackedByteArray, w2: int, h2: int,
		x0: int, x1: int, ylo: int, y1: int) -> Dictionary:
	var vuelta: Dictionary = {}
	var visto := PackedByteArray()
	visto.resize(w2 * h2)
	for y in range(ylo, y1):
		for x in range(x0, x1):
			var s: int = y * w2 + x
			if zona[s] != 2 or visto[s] != 0:
				continue
			var grupo: Array[int] = [s]
			visto[s] = 1
			var k: int = 0
			var arriba: bool = false
			while k < grupo.size():
				var p: int = grupo[k]
				k += 1
				if p / w2 < ylo:
					arriba = true
				for d in [-1, 1, - w2, w2]:
					var q: int = p + d
					if q < 0 or q >= w2 * h2 or visto[q] != 0 or zona[q] != 2:
						continue
					if (d == 1 or d == -1) and q / w2 != p / w2:
						continue
					visto[q] = 1
					grupo.append(q)
			if arriba or grupo.size() > 8:
				continue



			var es_vuelta: Array[bool] = []
			for p in grupo:
				es_vuelta.append(p + w2 < w2 * h2 and zona[p + w2] == 1)
			for gi in grupo.size():
				if es_vuelta[gi]:
					zona[grupo[gi]] = 1
					vuelta[grupo[gi]] = true
			for gi in grupo.size():
				var p: int = grupo[gi]
				if es_vuelta[gi]:
					continue
				var px: int = p % w2
				var py: int = p / w2
				var media_abajo: bool = false
				for dy in range(2, 7):
					if py + dy < h2 and zona[(py + dy) * w2 + px] == 1:
						media_abajo = true
						break
				if not media_abajo:
					continue
				var suma := Color(0, 0, 0, 0)
				var n: int = 0
				for d in [-1, 1, - w2, w2, -2, 2]:
					var q: int = p + d
					if q < 0 or q >= w2 * h2 or zona[q] != 0:
						continue
					var cq: Color = img.get_pixel(q % w2, q / w2)
					if cq.a < 0.5 or cq.v < 0.3 or cq.s < 0.15:
						continue
					suma += cq
					n += 1
				if n > 0:
					var piel: Color = suma / float(n)
					piel.a = 1.0
					img.set_pixel(px, py, piel.lerp(Color.WHITE, 0.12))
					zona[p] = 0
	return vuelta













const BARRO_PLAYERA: Array = [
	[[0.15, 0.8, 0.28, 0.16, 25.0], [0.7, 0.62, 0.07, 0.06, 0.0]],
	[[0.55, 0.85, 0.32, 0.12, -8.0], [0.25, 0.45, 0.06, 0.07, 0.0]],
	[[0.3, 0.7, 0.06, 0.05, 0.0], [0.65, 0.78, 0.07, 0.05, 0.0],
		[0.48, 0.55, 0.05, 0.05, 0.0], [0.8, 0.9, 0.06, 0.05, 0.0]],
	[[0.85, 0.25, 0.2, 0.14, -30.0], [0.4, 0.88, 0.1, 0.06, 0.0]],
]
const BARRO_PLAYERA_COL: Color = Color("8a6a45")
const BARRO_PLAYERA_2: Array = [
	[[0.6, 0.4, 0.14, 0.1, 40.0], [0.9, 0.85, 0.12, 0.1, 0.0]],
	[[0.8, 0.3, 0.1, 0.09, 0.0], [0.1, 0.7, 0.1, 0.12, 15.0]],
	[[0.2, 0.3, 0.05, 0.05, 0.0], [0.75, 0.4, 0.06, 0.05, 0.0],
		[0.35, 0.9, 0.22, 0.1, 10.0]],
	[[0.2, 0.55, 0.12, 0.18, 20.0], [0.7, 0.75, 0.16, 0.08, -15.0]],
]

static func _pinta_barro_playera(img: Image, zona: PackedByteArray, cfg: Dictionary,
		nivel: int, x0: int, y0: int, tx0: int, tx1: int, cintura: int,
		propias: Array = [], col: Color = BARRO_PLAYERA_COL, fuerza: float = 0.85) -> void:
	var w2: int = img.get_width()

	var ty0: int = -1
	for y in range(y0, cintura):
		for x in range(maxi(tx0, x0), tx1 + 1):
			if zona[y * w2 + x] == 1:
				ty0 = y
				break
		if ty0 >= 0:
			break
	if ty0 < 0 or cintura - ty0 < 4 or tx1 - tx0 < 4:
		return
	var sem: int = posmod(int(cfg.get("barro_sem", 0)), BARRO_PLAYERA.size())
	var manchas: Array = propias if not propias.is_empty() else BARRO_PLAYERA[sem].duplicate()
	if nivel >= 3 and propias.is_empty():
		manchas.append_array(BARRO_PLAYERA_2[sem])
	var ancho: float = float(tx1 - tx0 + 1)
	var alto: float = float(cintura - ty0)
	for y in range(ty0, cintura):
		for x in range(tx0, tx1 + 1):
			if zona[y * w2 + x] != 1:
				continue
			var fx: float =(x - tx0 + 0.5) / ancho
			var fy: float =(y - ty0 + 0.5) / alto

			var borde: float = 1.0 - _mancha(x - tx0, y - ty0) / 100.0 * 0.45
			for m in manchas:
				var a: float = deg_to_rad(m[4])
				var dx: float = fx - m[0]
				var dy: float = fy - m[1]
				var u: float =(dx * cos(a) + dy * sin(a)) / m[2]
				var v: float =(- dx * sin(a) + dy * cos(a)) / m[3]
				if u * u + v * v < borde * borde:



					var cur: Color = img.get_pixel(x, y)
					var lodo: Color = col *(0.7 + 0.45 * cur.v)
					lodo.a = cur.a
					img.set_pixel(x, y, cur.lerp(lodo, fuerza))
					break








const PASTO_COL: Color = Color("5e8a2c")

const PASTO_MANCHA: Array = [[], [0.18, 0.68, 0.24, 0.38], [0.18, 0.62, 0.3, 0.48]]


const PASTO_PORTERO: Array = [[0.3, 0.84, 0.13, 0.16, 20.0], [0.7, 0.84, 0.13, 0.16, -20.0]]

static func _pinta_pasto_short(img: Image, zona: PackedByteArray, cfg: Dictionary,
		pasto: int, x0: int, x1: int, sx0: int, sx1: int, sy0: int, sy1: int) -> void:
	var w2: int = img.get_width()
	var ancho: float = float(sx1 - sx0 + 1)




	for y in range(sy0, sy1 + 1):
		var hay: bool = false
		for x in range(sx0, sx1 + 1):
			if zona[y * w2 + x] == 2:
				hay = true
				break
		if not hay:
			sy1 = y - 1
			break
	var alto: float = float(sy1 - sy0 + 1)
	var m: Array = PASTO_MANCHA[pasto]
	var izq: bool = posmod(int(cfg.get("barro_sem", 0)), 2) == 0
	for y in range(sy0, sy1 + 1):
		for x in range(x0, x1):
			if zona[y * w2 + x] != 2:
				continue
			var fx: float =(x - sx0 + 0.5) / ancho
			var fy: float =(y - sy0 + 0.5) / alto

			var lado: float = fx if izq else 1.0 - fx
			if pasto >= 2:
				lado = minf(fx, 1.0 - fx)
			var borde: float = 1.0 - _mancha(x - sx0, y - sy0) / 100.0 * 0.5
			var u: float =(lado - m[0]) / m[2]
			var v: float =(fy - m[1]) / m[3]
			if u * u + v * v < borde * borde:
				var cur: Color = img.get_pixel(x, y)
				var verde: Color = PASTO_COL *(0.65 + 0.5 * cur.v)
				verde.a = cur.a
				img.set_pixel(x, y, cur.lerp(verde, 0.7))















const _CL_OPACO: int = 1
const _CL_BLANCO: int = 2
const _CL_PIEL: int = 4
const _CL_KIT: int = 8
const _QUIEN_ARM: int = 2


static func _bajo_del_short(data2: PackedByteArray, w2: int, h2: int, bb: Rect2i,
		base: KitBase) -> Dictionary:
	var pants_top: int = bb.position.y + int(bb.size.y * CASUAL_PANTS_TOP)
	var leg_top: int = bb.position.y + int(bb.size.y * CASUAL_LEG_TOP)
	var x0: int = maxi(bb.position.x - 1, 0)
	var x1: int = mini(bb.end.x + 1, w2)
	var clase := PackedByteArray()
	clase.resize(w2 * h2)
	for y in range(maxi(pants_top - 1, 0), h2):
		for x in range(x0, x1):
			var o: int =(y * w2 + x) * 4
			if data2[o + 3] < 128:
				continue
			var c: Color = Color8(data2[o], data2[o + 1], data2[o + 2], data2[o + 3])
			var deg: float = c.h * 360.0
			var k: int = _CL_OPACO
			if c.s < 0.18 and c.v > 0.5:
				k |= _CL_BLANCO
			if _is_skin(deg, c):
				k |= _CL_PIEL
			if _es_kit_origen(deg, c, base):
				k |= _CL_KIT
			clase[y * w2 + x] = k
	var hem := PackedInt32Array()
	hem.resize(w2)
	hem.fill(-1)
	var quien := PackedByteArray()
	quien.resize(w2 * h2)
	for x in range(x0, x1):
		var estado: int = 0
		var cerrado: bool = false
		for y in range(maxi(pants_top, 0), h2):
			var i: int = y * w2 + x
			var k: int = clase[i]
			if k&_CL_OPACO:
				if (k&_CL_BLANCO) and _vecino_con(clase, w2, h2, x, y, _CL_BLANCO):
					estado = 1
					if not cerrado:
						hem[x] = y
				elif hem[x] >= 0 and ((k&_CL_PIEL) or (y >= leg_top and (k&_CL_KIT))):
					cerrado = true
				elif (k&_CL_KIT) and y < leg_top and y > 0 and (clase[i - w2]&_CL_KIT):
					estado = _QUIEN_ARM
			quien[i] = estado
	return {"hem": hem, "quien": quien, "clase": clase, "pants_top": pants_top,
		"leg_top": leg_top, "x0": x0, "x1": x1}



static func _vecino_con(clase: PackedByteArray, w2: int, h2: int, x: int, y: int,
		bit: int) -> bool:
	if x > 0 and clase[y * w2 + x - 1]&bit:
		return true
	if x < w2 - 1 and clase[y * w2 + x + 1]&bit:
		return true
	if y > 0 and clase[(y - 1) * w2 + x]&bit:
		return true
	return y < h2 - 1 and clase[(y + 1) * w2 + x]&bit



static func _bfs_comp(comp_id: PackedInt32Array, cid: int, src: PackedInt32Array, w2: int,
		h2: int) -> Dictionary:
	var d: Dictionary = {}
	var cola := PackedInt32Array()
	for s in src:
		if not d.has(s):
			d[s] = 0
			cola.append(s)
	var head: int = 0
	while head < cola.size():
		var p: int = cola[head]
		head += 1
		var px: int = p % w2
		var py: int = p / w2
		for q in [p - 1 if px > 0 else -1, p + 1 if px < w2 - 1 else -1,
				p - w2 if py > 0 else -1, p + w2 if py < h2 - 1 else -1]:
			if q >= 0 and comp_id[q] == cid and not d.has(q):
				d[q] = int(d[p]) + 1
				cola.append(q)
	return d
















static func _pinta_mallas(img: Image, data2: PackedByteArray, w2: int, h2: int, bb: Rect2i,
		base: KitBase, kit2_col: Color) -> void:
	if bb.size.y < bb.size.x:
		return
	var info: Dictionary = _bajo_del_short(data2, w2, h2, bb, base)
	var hem: PackedInt32Array = info["hem"]
	var quien: PackedByteArray = info["quien"]
	var clase: PackedByteArray = info["clase"]
	var pt: int = maxi(int(info["pants_top"]), 0)
	var lt: int = info["leg_top"]
	var x0: int = info["x0"]
	var x1: int = info["x1"]
	var y70: int = bb.position.y + int(bb.size.y * 0.7)
	var media := PackedByteArray()
	media.resize(w2 * h2)
	var hay_media: bool = false
	for y in range(pt, h2):
		for x in range(x0, x1):
			var i: int = y * w2 + x
			if not (clase[i]&_CL_KIT) or (quien[i] == _QUIEN_ARM and y < lt):
				continue
			if y >(hem[x] if hem[x] >= 0 else y70 - 1):
				media[i] = 1
				hay_media = true
	if not hay_media:
		return
	var piel := PackedByteArray()
	piel.resize(w2 * h2)
	for y in range(pt, h2):
		for x in range(x0, x1):
			var i: int = y * w2 + x
			if (clase[i]&_CL_PIEL) and quien[i] != _QUIEN_ARM and y > hem[x]:
				piel[i] = 1


	var brillos := PackedInt32Array()
	for y in range(pt + 1, h2 - 1):
		for x in range(maxi(x0, 1), mini(x1, w2 - 1)):
			var i: int = y * w2 + x
			if not (clase[i]&_CL_BLANCO) or quien[i] == _QUIEN_ARM or hem[x] < 0 \
					or y <= hem[x]:
				continue
			var n_piel: int = piel[i - 1] + piel[i + 1] + piel[i - w2] + piel[i + w2]
			if n_piel >= 2 and not _vecino_con(clase, w2, h2, x, y, _CL_KIT):
				brillos.append(i)
	for i in brillos:
		piel[i] = 1
	var comp_id := PackedInt32Array()
	comp_id.resize(w2 * h2)
	comp_id.fill(-1)
	var malla := PackedByteArray()
	malla.resize(w2 * h2)
	var pintar := PackedInt32Array()
	for y in range(pt, h2):
		for x in range(x0, x1):
			var s0: int = y * w2 + x
			if piel[s0] == 0 or comp_id[s0] >= 0:
				continue
			var comp := PackedInt32Array([s0])
			comp_id[s0] = s0
			var head: int = 0
			while head < comp.size():
				var p: int = comp[head]
				head += 1
				var px: int = p % w2
				var py: int = p / w2
				for q in [p - 1 if px > 0 else -1, p + 1 if px < w2 - 1 else -1,
						p - w2 if py > 0 else -1, p + w2 if py < h2 - 1 else -1]:
					if q >= 0 and piel[q] == 1 and comp_id[q] < 0:
						comp_id[q] = s0
						comp.append(q)



			var seeds := PackedInt32Array()
			var bajos := PackedInt32Array()
			for p in comp:
				var px: int = p % w2
				var py: int = p / w2
				if (py == 0 or comp_id[p - w2] != s0) and _semilla_malla(clase, hem, w2, px, py):
					seeds.append(p)
				var toca: bool = false
				for dx in [-1, 0, 1]:
					for dy in [0, 1, 2]:
						var qx: int = px + dx
						var qy: int = py + dy
						if qx >= 0 and qx < w2 and qy < h2 and media[qy * w2 + qx] == 1:
							toca = true
				if toca:
					bajos.append(p)
			if seeds.is_empty():
				continue
			var d: Dictionary = _bfs_comp(comp_id, s0, seeds, w2, h2)
			var maxd: int = 0
			for p in d:
				maxd = maxi(maxd, int(d[p]))
			var largo: int = maxd + 1
			if not bajos.is_empty():
				var dm: Dictionary = _bfs_comp(comp_id, s0, bajos, w2, h2)
				var ls: Array[int] = []
				for p in seeds:
					if dm.has(p):
						ls.append(int(d[p]) + int(dm[p]) + 1)
				if not ls.is_empty():
					ls.sort()
					largo = ls[ls.size() / 2]
			var n: int = maxi(2, int(TIGHTS_COBERTURA * largo + 0.5))
			if not bajos.is_empty():
				n = mini(n, maxd)
			for p in d:
				if int(d[p]) < n:
					malla[p] = 1
					pintar.append(p)



	var claro: bool = kit2_col.v >= TIGHTS_OSCURO_V
	for p in pintar:
		var o: int = p * 4
		var c: Color = Color8(data2[o], data2[o + 1], data2[o + 2], 255)
		var r: float = minf(c.v / REF_SKIN.v, 1.0)
		var remate: bool = p + w2 >= w2 * h2 or malla[p + w2] == 0
		var col: Color
		if claro:
			col = Color.from_hsv(kit2_col.h, kit2_col.s,
				kit2_col.v *(0.775 if remate else 0.92) * r)
		elif remate:
			col = Color.from_hsv(kit2_col.h, kit2_col.s, kit2_col.v * 0.85)
		else:
			col = Color.from_hsv(kit2_col.h, minf(kit2_col.s + 0.1, 1.0),
				(kit2_col.v + 0.12) * r)
		img.set_pixel(p % w2, p / w2, col)




static func _semilla_malla(clase: PackedByteArray, hem: PackedInt32Array, w2: int, x: int,
		y: int) -> bool:
	for dy in [1, 2, 3]:
		for dx in [-2, -1, 0, 1, 2]:
			var qx: int = x + dx
			if qx < 0 or qx >= w2 or y - dy < 0:
				continue
			var hq: int = hem[qx]
			if hq >= 0 and hq >= y - dy and hq < y and y - hq <= 6 \
					and clase[(y - dy) * w2 + qx]&_CL_BLANCO:
				return true
	return false












static func _pinta_rodillera(img: Image, data2: PackedByteArray, w2: int, h2: int, bb: Rect2i,
		base: KitBase, view: String, lado: String, vendaje: bool) -> void:
	if bb.size.y < bb.size.x:
		return
	var x0: int = bb.position.x
	var x1: int = mini(bb.end.x + 1, w2)
	var y0: int = bb.position.y
	var y1: int = mini(bb.end.y + 1, h2)
	var alto_cuerpo: int = y1 - y0
	var ytop: int = y0 + int(alto_cuerpo * 0.55)
	var piel := PackedByteArray()
	piel.resize(w2 * h2)
	for y in range(ytop, y1):
		for x in range(x0, x1):
			var o: int =(y * w2 + x) * 4
			if data2[o + 3] >= 128:
				var c: Color = Color8(data2[o], data2[o + 1], data2[o + 2], data2[o + 3])
				if _is_skin(c.h * 360.0, c):
					piel[y * w2 + x] = 2




	var brillos := PackedInt32Array()
	for y in range(maxi(ytop, 1), mini(y1, h2 - 1)):
		for x in range(maxi(x0, 1), mini(x1, w2 - 1)):
			var i: int = y * w2 + x
			var o: int = i * 4
			if data2[o + 3] < 128:
				continue
			var c: Color = Color8(data2[o], data2[o + 1], data2[o + 2], 255)
			if not (c.s < 0.18 and c.v > 0.5):
				continue
			var n_piel: int = 0
			var con_media: bool = false
			for q in [i - 1, i + 1, i - w2, i + w2]:
				if piel[q] == 2:
					n_piel += 1
				elif data2[q * 4 + 3] >= 128:
					var cq: Color = Color8(data2[q * 4], data2[q * 4 + 1], data2[q * 4 + 2], 255)
					if _es_kit_origen(cq.h * 360.0, cq, base):
						con_media = true
			if n_piel >= 2 and not con_media:
				brillos.append(i)
	for i in brillos:
		piel[i] = 1
	var comp_id := PackedInt32Array()
	comp_id.resize(w2 * h2)
	comp_id.fill(-1)
	var piernas: Array[Dictionary] = []
	for y in range(ytop, y1):
		for x in range(x0, x1):
			var s0: int = y * w2 + x
			if piel[s0] == 0 or comp_id[s0] >= 0:
				continue
			var comp := PackedInt32Array([s0])
			comp_id[s0] = s0
			var head: int = 0
			while head < comp.size():
				var p: int = comp[head]
				head += 1
				var px: int = p % w2
				var py: int = p / w2
				for dy in [-1, 0, 1]:
					for dx in [-1, 0, 1]:
						var qx: int = px + dx
						var qy: int = py + dy
						if qx < x0 or qx >= x1 or qy < ytop or qy >= y1:
							continue
						var q: int = qy * w2 + qx
						if piel[q] > 0 and comp_id[q] < 0:
							comp_id[q] = s0
							comp.append(q)
			if comp.size() < 6:
				continue
			var ymin: int = h2
			var ymax: int = -1
			for p in comp:
				ymin = mini(ymin, p / w2)
				ymax = maxi(ymax, p / w2)
			if ymax < y0 + 0.6 * alto_cuerpo or ymax - ymin + 1 > 9:
				continue
			var apoyo := PackedInt32Array()
			var cols: Dictionary = {}
			for p in comp:
				var px: int = p % w2
				var py: int = p / w2
				if py + 1 < h2 and comp_id[p + w2] == s0:
					continue
				for ddx in [0, -1, 1]:
					var n: int = 0
					for k in range(1, 5):
						var qx: int = px + ddx * k
						var qy: int = py + k
						if qy >= h2 or qx < 0 or qx >= w2:
							break
						var o: int =(qy * w2 + qx) * 4
						if data2[o + 3] < 128:
							break
						var c: Color = Color8(data2[o], data2[o + 1], data2[o + 2], 255)
						if _is_skin(c.h * 360.0, c):
							break





						if c.v > 0.2 and (not (c.s < 0.18 and c.v > 0.657) \
								or _toca_media(data2, w2, h2, qx, qy, base)):
							n += 1
					if n >= 2:
						apoyo.append(p)
						cols[px] = true
						break
			if cols.size() < 2:
				continue
			var brillo: float = 0.0
			var n_brillo: int = 0
			var cx: float = 0.0
			var cy: float = 0.0
			for p in comp:
				if piel[p] == 2:
					var o: int = p * 4
					brillo += Color8(data2[o], data2[o + 1], data2[o + 2], 255).v
					n_brillo += 1
				cx += p % w2
				cy += p / w2
			piernas.append({"id": s0, "comp": comp, "apoyo": apoyo,
				"brillo": brillo / maxi(n_brillo, 1), "cx": cx / comp.size(),
				"cy": cy / comp.size()})

	var suma_y: float = 0.0
	var n_short: int = 0
	for y in range(y0 + alto_cuerpo / 2, y1):
		for x in range(x0, x1):
			var o: int =(y * w2 + x) * 4
			if data2[o + 3] < 128:
				continue
			var c: Color = Color8(data2[o], data2[o + 1], data2[o + 2], 255)
			if c.s < 0.18 and c.v > 0.657:
				suma_y += y
				n_short += 1
	if n_short > 0:
		var cy_short: float = suma_y / n_short
		var bajo_short: Array[Dictionary] = []
		for l in piernas:
			if float(l["cy"]) > cy_short:
				bajo_short.append(l)
		piernas = bajo_short
	if piernas.is_empty():
		return





	var elegidas: Array = []
	if lado == "both":
		for l in piernas:
			elegidas.append([l, false])
	elif view == "front" or view == "back":
		var mid: float =(x0 + x1) / 2.0
		var izq: bool = lado == "left"
		for l in piernas:
			if (float(l["cx"]) < mid) == izq:
				elegidas.append([l, false])
	elif piernas.size() == 1:
		elegidas.append([piernas[0], false])
	else:
		var orden: Array[Dictionary] = piernas.duplicate()
		orden.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
			return float(a["brillo"]) > float(b["brillo"]))
		var lejos: bool = float(orden[0]["brillo"]) - float(orden[-1]["brillo"]) > 0.04
		for l in orden:
			elegidas.append([l, lejos and l == orden[-1]])
	for par in elegidas:
		var l: Dictionary = par[0]
		var cid: int = l["id"]
		var dist: Dictionary = {}
		var cola := PackedInt32Array()
		for p in l["apoyo"]:
			dist[p] = 0
			cola.append(p)
		var head: int = 0
		while head < cola.size():
			var p: int = cola[head]
			head += 1
			var px: int = p % w2
			var py: int = p / w2
			for off: Vector2i in [Vector2i(0, -1), Vector2i(-1, 0), Vector2i(1, 0),
					Vector2i(0, 1), Vector2i(-1, -1), Vector2i(1, -1)]:
				var qx: int = px + off.x
				var qy: int = py + off.y
				if qx < 0 or qx >= w2 or qy < 0 or qy >= h2:
					continue
				var q: int = qy * w2 + qx
				if comp_id[q] == cid and not dist.has(q):
					dist[q] = int(dist[p]) + 1
					cola.append(q)
		var dmax: int = 0
		for p in dist:
			dmax = maxi(dmax, int(dist[p]))
		var alto: int = dmax + 1


		var d0: int = 1
		var grueso: int = 3 if alto >= 7 else 2
		if alto < 4:
			d0 = 0
			grueso = mini(2, alto)
		var tope: int = d0 + grueso - 1
		var xmax: Dictionary = {}
		var xmin: Dictionary = {}
		var banda: Array[int] = []
		for p in dist:
			var d: int = dist[p]
			if d < d0 or d > tope:
				continue
			banda.append(p)
			xmax[d] = maxi(int(xmax.get(d, -1)), p % w2)
			xmin[d] = mini(int(xmin.get(d, 9999)), p % w2)
		var rampa: Array[Color]
		if bool(par[1]):
			rampa = KNEE_WRAP_LEJOS if vendaje else KNEE_NEO_LEJOS
		else:
			rampa = KNEE_WRAP if vendaje else KNEE_NEO
		for p in banda:
			var d: int = dist[p]
			var px: int = p % w2
			var canto: bool = px == int(xmax[d]) and int(xmax[d]) - int(xmin[d]) >= 2
			var t: int = 1
			if vendaje:

				t = 1 if (tope - d) % 2 == 0 else 0
				if canto:
					t = 0
			elif canto:
				t = 0
			elif d == tope and px <= int(xmin[d]) + 1:

				t = 2
			img.set_pixel(px, p / w2, rampa[t])



static func _toca_media(data2: PackedByteArray, w2: int, h2: int, x: int, y: int,
		base: KitBase) -> bool:
	for off: Vector2i in [Vector2i(-1, 0), Vector2i(1, 0), Vector2i(0, -1), Vector2i(0, 1)]:
		var qx: int = x + off.x
		var qy: int = y + off.y
		if qx < 0 or qy < 0 or qx >= w2 or qy >= h2:
			continue
		var o: int =(qy * w2 + qx) * 4
		if data2[o + 3] < 128:
			continue
		var c: Color = Color8(data2[o], data2[o + 1], data2[o + 2], 255)
		if _es_kit_origen(c.h * 360.0, c, base):
			return true
	return false




static func _mancha(lx: int, ly: int) -> int:
	var hx: int =(lx>>1) * 73856093
	var hy: int =(ly>>1) * 19349663
	return absi((hx^hy) * 83492791) % 100









static func _es_kit_origen(deg: float, c: Color, base: KitBase) -> bool:
	if _is_kit_px(deg, c, base):
		return true
	if _roles_map().is_empty():
		return false
	return int(_roles.get((c.r8<<16)|(c.g8<<8)|c.b8, -1)) == RolZona.KIT









const CUELLO_TELA_MAX: int = 4
static func _cuello_de_tela(data: PackedByteArray, w: int, x: int, y: int, hasta: int,
		base: KitBase) -> bool:
	if hasta - y > CUELLO_TELA_MAX:
		return false
	var h: int = data.size() /(4 * w)
	var vistos: Dictionary = {Vector2i(x, y): true}
	var cola: Array[Vector2i] = [Vector2i(x, y)]
	while not cola.is_empty() and vistos.size() < 40:
		var p: Vector2i = cola.pop_back()
		if p.y >= hasta:
			return true
		for d: Vector2i in [Vector2i(0, 1), Vector2i(-1, 0), Vector2i(1, 0), Vector2i(0, -1)]:
			var q: Vector2i = p + d
			if q.x < 0 or q.x >= w or q.y < y or q.y >= h or absi(q.x - x) > 3 or vistos.has(q):
				continue
			var o: int =(q.y * w + q.x) * 4
			if data[o + 3] < 128:
				continue
			var c: Color = Color8(data[o], data[o + 1], data[o + 2], data[o + 3])
			if _es_kit_origen(c.h * 360.0, c, base) or (c.s < 0.12 and c.v > 0.85):
				vistos[q] = true
				cola.append(q)
	return false


static func _is_skin(deg: float, c: Color) -> bool:
	return deg >= 4.0 and deg <= 34.0 and c.s >= 0.2 and c.s <= 0.75 \
			and c.v > 0.42





































static func _en_la_mata(bb: Rect2i, has: bool, x: int, y: int) -> bool:
	if not has:
		return true
	return x >= bb.position.x - 1 and x <= bb.end.x \
			and y >= bb.position.y - 1 and y <= bb.end.y


static func _largest_dark_component(img: Image, head_bottom: int) -> Rect2i:
	var dark: Dictionary = {}
	for y in mini(head_bottom, img.get_height()):
		for x in img.get_width():
			var c: Color = img.get_pixel(x, y)
			if c.a >= 0.5 and (c.v < 0.22 or _is_hair(c.h * 360.0, c)):
				dark[Vector2i(x, y)] = true
	var best: Array[Vector2i] = []
	var visited: Dictionary = {}
	for start in dark:
		if visited.has(start):
			continue
		var comp: Array[Vector2i] = []
		var queue: Array[Vector2i] = [start]
		visited[start] = true
		while not queue.is_empty():
			var p: Vector2i = queue.pop_back()
			comp.append(p)
			for off in [Vector2i(1, 0), Vector2i(-1, 0), Vector2i(0, 1),
					Vector2i(0, -1)]:
				var q: Vector2i = p + off
				if dark.has(q) and not visited.has(q):
					visited[q] = true
					queue.append(q)
		if comp.size() > best.size():
			best = comp
	if best.is_empty():
		return Rect2i()
	var bb: Rect2i = Rect2i(best[0], Vector2i.ONE)
	for p in best:
		bb = bb.expand(p)
	return bb


const MIN_FACE_SIDE: int = 4
const MIN_FACE_PX: int = 12
















const FACE_ALTA: float = 1.6
static func _largest_skin_component(img: Image, head_bottom: int,
		out_px: Array[Vector2i], out_orig: Array[Color]) -> Rect2i:
	var skin: Dictionary = {}
	for y in mini(head_bottom, img.get_height()):
		for x in img.get_width():
			var c: Color = img.get_pixel(x, y)
			if c.a >= 0.5 and _is_skin(c.h * 360.0, c):
				skin[Vector2i(x, y)] = c
	var best: Array[Vector2i] = []
	var candidatas: Array = []
	var visited: Dictionary = {}
	for start in skin:
		if visited.has(start):
			continue
		var comp: Array[Vector2i] = []
		var queue: Array[Vector2i] = [start]
		visited[start] = true
		while not queue.is_empty():
			var p: Vector2i = queue.pop_back()
			comp.append(p)
			for off in [Vector2i(1, 0), Vector2i(-1, 0), Vector2i(0, 1), Vector2i(0, -1)]:
				var q: Vector2i = p + off
				if skin.has(q) and not visited.has(q):
					visited[q] = true
					queue.append(q)
		if comp.size() >= MIN_FACE_PX:
			candidatas.append(comp)
		if comp.size() > best.size():
			best = comp
	if best.size() < MIN_FACE_PX:
		return Rect2i()
	var bb: Rect2i = _caja_piel(best)
	if bb.size.x < MIN_FACE_SIDE or bb.size.y < MIN_FACE_SIDE:
		return Rect2i()


	if bb.size.y > bb.size.x * FACE_ALTA and candidatas.size() > 1:
		var eje: float = _eje_torso(img, head_bottom)
		if eje >= 0.0:
			var dist: float = absf(bb.position.x + bb.size.x * 0.5 - eje)
			for comp in candidatas:
				var cb: Rect2i = _caja_piel(comp)
				if cb.size.x < MIN_FACE_SIDE or cb.size.y < MIN_FACE_SIDE \
						or cb.size.y > cb.size.x * FACE_ALTA:
					continue
				var d: float = absf(cb.position.x + cb.size.x * 0.5 - eje)
				if d < dist:
					dist = d
					best = comp
					bb = cb



	for p in best:
		out_px.append(p)
		out_orig.append(skin[p])
	return bb



static func _caja_piel(comp: Array) -> Rect2i:
	var bb: Rect2i = Rect2i(comp[0], Vector2i.ONE)
	for p in comp:
		bb = bb.expand(p)
	return bb





static func _eje_torso(img: Image, head_bottom: int) -> float:
	var caja: Rect2i = img.get_used_rect()
	var hasta: int = mini(caja.position.y + int(caja.size.y * 0.6), img.get_height())
	var suma: float = 0.0
	var n: int = 0
	for y in range(maxi(head_bottom, 0), hasta):
		for x in range(caja.position.x, caja.end.x):
			if img.get_pixel(x, y).a >= 0.5:
				suma += x
				n += 1
	return suma / n if n > 0 else -1.0























static var _hair_ov_cache: Dictionary = {}
static var _hair_anchors: Dictionary = {}
static var _hair_anchors_loaded: bool = false

const HAIR_OV_DIR: String = "res://assets/sprites/hair"




const OV_FILAS_CORONILLA: int = 3


const _OV_VISTA: Dictionary = {
	"front": "south", "right": "east", "left": "west", "back": "north",
}


static func _hair_overlay_de(style: String, view: String) -> Dictionary:
	var key: String = style + "_" + String(_OV_VISTA.get(view, "south"))
	if _hair_ov_cache.has(key):
		return _hair_ov_cache[key]
	var out: Dictionary = {}
	var path: String = HAIR_OV_DIR + "/" + key + ".png"
	if ResourceLoader.exists(path):
		var img: Image = lee_imagen(load(path) as Texture2D, "path")

		var vs: Array[float] = []
		var ss: Array[float] = []
		for y in img.get_height():
			for x in img.get_width():
				var c: Color = img.get_pixel(x, y)
				if c.a >= 0.5:
					vs.append(c.v)
					ss.append(c.s)
		if not vs.is_empty():
			vs.sort()
			ss.sort()
			out = {"img": img, "ref_v": vs[vs.size() / 2],
				"ref_s": ss[ss.size() / 2]}
	_hair_ov_cache[key] = out
	return out







static func _stamp_hair_overlay(img: Image, style: String, hair_px: Array[Vector2i],
		view: String, hair_c: Color) -> void:
	var ov: Dictionary = _hair_overlay_de(style, view)
	if ov.is_empty():
		return
	if not _hair_anchors_loaded:
		_hair_anchors_loaded = true
		var f: FileAccess = FileAccess.open(HAIR_OV_DIR + "/hair_anchors.json",
			FileAccess.READ)
		if f != null:
			var raw: Variant = JSON.parse_string(f.get_as_text())
			if typeof(raw) == TYPE_DICTIONARY:
				_hair_anchors = raw
	var vista: String = String(_OV_VISTA.get(view, "south"))
	var base_a: Dictionary = _hair_anchors.get(vista, {})





	var top: int = 1<<30
	for p in hair_px:
		top = mini(top, p.y)
	var xmin: int = 1<<30
	var xmax: int = -(1<<30)
	for p in hair_px:
		if p.y < top + OV_FILAS_CORONILLA:
			xmin = mini(xmin, p.x)
			xmax = maxi(xmax, p.x)
	if xmax < xmin:
		return
	var dx: int = roundi(float(xmin + xmax) * 0.5 - float(base_a.get("cx", 46.0)))
	var dy: int = top - int(base_a.get("top", 18))
	var o: Image = ov["img"]
	var rv: float = ov["ref_v"]
	var rs: float = ov["ref_s"]
	var w: int = img.get_width()
	var h: int = img.get_height()
	for y in o.get_height():
		for x in o.get_width():
			var c: Color = o.get_pixel(x, y)
			if c.a < 0.5:
				continue
			var tx: int = x + dx
			var ty: int = y + dy
			if tx < 0 or ty < 0 or tx >= w or ty >= h:
				continue
			img.set_pixel(tx, ty,
				c if hair_c.a == 0.0 else _toned_hair(hair_c, rv, rs, c))


static func _apply_hair_style(img: Image, style: String,
		hair_px: Array[Vector2i], hair_orig: Array[Color], ref_v: float,
		ref_s: float, face_bb: Rect2i, skin_c: Color,
		out_kept: Dictionary, view: String = "front") -> void:
	var is_back: bool = view == "back"
	var is_profile: bool = view == "left" or view == "right"
	var cx: float = face_bb.position.x + face_bb.size.x * 0.5
	var half_crest: float = maxf(face_bb.size.x * 0.17, 1.5)

	var half_wide: float = maxf(face_bb.size.x * 0.34, 3.0)


	var hair_top: int = 1<<30
	var hair_bot: int = -(1<<30)
	var hair_xmin: int = 1<<30
	var hair_xmax: int = -(1<<30)
	for p in hair_px:
		hair_top = mini(hair_top, p.y)
		hair_bot = maxi(hair_bot, p.y)
		hair_xmin = mini(hair_xmin, p.x)
		hair_xmax = maxi(hair_xmax, p.x)



	var hair_hw: float = maxf(float(hair_xmax - hair_xmin) * 0.5, 2.0)
	var hair_h: float = maxf(float(hair_bot - hair_top), 2.0)



	var brow: float = float(face_bb.position.y) if face_bb.size.y > 0 \
			else float(hair_top) + float(hair_bot - hair_top) * 0.5

	var crown_h: float = maxf(brow - float(hair_top), 2.0)




	var top_min: int = 1<<30
	var top_max: int = -(1<<30)
	for p in hair_px:
		if float(p.y) < brow:
			top_min = mini(top_min, p.x)
			top_max = maxi(top_max, p.x)
	var cx_top: float = cx if top_max < top_min \
			else float(top_min + top_max) * 0.5
	var half_w: float = maxf(face_bb.size.x * 0.5, 1.0)











	var part_off: float = face_bb.size.x * 0.17 if face_bb.size.y > 0 \
			else hair_hw * 0.2


	var part_sign: float = -1.0 if is_back else 1.0
	var part_x: float = cx_top - part_off * part_sign
	var half_part: float = 0.6
	var is_extra: bool = EXTRA_HAIR_STYLES.has(style)
	for i in hair_px.size():
		var p: Vector2i = hair_px[i]



		if is_extra and _is_face_feature(p, face_bb):
			out_kept[p] = 1.0
			continue

		var blend: float = 1.0
		match style:
			"mohawk":







				var en_cresta: bool = float(p.y) < float(hair_top) + crown_h * 0.5 \
						if is_profile else absf(float(p.x) - cx_top) <= half_crest
				blend = 0.0 if en_cresta else 0.74
			"crest_wide":


				var en_ancha: bool = float(p.y) < float(hair_top) + crown_h * 0.85 \
						if is_profile else absf(float(p.x) - cx_top) <= half_wide
				blend = 0.0 if en_ancha else 0.82
			"buzz":
				blend = 0.55
			"undercut":







				var dx_u: float = absf(float(p.x) - cx_top) / half_w
				blend = 0.0 if float(p.y) < brow and dx_u <= 0.9 else 0.78
			"taper":




				var t: float =(float(p.y) - float(hair_top)) \
						/ maxf(brow + crown_h * 0.5 - float(hair_top), 1.0)
				blend = clampf((t - 0.18) / 0.82, 0.0, 1.0)
			"entradas":





				var dx_n: float = absf(float(p.x) - cx_top) / half_w
				var w: float = clampf(1.0 - absf(dx_n - 0.65) / 0.38, 0.0, 1.0)




				var top_cut: float = maxf(brow - w * crown_h * 1.15,
					float(hair_top) + 1.0)
				blend = 1.0 if w > 0.0 and float(p.y) > top_cut \
						and float(p.y) <= brow + crown_h * 0.6 else 0.0
			"part":














				var dx_p: float =(float(p.x) - part_x) * part_sign




				var part_bot: float = float(hair_top) + maxf(crown_h * 0.25, 1.0) \
						if is_profile else brow + 1.0
				if absf(dx_p) <= half_part and float(p.y) <= part_bot:
					blend = 0.82
				elif (view == "right" if is_profile else dx_p < 0.0) \
						and float(p.y) <= brow \
						and not _touches_alpha(img, p):
					blend = 0.18
				else:
					blend = 0.0
			"lines":










				var k: int =((p.x - int(cx_top)) % 3 + 3) % 3
				blend = 0.92 if k == 1 else 0.15
			"fade_alto":
				var dx_fa: float = absf(float(p.x) - cx_top) / maxf(hair_hw, 1.0)
				var y_fa: float =(float(p.y) - float(hair_top)) / hair_h
				blend = 0.0 if dx_fa <= 0.52 and y_fa <= 0.42 else \
						clampf(0.45 + y_fa * 0.55 + maxf(dx_fa - 0.52, 0.0), 0.35, 0.92)
			"fade_bajo":
				var dx_fb: float = absf(float(p.x) - cx_top) / maxf(hair_hw, 1.0)
				var y_fb: float =(float(p.y) - float(hair_top)) / hair_h
				blend = 0.18 if y_fb < 0.45 and dx_fb <= 0.82 else \
						clampf((y_fb - 0.35) * 1.6 + maxf(dx_fb - 0.7, 0.0), 0.0, 0.84)
			"crop":
				var y_cr: float =(float(p.y) - float(hair_top)) / hair_h
				blend = 0.3 if float(p.y) < brow else 0.7
				if not is_back and y_cr > 0.52 and absf(float(p.x) - cx_top) < hair_hw * 0.55:
					blend = 0.1
			"caesar":
				var y_ca: float =(float(p.y) - float(hair_top)) / hair_h
				blend = 0.36 if float(p.y) < brow else 0.68
				if not is_back and y_ca > 0.54 and absf(float(p.x) - cx_top) < hair_hw * 0.72:
					blend = 0.0
			"crew_cut":
				var dx_cc: float = absf(float(p.x) - cx_top) / maxf(hair_hw, 1.0)
				blend = 0.5 if dx_cc <= 0.58 else 0.82
			"flequillo":
				var y_fl: float =(float(p.y) - float(hair_top)) / hair_h
				if is_back:
					blend = 0.2
				elif y_fl > 0.5 and float(p.y) <= brow + crown_h * 0.45:
					blend = 0.0
				else:
					blend = 0.32
			"slick_back":
				var y_sb: float =(float(p.y) - float(hair_top)) / hair_h
				var dx_sb: float = absf(float(p.x) - cx_top) / maxf(hair_hw, 1.0)
				blend = 0.16 if y_sb < 0.45 or is_back else 0.34
				if dx_sb > 0.72:
					blend = maxf(blend, 0.5)
			"quiff_corto":
				var dx_q: float = absf(float(p.x) - cx_top) / maxf(hair_hw, 1.0)
				var y_q: float =(float(p.y) - float(hair_top)) / hair_h
				blend = 0.0 if dx_q <= 0.42 and y_q <= 0.45 else 0.5
			"coleta", "coleta_alta", "bun_corto", "liga_coleta":
				var dx_po: float = absf(float(p.x) - cx_top) / maxf(hair_hw, 1.0)
				var y_po: float =(float(p.y) - float(hair_top)) / hair_h
				if is_back:
					blend = 0.1 if dx_po <= 0.72 else 0.58
				else:
					blend = 0.24 if y_po < 0.56 else 0.7
					if is_profile and y_po > 0.45:
						blend = 0.12
			"banda_pelo":
				blend = 0.18
			"raya_medio":





				var rm_top: float = float(hair_top)
				var rm_bot: float
				if is_back:
					rm_bot = float(hair_bot)
				elif is_profile:
					rm_bot = float(hair_top) + hair_h * 0.22
				else:
					rm_bot = minf(float(hair_top) + hair_h * 0.5, brow + 1.0)








				var rm_hw: float = 0.6
				if not is_back and float(p.y) >= rm_bot - 2.0:
					rm_hw = 1.2
				blend = 0.82 if absf(float(p.x) - cx_top) <= rm_hw \
						and float(p.y) >= rm_top and float(p.y) <= rm_bot else 0.0
			"coronilla":





				var co_cy: float = float(hair_top) + hair_h *(0.42 if is_back else 0.24)
				var co_rx: float = maxf(hair_hw * 0.5, 1.5)
				var co_ry: float = maxf(hair_h *(0.26 if is_back else 0.18), 1.5)
				var co_ex: float =(float(p.x) - cx_top) / co_rx
				var co_ey: float =(float(p.y) - co_cy) / co_ry
				blend = 0.78 if co_ex * co_ex + co_ey * co_ey <= 1.0 else 0.0
			"cepillo":






				var dx_c: float = absf(float(p.x) - cx_top) / maxf(hair_hw, 1.0)
				blend = 0.85 if dx_c > 0.68 else 0.42
			"lado_rapado":





				if is_profile:
					blend = 0.8 if view == "left" \
							and float(p.y) >= float(hair_top) + crown_h * 0.35 else 0.0
				else:
					var dx_lado: float =(float(p.x) - cx_top) *(-1.0 if is_back else 1.0)
					blend = 0.8 if dx_lado > half_w * 0.22 else 0.0
			"mullet":






				if is_back:
					blend = 0.0
				else:
					blend = 0.58 if float(p.y) < brow else 0.0
			"herradura":





				var he_dx: float = absf(float(p.x) - cx_top) / hair_hw
				var he_bot: float = float(hair_top) + hair_h *(0.62 if is_back else 0.72)
				blend = 0.86 if float(p.y) <= he_bot and he_dx <= 0.62 else 0.0
		if blend <= 0.0:
			out_kept[p] = 1.0
			continue
		var orig: Color = hair_orig[i]


		var shade: float = minf(orig.v / maxf(ref_v, 0.05), 1.35)
		var target: Color = Color.from_hsv(skin_c.h, skin_c.s,
			clampf(skin_c.v * shade, 0.03, 1.0), orig.a)
		if _touches_alpha(img, p):

			img.set_pixel(p.x, p.y, Color.from_hsv(skin_c.h, skin_c.s,
				skin_c.v * 0.32, orig.a))
		else:


			img.set_pixel(p.x, p.y, img.get_pixel(p.x, p.y).lerp(target, blend))
			if blend < 1.0:
				out_kept[p] = 1.0 - blend

























const SKULL_SHRINK: Dictionary = {"bald": 2, "buzz": 1}



const SKULL_VEIL: Dictionary = {"bald": 0.0, "buzz": 0.45}



const SKULL_ERODE: Array[Vector2i] = [
	Vector2i(0, -1), Vector2i(1, 0), Vector2i(-1, 0),
]






const SKULL_WIN_X: int = 9
const SKULL_WIN_Y: int = 12










const SKULL_CROWN_MAX: int = 10





const SKULL_MAX_W: int = 18
const SKULL_MAX_ROW: int = 16










const SKULL_MAX_FRAG: float = 0.24












const SKULL_MAX_ASPECT: float = 0.7







const SKULL_SPEC: Vector2 = Vector2(0.5, 1.1)
const SKULL_LIGHT: Vector2 = Vector2(0.72, 1.0)
const SKULL_BASE: Vector2 = Vector2(1.0, 0.94)
const SKULL_SHADE: Vector2 = Vector2(1.28, 0.84)
const SKULL_CONT: Vector2 = Vector2(1.0, 0.3)







const SKULL_DROP: float = 0.85
const SKULL_R_K: float = 0.8
const SKULL_K_LIGHT: float = 0.62
const SKULL_K_BASE: float = 0.3




static func _skull_tone(skin: Color, k: Vector2, a: float) -> Color:
	return Color.from_hsv(skin.h, clampf(skin.s * k.x, 0.0, 1.0),
		clampf(skin.v * k.y, 0.03, 1.0), a)



static func _skull_dist(p: Vector2i, lx: float, ly: float) -> float:
	var dx: float = float(p.x) - lx
	var dy: float = maxf(float(p.y) - ly, 0.0) * SKULL_DROP
	return sqrt(dx * dx + dy * dy)





static func _toca_pelo(p: Vector2i, hair_set: Dictionary) -> bool:
	for dx in [-1, 0, 1]:
		for dy in [-1, 0, 1]:
			if dx == 0 and dy == 0:
				continue
			if hair_set.has(p + Vector2i(dx, dy)):
				return true
	return false




static func _mayor_componente(set_px: Dictionary) -> int:
	var vis: Dictionary = {}
	var mejor: int = 0
	for s in set_px:
		if vis.has(s):
			continue
		var n: int = 0
		var q: Array[Vector2i] = [s]
		vis[s] = true
		while not q.is_empty():
			var p: Vector2i = q.pop_back()
			n += 1
			for dx in [-1, 0, 1]:
				for dy in [-1, 0, 1]:
					var t: Vector2i = p + Vector2i(dx, dy)
					if set_px.has(t) and not vis.has(t):
						vis[t] = true
						q.append(t)
		mejor = maxi(mejor, n)
	return mejor




static func _skull_near_skin(p: Vector2i, skin_set: Dictionary) -> bool:
	for off in [Vector2i(1, 0), Vector2i(-1, 0), Vector2i(0, 1), Vector2i(0, -1)]:
		if skin_set.has(p + off):
			return true
	return false









static func _shave_skull(img: Image, style: String, hair_px: Array[Vector2i],
		face_px: Array[Vector2i], src: Dictionary, skin_set: Dictionary,
		face_bb: Rect2i, skin_c: Color, base: KitBase,
		out_kept: Dictionary) -> bool:
	if not SKULL_SHRINK.has(style) or hair_px.is_empty():
		return false
	var shrink: int = int(SKULL_SHRINK[style])
	var veil: float = float(SKULL_VEIL[style])
	var w: int = img.get_width()
	var h: int = img.get_height()

	var hair_set: Dictionary = {}
	var top: int = 1<<30
	var bot: int = -(1<<30)
	for p in hair_px:
		hair_set[p] = true
		top = mini(top, p.y)
		bot = maxi(bot, p.y)




	if float(hair_px.size() - _mayor_componente(hair_set)) \
			/ float(hair_px.size()) > SKULL_MAX_FRAG:
		return false




	var cap_bot: int = face_bb.position.y
	if face_bb.size.y <= 0:
		cap_bot = top + int(round(float(bot - top) * 0.72))



	var ax0: int = 1<<30
	var ax1: int = -(1<<30)
	for p in hair_px:
		if p.y <= top + 2:
			ax0 = mini(ax0, p.x)
			ax1 = maxi(ax1, p.x)
	var axis: int = int(round(float(ax0 + ax1) * 0.5))




	var opaco: Dictionary = {}
	for y in range(maxi(top - 1, 0), mini(bot + 3, h)):
		for x in range(maxi(axis - SKULL_WIN_X - 2, 0),
				mini(axis + SKULL_WIN_X + 3, w)):
			if img.get_pixel(x, y).a >= 0.5:
				opaco[Vector2i(x, y)] = true






	var cand: Dictionary = {}
	for key in opaco:
		var p: Vector2i = key
		if p.y < top or p.y > bot or skin_set.has(p):
			continue
		if absi(p.x - axis) > SKULL_WIN_X or p.y > top + SKULL_WIN_Y:
			continue






		if face_bb.size.y > 0 and p.y < cap_bot - SKULL_CROWN_MAX:
			continue
		if p.y >= cap_bot and not hair_set.has(p):
			continue






		if p.y < cap_bot and not hair_set.has(p) and not _toca_pelo(p, hair_set):
			continue
		var c: Color = src.get(p, Color(0, 0, 0, 0))
		if c.a > 0.0 and c.v > 0.35 and _es_kit_origen(c.h * 360.0, c, base):
			continue











		if c.a > 0.0 and c.s < 0.25 and c.v > 0.55:
			continue
		cand[p] = true




	var seed: Vector2i = Vector2i(-1, -1)
	for p in hair_px:
		if p.y >= cap_bot or not cand.has(p):
			continue
		if seed.x < 0 or p.y < seed.y \
				or (p.y == seed.y and absi(p.x - axis) < absi(seed.x - axis)):
			seed = p
	if seed.x < 0:
		return false
	var cap: Dictionary = {seed: true}
	var queue: Array[Vector2i] = [seed]
	while not queue.is_empty():
		var p: Vector2i = queue.pop_back()
		for dx in [-1, 0, 1]:
			for dy in [-1, 0, 1]:
				var t: Vector2i = p + Vector2i(dx, dy)
				if cand.has(t) and not cap.has(t):
					cap[t] = true
					queue.append(t)


	var cx_min: int = 1<<30
	var cx_max: int = -(1<<30)
	var per_row: Dictionary = {}
	var cap_top: int = 1<<30
	for key in cap:
		var p: Vector2i = key
		cx_min = mini(cx_min, p.x)
		cx_max = maxi(cx_max, p.x)
		cap_top = mini(cap_top, p.y)
		per_row[p.y] = int(per_row.get(p.y, 0)) + 1
	if cx_max - cx_min + 1 > SKULL_MAX_W:
		return false
	for y in per_row:
		if int(per_row[y]) > SKULL_MAX_ROW:
			return false




	var cor_filas: Dictionary = {}
	var cor_min: int = 1<<30
	var cor_max: int = -(1<<30)
	for key in cap:
		var p: Vector2i = key
		if p.y >= cap_bot:
			continue
		cor_filas[p.y] = true
		cor_min = mini(cor_min, p.x)
		cor_max = maxi(cor_max, p.x)
	if face_bb.size.y > 0 and cor_max >= cor_min and not cor_filas.is_empty():
		var cor_ancho: int = cor_max - cor_min + 1
		if float(cor_filas.size()) / float(maxi(cor_ancho, 1)) > SKULL_MAX_ASPECT:
			return false







	var face_lo: Dictionary = {}
	var face_hi: Dictionary = {}
	for q in face_px:
		face_lo[q.y] = mini(int(face_lo.get(q.y, 1<<30)), q.x)
		face_hi[q.y] = maxi(int(face_hi.get(q.y, -(1<<30))), q.x)
	var feat: Dictionary = {}
	for p in hair_px:
		if p.y <= cap_bot or not face_lo.has(p.y):
			continue
		if int(face_lo[p.y]) < p.x and int(face_hi[p.y]) > p.x:
			feat[p] = true




	var rim: Dictionary = {}
	for key in cap:
		var p: Vector2i = key
		if feat.has(p) or _skull_near_skin(p, skin_set):
			continue
		if shrink == 1:
			if p.y == cap_top:
				rim[p] = true
			continue
		for off in SKULL_ERODE:
			var t: Vector2i = p + off
			if t.x < 0 or t.y < 0 or t.x >= w or t.y >= h or not opaco.has(t):
				rim[p] = true
				break
	for key in rim:
		var p: Vector2i = key
		img.set_pixel(p.x, p.y, Color(0, 0, 0, 0))


	for key in cap:
		var p: Vector2i = key
		if rim.has(p) or img.get_pixel(p.x, p.y).a < 0.5:
			continue
		var solo: bool = true
		for dx in [-1, 0, 1]:
			for dy in [-1, 0, 1]:
				if dx == 0 and dy == 0:
					continue
				var t: Vector2i = p + Vector2i(dx, dy)
				if t.x >= 0 and t.y >= 0 and t.x < w and t.y < h \
						and img.get_pixel(t.x, t.y).a >= 0.5:
					solo = false
		if solo:
			img.set_pixel(p.x, p.y, Color(0, 0, 0, 0))
			rim[p] = true


	var keep: Array[Vector2i] = []
	var sk_top: int = 1<<30
	for key in cap:
		var p: Vector2i = key
		if not rim.has(p):
			keep.append(p)
			sk_top = mini(sk_top, p.y)
	if keep.is_empty():
		return true
	var kx0: int = 1<<30
	var kx1: int = -(1<<30)
	var wide: Dictionary = {}
	for p in keep:
		if p.y <= sk_top + 1:
			kx0 = mini(kx0, p.x)
			kx1 = maxi(kx1, p.x)
		wide[p.y] = int(wide.get(p.y, 0)) + 1
	var lx: float = float(kx0 + kx1) * 0.5
	var ly: float = float(sk_top) + 0.5
	var wmax: int = 1
	for y in wide:
		wmax = maxi(wmax, int(wide[y]))
	var rad: float = maxf(SKULL_R_K * float(wmax), 2.0)





	var spec: Dictionary = {}
	var fila: Array[int] = []
	for p in keep:
		if p.y == sk_top + 1 and not _touches_alpha(img, p):
			fila.append(p.x)
	if not fila.is_empty():
		fila.sort()
		var best: int = fila[0]
		for x in fila:
			if absf(float(x) - lx) < absf(float(best) - lx):
				best = x
		spec[Vector2i(best, sk_top + 1)] = true
		if fila.size() >= 4 and fila.has(best + 1):
			spec[Vector2i(best + 1, sk_top + 1)] = true




	var pinta: Dictionary = {}
	for p in keep:
		pinta[p] = true
	for p in hair_px:




		if p.y < cap_bot \
				and (face_bb.size.y <= 0 or p.y >= cap_bot - SKULL_CROWN_MAX) \
				and not rim.has(p) and absi(p.x - axis) <= SKULL_WIN_X \
				and p.y <= sk_top + SKULL_WIN_Y:
			pinta[p] = true
	for key in pinta:
		var p: Vector2i = key
		var cur: Color = img.get_pixel(p.x, p.y)
		if cur.a < 0.5:
			continue
		var t: Color
		if feat.has(p):


			t = _skull_tone(skin_c, SKULL_CONT, cur.a)
		elif _touches_alpha(img, p):
			t = _skull_tone(skin_c, SKULL_CONT, cur.a)
		elif spec.has(p):
			t = _skull_tone(skin_c, SKULL_SPEC, cur.a)
		else:
			var kk: float = 1.0 - minf(_skull_dist(p, lx, ly) / rad, 1.0)
			if kk >= SKULL_K_LIGHT:
				t = _skull_tone(skin_c, SKULL_LIGHT, cur.a)
			elif kk >= SKULL_K_BASE:
				t = _skull_tone(skin_c, SKULL_BASE, cur.a)
			else:
				t = _skull_tone(skin_c, SKULL_SHADE, cur.a)
		if veil > 0.0 and not feat.has(p):
			t = t.lerp(cur, veil)
			out_kept[p] = veil
		img.set_pixel(p.x, p.y, t)
	return true





static func _is_face_feature(p: Vector2i, face_bb: Rect2i) -> bool:
	if face_bb.size.y <= 0:
		return false


	if p.x <= face_bb.position.x or p.x >= face_bb.end.x - 1:
		return false
	return float(p.y - face_bb.position.y) >= float(face_bb.size.y) * 0.18







static func _apply_hair_tips(img: Image, tips: Color,
		hair_px: Array[Vector2i], hair_orig: Array[Color], kept: Dictionary,
		ref_v: float, ref_s: float, face_bb: Rect2i) -> void:
	var hair_top: int = 1<<30
	var hair_bot: int = -(1<<30)
	for p in hair_px:



		if img.get_pixel(p.x, p.y).a < 0.5:
			continue
		hair_top = mini(hair_top, p.y)
		hair_bot = maxi(hair_bot, p.y)
	if hair_bot < hair_top:
		return
	var brow: float = float(face_bb.position.y) if face_bb.size.y > 0 \
			else float(hair_top) + float(hair_bot - hair_top) * 0.5


	var edge: float = float(hair_top) + maxf((brow - float(hair_top)) * 0.85, 1.0)
	for i in hair_px.size():
		var p: Vector2i = hair_px[i]
		var keep: float = float(kept.get(p, 0.0))
		if keep <= 0.02:
			continue


		var mask: float = clampf(edge - float(p.y) + 0.5, 0.0, 1.0)
		if mask <= 0.0:
			continue
		var target: Color = _toned_hair(tips, ref_v, ref_s, hair_orig[i])
		img.set_pixel(p.x, p.y,
			img.get_pixel(p.x, p.y).lerp(target, mask * keep))



























































const VELLO_K_MAX: int = 5
const VELLO_K_SEGURO: int = 3





















const VELLO_MASCARAS: Dictionary = {












	"beard": {4: "MM.", 3: "OMMM", 2: "OMM", 1: "OMF", 0: "M"},



	"full": {5: "OMM.", 4: "OMM.", 3: "OMM", 2: "OM.", 1: "MF", 0: "O"},


	"stubble": {5: "D.", 4: "DD.", 3: "DD", 2: "DD.", 1: "DD", 0: "D"},



	"goatee": {3: "...M", 2: "..M", 1: "..F", 0: ".M"},



	"mustache": {3: "OMM", 2: "MM."},


	"handlebar": {5: "MM.", 4: "MMM.", 3: "FMM"},



	"sideburns": {5: "OMMM.", 4: "OMM.", 3: "OM.", 2: "O."},


	"chinstrap": {5: "OF.", 4: "OF.", 3: "OF.", 2: "OF.", 1: "OF.", 0: "M"},





	"soul": {1: "OMF", 0: "O"},
}














const RASGO_DV: float = 0.1
const RASGO_D: int = 2
const RASGO_K: Array[int] = [2, 4]










static func _vello_rampa(hair_c: Color) -> Dictionary:
	var v: float = hair_c.v
	return {
		"M": Color.from_hsv(hair_c.h, hair_c.s, v),
		"O": Color.from_hsv(hair_c.h, minf(1.0, hair_c.s * 1.12),
			maxf(0.02, v * 0.58)),
		"F": Color.from_hsv(hair_c.h, hair_c.s * 0.8,
			minf(1.0, v * 1.45 + 0.05)),
		"D": Color.from_hsv(hair_c.h, minf(1.0, hair_c.s * 1.12),
			maxf(0.02, v * 0.58)),
	}




static func _vello_px(img: Image, x: int, y: int, ch: String, rampa: Dictionary,
		k: int, face_bb: Rect2i) -> void:
	var blend: float = 1.0
	if ch == "D":







		blend = 0.18
		if posmod((x - face_bb.position.x) + k, 2) == 0:
			blend = 0.62
	var base: Color = img.get_pixel(x, y)
	var col: Color = base.lerp(rampa[ch], blend)
	col.a = base.a
	img.set_pixel(x, y, col)








static func _tint_eyes(img: Image, eye_c: Color, src: Dictionary,
		face_bb: Rect2i, base: KitBase) -> void:














	for p in src:
		var q: Vector2i = p
		if q.x < face_bb.position.x or q.x > face_bb.end.x \
				or q.y < face_bb.position.y or q.y > face_bb.end.y:
			continue
		var c: Color = src[p]
		if not _es_kit_origen(c.h * 360.0, c, base):
			continue





		if c.s < 0.6 or c.v < 0.12 or c.v > 0.7:
			continue
		if not (_es_esclera(src.get(q + Vector2i.LEFT, Color.TRANSPARENT))
				or _es_esclera(src.get(q + Vector2i.RIGHT, Color.TRANSPARENT))):
			continue
		img.set_pixel(q.x, q.y, Color(eye_c.r, eye_c.g, eye_c.b, c.a))





static func _es_esclera(c: Color) -> bool:
	return c.a >= 0.5 and c.s < 0.2 and c.v > 0.85

















static func _tint_brows(img: Image, brow_c: Color, src: Dictionary,
		face_bb: Rect2i) -> void:

	var y_scl: int = 1<<30
	for p in src:
		var q: Vector2i = p
		if q.x < face_bb.position.x or q.x > face_bb.end.x \
				or q.y < face_bb.position.y or q.y > face_bb.end.y:
			continue
		if _es_esclera(src[p]):
			y_scl = mini(y_scl, q.y)
	if y_scl == 1<<30:
		return
	var x0: int = 1<<30
	var x1: int = -(1<<30)
	for p in src:
		var q: Vector2i = p
		if q.y != y_scl:
			continue
		var c0: Color = src[p]
		if _es_esclera(c0) or (c0.a >= 0.5 and c0.s > 0.6 and c0.v > 0.12 and c0.v < 0.7):
			x0 = mini(x0, q.x)
			x1 = maxi(x1, q.x)
	if x1 < x0:
		return
	for y in [y_scl - 1, y_scl - 2]:
		if y < face_bb.position.y:
			continue
		for x in range(maxi(x0 - 1, face_bb.position.x), mini(x1 + 2, face_bb.end.x + 1)):
			var c: Color = src.get(Vector2i(x, y), Color.TRANSPARENT)
			if c.a < 0.5 or c.v >= 0.15:
				continue
			var borde: bool = false
			for off in [Vector2i.LEFT, Vector2i.RIGHT, Vector2i.UP, Vector2i.DOWN]:
				if src.get(Vector2i(x, y) + off, Color.TRANSPARENT).a < 0.5:
					borde = true
					break
			if borde:
				continue
			img.set_pixel(x, y, Color(brow_c.r, brow_c.g, brow_c.b, c.a))










static func _vello_perfil(facial: String, k: int, desde_frente: float) -> String:
	match facial:
		"mustache":
			return "M" if k == 3 and desde_frente <= 0.55 else "."
		"goatee":
			if k == 3 and desde_frente <= 0.4:
				return "M"
			if k <= 1 and desde_frente <= 0.65:
				return "F" if k == 1 else "M"
			return "."
		"sideburns":
			return "M" if k >= 2 and k <= 5 and desde_frente >= 0.65 else "."
	return ""


static func _apply_facial_hair(img: Image, facial: String,
		face_px: Array[Vector2i], face_orig: Array[Color], face_bb: Rect2i,
		hair_c: Color, view: String = "front") -> void:


	var perfil: bool = view == "left" or view == "right"
	var perfil_local: bool = perfil and facial in ["mustache", "goatee", "sideburns"]



	var fuente: Dictionary = VELLO_MASCARAS if _vello_override.is_empty() \
			else _vello_override
	var tabla: Dictionary = fuente.get(facial, {})
	if face_px.is_empty() or tabla.is_empty() or face_bb.size.y <= 0:
		return


	var row_min: Dictionary = {}
	var row_max: Dictionary = {}
	var row_px: Dictionary = {}
	var row_luz: Dictionary = {}
	var orig_v: Dictionary = {}
	var chin: int = -(1<<30)
	for i in face_px.size():
		var q: Vector2i = face_px[i]
		var v: float = face_orig[i].v
		chin = maxi(chin, q.y)
		row_min[q.y] = mini(int(row_min.get(q.y, 1<<30)), q.x)
		row_max[q.y] = maxi(int(row_max.get(q.y, -(1<<30))), q.x)
		row_luz[q.y] = maxf(float(row_luz.get(q.y, 0.0)), v)
		orig_v[q] = v
		var lista: Array = row_px.get(q.y, [])
		lista.append(q.x)
		row_px[q.y] = lista















	var banda: Dictionary = {}
	var ant_lo: int = 0
	var ant_hi: int = 0
	for k in range(0, VELLO_K_MAX + 1):
		var y: int = chin - k
		if not row_min.has(y):
			break
		var lo: int = int(row_min[y])
		var hi: int = int(row_max[y])
		if k > VELLO_K_SEGURO:
			var span: int = hi - lo + 1
			var span_ant: int = ant_hi - ant_lo + 1
			var encadena: bool = span >= span_ant - 1 \
					or (absi(lo - ant_lo) <= 2 and absi(hi - ant_hi) <= 2)
			if not encadena:
				break
		banda[k] = Vector2i(lo, hi)
		ant_lo = lo
		ant_hi = hi

	var rampa: Dictionary = _vello_rampa(hair_c)
	for k in banda:
		if not tabla.has(k):
			continue
		var kk: int = int(k)
		var y2: int = chin - kk
		var ext: Vector2i = banda[k]
		var s: String = String(tabla[k])
		var ultimo: String = s[s.length() - 1]
		var xs: Array = row_px[y2]

		var guarda: bool = kk in RASGO_K
		var luz: float = float(row_luz.get(y2, 1.0))
		var pintados: int = 0
		var dmax: int = -1
		for x in xs:
			var d: int = mini(int(x) - ext.x, ext.y - int(x))




			if guarda and d >= RASGO_D \
					and luz - float(orig_v.get(Vector2i(int(x), y2), luz)) >= RASGO_DV:
				continue
			if perfil_local:


				var ancho: int = ext.y - ext.x
				var desde_frente: float = 0.0 if ancho <= 0 else \
						float(ext.y - int(x) if view == "right" else int(x) - ext.x) / float(ancho)
				var trazo: String = _vello_perfil(facial, kk, desde_frente)
				if trazo != ".":
					_vello_px(img, int(x), y2, trazo, rampa, kk, face_bb)
				continue
			dmax = maxi(dmax, d)
			var ch: String = ultimo
			if d < s.length():
				ch = s[d]
			if ch == ".":


				if not (perfil and d == 0):
					continue
				ch = "M"
				for j in s.length():
					if s[j] != ".":
						ch = s[j]
						break
			_vello_px(img, int(x), y2, ch, rampa, kk, face_bb)
			pintados += 1






		if pintados == 0 and ultimo != "." and dmax >= 0:
			for x in xs:
				if mini(int(x) - ext.x, ext.y - int(x)) != dmax:
					continue
				if guarda and dmax >= RASGO_D \
						and luz - float(orig_v.get(Vector2i(int(x), y2), luz)) >= RASGO_DV:
					continue
				_vello_px(img, int(x), y2, ultimo, rampa, kk, face_bb)















const MASK_COLOR: Color = Color("15151a")
const MASK_BOT_K: int = 3
static func _stamp_mask(img: Image, face_px: Array[Vector2i]) -> void:
	var chin: int = -(1<<30)
	var top_y: int = 1<<30
	for q in face_px:
		chin = maxi(chin, q.y)
		top_y = mini(top_y, q.y)
	var bot: int = chin - MASK_BOT_K



	var hole: Dictionary = {}
	var faces: Dictionary = {}
	for q in face_px:
		faces[q] = true
	for q in face_px:
		if _is_eye(img.get_pixel(q.x, q.y)):
			hole[q] = true
			for off in [Vector2i(1, 0), Vector2i(-1, 0), Vector2i(0, 1), Vector2i(0, -1)]:
				hole[q + off] = true
	var hi: Color = MASK_COLOR.lightened(0.16)
	for q in face_px:
		if q.y > bot or hole.has(q):
			continue
		var col: Color = hi if q.y <= top_y + 1 else MASK_COLOR
		var a: float = img.get_pixel(q.x, q.y).a
		img.set_pixel(q.x, q.y, Color(col.r, col.g, col.b, a))





static func _is_eye(c: Color) -> bool:
	if c.s < 0.22 and c.v > 0.6:
		return true
	var d: float = c.h * 360.0
	return d >= 185.0 and d <= 255.0 and c.s > 0.35


const _hair_style_acc: Array[String] = [
	"coleta", "coleta_alta", "bun_corto", "liga_coleta", "banda_pelo",
]
const HAIR_TIE_COL: Color = Color("141418")
const HAIR_TIE_LIGHT: Color = Color("f0f0f0")
static func _stamp_hair_style_acc(img: Image, style: String,
		hair_px: Array[Vector2i], hair_c: Color, face_bb: Rect2i,
		view: String) -> void:
	var xmin: int = 1<<30
	var xmax: int = -(1<<30)
	var ymin: int = 1<<30
	var ymax: int = -(1<<30)
	for p in hair_px:
		xmin = mini(xmin, p.x)
		xmax = maxi(xmax, p.x)
		ymin = mini(ymin, p.y)
		ymax = maxi(ymax, p.y)
	if xmax < xmin:
		return
	var cx: int = roundi(float(xmin + xmax) * 0.5)
	var w: int = img.get_width()
	var h: int = img.get_height()
	if style == "banda_pelo":
		var y_band: int = face_bb.position.y - 1 if face_bb.size.y > 0 \
				else ymin + int(float(ymax - ymin) * 0.45)
		for x in range(maxi(xmin, 0), mini(xmax + 1, w)):
			for y in range(maxi(y_band, 0), mini(y_band + 2, h)):
				var a: float = img.get_pixel(x, y).a
				if a > 0.0:
					img.set_pixel(x, y, Color(HAIR_TIE_COL.r, HAIR_TIE_COL.g,
						HAIR_TIE_COL.b, a))
		return
	var tie: Color = HAIR_TIE_LIGHT if style == "liga_coleta" else HAIR_TIE_COL
	var base_y: int = ymin + int(float(ymax - ymin) \
			*(0.22 if style == "coleta_alta" else 0.72))
	if view == "back":
		_stamp_disc(img, Vector2i(cx, base_y + 2),
			3 if style == "bun_corto" else 2, hair_c)
		_stamp_disc(img, Vector2i(cx, base_y), 1, tie)
	elif view == "right":
		_stamp_disc(img, Vector2i(maxi(xmin - 2, 0), base_y + 1), 2, hair_c)
		_stamp_disc(img, Vector2i(maxi(xmin - 1, 0), base_y), 1, tie)
	elif view == "left":
		_stamp_disc(img, Vector2i(mini(xmax + 2, w - 1), base_y + 1), 2, hair_c)
		_stamp_disc(img, Vector2i(mini(xmax + 1, w - 1), base_y), 1, tie)
	else:
		_stamp_disc(img, Vector2i(cx, mini(ymax + 1, h - 1)), 1, tie)


static func _stamp_disc(img: Image, center: Vector2i, radius: int,
		color: Color) -> void:
	var w: int = img.get_width()
	var h: int = img.get_height()
	for y in range(center.y - radius, center.y + radius + 1):
		if y < 0 or y >= h:
			continue
		for x in range(center.x - radius, center.x + radius + 1):
			if x < 0 or x >= w:
				continue
			var dx: int = x - center.x
			var dy: int = y - center.y
			if dx * dx + dy * dy > radius * radius:
				continue
			img.set_pixel(x, y, Color(color.r, color.g, color.b, 1.0))








const BAND_H: int = 3
static func _stamp_headband(img: Image, color: Color,
		hair_px: Array[Vector2i], face_px: Array[Vector2i],
		face_bb: Rect2i) -> void:
	if hair_px.is_empty():
		return
	var hair_top: int = 1<<30
	var hair_bot: int = -(1<<30)
	for p in hair_px:
		hair_top = mini(hair_top, p.y)
		hair_bot = maxi(hair_bot, p.y)
	var anchor: int
	if face_bb.size.y > 0:
		anchor = face_bb.position.y
	else:
		anchor = hair_top + int(float(hair_bot - hair_top) * 0.4)
	var lo: int = anchor - 1
	var hi: int = lo + BAND_H - 1
	var edge: Color = color.darkened(0.35)
	for p in hair_px:
		if p.y >= lo and p.y <= hi:
			var a: float = img.get_pixel(p.x, p.y).a
			var c: Color = edge if p.y == hi else color
			img.set_pixel(p.x, p.y, Color(c.r, c.g, c.b, a))

	if face_bb.size.y > 0:
		for q in face_px:
			if q.y >= lo and q.y <= hi and q.y <= face_bb.position.y + 1:
				var a2: float = img.get_pixel(q.x, q.y).a
				var c2: Color = edge if q.y == hi else color
				img.set_pixel(q.x, q.y, Color(c2.r, c2.g, c2.b, a2))











static func _blit_acc(img: Image, path: String, off: Vector2i,
		tint: Color = Color(0, 0, 0, 0)) -> void:
	if not ResourceLoader.exists(path):
		return
	var acc: Image = lee_imagen(load(path) as Texture2D, "acc")
	var w: int = img.get_width()
	var h: int = img.get_height()
	var tinta: bool = tint.a > 0.0
	for y in acc.get_height():
		for x in acc.get_width():
			var c: Color = acc.get_pixel(x, y)
			if c.a < 0.5:
				continue
			var q: Vector2i = Vector2i(x, y) + off
			if q.x < 0 or q.x >= w or q.y < 0 or q.y >= h:
				continue
			img.set_pixel(q.x, q.y, _toned(tint, REF_HEAD_ACC, c) if tinta else c)


static func _touches_alpha(img: Image, p: Vector2i) -> bool:
	for off in [Vector2i(1, 0), Vector2i(-1, 0), Vector2i(0, 1), Vector2i(0, -1)]:
		var q: Vector2i = p + off
		if q.x < 0 or q.y < 0 or q.x >= img.get_width() or q.y >= img.get_height():
			return true
		if img.get_pixel(q.x, q.y).a < 0.5:
			return true
	return false







static func _pattern_color(cfg: Dictionary, x: int, y: int, bb: Rect2i,
		brazo: int = -1) -> Color:
	return KitPatternGeo.pixel(String(cfg.get("pattern", "solid")), x, y, bb,
		cfg["kit"], cfg["kit_b"], int(cfg.get("pat_w", 3)), brazo)



static func _dibujo_de_brazos(pattern: String) -> bool:
	if pattern.begins_with("gradh_"):
		pattern = pattern.substr(6)
	elif pattern.begins_with("grad_"):
		pattern = pattern.substr(5)
	return pattern == "sleeves"





const MANGA_LARGO: float = 9.0


const MANGA_FUERA_MAX: int = 14

const MANGA_TRONCO_FILAS: int = 8


























static func _mangas_de(data2: PackedByteArray, w2: int, h2: int, caja2: Rect2i, bb: Rect2i,
		base: KitBase, head_mask: PackedByteArray, face_bb: Rect2i,
		pattern_top: int) -> PackedByteArray:
	var n: int = w2 * h2

	var tipo: PackedByteArray = PackedByteArray()
	tipo.resize(n)
	var cadera: int = bb.position.y + int(bb.size.y * SLEEVE_HIP)


	var tiene_cara: bool = face_bb.size.y > 0
	var cara_x0: int = face_bb.position.x - 2
	var cara_x1: int = face_bb.end.x + 2
	var y_fin: int = mini(caja2.end.y, h2)
	var x_fin: int = mini(caja2.end.x, w2)
	var bajo: int = -1
	for y in range(caja2.position.y, y_fin):
		for x in range(caja2.position.x, x_fin):
			var i: int = y * w2 + x
			var o: int = i * 4
			if data2[o + 3] < 128:
				continue
			var c: Color = Color8(data2[o], data2[o + 1], data2[o + 2], data2[o + 3])
			var deg: float = c.h * 360.0
			if _es_kit_origen(deg, c, base):
				if head_mask[i] == 0:
					tipo[i] = 1
					if y < pattern_top:
						bajo = y
				continue
			var en_franja: bool = tiene_cara and x >= cara_x0 and x <= cara_x1
			if en_franja and y <= face_bb.end.y + 2:
				continue
			var piel: bool = _is_skin(deg, c)
			if head_mask[i] == 1 and (en_franja or not tiene_cara or not piel):
				continue
			if piel:
				tipo[i] = 2
			elif y < cadera and c.s < 0.35 and c.v > 0.45 \
					and not (en_franja and y <= face_bb.end.y + SLEEVE_COLLAR_PAD):
				tipo[i] = 3
	var mangas: PackedByteArray = PackedByteArray()
	if bajo < 0:
		return mangas





	var tx0: int = w2
	var tx1: int = -1
	for y in range(maxi(bajo - MANGA_TRONCO_FILAS + 1, 0), bajo + 1):
		var mejor0: int = -1
		var mejor1: int = -2
		var x: int = caja2.position.x
		while x < x_fin:
			if tipo[y * w2 + x] != 1:
				x += 1
				continue
			var x_ini: int = x
			while x < x_fin and tipo[y * w2 + x] == 1:
				x += 1
			if x - x_ini > mejor1 - mejor0 + 1:
				mejor0 = x_ini
				mejor1 = x - 1
		if mejor0 >= 0:
			tx0 = mini(tx0, mejor0)
			tx1 = maxi(tx1, mejor1)
	var visto: PackedByteArray = PackedByteArray()
	visto.resize(n)
	for y0 in range(caja2.position.y, y_fin):
		for x0 in range(caja2.position.x, x_fin):
			var raiz: int = y0 * w2 + x0
			if tipo[raiz] != 3 or visto[raiz] == 1:
				continue


			var puno: Array[Vector2i] = [Vector2i(x0, y0)]
			visto[raiz] = 1
			var toca_tela: bool = false
			var toca_piel: bool = false
			var k: int = 0
			while k < puno.size():
				var p: Vector2i = puno[k]
				k += 1
				for d: Vector2i in _OCHO:
					var q: Vector2i = p + d
					if q.x < 0 or q.y < 0 or q.x >= w2 or q.y >= h2:
						continue
					var iq: int = q.y * w2 + q.x
					if tipo[iq] == 1:
						toca_tela = true
					elif tipo[iq] == 2:
						toca_piel = true
					elif tipo[iq] == 3 and visto[iq] == 0:
						visto[iq] = 1
						puno.append(q)
			if not toca_tela or not toca_piel or puno.size() > SLEEVE_PUNO_MAX:
				continue
			var cx: float = 0.0
			for p in puno:
				cx += p.x
			cx /= float(puno.size())




			if tiene_cara and cx >= cara_x0 and cx <= cara_x1 \
					and _piel_llega_a_cara(puno, tipo, face_bb, w2, h2):
				continue
			if mangas.is_empty():
				mangas.resize(n)
			if cx < tx0 or cx > tx1:
				_manga_fuera(puno, tipo, w2, h2, cx < tx0, tx0 if cx < tx0 else tx1, mangas)
			else:
				_tubo_de_manga(puno, tipo, w2, h2, mangas)
	return mangas






const MANGA_CUELLO_PAD: int = 4
const MANGA_PIEL_TOPE: int = 160
static func _piel_llega_a_cara(puno: Array[Vector2i], tipo: PackedByteArray,
		face_bb: Rect2i, w2: int, h2: int) -> bool:
	var cerca: Rect2i = face_bb.grow(MANGA_CUELLO_PAD)
	var cola: Array[Vector2i] = []
	var vista: Dictionary = {}
	for p in puno:
		for d: Vector2i in _OCHO:
			var q: Vector2i = p + d
			if q.x >= 0 and q.y >= 0 and q.x < w2 and q.y < h2 \
					and tipo[q.y * w2 + q.x] == 2 and not vista.has(q):
				vista[q] = true
				cola.append(q)
	var k: int = 0
	while k < cola.size() and k < MANGA_PIEL_TOPE:
		var p: Vector2i = cola[k]
		k += 1
		if cerca.has_point(p):
			return true
		for d: Vector2i in _OCHO:
			var q: Vector2i = p + d
			if q.x < 0 or q.y < 0 or q.x >= w2 or q.y >= h2:
				continue
			if tipo[q.y * w2 + q.x] == 2 and not vista.has(q):
				vista[q] = true
				cola.append(q)
	return false


const _OCHO: Array[Vector2i] = [Vector2i(-1, -1), Vector2i(0, -1), Vector2i(1, -1),
	Vector2i(-1, 0), Vector2i(1, 0), Vector2i(-1, 1), Vector2i(0, 1), Vector2i(1, 1)]
const _CUATRO: Array[Vector2i] = [Vector2i(-1, 0), Vector2i(1, 0), Vector2i(0, -1),
	Vector2i(0, 1)]





static func _manga_fuera(puno: Array[Vector2i], tipo: PackedByteArray, w2: int, h2: int,
		izq: bool, borde: int, mangas: PackedByteArray) -> void:
	var cola: Array[Vector2i] = []
	var dist: Dictionary = {}
	for p in puno:
		for d: Vector2i in _OCHO:
			var q: Vector2i = p + d
			if q.x < 0 or q.y < 0 or q.x >= w2 or q.y >= h2:
				continue
			if (q.x >= borde) if izq else (q.x <= borde):
				continue
			var iq: int = q.y * w2 + q.x
			if tipo[iq] == 1 and not dist.has(iq):
				dist[iq] = 0
				cola.append(q)
	var k: int = 0
	while k < cola.size():
		var p: Vector2i = cola[k]
		k += 1
		var ip: int = p.y * w2 + p.x
		mangas[ip] = 1
		if int(dist[ip]) >= MANGA_FUERA_MAX:
			continue
		for d: Vector2i in _CUATRO:
			var q: Vector2i = p + d
			if q.x < 0 or q.y < 0 or q.x >= w2 or q.y >= h2:
				continue
			if (q.x >= borde) if izq else (q.x <= borde):
				continue
			var iq: int = q.y * w2 + q.x
			if tipo[iq] != 1 or dist.has(iq):
				continue
			dist[iq] = int(dist[ip]) + 1
			cola.append(q)







static func _tubo_de_manga(puno: Array[Vector2i], tipo: PackedByteArray, w2: int, h2: int,
		mangas: PackedByteArray) -> void:
	var c0 := Vector2.ZERO
	for p in puno:
		c0 += Vector2(p)
	c0 /= float(puno.size())
	var tela := Vector2.ZERO
	var n_tela: int = 0
	var piel := Vector2.ZERO
	var n_piel: int = 0
	var semilla: Array[Vector2i] = []
	var vistos: Dictionary = {}
	for p in puno:
		for d: Vector2i in _OCHO:
			var q: Vector2i = p + d
			if q.x < 0 or q.y < 0 or q.x >= w2 or q.y >= h2 or vistos.has(q):
				continue
			vistos[q] = true
			var t: int = tipo[q.y * w2 + q.x]
			if t == 1:
				tela += Vector2(q)
				n_tela += 1
				semilla.append(q)
			elif t == 2:
				piel += Vector2(q)
				n_piel += 1
	if n_tela == 0:
		return

	var desde: Vector2 = piel / float(n_piel) if n_piel > 0 else c0
	var u: Vector2 = tela / float(n_tela) - desde
	if u.length() < 0.01:
		return
	u = u.normalized()
	var v := Vector2(- u.y, u.x)

	var media: float = 0.0
	var t0: float = - INF
	for p in puno:
		var dp: Vector2 = Vector2(p) - c0
		media = maxf(media, absf(dp.dot(v)))
		t0 = maxf(t0, dp.dot(u))
	media += 1.0
	for q in semilla:
		mangas[q.y * w2 + q.x] = 1
	while not semilla.is_empty():
		var p: Vector2i = semilla.pop_back()
		for d: Vector2i in _CUATRO:
			var q: Vector2i = p + d
			if q.x < 0 or q.y < 0 or q.x >= w2 or q.y >= h2:
				continue
			var iq: int = q.y * w2 + q.x
			if tipo[iq] != 1 or mangas[iq] == 1:
				continue
			var dq: Vector2 = Vector2(q) - c0
			var t: float = dq.dot(u)
			if t < t0 - 0.5 or t > t0 + MANGA_LARGO or absf(dq.dot(v)) > media:
				continue
			mangas[iq] = 1
			semilla.append(q)











static func _caja_playera_suelta(data2: PackedByteArray, w2: int, h2: int, caja2: Rect2i,
		base: KitBase, head_mask: PackedByteArray, pattern_top: int, bb: Rect2i) -> Rect2i:
	var y_fin: int = mini(mini(caja2.end.y, h2), pattern_top)
	var x_fin: int = mini(caja2.end.x, w2)
	var tela: PackedByteArray = PackedByteArray()
	tela.resize(w2 * h2)
	for y in range(caja2.position.y, y_fin):
		for x in range(caja2.position.x, x_fin):
			var i: int = y * w2 + x
			var o: int = i * 4
			if data2[o + 3] < 128 or head_mask[i] == 1:
				continue
			var c: Color = Color8(data2[o], data2[o + 1], data2[o + 2], data2[o + 3])
			if _es_kit_origen(c.h * 360.0, c, base):
				tela[i] = 1
	var lo := Vector2i(1<<30, 1<<30)
	var hi := Vector2i(-1, -1)
	var mayor: int = 0
	for y0 in range(caja2.position.y, y_fin):
		for x0 in range(caja2.position.x, x_fin):
			if tela[y0 * w2 + x0] != 1:
				continue

			tela[y0 * w2 + x0] = 2
			var mancha: Array[Vector2i] = [Vector2i(x0, y0)]
			var m_lo := Vector2i(x0, y0)
			var m_hi := Vector2i(x0, y0)
			var k: int = 0
			while k < mancha.size():
				var p: Vector2i = mancha[k]
				k += 1
				m_lo = m_lo.min(p)
				m_hi = m_hi.max(p)
				for d: Vector2i in _OCHO:
					var q: Vector2i = p + d
					if q.x < 0 or q.y < 0 or q.x >= w2 or q.y >= h2:
						continue
					if tela[q.y * w2 + q.x] == 1:
						tela[q.y * w2 + q.x] = 2
						mancha.append(q)
			if mancha.size() > mayor:
				mayor = mancha.size()
				lo = m_lo
				hi = m_hi
	if mayor == 0:
		return bb
	var tam: Vector2i = hi - lo + Vector2i.ONE
	return Rect2i(lo, Vector2i(tam.x, ceili(tam.y / 0.62)))





static func _short_color(cfg: Dictionary, x: int, y: int, sb: Rect2i) -> Color:
	var a: Color = cfg["kit2"]
	var b: Color = cfg["kit2_b"]
	var rel: float = float(x - sb.position.x) / maxf(float(sb.size.x), 1.0)
	var rel_y: float = float(y - sb.position.y) / maxf(float(sb.size.y), 1.0)
	match String(cfg.get("short_pat", "solid")):
		"side_stripe":


			return b if rel < 0.1 or rel > 0.9 else a
		"side_panel":


			return b if rel < 0.24 or rel > 0.76 else a
		"hem":

			return b if rel_y > 0.82 else a
		"waistband":

			return b if rel_y < 0.2 else a
		"trim":

			return b if rel_y < 0.2 or rel_y > 0.82 else a
		"stripes":



			return a if (x - sb.position.x) / 2 % 2 == 0 else b
		"hoops":
			return a if (y - sb.position.y) / 3 % 2 == 0 else b
		"split":


			return a if rel < 0.5 else b
	return a












const SHORT_CLUB: Array[String] = ["solid", "filo", "doble_filo", "ribete", "filo_ribete",
	"panel", "abertura"]
const SOCK_CLUB: Array[String] = ["solid", "vuelta_fina", "vuelta_dos", "dos_rayas",
	"raya_alta", "banda", "aros_anchos"]

const SHORT_BORDES: Array[String] = ["filo", "doble_filo", "ribete", "filo_ribete",
	"panel", "abertura"]




static func _short_bordes(short_px: Array, w2: int, y_top: int, y_bot: int) -> Dictionary:
	var fmin: Dictionary = {}
	var fmax: Dictionary = {}
	var cbot: Dictionary = {}
	for i in short_px:
		var x: int = i % w2
		var y: int = i / w2
		if y < y_top or y > y_bot:
			continue
		fmin[y] = mini(int(fmin.get(y, x)), x)
		fmax[y] = maxi(int(fmax.get(y, x)), x)
		cbot[x] = maxi(int(cbot.get(x, y)), y)
	return {"fmin": fmin, "fmax": fmax, "cbot": cbot, "top": y_top, "bot": y_bot}


static func _short_borde_color(cfg: Dictionary, x: int, y: int, b: Dictionary) -> Color:
	var a: Color = cfg["kit2"]
	var c: Color = cfg["kit2_b"]

	var fuera: int = mini(x - int(b["fmin"][y]), int(b["fmax"][y]) - x)


	var bot: int = int(b["bot"])
	var cb: int = int(b["cbot"].get(x, -1))
	var boca: bool = y == cb and cb >= bot - 1

	var bajo_playera: bool = y > int(b["top"])
	match String(cfg.get("short_pat", "solid")):
		"filo":
			return c if fuera == 0 and bajo_playera else a
		"doble_filo":
			return c if (fuera == 0 or fuera == 2) and bajo_playera else a
		"ribete":
			return c if boca else a
		"filo_ribete":
			return c if boca or (fuera == 0 and bajo_playera) else a
		"panel":
			return c if fuera <= 1 and bajo_playera else a
		"abertura":


			return c if fuera <= 1 and y >= bot - 1 else a
	return a






static func _toned_neutral(target: Color, ref: Color, c: Color) -> Color:
	var v: float = clampf(target.v *(c.v / maxf(ref.v, 0.05)), 0.03, 1.0)
	return Color.from_hsv(target.h, target.s, v, c.a)























static func _toned_skin(target: Color, ref: Color, c: Color) -> Color:
	var v: float = clampf(target.v *(c.v / maxf(ref.v, 0.05)), 0.03, 1.0)
	var s: float = clampf(target.s * clampf(c.s / maxf(ref.s, 0.05), 0.88, 1.08),
		0.0, 1.0)
	return Color.from_hsv(target.h, s, v, c.a)




static func _toned(target: Color, ref: Color, c: Color) -> Color:
	var v: float = clampf(target.v *(c.v / maxf(ref.v, 0.05)), 0.03, 1.0)
	var s: float = clampf(target.s *(c.s / maxf(ref.s, 0.05)), 0.0, 1.0)
	return Color.from_hsv(target.h, s, v, c.a)
