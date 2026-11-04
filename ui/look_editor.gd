class_name LookEditor
extends VBoxContainer



















signal changed(cfg: Dictionary)
signal part_changed(part: String)




const PLAYER_TEX: Texture2D = preload("res://assets/sprites/players/player_south.png")
const ModularCatalog = preload("res://assets/sprites/modular/catalog.gd")
const Appearance = preload("res://features/match/appearance_catalog.gd")
const LookMigracion = preload("res://features/match/look_migracion.gd")
const PiezasPropias = preload("res://features/match/piezas_propias.gd")


































const VENTANA_CABEZA: Rect2i = Rect2i(33, 12, 27, 24)





const VENTANA_CUELLO: Rect2i = Rect2i(33, 16, 27, 24)
const ZOOM_CABEZA: int = 4

const ZOOM_VESTIDOR: int = 5





















const PRESUPUESTO_US: int = 2500



const MEMO_MAX: int = 400





const POR_HOJA: int = 30



var _paginas: Dictionary = {}




var _pendientes: Array = []
var _pendiente_de: Dictionary = {}



var _memo: Dictionary = {}
var _memo_orden: Array = []












var _firmas: Dictionary = {}
var _firmas_de: int = 0






var _dormidas: Dictionary = {}



const STYLE_NAMES: Dictionary = {
	"normal": "Normal", "bald": "Calvo", "buzz": "Rapado", "mohawk": "Cresta",
	"undercut": "Lados", "taper": "Degradado", "entradas": "Entradas",
	"crest_wide": "Cresta ancha", "part": "Raya", "lines": "Franjas",
	"raya_medio": "Raya al medio",
	"coronilla": "Coronilla", "herradura": "Herradura",
	"cepillo": "Cepillo", "lado_rapado": "Un costado", "mullet": "Mullet",
	"fade_alto": "Fade alto", "fade_bajo": "Fade bajo", "crop": "Crop",
	"caesar": "Cesar", "crew_cut": "Crew", "flequillo": "Flequillo",
	"slick_back": "Peinado atrás", "quiff_corto": "Quiff corto",
	"coleta": "Coleta", "coleta_alta": "Coleta alta",
	"bun_corto": "Bun", "liga_coleta": "Liga", "banda_pelo": "Banda pelo",
}
const TAT_NAMES: Dictionary = {
	"none": "Nada", "left": "Brazo izq", "right": "Brazo der", "both": "Ambos",
}
const TAT_PAT_NAMES: Dictionary = {
	"damero": "Damero", "lineas": "Aros", "banda": "Brazalete",
	"tribal": "Tribal", "solido": "Sólido", "espina": "Espina",
	"puntos": "Puntos", "estrellas": "Estrellas",
	"doble_banda": "Doble brazalete", "zigzag": "Zigzag", "rombos": "Rombos",
	"espiga": "Espiga", "malla": "Malla", "media_manga": "Media manga",



	"manga_entera": "Manga entera", "antebrazo": "Antebrazo", "biceps": "Bíceps",
	"muneca": "Muñeca", "manga_degradada": "Manga difuminada", "escamas": "Escamas",
	"cadena": "Eslabones", "ondas": "Ondas", "cuadros": "Cuadros",
	"aros_finos": "Aros finos", "salpicado": "Salpicado", "triple_banda": "Tres aros",
}
const TAT_LEG_NAMES: Dictionary = {
	"none": "Nada", "left": "Pierna izq", "right": "Pierna der", "both": "Ambas",
}




const FACE_TAT_OPTS: Array[String] = ["none", "dot", "double_dot", "line", "cross", "diamond",
	"tear", "star", "bar", "triangle", "chevron", "arrow", "square", "ring", "hook", "zig"]
const NECK_TAT_OPTS: Array[String] = ["none", "punto", "raya", "barras", "cruz", "flecha",
	"zigzag", "estrellas", "banda", "doble_banda", "puntos", "rombo", "gancho"]
const CASUAL_PRINT_NAMES: Dictionary = {
	"solid": "Liso", "stripes": "Rayas", "hoops": "Aros",
	"pinstripes": "Raya fina", "half": "Mitad",
}
const STREET_ACC_NAMES: Dictionary = {
	"none": "Nada", "gafas": "De sol", "lentes": "Lentes",
	"redondos": "Redondos", "aviador": "Aviador",
	"rectangulares": "Rectangulares", "deportivos": "Deportivos",
}
const SLEEVE_NAMES: Dictionary = {"corta": "Corta", "larga": "Larga"}
const PANTS_LEN_NAMES: Dictionary = {"largo": "Largo", "corto": "Corto"}
const CASUAL_TOP_NAMES: Dictionary = {
	"playera": "Playera", "chamarra": "Chamarra", "hoodie": "Hoodie",
	"polo": "Polo", "camisa": "Camisa", "sueter": "Suéter",
	"chaleco": "Chaleco", "abrigo": "Abrigo",
	"oversize": "Oversize", "sin_mangas": "Sin mangas", "cuello_alto": "Cuello alto",
	"camisa_abierta": "Camisa abierta",
	"entrenamiento": "Entrenamiento", "grafica": "Playera gráfica", "jersey_retro": "Jersey retro",
	"polo_tejido": "Polo tejido", "lino": "Camisa de lino", "cuarto_cierre": "Cierre corto",
	"rugby": "Polo rugby",
}
const STREET_HEAD_NAMES: Dictionary = {
	"none": "Nada", "gorra": "Gorra", "sombrero": "Sombrero",
	"gorra_atras": "Hacia atrás", "tejido": "Gorro tejido", "bucket": "Bucket",
}
const FACIAL_NAMES: Dictionary = {
	"none": "Nada", "beard": "Barba", "goatee": "Candado",
	"mustache": "Bigote", "stubble": "Sombra",
	"sideburns": "Patillas", "soul": "Mosca", "chinstrap": "Contorno",
	"full": "Barbón", "handlebar": "Manillar",
}



















const HEAD_ACC: Array = [
	{"id": "none", "name": "Ninguno"},
	{"id": "mask", "name": "Máscara"},
	{"id": "band", "name": "Banda", "color": Color("f0f0f0")},
	{"id": "band_r", "name": "Banda roja", "color": Color("d1341f")},
	{"id": "band_b", "name": "Banda azul", "color": Color("2f6fd0")},
	{"id": "band_k", "name": "Banda negra", "color": Color("141418")},
	{"id": "band_g", "name": "Banda oro", "color": Color("e8c86a")},
	{"id": "band_v", "name": "Banda verde", "color": Color("2fbf71")},
	{"id": "band_p", "name": "Banda rosa", "color": Color("d94f97")},
	{"id": "band_o", "name": "Banda naranja", "color": Color("ff7a1a")},
]

var _cfg: Dictionary = {}

var _groups: Dictionary = {}




var _originals: Dictionary = {}



















var view: String = ""






var unlocked: Array = []








var pagar: Callable = Callable()











var modo_tienda: bool = false









var vestidor: bool = false



var categoria: String = ""
var sub: String = ""




var tira: bool = false


const TIRA_ROTULO_W: float = 170.0





const TIRA_ALTO: float = 116.0
const TIRA_MUESTRA: float = 80.0
const TIRA_TEXTO: float = 72.0
const ZOOM_TIRA: int = 3



const TIRA_CARA_W: float = 148.0
const TIRA_PRENDA_W: float = 184.0







var memoria: Dictionary = {}


var con_rail: bool = true



var _fichas_compactas: Array[Dictionary] = []
var _vistas_compactas: Array[String] = []


signal hoja_cambiada(plano: String)
var solo_mio: bool = false











var sin_taller: bool = false






var solo_pieza: bool = false



var owned: Array = []



var dinero: int = 0







func _vendible(key: String, options: Array[String]) -> bool:
	if key == "_preset":
		return true
	for opt in options:
		if Shop.casual_price(key, opt) > 0:
			return true
	return false




func _ajena(key: String, opt: String) -> bool:



	if sin_taller and opt.begins_with("p_") and Shop.casual_price(key, opt) > 0:
		return true
	return solo_mio and not modo_tienda and _precio(key, opt) > 0


func _precio(key: String, opt: String) -> int:
	if not (modo_tienda or solo_mio):
		return 0
	if key == "_preset":
		var preset: Dictionary = KitRecolor.WARDROBE.PRESETS.get(opt, {})
		return Shop.casual_preset_price(preset, owned)
	if owned.has(Shop.wardrobe_id(key, opt)):
		return 0
	return Shop.casual_price(key, opt)









func _shows(kind: String) -> bool:
	return view.is_empty() or view.split(",").has(kind)


func _ready() -> void:

	set_process(false)
	if UiKit.es_horizontal() and not view.is_empty():
		tira = true
		if view.contains(","):
			_vistas_compactas.assign(view.split(","))
			view = _vistas_compactas[0]


	add_theme_constant_override("separation", 6 if tira else 12)
	_upgrade_legacy_appearance()
	_monta()







func _remonta() -> void:
	for hijo in get_children():
		remove_child(hijo)
		hijo.queue_free()
	_groups.clear()
	_originals.clear()
	_pendientes.clear()
	_pendiente_de.clear()
	_dormidas.clear()
	_part_nodes.clear()
	_part_buttons.clear()
	_part_thumbs.clear()
	_fichas_compactas.clear()
	set_process(false)
	_monta()


func _monta() -> void:
	if tira and _vistas_compactas.size() > 1:
		pestanas_vista(self, _vistas_compactas, view, func(i: int) -> void:
			view = _vistas_compactas[i]
			categoria = ""
			sub = ""
			_remonta.call_deferred())





















	if tira and con_rail and not categorias(view).is_empty():
		_monta_rail()
	if not categoria.is_empty() and not categorias(view).is_empty():
		for fila in filas_de_hoja():
			_fila(fila)
		_mark()
		return
	if _shows("uniforme"):
		if not vestidor:
			_section("UNIFORME")
		for fila in FILAS_UNIFORME:
			_fila(fila)





	if _shows("casual"):
		_build_casual_parts()
	if _shows("gala"):
		for fila in FILAS_GALA:
			_fila(fila)








	if _shows("fisico"):
		if not vestidor:
			_section("FISICO")
		for fila in FILAS_FISICO:
			_fila(fila)
	_mark()









const FILAS_FISICO: Array[String] = ["piel", "color_pelo", "sin_pelo", "pelo_corto",
	"pelo_mediano", "pelo_largo", "pelo_accesorio", "mascara", "ojos", "color_cejas",
	"tipo_ceja", "vello", "puntas", "tat_facial", "tat_lado", "tat_tinta_facial",
	"tat_cuello", "tat_tinta_cuello", "tat_brazo", "tat_dibujo", "tat_tinta",
	"tat_pierna", "tat_dibujo_pierna", "tat_tinta_pierna"]
const FILAS_UNIFORME: Array[String] = ["botines", "manga_kit", "guantes_campo",
	"munequeras", "color_munequera", "manga_compresion", "color_manga_compresion",
	"vendaje_brazo", "medias", "color_cinta_media", "mallas",
	"rodillera", "material_rodillera"]

const BRAZO_NAMES: Dictionary = {
	"none": "Nada", "left": "Brazo izq", "right": "Brazo der", "both": "Ambos",
}
const MEDIAS_NAMES: Dictionary = {"none": "Normales", "cinta": "Con cinta", "bajadas": "Bajadas"}

const MALLAS_NAMES: Dictionary = {"none": "Nada", "on": "Térmicas"}
const RODILLERA_NAMES: Dictionary = {"neopreno": "Neopreno", "vendaje": "Vendaje"}
const FILAS_GALA: Array[String] = ["gala_economicos", "gala_clasicos", "gala_lujo",
	"gala_contemporaneos", "corbata_gala", "panuelo_gala", "cinturon_gala",
	"color_accesorio_gala", "reloj_gala", "cadena_gala", "metal_gala", "mis_outfits_gala"]

const PARTES_CALLE: Dictionary = {
	"outfits": ["conjuntos", "mis_outfits_calle"],
	"playeras": ["playera", "color_playera", "estampado", "color2_playera", "manga_calle"],
	"pantalones": ["pantalon", "largo_pantalon", "color_pantalon"],
	"chamarras": ["exterior", "cierre", "color_chamarra"],
	"gorras": ["gorra", "color_gorra"],
	"accesorios": ["gafas", "aretes", "cadena", "bolsa", "reloj", "corbata_calle", "panuelo_calle",
		"cinturon_calle", "color_accesorio_calle", "pulsera", "metal_calle"],
	"calzado": ["calzado", "color_calzado"],
}


const FUSIONADAS: Dictionary = {"sin_pelo": "pelo_corto"}





const CATEGORIAS: Dictionary = {
	"fisico": [
		{"id": "corte", "rotulo": "Corte", "icono": "corte_pelo", "plano": "cabeza", "subs": [
			{"id": "corto", "rotulo": "Corto", "filas": ["pelo_corto"]},
			{"id": "mediano", "rotulo": "Mediano", "filas": ["pelo_mediano"]},
			{"id": "largo", "rotulo": "Largo", "filas": ["pelo_largo"]},
			{"id": "accesorio", "rotulo": "Accesorio", "filas": ["pelo_accesorio"]}]},
		{"id": "tinte", "rotulo": "Tinte", "icono": "tinte", "plano": "cabeza",
			"filas": ["color_pelo", "puntas", "color_cejas"]},
		{"id": "rostro", "rotulo": "Rostro", "icono": "perfil", "plano": "cabeza",
			"filas": ["piel", "ojos", "tipo_ceja", "mascara"]},
		{"id": "barba", "rotulo": "Barba", "icono": "barba", "plano": "cabeza",
			"filas": ["vello"]},
		{"id": "tatuajes", "rotulo": "Tatuajes", "icono": "pincel", "plano": "cabeza", "subs": [
			{"id": "rostro", "rotulo": "Rostro", "filas": ["tat_facial", "tat_lado",
				"tat_tinta_facial"]},


			{"id": "cuello", "rotulo": "Cuello", "filas": ["tat_cuello", "tat_tinta_cuello"]},
			{"id": "brazos", "rotulo": "Brazos", "plano": "torso", "filas": ["tat_brazo",
				"tat_dibujo", "tat_tinta"]},
			{"id": "piernas", "rotulo": "Piernas", "plano": "cuerpo", "filas": ["tat_pierna",
				"tat_dibujo_pierna", "tat_tinta_pierna"]}]},
	],
	"casual": [
		{"id": "arriba", "rotulo": "Arriba", "icono": "camiseta", "plano": "torso", "subs": [



			{"id": "playeras", "rotulo": "Playeras", "filas": ["playera", "color_playera",
				"manga_calle"]},
			{"id": "estampado", "rotulo": "Estampado", "filas": ["estampado", "color2_playera"]},
			{"id": "chamarras", "rotulo": "Chamarras", "filas": ["exterior", "cierre",
				"color_chamarra"]}]},
		{"id": "abajo", "rotulo": "Abajo", "icono": "bota_potencia", "plano": "cuerpo", "subs": [
			{"id": "pantalones", "rotulo": "Pantalones", "filas": ["pantalon",
				"largo_pantalon", "color_pantalon"]},
			{"id": "calzado", "rotulo": "Calzado", "plano": "pies", "filas": ["calzado",
				"color_calzado"]}]},
		{"id": "detalles", "rotulo": "Detalles", "icono": "reloj", "plano": "torso", "subs": [
			{"id": "gorras", "rotulo": "Gorras", "plano": "cabeza", "filas": ["gorra",
				"color_gorra"]},
			{"id": "rostro", "rotulo": "Rostro", "plano": "cabeza", "filas": ["gafas", "aretes"]},
			{"id": "cuello", "rotulo": "Cuello", "filas": ["cadena", "corbata_calle",
				"panuelo_calle", "color_accesorio_calle"]},
			{"id": "bolsa", "rotulo": "Bolsa", "filas": ["bolsa"]},
			{"id": "muneca", "rotulo": "Muñeca", "filas": ["reloj", "pulsera", "metal_calle"]},
			{"id": "cinturon", "rotulo": "Cinturón", "filas": ["cinturon_calle"]}]},
		{"id": "outfits", "rotulo": "Outfits", "icono": "percha", "plano": "cuerpo",
			"filas": ["conjuntos", "mis_outfits_calle"]},
	],
	"gala": [
		{"id": "traje", "rotulo": "Traje", "icono": "vestidor", "plano": "cuerpo",
			"filas": ["gala_economicos", "gala_clasicos", "gala_lujo", "gala_contemporaneos"]},
		{"id": "cuello", "rotulo": "Cuello", "icono": "bufanda", "plano": "torso",
			"filas": ["corbata_gala", "panuelo_gala", "color_accesorio_gala"]},
		{"id": "detalles", "rotulo": "Detalles", "icono": "reloj_lujo", "plano": "torso",
			"filas": ["cinturon_gala", "reloj_gala", "cadena_gala", "metal_gala"]},
		{"id": "outfits", "rotulo": "Outfits", "icono": "percha", "plano": "cuerpo",
			"filas": ["mis_outfits_gala"]},
	],
}








const CATEGORIAS_TUMBADO: Dictionary = {
	"uniforme": [
		{"id": "botas", "rotulo": "Botines", "icono": "bota_potencia", "plano": "pies",
			"filas": ["botines", "medias", "color_cinta_media", "mallas", "rodillera",
				"material_rodillera"]},
		{"id": "manga", "rotulo": "Manga", "icono": "camiseta", "plano": "torso",
			"filas": ["manga_kit", "manga_compresion", "color_manga_compresion"]},
		{"id": "muneca", "rotulo": "Muñeca", "icono": "reloj", "plano": "torso",
			"filas": ["munequeras", "color_munequera", "vendaje_brazo"]},
		{"id": "guantes", "rotulo": "Guantes", "icono": "guante", "plano": "torso",
			"filas": ["guantes_campo"]},
	],
}







const ICONO_VISTA: Dictionary = {"fisico": "perfil", "uniforme": "camiseta",
	"casual": "percha", "gala": "vestidor"}
const ROTULO_VISTA: Dictionary = {"fisico": "FISICO", "uniforme": "UNIFORME",
	"casual": "CASUAL", "gala": "Gala"}







const VISTA_COMPACTA_W: float = 176.0
const VISTA_ICONO_W: float = 76.0


static func pestanas_vista(parent: Container, vistas: Array, actual: String,
		on_pick: Callable, compacta: bool = false) -> HBoxContainer:
	var tabs: Array = []
	for v in vistas:
		tabs.append({"icon": String(ICONO_VISTA[v]), "label": I18n.t(String(ROTULO_VISTA[v]))})
	var fila: HBoxContainer = CareerUi.icon_tabs(parent, tabs, vistas.find(actual), on_pick)
	if compacta:
		for i in fila.get_child_count():
			var b: Control = fila.get_child(i) as Control
			var activa: bool = i == vistas.find(actual)
			b.size_flags_horizontal = Control.SIZE_FILL
			b.custom_minimum_size.x = VISTA_COMPACTA_W if activa else VISTA_ICONO_W
			if not activa:
				for l in b.find_children("*", "Label", true, false):
					(l as Label).visible = false
	return fila




static func categorias(v: String) -> Array:
	if UiKit.es_horizontal() and CATEGORIAS_TUMBADO.has(v):
		return CATEGORIAS_TUMBADO[v]
	return CATEGORIAS.get(v, [])





static func categoria_de(v: String, cat: String) -> Dictionary:
	var lista: Array = categorias(v)
	for c in lista:
		if String((c as Dictionary)["id"]) == cat:
			return c
	return lista[0] if not lista.is_empty() else {}


static func sub_de(c: Dictionary, sb: String) -> Dictionary:
	var subs: Array = c.get("subs", [])
	for x in subs:
		if String((x as Dictionary)["id"]) == sb:
			return x
	return subs[0] if not subs.is_empty() else {}



static func plano_de(v: String, cat: String, sb: String) -> String:
	var c: Dictionary = categoria_de(v, cat)
	var x: Dictionary = sub_de(c, sb)
	return String(x.get("plano", c.get("plano", "cuerpo")))



func filas_de_hoja() -> Array:
	var c: Dictionary = categoria_de(view, categoria)
	var x: Dictionary = sub_de(c, sub)
	return x.get("filas", c.get("filas", []))





func _monta_rail() -> void:
	var cats: Array = categorias(view)
	if modo_tienda:
		cats = _hojas_tienda(cats)
	if cats.is_empty():
		return
	var c: Dictionary = cats[0]
	for posible: Dictionary in cats:
		if String(posible["id"]) == String(memoria.get(view, categoria)):
			c = posible
			break
	categoria = String(c.get("id", ""))
	var clave: String = "%s/%s" % [view, categoria]
	sub = String(sub_de(c, String(memoria.get(clave, sub))).get("id", ""))
	var tabs: Array = []
	var idx: int = 0
	for i in cats.size():
		var x: Dictionary = cats[i]
		tabs.append({"icon": String(x["icono"]), "label": I18n.t(String(x["rotulo"]))})
		if String(x["id"]) == categoria:
			idx = i
	var fila: HBoxContainer = CareerUi.icon_tabs(self, tabs, idx, func(i: int) -> void:
		memoria[view] = String(cats[i]["id"])
		_cambia_hoja())





	var pestanas: Array[Node] = fila.get_children()
	for i in range(1, pestanas.size()):
		var izq: Control = pestanas[i - 1]
		var der: Control = pestanas[i]
		izq.focus_neighbor_right = izq.get_path_to(der)
		der.focus_neighbor_left = der.get_path_to(izq)
	var subs: Array = c.get("subs", [])
	if subs.is_empty():
		return
	var rotulos: Array = []
	var s_idx: int = 0
	for i in subs.size():
		rotulos.append(I18n.t(String(subs[i]["rotulo"])))
		if String(subs[i]["id"]) == sub:
			s_idx = i
	CareerUi.tab_chips_row(self, rotulos, s_idx, func(i: int) -> void:
		memoria[clave] = String(subs[i]["id"])
		_cambia_hoja())





const FILA_VENDIBLE: Dictionary = {
	"pelo_corto": "modular_hair", "pelo_mediano": "modular_hair",
	"pelo_largo": "modular_hair", "vello": "modular_beard", "playera": "casual_top",
	"pantalon": "casual_pants_style", "exterior": "casual_outer", "gorra": "acc_head",
	"gafas": "acc_face", "aretes": "acc_ear", "cadena": "acc_neck", "reloj": "acc_watch",
	"pulsera": "acc_bracelet", "calzado": "casual_shoes", "corbata_calle": "acc_neckwear",
	"panuelo_calle": "acc_pocket", "cinturon_calle": "acc_belt", "conjuntos": "_preset",
	"bolsa": "acc_torso",
}

func _hojas_tienda(lista: Array) -> Array:
	var resultado: Array = []
	for original: Dictionary in lista:
		var c: Dictionary = original.duplicate(true)
		if c.has("subs"):
			var subs: Array = []
			for sb: Dictionary in c["subs"]:
				var filas: Array =(sb["filas"] as Array).filter(_fila_se_vende)
				if not filas.is_empty():
					sb["filas"] = filas
					subs.append(sb)
			if subs.is_empty():
				continue
			c["subs"] = subs
		else:
			var filas: Array =(c.get("filas", []) as Array).filter(_fila_se_vende)
			if filas.is_empty():
				continue
			c["filas"] = filas
		resultado.append(c)
	return resultado

func _fila_se_vende(fila: String) -> bool:
	var key: String = String(FILA_VENDIBLE.get(fila, ""))
	return key == "_preset" or Shop.CASUAL_BASE.has(key) or Shop.FILAS_ESTETICA.has(key)


func _cambia_hoja() -> void:
	categoria = String(memoria.get(view, categoria))
	_remonta.call_deferred()
	hoja_cambiada.emit(plano_de(view, categoria,
		String(memoria.get("%s/%s" % [view, categoria], ""))))



func _fila(id: String) -> void:
	match id:

		"botines":


			_add_color_row("Botines", "boots", KitRecolor.BOOT_COLORS, KitRecolor.REF_BOOT)
		"manga_kit":




			_add_text_row("Manga", "kit_sleeves", ["corta", "larga"], SLEEVE_NAMES, "corta")



		"guantes_campo":
			_add_color_row("Guantes de campo", "field_gloves_color",
				KitRecolor.FIELD_GLOVE_COLORS, KitRecolor.FIELD_GLOVE_COLORS[0], true)
		"munequeras":
			_add_text_row("Muñequeras", "wristband_style",
				["none", "left", "right", "both"], BRAZO_NAMES, "none")
		"color_munequera":
			_add_color_row("Color de la muñequera", "wristband_color",
				KitRecolor.WRIST_COLORS, KitRecolor.WRIST_COLORS[0])
		"manga_compresion":
			_add_text_row("Manga de compresión", "arm_sleeve_style",
				["none", "left", "right", "both"], BRAZO_NAMES, "none")
		"color_manga_compresion":
			_add_color_row("Color de la manga", "arm_sleeve_color",
				KitRecolor.ARM_SLEEVE_COLORS, KitRecolor.ARM_SLEEVE_COLORS[0])
		"vendaje_brazo":
			_add_text_row("Vendaje", "arm_wrap_style",
				["none", "left", "right", "both"], BRAZO_NAMES, "none")
		"medias":
			_add_text_row("Medias", "sock_style",
				["none", "cinta", "bajadas"], MEDIAS_NAMES, "none")
		"color_cinta_media":
			_add_color_row("Cinta de la media", "sock_tape_color",
				KitRecolor.SOCK_TAPE_COLORS, KitRecolor.SOCK_TAPE_COLORS[0])

		"mallas":
			_add_text_row("Mallas", "tights_style", KitRecolor.TIGHTS_STYLES, MALLAS_NAMES, "none")
		"rodillera":
			_add_text_row("Rodillera", "knee_style", KitRecolor.KNEE_SIDES, TAT_LEG_NAMES, "none")
		"material_rodillera":
			_add_text_row("Material", "knee_kind", KitRecolor.KNEE_KINDS, RODILLERA_NAMES,
				"neopreno")

		"gala_economicos":
			_add_thumb_row("Económicos", "gala_outfit", KitRecolor.GALA_WEAR.ECONOMIC, KitRecolor.GALA_WEAR.NAMES, "clasico")
		"gala_clasicos":
			_add_thumb_row("Clásicos", "gala_outfit", ["clasico", "azul", "marfil", "vino", "gris", "cruzado"], KitRecolor.GALA_WEAR.NAMES, "clasico")
		"gala_lujo":
			_add_thumb_row("Lujo", "gala_outfit", KitRecolor.GALA_WEAR.LUXURY, KitRecolor.GALA_WEAR.NAMES, "clasico")
		"gala_contemporaneos":
			_add_thumb_row("Contemporáneos", "gala_outfit", KitRecolor.GALA_WEAR.MODERN, KitRecolor.GALA_WEAR.NAMES, "clasico")
		"corbata_gala", "corbata_calle":
			var neck: Dictionary = {"auto": "Del traje"} if id == "corbata_gala" else {}
			neck.merge(KitRecolor.WARDROBE.NECKWEAR)
			_add_named_thumbs("Corbata, moño o bufanda", "gala_neckwear" if id == "corbata_gala" else "acc_neckwear",
				neck, "auto" if id == "corbata_gala" else "none")
		"panuelo_gala", "panuelo_calle":
			var pocket: Dictionary = {"auto": "Del traje"} if id == "panuelo_gala" else {}
			pocket.merge(KitRecolor.WARDROBE.POCKETS)
			_add_named_thumbs("Pañuelo de saco", "gala_pocket" if id == "panuelo_gala" else "acc_pocket",
				pocket, "auto" if id == "panuelo_gala" else "none")
		"cinturon_gala", "cinturon_calle":
			_add_named_thumbs("Cinturón", "gala_belt" if id == "cinturon_gala" else "acc_belt",
				KitRecolor.WARDROBE.BELTS, "none")
		"color_accesorio_gala", "color_accesorio_calle":
			_add_color_row("Color del accesorio", "gala_accent" if id == "color_accesorio_gala" else "acc_cloth",
				KitRecolor.CASUAL_SHIRTS, Color("733344"))
		"reloj_gala":
			_add_named_thumbs("Reloj", "gala_watch", {"none": "Ninguno", "reloj": "Clásico", "deportivo": "Deportivo", "lujo": "De lujo"}, "none")
		"cadena_gala":
			_add_named_thumbs("Cadena", "gala_chain", {"none": "Ninguna", "cadena": "Cadena", "dije": "Con dije"}, "none")
		"metal_gala":
			_add_color_row("Metal", "gala_metal", [Color("d7b76d"), Color("cbd2da"), Color("aa785f")], Color("d7b76d"))
		"mis_outfits_gala":
			_add_saved_outfits("gala")

		"conjuntos":
			_add_named_thumbs("Conjuntos completos", "_preset", KitRecolor.WARDROBE.PRESET_NAMES, "")
		"mis_outfits_calle":
			_add_saved_outfits("casual")
		"playera":
			_add_text_row("Playera", "casual_top", _con_propias(KitRecolor.CASUAL_TOPS, "prendas"),
				_nombres_con_propias(CASUAL_TOP_NAMES, "prendas"), "playera")
		"color_playera":
			_add_color_row("Color de playera", "casual_shirt", _all_colors(KitRecolor.CASUAL_SHIRTS,
				Shop.casual_colors(unlocked, "shirt")), KitRecolor.CASUAL_SHIRTS[0])
		"estampado":
			_add_text_row("Estampado", "casual_print", KitRecolor.CASUAL_PRINTS, CASUAL_PRINT_NAMES, "solid")
		"color2_playera":
			_add_color_row("2º color playera", "casual_shirt2", KitRecolor.CASUAL_SHIRTS, KitRecolor.CASUAL_SHIRTS[1])
		"manga_calle":
			_add_text_row("Manga", "casual_sleeves", ["corta", "larga"], SLEEVE_NAMES, "corta")
		"pantalon":
			_add_text_row("Pantalones", "casual_pants_style", KitRecolor.CASUAL_PANT_STYLES,
				{"recto": "Recto", "jeans": "Jeans", "cargo": "Cargo", "jogger": "Jogger",
				"chinos": "Chinos", "ancho": "Mezclilla ancha", "vestir": "De vestir", "deportivo": "Short deportivo", "short_denim": "Short de mezclilla",
				"short_cargo": "Short cargo", "short_chino": "Bermuda", "bano": "Short de baño", "pants": "Pants deportivos", "pinzas": "Pantalón de pinzas",
				"barril": "Jeans barril", "tecnico": "Cargo técnico"}, "recto")
		"largo_pantalon":
			_add_text_row("Largo del pantalón", "casual_pants_len", ["largo", "corto"], PANTS_LEN_NAMES, "largo")
		"color_pantalon":
			_add_color_row("Pantalón casual", "casual_pants", _all_colors(KitRecolor.CASUAL_PANTS,
				Shop.casual_colors(unlocked, "pants")), KitRecolor.CASUAL_PANTS[0])
		"exterior":
			_add_text_row("Prenda exterior", "casual_outer", KitRecolor.CASUAL_OUTERS,
				{"none": "Ninguna", "chamarra": "Chamarra", "hoodie": "Hoodie",
				"chaleco": "Chaleco", "abrigo": "Abrigo", "bomber": "Bomber",
				"mezclilla": "Mezclilla", "cuero": "Cuero", "rompevientos": "Rompevientos", "blazer": "Blazer",
				"varsity": "Varsity", "gabardina": "Gabardina", "acolchada": "Acolchada",
				"sobrecamisa": "Sobrecamisa", "parka": "Parka"}, "none")
		"cierre":
			_add_text_row("Cierre", "casual_outer_state", ["abierta", "cerrada"],
				{"abierta": "Abierta", "cerrada": "Cerrada"}, "abierta")
		"color_chamarra":
			_add_color_row("Color de chamarra", "casual_outer_color", KitRecolor.CASUAL_SHIRTS, KitRecolor.CASUAL_SHIRTS[0])
		"gorra":
			_add_text_row("Gorra", "acc_head", _con_propias(KitRecolor.STREET_HEAD, "head_acc"),
				_nombres_con_propias(STREET_HEAD_NAMES, "head_acc"), "none")
		"color_gorra":
			_add_color_row("Color de la gorra", "acc_head_color", KitRecolor.HEAD_ACC_COLORS, KitRecolor.HEAD_ACC_COLORS[0])
		"gafas":
			_add_text_row("Gafas", "acc_face", _con_propias(KitRecolor.STREET_FACE, "face_acc"),
				_nombres_con_propias(STREET_ACC_NAMES, "face_acc"), "none")
		"aretes":
			_add_text_row("Aretes", "acc_ear", KitRecolor.CASUAL_EARRINGS,
				{"none": "Ninguno", "stud": "Broquel", "hoop": "Aro", "diamante": "Diamante",
				"doble_aro": "Doble aro", "colgante": "Colgante", "ear_cuff": "Ear cuff"}, "none")
		"cadena":
			_add_text_row("Cadena", "acc_neck", _con_propias(["none", "cadena", "dije"], "neck_acc"),
				_nombres_con_propias({"none": "Ninguna", "cadena": "Cadena", "dije": "Con dije"}, "neck_acc"), "none")
		"bolsa":

			_add_text_row("Bolsa", "acc_torso", _con_propias(["none"], "torso_acc"),
				_nombres_con_propias({"none": "Ninguna"}, "torso_acc"), "none")
		"reloj":
			_add_named_thumbs("Reloj", "acc_watch", {"none": "Ninguno", "reloj": "Clásico", "deportivo": "Deportivo", "lujo": "De lujo"}, "none")
		"pulsera":
			_add_text_row("Pulsera", "acc_bracelet", ["none", "pulsera"], {"none": "Ninguna", "pulsera": "Pulsera"}, "none")
		"metal_calle":
			_add_color_row("Metal", "acc_metal", [Color("d7b76d"), Color("cbd2da"), Color("aa785f")], Color("d7b76d"))
		"calzado":
			_add_text_row("Calzado", "casual_shoes", KitRecolor.CASUAL_SHOES,
				{"bajos": "Tenis bajos", "altos": "Tenis altos", "botas": "Botas",
				"mocasines": "Mocasines", "sandalias": "Sandalias", "oxford": "Oxford",
				"chelsea": "Chelsea", "slides": "Chanclas", "retro": "Tenis retro", "running": "Tenis deportivos", "charol": "Zapatos de charol",
				"gruesos": "Tenis gruesos"}, "bajos")
		"color_calzado":
			_add_color_row("Color del calzado", "casual_shoes_color", KitRecolor.BOOT_COLORS, KitRecolor.BOOT_COLORS[0])

		"piel":
			_add_color_row("Piel", "skin", KitRecolor.SKIN_TONES, KitRecolor.REF_SKIN)
		"color_pelo":
			_add_color_row("Pelo", "hair",
				_all_colors(KitRecolor.HAIR_COLORS, KitRecolor.EXTRA_HAIR_COLORS),
				KitRecolor.REF_HAIR)
		"sin_pelo":
			_add_thumb_row("Sin pelo", "modular_hair", ["none"], {"none": "Calvo"}, LookMigracion.PELO_POR_DEFECTO)
		"pelo_corto", "pelo_mediano", "pelo_largo":
			var length: String = {"pelo_corto": "short", "pelo_mediano": "medium",
				"pelo_largo": "long"}[id]
			var cuts: Array[String] = []

			if id == "pelo_corto" and not categoria.is_empty():
				cuts.append("none")
			cuts.append_array(Appearance.Extra.DATA.hair_groups[length])

			cuts = _all_options(cuts, _ids_propios("hair", PiezasPropias.hair_groups().get(length, [])))
			_add_thumb_row({"short": "Cortes cortos", "medium": "Cortes medianos", "long": "Cortes largos"}[length],
				"modular_hair", cuts, _modular_names("hair", {"none": "Calvo"}), LookMigracion.PELO_POR_DEFECTO)
		"pelo_accesorio":
			_add_text_row("Accesorio de pelo", "modular_hair_accessory",
				_con_propias(["none", "band", "ribbon", "tie"], "accessories"),
				_nombres_con_propias({"none": "Ninguno", "band": "Banda deportiva", "ribbon": "Cinta fina",
					"tie": "Liga para recogido"}, "accessories"), "none")
		"mascara":
			_add_text_row("Máscara de protección", "modular_mask", ["none", "mask"],
				{"none": "Sin máscara", "mask": "Con máscara"}, "none")
		"ojos":


			_add_color_row("Ojos", "eyes", KitRecolor.EYE_COLORS, KitRecolor.REF_EYE)
		"color_cejas":


			_add_color_row("Cejas", "brows", KitRecolor.BROW_COLORS, KitRecolor.REF_BROW)
		"tipo_ceja":
			_add_thumb_row("Tipo de ceja", "modular_brows",
				_modular_options("brows", ["none"], ORDEN_CEJAS),
				_modular_names("brows", {"none": "Sin cejas"}), "natural")
		"vello":
			_add_thumb_row("Vello facial", "modular_beard",
				_modular_options("beard", ["none"], ORDEN_VELLO),
				_modular_names("beard", {"none": "Nada"}), "none")
		"puntas":


			_add_color_row("Puntas", "hair_tips", KitRecolor.HAIR_TIPS, Color.TRANSPARENT,
				true)


		"tat_facial":
			_add_text_row("Tatuaje facial", "modular_face_tattoo",
				FACE_TAT_OPTS, Appearance.FaceTattoos.NAMES, "none")
		"tat_lado":
			_add_text_row("Lado del rostro", "modular_face_tattoo_side",
				["left", "right", "both"], Appearance.FaceTattoos.SIDES, "left")
		"tat_tinta_facial":
			_add_color_row("Tinta facial", "face_tattoo_color", KitRecolor.TAT_INKS, KitRecolor.TAT_INKS[0])



		"tat_cuello":
			_add_text_row("Tatuaje de cuello", "modular_neck_tattoo",
				NECK_TAT_OPTS, Appearance.FaceTattoos.NECK_NAMES, "none")
		"tat_tinta_cuello":
			_add_color_row("Tinta del cuello", "neck_tattoo_color", KitRecolor.TAT_INKS,
				KitRecolor.TAT_INKS[0])
		"tat_brazo":
			_add_text_row("Tatuajes", "tattoo_style",
				["none", "left", "right", "both"], TAT_NAMES, "none")
		"tat_dibujo":


			_add_text_row("Dibujo del tatuaje", "tattoo_pattern",
				KitRecolor.TAT_PATTERNS, TAT_PAT_NAMES, "damero")
		"tat_tinta":
			_add_color_row("Tinta del tatuaje", "tattoo_color", KitRecolor.TAT_INKS,
				KitRecolor.TAT_INKS[0])



		"tat_pierna":
			_add_text_row("Tatuajes", "tattoo_leg_style",
				["none", "left", "right", "both"], TAT_LEG_NAMES, "none")
		"tat_dibujo_pierna":
			_add_text_row("Dibujo de la pierna", "tattoo_leg_pattern",
				KitRecolor.TAT_PATTERNS, TAT_PAT_NAMES, "damero")
		"tat_tinta_pierna":
			_add_color_row("Tinta de la pierna", "tattoo_leg_color", KitRecolor.TAT_INKS,
				KitRecolor.TAT_INKS[0])
		_:
			push_error("LookEditor: fila desconocida '%s'" % id)







func _section(title: String) -> void:



	if modo_tienda:
		return
	CareerUi.head(self, I18n.t(title))





func _all_options(base: Array[String], extra: Array[String]) -> Array[String]:
	var out: Array[String] = base.duplicate()
	for v in extra:
		if not out.has(v):
			out.append(v)
	return out


func _all_colors(base: Array[Color], extra: Array[Color]) -> Array[Color]:
	var out: Array[Color] = base.duplicate()
	out.append_array(extra)
	return out


func _modular_names(group: String, extras: Dictionary = {}) -> Dictionary:
	var out: Dictionary = extras.duplicate()
	var group_labels: Dictionary = Appearance.names(group)
	for key in group_labels:
		out[String(key)] = String(group_labels[key])
	return _nombres_con_propias(out, group)










const ORDEN_VELLO: Array[String] = ["p_sombra_de_tres_dias", "p_barba_recortada",
	"p_barba_redonda_llena", "p_cortina_lincoln", "p_barba_de_lenador", "p_trenzas_vikingas",
	"p_candado_marcado", "p_mosca_bajo_el_labio", "p_perilla_afilada", "p_bigote_ingles",
	"p_bigote_lapiz", "p_bigote_de_herradura", "p_bigote_mexicano", "p_bigote_manubrio",
	"p_wolverine", "p_chuletas"]

const ORDEN_CEJAS: Array[String] = ["natural"]


func _modular_options(group: String, prefix: Array[String] = [],
		orden: Array[String] = []) -> Array[String]:
	var out: Array[String] = []
	for key in prefix:
		if not out.has(key):
			out.append(key)
	var catalog: Dictionary = Appearance.group(group)
	for key in orden:
		if catalog.has(key) and not out.has(key):
			out.append(key)
	var keys: Array = catalog.keys()
	keys.sort()
	for key in keys:
		var id: String = String(key)
		if not out.has(id):
			out.append(id)


	return _con_propias(out, group)







func _con_propias(base: Array[String], grupo: String) -> Array[String]:
	return _all_options(base, _ids_propios(grupo, PiezasPropias.group(grupo).keys()))




func _ids_propios(grupo: String, ids: Array) -> Array[String]:
	var out: Array[String] = []
	for id in ids:
		if PiezasPropias.es_propia(grupo, str(id)) and not out.has(str(id)):
			out.append(str(id))
	out.sort()
	return out






func _nombres_con_propias(names: Dictionary, grupo: String) -> Dictionary:
	var out: Dictionary = names.duplicate()
	var propias: Dictionary = PiezasPropias.names(grupo)
	for id in propias:
		if not out.has(str(id)):
			out[str(id)] = str(propias[id])
	return out



func cfg() -> Dictionary:
	return _cfg.duplicate()



func set_cfg(c: Dictionary) -> void:
	_cfg = KitRecolor.casual_parts(c)
	_upgrade_legacy_appearance()
	if is_inside_tree():
		_mark()


const PART_NAMES: Dictionary = {"outfits": "Outfits", "playeras": "Playeras", "pantalones": "Pantalones",
	"chamarras": "Chamarras", "gorras": "Gorras", "accesorios": "Accesorios", "calzado": "Calzado"}
var _part: String = "outfits"
var _part_nodes: Dictionary = {}
var _part_buttons: Dictionary = {}
var _part_thumbs: Dictionary = {}
const PART_PREVIEWS: Dictionary = {
	"outfits": ["_preset", "streetwear"],
	"playeras": ["casual_top", "playera"], "pantalones": ["casual_pants_style", "jeans"],
	"chamarras": ["casual_outer", "chamarra"], "gorras": ["acc_head", "gorra"],
	"accesorios": ["acc_face", "gafas"], "calzado": ["casual_shoes", "altos"]}

func _build_casual_parts() -> void:
	var tabs: HFlowContainer = HFlowContainer.new()
	tabs.add_theme_constant_override("h_separation", 10)
	tabs.add_theme_constant_override("v_separation", 10)
	add_child(tabs)
	for key in PART_NAMES:
		var button: Button = Button.new()
		button.custom_minimum_size = Vector2(154, 158)
		button.tooltip_text = I18n.t(PART_NAMES[key])
		CareerTheme.apply_button(button, CareerTheme.Kind.NEUTRAL, 13)
		var column: VBoxContainer = VBoxContainer.new()
		column.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
		column.offset_top = 8
		column.offset_bottom = -10
		column.offset_left = 6
		column.offset_right = -6
		column.mouse_filter = Control.MOUSE_FILTER_IGNORE
		button.add_child(column)
		var thumb: TextureRect = TextureRect.new()
		thumb.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
		thumb.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		thumb.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
		thumb.size_flags_vertical = Control.SIZE_EXPAND_FILL
		if solo_pieza:


			thumb.custom_minimum_size = Vector2(_caja_pieza())
			thumb.size_flags_vertical = Control.SIZE_SHRINK_CENTER
			column.offset_top = 4
			column.offset_bottom = -6
		thumb.mouse_filter = Control.MOUSE_FILTER_IGNORE
		_encola(thumb, PART_PREVIEWS[key][0], PART_PREVIEWS[key][1])
		column.add_child(thumb)
		_part_thumbs[key] = thumb
		var caption: Label = CareerUi.plain(12, CareerTheme.TEXT)
		caption.text = CareerTheme.caps(I18n.t(PART_NAMES[key]))
		caption.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		caption.clip_text = true
		caption.mouse_filter = Control.MOUSE_FILTER_IGNORE
		column.add_child(caption)
		button.pressed.connect(_show_part.bind(key))
		tabs.add_child(button)
		_part_buttons[key] = button
		var start: int = get_child_count()
		for fila in PARTES_CALLE[key]:
			_fila(fila)
		_part_nodes[key] = get_children().slice(start)
	_show_part(_part)

func _show_part(key: String) -> void:
	_part = key
	for part in _part_nodes:
		for node: Control in _part_nodes[part]:
			node.visible = part == key
		CareerTheme.style_button(_part_buttons[part],
			CareerTheme.Kind.PRIMARY if part == key else CareerTheme.Kind.NEUTRAL, 13)

	_despierta()
	part_changed.emit(key)

func _add_named_thumbs(label: String, key: String, names: Dictionary, default_val: String) -> void:
	var options: Array[String] = []
	options.assign(names.keys())
	_add_thumb_row(label, key, options, names, default_val)

func _add_saved_outfits(kind: String) -> void:

	if modo_tienda:
		return
	var panel = preload("res://ui/wardrobe_saved.gd").new()
	panel.editor = self
	panel.kind = kind
	add_child(panel)

func _outfit_texture(clothes: Dictionary, kind: String) -> Texture2D:
	var dressed: Dictionary = KitRecolor.WARDROBE.wear(_cfg, clothes, kind)
	dressed = KitRecolor.GALA_WEAR.preview_cfg(dressed) if kind == "gala" else KitRecolor.casual_of(dressed)
	var tex: Texture2D = KitRecolor.apply(PLAYER_TEX, dressed)
	var img: Image = SceneFade.imagen_copia(tex)
	if img == null:
		return tex
	if img.is_compressed(): img.decompress()
	return ImageTexture.create_from_image(img.get_region(img.get_used_rect()))

func _wear_outfit(clothes: Dictionary, kind: String) -> void:
	_cfg = KitRecolor.WARDROBE.wear(_cfg, clothes, kind)
	_mark()
	changed.emit(cfg())

func _upgrade_legacy_appearance() -> void:







	_cfg = LookMigracion.al_dia(_cfg, true)





func _fila_nueva(rotulo: String) -> Container:
	if not tira:
		CareerUi.subhead(self, rotulo)
		return _flujo()
	var linea: HBoxContainer = HBoxContainer.new()
	linea.add_theme_constant_override("separation", 12)
	add_child(linea)
	var l: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
	l.text = CareerTheme.caps(rotulo)
	l.custom_minimum_size.x = TIRA_ROTULO_W
	l.max_lines_visible = 3
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	linea.add_child(l)


	_sin_partir(l, TIRA_ROTULO_W)
	var abrir: Button = Button.new()
	abrir.custom_minimum_size.y = 76
	abrir.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	CareerTheme.apply_button(abrir, CareerTheme.Kind.NEUTRAL, 22)
	linea.add_child(abrir)
	var contenido: HBoxContainer = HBoxContainer.new()
	contenido.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	contenido.offset_left = 10
	contenido.offset_right = -10
	contenido.offset_top = 4
	contenido.offset_bottom = -4
	contenido.add_theme_constant_override("separation", 12)
	contenido.mouse_filter = Control.MOUSE_FILTER_IGNORE
	abrir.add_child(contenido)
	var muestra: TextureRect = TextureRect.new()
	muestra.custom_minimum_size = Vector2(68, 68)
	muestra.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	muestra.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	muestra.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	muestra.mouse_filter = Control.MOUSE_FILTER_IGNORE
	contenido.add_child(muestra)
	var color: ColorRect = ColorRect.new()
	color.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	color.mouse_filter = Control.MOUSE_FILTER_IGNORE
	color.visible = false
	muestra.add_child(color)
	var valor: Label = CareerUi.plain(22, CareerTheme.TEXT)
	valor.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	valor.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	valor.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	valor.mouse_filter = Control.MOUSE_FILTER_IGNORE
	contenido.add_child(valor)
	var icono: MenuIcon = MenuIcon.new()
	icono.setup("perfil", CareerTheme.TEXT_DIM)
	icono.custom_minimum_size = Vector2(28, 28)
	icono.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	icono.mouse_filter = Control.MOUSE_FILTER_IGNORE
	contenido.add_child(icono)
	var fila: GridContainer = GridContainer.new()
	fila.visible = false
	fila.columns = 10
	add_child(fila)
	var ficha: Dictionary = {"row": fila, "button": abrir, "label": rotulo,
		"preview": muestra, "value": valor, "color": color}
	_fichas_compactas.append(ficha)
	abrir.pressed.connect(_abre_rejilla.bind(ficha))
	return fila


func _refresca_fichas() -> void:
	for ficha in _fichas_compactas:
		var fila: GridContainer = ficha["row"]
		var puesta: Button = null
		var muestra_color: Variant = null
		for key in _groups:
			for entrada in _groups[key]:
				var b: Button = entrada["button"]
				if b.get_parent() != fila:
					continue
				if puesta == null or entrada.get("sel", false) \
						or int(entrada.get("kind", -1)) == CareerTheme.Kind.PRIMARY:
					puesta = b
					muestra_color =(entrada["style"] as StyleBoxFlat).bg_color \
							if entrada.get("value") is Color else null
		var texto: String = I18n.t("ELEGIR")
		if puesta != null:
			texto = puesta.tooltip_text if not puesta.tooltip_text.is_empty() else puesta.text
			if texto.is_empty():
				texto = str(fila.get_child_count())
		(ficha["value"] as Label).text = texto
		(ficha["color"] as ColorRect).visible = muestra_color is Color
		if muestra_color is Color:
			(ficha["color"] as ColorRect).color = muestra_color
			(ficha["value"] as Label).text = I18n.t("ELEGIR")
		(ficha["preview"] as TextureRect).texture = null
		if puesta != null:
			var miniaturas: Array[Node] = puesta.find_children("*", "TextureRect", true, false)
			if not miniaturas.is_empty():
				(ficha["preview"] as TextureRect).texture =(miniaturas[0] as TextureRect).texture


func _abre_rejilla(ficha: Dictionary) -> void:
	var box: VBoxContainer = CareerUi.modal_pantalla(_modal_host())
	if box == null:
		return
	var encabezado: HBoxContainer = HBoxContainer.new()
	encabezado.add_theme_constant_override("separation", 24)
	box.add_child(encabezado)
	var titulo: Label = CareerUi.plain(CareerTheme.T_CARD, CareerTheme.TEXT)
	titulo.text = CareerTheme.caps(String(ficha["label"]))
	titulo.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	titulo.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	encabezado.add_child(titulo)
	var cerrar: Button = CareerUi.primary_cta(I18n.t("CERRAR"),
		func() -> void: CareerUi.close_modal(box))
	CareerTheme.apply_button(cerrar, CareerTheme.Kind.GHOST, 26)
	var ancho_cerrar: float = cerrar.get_theme_font("font").get_string_size(
		I18n.gritado_seguro(I18n.t("CERRAR")), HORIZONTAL_ALIGNMENT_LEFT, -1, 26).x + 64
	cerrar.custom_minimum_size = Vector2(maxf(300, ancho_cerrar), 76)
	cerrar.size_flags_horizontal = Control.SIZE_SHRINK_END
	encabezado.add_child(cerrar)
	var nombre: Label = CareerUi.plain(22, CareerTheme.TEXT_DIM)
	nombre.text =(ficha["value"] as Label).text
	nombre.clip_text = true
	box.add_child(nombre)
	var cuerpo: Control = Control.new()
	cuerpo.size_flags_vertical = Control.SIZE_EXPAND_FILL
	box.add_child(cuerpo)
	var rejilla: GridContainer = GridContainer.new()
	rejilla.add_theme_constant_override("h_separation", 8)
	rejilla.add_theme_constant_override("v_separation", 8)
	rejilla.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	rejilla.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	cuerpo.add_child(rejilla)
	rejilla.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	var fuente: GridContainer = ficha["row"]
	for original: Button in fuente.get_children():
		var copia: Button = original.duplicate(Node.DUPLICATE_GROUPS|Node.DUPLICATE_SCRIPTS) as Button
		copia.visible = true
		copia.pressed.connect(func() -> void:
			CareerUi.close_modal(box)
			original.pressed.emit())
		copia.mouse_entered.connect(func() -> void: nombre.text = original.tooltip_text)
		copia.focus_entered.connect(func() -> void: nombre.text = original.tooltip_text)
		rejilla.add_child(copia)
		for key in _groups:
			for entrada in _groups[key]:
				if entrada["button"] == original and entrada.has("thumb"):
					var nuevas: Array[Node] = copia.find_children("*", "TextureRect", true, false)
					if not nuevas.is_empty():
						_encola(nuevas[0] as TextureRect, String(key), String(entrada["value"]))
	cuerpo.resized.connect(_ajusta_rejilla.bind(rejilla, cuerpo))
	_ajusta_rejilla.call_deferred(rejilla, cuerpo)





func _ajusta_rejilla(rejilla: GridContainer, cuerpo: Control) -> void:
	if not is_instance_valid(rejilla) or cuerpo.size.x < 1 or cuerpo.size.y < 1:
		return
	var cantidad: int = rejilla.get_child_count()
	var alto: float = 142.0 if modo_tienda else 116.0
	var filas: int = maxi(1, floori((cuerpo.size.y + 8.0) /(alto + 8.0)))
	var preferidas: int = mini(cantidad, maxi(1, floori((cuerpo.size.x + 8) / 192.0)))
	var columnas: int = maxi(preferidas, maxi(1, ceili(float(cantidad) / float(filas))))
	var ancho: float = floorf((cuerpo.size.x - 8.0 *(columnas - 1)) / columnas)
	if ancho < 100.0:
		alto = 106.0 if modo_tienda else 80.0
		filas = maxi(1, floori((cuerpo.size.y + 8.0) /(alto + 8.0)))
		columnas = maxi(preferidas, maxi(1, ceili(float(cantidad) / float(filas))))
		ancho = floorf((cuerpo.size.x - 8.0 *(columnas - 1)) / columnas)
	ancho = minf(184, ancho)
	rejilla.columns = columnas
	for b: Button in rejilla.get_children():
		b.custom_minimum_size = Vector2(maxf(56, ancho), alto)
		for t: TextureRect in b.find_children("*", "TextureRect", true, false):
			if t.custom_minimum_size.y > 0:
				t.custom_minimum_size = Vector2(54, 48) if alto < 116 else Vector2(81, 72)
		for l: Label in b.find_children("*", "Label", true, false):
			if l.get_theme_font_size("font_size") != 14:
				l.add_theme_font_size_override("font_size", CareerTheme.T_CAPTION)
				l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
				l.custom_minimum_size.y = 32 if alto >= 116 else 20
				l.max_lines_visible = 2 if alto >= 116 else 1
				l.clip_text = true
	var ancho_total: float = columnas * ancho + 8 *(columnas - 1)
	rejilla.set_anchors_and_offsets_preset(Control.PRESET_TOP_LEFT)
	rejilla.position = Vector2((cuerpo.size.x - ancho_total) * 0.5, 0)
	rejilla.size = Vector2(ancho_total, cuerpo.size.y)








static func _sin_partir(l: Label, ancho: float) -> void:
	l.autowrap_mode = TextServer.AUTOWRAP_WORD
	var larga: String = ""
	for w: String in l.text.split(" ", false):
		if w.length() > larga.length():
			larga = w
	var desde: int = l.get_theme_font_size("font_size")
	var px: int = CareerUi.fit_font_size(l.get_theme_font("font"), larga, ancho, desde, 12)
	if px != desde:
		l.add_theme_font_size_override("font_size", px)



func _flujo() -> HFlowContainer:
	var flujo: HFlowContainer = HFlowContainer.new()
	flujo.add_theme_constant_override("h_separation", 10)
	flujo.add_theme_constant_override("v_separation", 10)
	add_child(flujo)
	return flujo






func _add_color_row(label: String, key: String, colors: Array[Color],
		original: Color, none_first: bool = false) -> void:


	if modo_tienda:
		return
	var row: Container = _fila_nueva(I18n.t(label))
	_groups[key] = []
	_originals[key] = original
	if none_first:
		_add_swatch(row, key, original, original, CareerTheme.SURFACE_LINE, "—")
	for i in colors.size():
		_add_swatch(row, key, colors[i], original, colors[i], "")
	_add_libre_swatch(row, key)





func _add_swatch(row: Container, key: String, value: Color, original: Color,
		fill: Color, text: String) -> void:
	var b: Button = Button.new()
	b.custom_minimum_size = Vector2.ONE *(TIRA_MUESTRA if tira else 92.0)
	if not text.is_empty():
		b.text = text
		b.add_theme_color_override("font_color", CareerTheme.TEXT_DIM)
		b.add_theme_font_size_override("font_size", 40)
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = fill
	sb.set_corner_radius_all(4)



	sb.border_color = CareerTheme.SURFACE_LINE
	sb.set_border_width_all(SWATCH_CANTO)
	b.add_theme_stylebox_override("normal", sb)
	b.add_theme_stylebox_override("hover", sb)
	b.add_theme_stylebox_override("pressed", sb)


	b.add_theme_stylebox_override("disabled", sb)

	UiKit.add_feedback(b)
	b.pressed.connect(_on_color_picked.bind(key, value, original))
	row.add_child(b)
	_groups[key].append({"button": b, "value": value, "style": sb})


const VISUAL_OPTIONS: Array[String] = ["gala_outfit", "kit_sleeves", "casual_top", "casual_print",
	"casual_sleeves", "casual_pants_style", "casual_pants_len", "casual_outer",
	"casual_outer_state", "casual_shoes", "casual_footwear", "acc_head", "acc_face",
	"acc_ear", "acc_neck", "acc_torso", "acc_watch", "acc_bracelet", "modular_hair_accessory",
	"modular_mask", "modular_face_tattoo", "modular_face_tattoo_side", "modular_neck_tattoo",
	"tattoo_style", "tattoo_pattern", "tattoo_leg_style", "tattoo_leg_pattern"]

func _add_text_row(label: String, key: String, options: Array[String],
		names: Dictionary, default_val: String) -> void:
	if key in VISUAL_OPTIONS:
		_add_thumb_row(label, key, options, names, default_val)
		return


	if modo_tienda:
		return
	var row: Container = _fila_nueva(I18n.t(label))
	_groups[key] = []
	for opt in options:
		var b: Button = Button.new()


		b.text = CareerTheme.caps(I18n.t(String(names.get(opt, opt))))
		b.custom_minimum_size = Vector2(0, TIRA_TEXTO if tira else 84.0)
		CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, 24)
		b.pressed.connect(_on_text_picked.bind(key, opt, default_val))
		row.add_child(b)
		_groups[key].append({"button": b, "value": opt})












func _hoja_puesta(key: String, options: Array[String]) -> int:
	var i: int = options.find(String(_cfg.get(key, "")))
	return 0 if i < 0 else i / POR_HOJA


func _add_thumb_row(label: String, key: String, options: Array[String],
		names: Dictionary, default_val: String) -> void:
	_originals[key] = default_val



	if modo_tienda and not _vendible(key, options):
		return




	var solo_pago: bool = modo_tienda and Shop.FILAS_ESTETICA.has(key)
	var mostradas: Array[String] = []
	for opt in options:
		if _ajena(key, opt) or (solo_pago and Shop.casual_price(key, opt) <= 0):
			continue
		mostradas.append(opt)
	if mostradas.is_empty():
		return
	options = mostradas









	var hojas: int = ceili(float(options.size()) / float(POR_HOJA))

	if hojas > 1 and not tira:
		var hoja: int = clampi(int(_paginas.get(label, _hoja_puesta(key, options))), 0, hojas - 1)
		_paginas[label] = hoja


		CareerUi.pager(self, I18n.t(label), hojas, hoja, func(d: int) -> void:
			_paginas[label] = posmod(hoja + d, hojas)
			_remonta())
		options = options.slice(hoja * POR_HOJA, mini((hoja + 1) * POR_HOJA, options.size()))
	var row: Container = null
	if hojas > 1 and not tira:
		row = _flujo()
	else:
		row = _fila_nueva(I18n.t(label))
	if not _groups.has(key):
		_groups[key] = []




	var cobra_fila: bool = modo_tienda
	for opt in options:
		var b: Button = Button.new()
		b.custom_minimum_size = Vector2(154, 158)
		var clothing_card: bool = key.begins_with("casual_") or key.begins_with("gala_") or key.begins_with("acc_") or key == "_preset"
		if clothing_card: b.custom_minimum_size = Vector2(164, 180)



		if vestidor: b.custom_minimum_size = Vector2(148, 184)


		if tira: b.custom_minimum_size = Vector2(TIRA_PRENDA_W if clothing_card else TIRA_CARA_W, TIRA_ALTO)
		if cobra_fila: b.custom_minimum_size.y += 26
		b.tooltip_text = I18n.t(String(names.get(opt, opt)))
		CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, 24)
		var col: VBoxContainer = VBoxContainer.new()
		col.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
		col.offset_top = 4.0 if tira else 8.0
		col.offset_bottom = -4.0 if tira else -8.0
		col.mouse_filter = Control.MOUSE_FILTER_IGNORE
		col.add_theme_constant_override("separation", 4)
		b.add_child(col)
		var thumb: TextureRect = TextureRect.new()
		thumb.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		thumb.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
		thumb.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
		if _es_cabeza(key):




			thumb.custom_minimum_size = Vector2(VENTANA_CABEZA.size) \
					*(ZOOM_TIRA if tira else (ZOOM_VESTIDOR if vestidor else ZOOM_CABEZA))
			thumb.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		elif solo_pieza and clothing_card:


			thumb.custom_minimum_size = Vector2(_caja_pieza())
			thumb.size_flags_vertical = Control.SIZE_SHRINK_CENTER
			if opt == "none":

				var nada: MenuIcon = MenuIcon.new()
				nada.setup("cerrar", CareerTheme.TEXT_DIM)
				nada.mouse_filter = Control.MOUSE_FILTER_IGNORE
				nada.set_anchors_and_offsets_preset(Control.PRESET_CENTER)
				nada.offset_left = -22.0
				nada.offset_right = 22.0
				nada.offset_top = -22.0
				nada.offset_bottom = 22.0
				thumb.add_child(nada)
		else:
			thumb.size_flags_vertical = Control.SIZE_EXPAND_FILL
		thumb.mouse_filter = Control.MOUSE_FILTER_IGNORE
		col.add_child(thumb)
		var cap: Label = CareerUi.plain(15, CareerTheme.TEXT_DIM)

		cap.text = CareerTheme.caps(I18n.t(String(names.get(opt, opt))))
		cap.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		cap.clip_text = true
		cap.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
		if _es_cabeza(key):




			cap.custom_minimum_size.y = 34
		if clothing_card:
			cap.add_theme_font_size_override("font_size", 12)
			cap.custom_minimum_size.y = 36
			cap.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
			cap.max_lines_visible = 2
		if vestidor:


			cap.add_theme_font_size_override("font_size", CareerTheme.T_CAPTION)
			cap.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
			cap.max_lines_visible = 2
			cap.custom_minimum_size.y = 40
			cap.clip_text = false
		if tira:




			cap.add_theme_font_size_override("font_size", CareerTheme.T_CAPTION)
			cap.add_theme_constant_override("line_spacing", 0)
			cap.max_lines_visible = 2
			cap.custom_minimum_size.y = 32
			_sin_partir(cap, b.custom_minimum_size.x - 16.0)
		cap.mouse_filter = Control.MOUSE_FILTER_IGNORE
		col.add_child(cap)


		if vestidor and opt == "none" and key != "modular_hair":
			var aspa: MenuIcon = MenuIcon.new()
			aspa.setup("cerrar", CareerTheme.TEXT_DIM)
			aspa.mouse_filter = Control.MOUSE_FILTER_IGNORE
			aspa.set_anchors_and_offsets_preset(Control.PRESET_TOP_RIGHT)
			aspa.offset_left = -30.0
			aspa.offset_right = -8.0
			aspa.offset_top = 8.0
			aspa.offset_bottom = 30.0
			b.add_child(aspa)



		var precio: Label = null
		if cobra_fila:
			precio = CareerUi.plain(14, CareerTheme.MONEY)
			precio.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
			precio.clip_text = true
			precio.custom_minimum_size.y = 22
			precio.mouse_filter = Control.MOUSE_FILTER_IGNORE
			col.add_child(precio)
		b.pressed.connect(_on_text_picked.bind(key, opt, default_val))
		row.add_child(b)
		var entrada: Dictionary = {"button": b, "value": opt, "thumb": thumb}
		if precio != null:
			entrada["precio"] = precio
		_groups[key].append(entrada)
		_pinta_precio(entrada, key)




func _encola(thumb: TextureRect, key: String, opt: String) -> void:
	if thumb == null or not is_instance_valid(thumb):
		return
	var clave: String = _clave(key, opt)
	if _memo.has(clave):
		thumb.texture = _memo[clave]
		_dormidas.erase(thumb)
		return
	if _oculta(thumb):
		_dormidas[thumb] = {"key": key, "opt": opt}
		return
	var ya: Variant = _pendiente_de.get(thumb)
	if ya != null:



		(ya as Dictionary)["key"] = key
		(ya as Dictionary)["opt"] = opt
		return
	var e: Dictionary = {"thumb": thumb, "key": key, "opt": opt}
	_pendiente_de[thumb] = e
	_pendientes.append(e)
	set_process(true)





func _process(_delta: float) -> void:
	if _pendientes.is_empty():
		set_process(false)
		_refresca_fichas()
		return
	var t0: int = Time.get_ticks_usec()
	while not _pendientes.is_empty():
		var e: Dictionary = _pendientes.pop_at(_siguiente())


		if _oculta(e["thumb"]):
			_pendiente_de.erase(e["thumb"])
			_dormidas[e["thumb"]] = {"key": e["key"], "opt": e["opt"]}
			continue
		_pinta(e)


		if Time.get_ticks_usec() - t0 >= PRESUPUESTO_US:
			break
	if _pendientes.is_empty():
		set_process(false)
		_refresca_fichas()








func termina_miniaturas() -> void:
	while not _pendientes.is_empty():
		_pinta(_pendientes.pop_front())
	for t in _dormidas.keys():
		var d: Dictionary = _dormidas[t]
		_pinta({"thumb": t, "key": d["key"], "opt": d["opt"]})
	_dormidas.clear()
	set_process(false)
	_refresca_fichas()



func _clave(key: String, opt: String) -> String:
	return "%s/%s/%s" % [key, opt, _firma(key)]





func _firma(key: String) -> String:
	var de: int = _cfg.hash()
	if de != _firmas_de:
		_firmas.clear()
		_firmas_de = de
	if _firmas.has(key):
		return _firmas[key]
	var fuera: Array = [] if key == "_preset" else [key, "mask", "modular_mask"]
	var llaves: Array = _cfg.keys()
	llaves.sort()
	var partes: PackedStringArray = []
	for k in llaves:
		if not fuera.has(k):
			partes.append("%s=%s" % [k, var_to_str(_cfg[k])])
	var firma: String = ";".join(partes)
	_firmas[key] = firma
	return firma





func _oculta(thumb: TextureRect) -> bool:
	if not is_instance_valid(thumb):
		return false
	for part in _part_nodes:
		if part == _part:
			continue
		for node: Control in _part_nodes[part]:
			if node == thumb or node.is_ancestor_of(thumb):
				return true
	return false



func _despierta() -> void:
	for t in _dormidas.keys():
		if not is_instance_valid(t):
			_dormidas.erase(t)
		elif not _oculta(t):
			var d: Dictionary = _dormidas[t]
			_dormidas.erase(t)
			_encola(t, String(d["key"]), String(d["opt"]))




static func termina_en(raiz: Node) -> void:
	if raiz == null:
		return
	if raiz is LookEditor:
		(raiz as LookEditor).termina_miniaturas()
	for hijo in raiz.get_children():
		termina_en(hijo)




func _siguiente() -> int:
	var vista: Rect2 = get_viewport_rect()
	for i in _pendientes.size():
		var t: TextureRect =(_pendientes[i] as Dictionary)["thumb"]
		if not is_instance_valid(t) or not t.is_visible_in_tree():
			continue
		if vista.intersects(t.get_global_rect()):
			return i
	return 0



func _pinta(e: Dictionary) -> void:
	var t: TextureRect = e["thumb"]
	_pendiente_de.erase(t)
	if not is_instance_valid(t):
		return
	var key: String = String(e["key"])
	var opt: String = String(e["opt"])
	var tex: Texture2D = _thumb_tex(key, opt)
	t.texture = tex
	var clave: String = _clave(key, opt)
	_memo[clave] = tex
	_memo_orden.append(clave)
	while _memo_orden.size() > MEMO_MAX:
		_memo.erase(_memo_orden.pop_front())







func _es_cabeza(key: String) -> bool:
	if key == "_preset" or key == "kit_sleeves" or key == "_acc":
		return false
	if key in ["tattoo_style", "tattoo_pattern", "tattoo_leg_style", "tattoo_leg_pattern",
			"wristband_style", "arm_sleeve_style", "arm_wrap_style", "sock_style",
			"tights_style", "knee_style", "knee_kind"]:
		return false
	return not (key.begins_with("casual_") or key.begins_with("acc_")
		or key.begins_with("gala_"))






func _thumb_tex(key: String, opt: String) -> Texture2D:
	if solo_pieza and (key == "_preset" or key.begins_with("casual_") or key.begins_with("acc_")):
		var sola: Texture2D = _pieza_sola(key, opt)
		if sola != null:
			return sola
	if key == "_preset":
		return _outfit_texture(KitRecolor.WARDROBE.PRESETS[opt], "casual")
	var cfg: Dictionary = _cfg.duplicate()
	cfg.erase("mask")
	cfg.erase("modular_mask")
	cfg[key] = opt
	var clothing: bool = key.begins_with("casual_") or key.begins_with("acc_")
	var arms: bool = key in ["tattoo_style", "tattoo_pattern"]
	var legs: bool = key in ["tattoo_leg_style", "tattoo_leg_pattern"]
	if legs:
		cfg.erase("tattoo_leg")
		cfg.erase("tattoo_leg_pat")
		if key == "tattoo_leg_pattern" and str(cfg.get("tattoo_leg_style", "none")) == "none":
			cfg["tattoo_leg_style"] = "both"
	if arms:
		cfg.erase("tattoo")
		cfg.erase("tattoo_pat")
		cfg["kit_sleeves"] = "corta"
		cfg.erase("long_sleeves")
		if key == "tattoo_pattern" and cfg.get("tattoo_style", "none") == "none":
			cfg["tattoo_style"] = "both"
	if key == "modular_face_tattoo_side" and cfg.get("modular_face_tattoo", "none") == "none":
		cfg["modular_face_tattoo"] = "dot"
	if key == "modular_hair_accessory" and opt == "tie" and not Appearance.es_atable(LookMigracion.pelo(str(cfg.get("modular_hair", LookMigracion.PELO_POR_DEFECTO)))):
		cfg["modular_hair"] = "p_colita"
	if clothing:
		if key == "acc_pocket" and cfg.get("casual_outer", "none") not in ["blazer", "gabardina", "abrigo"]:
			cfg["casual_outer"] = "blazer"
		if key in ["casual_top", "casual_print", "casual_sleeves"]:
			cfg["casual_outer"] = "none"
		if key == "casual_outer_state" and cfg.get("casual_outer", "none") == "none":
			cfg["casual_outer"] = "chamarra"
		cfg = KitRecolor.casual_of(cfg)
	var source: Texture2D = PLAYER_TEX
	if key.begins_with("gala_"):
		source = preload("res://assets/sprites/anim/idle_south_00.png")
		cfg = KitRecolor.GALA_WEAR.preview_cfg(cfg)
	var tex: Texture2D = KitRecolor.apply(source, cfg)
	var img: Image = SceneFade.imagen_copia(tex)
	if img == null:
		return tex
	if img.is_compressed():
		img.decompress()
	var bb: Rect2i = img.get_used_rect()
	if bb.size.y <= 0:
		return tex
	if clothing or key == "kit_sleeves" or key.begins_with("gala_") or arms or legs:
		var region: Rect2i = bb
		if arms:
			region.position.y += int(bb.size.y * 0.27)
			region.size.y = maxi(int(bb.size.y * 0.49), 1)
		elif legs:


			region.position.y += int(bb.size.y * 0.66)
			region.size.y = maxi(bb.size.y - int(bb.size.y * 0.66), 1)
		return ImageTexture.create_from_image(img.get_region(region))




	var ventana: Rect2i = VENTANA_CUELLO if key == "modular_neck_tattoo" else VENTANA_CABEZA
	var head: Rect2i = ventana.intersection(
		Rect2i(Vector2i.ZERO, img.get_size()))
	if head.size.x <= 0 or head.size.y <= 0:
		head = Rect2i(bb.position, Vector2i(bb.size.x, maxi(bb.size.y / 2, 1)))
	return ImageTexture.create_from_image(img.get_region(head))





const TINTES_DE: Dictionary = {
	"casual_top": ["casual_shirt", "casual_shirt2"],
	"casual_print": ["casual_shirt", "casual_shirt2"],
	"casual_sleeves": ["casual_shirt", "casual_shirt2"],
	"casual_pants_style": ["casual_pants"], "casual_pants_len": ["casual_pants"],
	"casual_outer": ["casual_outer_color"], "casual_outer_state": ["casual_outer_color"],
	"casual_shoes": ["casual_shoes_color"],
}


const FABRICA_DE: Dictionary = {"casual_top": "playera", "casual_print": "solid",
	"casual_pants_style": "recto", "casual_outer": "none", "casual_shoes": "bajos"}

const TINTES_CALLE: Array[String] = ["casual_shirt", "casual_shirt2", "casual_pants",
	"casual_outer_color", "casual_shoes_color", "acc_head_color", "acc_cloth", "acc_metal"]


const TINTE_TESTIGO: Color = Color8(3, 252, 1)

const PELO_TESTIGO: Color = Color8(1, 3, 252)




const PIEZA_POCOS: int = 24
const PIEZA_ZONA: Vector2i = Vector2i(18, 16)
const PIEZA_FANTASMA: float = 0.3

const PIEZA_ZOOM_MAX: int = 6





func _caja_pieza() -> Vector2i:
	return VENTANA_CABEZA.size *(ZOOM_TIRA if tira else ZOOM_VESTIDOR)




func _lienzo(cfg: Dictionary) -> Image:
	var img: Image = SceneFade.imagen_copia(KitRecolor.apply(PLAYER_TEX, KitRecolor.casual_of(cfg)))
	if img == null:
		return null
	if img.is_compressed():
		img.decompress()
	img.convert(Image.FORMAT_RGBA8)
	return img












func _pieza_sola(key: String, opt: String, sin_abrigo: bool = false) -> Texture2D:
	var caja: Vector2i = _caja_pieza()
	var vacia: Texture2D = ImageTexture.create_from_image(
		Image.create(caja.x, caja.y, false, Image.FORMAT_RGBA8))
	var cfg: Dictionary = _cfg.duplicate()
	if key == "_preset":
		cfg = KitRecolor.WARDROBE.wear(_cfg, KitRecolor.WARDROBE.PRESETS[opt], "casual")
	else:
		cfg[key] = opt
	cfg.erase("mask")
	cfg.erase("modular_mask")



	if key == "acc_pocket" and cfg.get("casual_outer", "none") not in ["blazer", "gabardina", "abrigo"]:
		cfg["casual_outer"] = "blazer"
	if sin_abrigo or key in ["casual_top", "casual_print", "casual_sleeves", "casual_pants_style",
			"casual_pants_len"]:
		cfg["casual_outer"] = "none"
	if key in ["casual_pants_style", "casual_pants_len"]:
		cfg["acc_belt"] = "none"
	if key == "casual_outer_state" and cfg.get("casual_outer", "none") == "none":
		cfg["casual_outer"] = "chamarra"
	var testigo: Dictionary = cfg.duplicate()
	if key == "_preset":
		testigo = KitRecolor.WARDROBE.wear(cfg, {}, "casual")
		for t in TINTES_CALLE:
			testigo[t] = TINTE_TESTIGO
	elif TINTES_DE.has(key):
		for t in TINTES_DE[key]:
			testigo[t] = TINTE_TESTIGO
		if opt.begins_with("p_"):
			testigo[key] = FABRICA_DE.get(key, "")
	elif opt != "none":
		testigo[key] = "none"
	else:
		return vacia
	var r: Image = _lienzo(cfg)
	var t_img: Image = _lienzo(testigo)
	if r == null or t_img == null:
		return vacia




	var piel: Image = null
	if not (TINTES_DE.has(key) and not opt.begins_with("p_")):
		var cp: Dictionary = cfg.duplicate()
		cp["skin"] = TINTE_TESTIGO
		cp["hair"] = PELO_TESTIGO
		if cp.has("hair_tips"):
			cp["hair_tips"] = PELO_TESTIGO
		piel = _lienzo(cp)
	var sola: Image = Image.create(r.get_width(), r.get_height(), false, Image.FORMAT_RGBA8)
	var usado: Rect2i = r.get_used_rect()
	var n: int = 0
	for y in range(usado.position.y, usado.end.y):
		for x in range(usado.position.x, usado.end.x):
			var c: Color = r.get_pixel(x, y)
			if c.a <= 0.0 or t_img.get_pixel(x, y) == c:
				continue
			if piel != null and piel.get_pixel(x, y) != c:
				continue
			sola.set_pixel(x, y, c)
			n += 1
	var bb: Rect2i = sola.get_used_rect()
	if not bb.has_area():

		if opt == "none":
			return vacia
		if not sin_abrigo and String(cfg.get("casual_outer", "none")) != "none" \
				and key not in ["casual_outer", "casual_outer_state", "acc_pocket"]:
			return _pieza_sola(key, opt, true)
		return null

	var marco: Rect2i = bb.grow(1)
	var en_zona: bool = key == "casual_shoes" or n < PIEZA_POCOS or mini(bb.size.x, bb.size.y) <= 2
	if en_zona:
		marco = Rect2i(Vector2i.ZERO, PIEZA_ZONA.max(bb.size + Vector2i(2, 2)))
		marco.position =(bb.get_center() - marco.size / 2).clamp(Vector2i.ZERO, r.get_size() - marco.size)
	var recorte: Image = Image.create(marco.size.x, marco.size.y, false, Image.FORMAT_RGBA8)
	for y in marco.size.y:
		for x in marco.size.x:
			var p: Vector2i = marco.position + Vector2i(x, y)
			if not Rect2i(Vector2i.ZERO, r.get_size()).has_point(p):
				continue
			var c: Color = sola.get_pixelv(p)
			if c.a <= 0.0 and en_zona:
				c = r.get_pixelv(p)
				c.a *= PIEZA_FANTASMA
			recorte.set_pixel(x, y, c)
	_contorno(recorte, sola, marco.position)
	var k: int = mini(mini(caja.x / recorte.get_width(), caja.y / recorte.get_height()), PIEZA_ZOOM_MAX)
	if k < 1:


		return ImageTexture.create_from_image(recorte)
	recorte.resize(recorte.get_width() * k, recorte.get_height() * k, Image.INTERPOLATE_NEAREST)
	var out: Image = Image.create(caja.x, caja.y, false, Image.FORMAT_RGBA8)
	out.blit_rect(recorte, Rect2i(Vector2i.ZERO, recorte.get_size()),(caja - recorte.get_size()) / 2)
	return ImageTexture.create_from_image(out)







func _contorno(img: Image, pieza: Image, origen: Vector2i) -> void:
	var lim: Rect2i = Rect2i(Vector2i.ZERO, pieza.get_size())
	for y in img.get_height():
		for x in img.get_width():
			var p: Vector2i = origen + Vector2i(x, y)
			if not lim.has_point(p) or pieza.get_pixelv(p).a > 0.0:
				continue
			for d: Vector2i in [Vector2i.LEFT, Vector2i.RIGHT, Vector2i.UP, Vector2i.DOWN]:
				if lim.has_point(p + d) and pieza.get_pixelv(p + d).a > 0.0:
					img.set_pixel(x, y, CareerTheme.TEXT_DIM)
					break









func _add_libre_swatch(row: Container, key: String) -> void:
	var b: Button = Button.new()
	b.custom_minimum_size = Vector2.ONE *(TIRA_MUESTRA if tira else 92.0)
	b.text = "+"
	b.add_theme_color_override("font_color", CareerTheme.TEXT_DIM)
	b.add_theme_font_size_override("font_size", 40)
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CareerTheme.SURFACE_LINE
	sb.set_corner_radius_all(4)
	sb.border_color = CareerTheme.SURFACE_LINE
	sb.set_border_width_all(SWATCH_CANTO)
	b.add_theme_stylebox_override("normal", sb)
	b.add_theme_stylebox_override("hover", sb)
	b.add_theme_stylebox_override("pressed", sb)
	b.add_theme_stylebox_override("disabled", sb)
	UiKit.add_feedback(b)
	b.pressed.connect(_open_libre.bind(key))
	row.add_child(b)
	_groups[key].append({"button": b, "value": Color.TRANSPARENT, "style": sb,
		"libre": true})






func _open_libre(key: String) -> void:






	var box: VBoxContainer = CareerUi.modal(_modal_host())
	if box == null:
		return
	CareerUi.head(box, I18n.t("Color libre"))


	var previo: Variant = _cfg.get(key, null)
	var base: Color = _originals.get(key, Color.BLACK)



	var tira: HBoxContainer = HBoxContainer.new()
	tira.add_theme_constant_override("separation", 12)
	box.add_child(tira)
	var antes: Color = _cfg.get(key, base)
	_swatch_chip(tira, I18n.t("ANTES"), antes)
	var ahora_chip: ColorRect = _swatch_chip(tira, I18n.t("AHORA"), antes)

	var picker: ColorPicker = ColorPicker.new()
	picker.edit_alpha = false






	picker.presets_visible = false
	picker.can_add_swatches = false
	picker.sampler_visible = false
	picker.color_modes_visible = false
	picker.sliders_visible = false
	picker.hex_visible = false
	picker.picker_shape = ColorPicker.SHAPE_HSV_WHEEL





	picker.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	picker.add_theme_constant_override("sv_width", 520)
	picker.add_theme_constant_override("sv_height", 520)
	picker.color = antes
	picker.color_changed.connect(func(c: Color) -> void:
		ahora_chip.color = c
		_on_color_picked(key, c, base))
	box.add_child(picker)

	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 12)
	box.add_child(fila)
	var cancelar: Button = Button.new()
	cancelar.text = I18n.t("CANCELAR")
	cancelar.custom_minimum_size = Vector2(0, 92)
	cancelar.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	CareerTheme.apply_button(cancelar, CareerTheme.Kind.GHOST, 26)
	cancelar.pressed.connect(func() -> void:


		_on_color_picked(key, previo if previo is Color else base, base)
		CareerUi.close_modal(box))
	fila.add_child(cancelar)
	var cerrar: Button = Button.new()
	cerrar.text = I18n.t("LISTO")
	cerrar.custom_minimum_size = Vector2(0, 92)
	cerrar.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	CareerTheme.apply_button(cerrar, CareerTheme.Kind.PRIMARY, 26)


	cerrar.pressed.connect(func() -> void: CareerUi.close_modal(box))
	fila.add_child(cerrar)




func _swatch_chip(parent: Container, caption: String, color: Color) -> ColorRect:
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 4)
	col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	parent.add_child(col)
	var cap: Label = CareerUi.plain(15, CareerTheme.TEXT_DIM)
	cap.text = caption
	cap.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	col.add_child(cap)
	var rect: ColorRect = ColorRect.new()
	rect.color = color
	rect.custom_minimum_size = Vector2(0, 64)
	col.add_child(rect)
	return rect





func _modal_host() -> Node:
	var scene: Node = get_tree().current_scene if is_inside_tree() else null
	return scene if scene != null and scene != self else self


func _on_color_picked(key: String, color: Color, original: Color) -> void:
	if color.is_equal_approx(original):
		_cfg.erase(key)
	else:
		_cfg[key] = color
	_mark()
	changed.emit(cfg())





func _pinta_precio(entrada: Dictionary, key: String) -> void:
	var lbl: Variant = entrada.get("precio", null)
	if lbl == null or not is_instance_valid(lbl):
		return
	var precio: int = _precio(key, String(entrada["value"]))
	var l: Label = lbl as Label
	if precio > 0:
		l.text = "$" + CareerUi.money(precio)
		l.add_theme_color_override("font_color", CareerTheme.MONEY)
		return



	l.text = I18n.t("TUYA") if modo_tienda else ""
	l.add_theme_color_override("font_color", CareerTheme.TEXT_DIM)


func _refresca_precios() -> void:
	for key in _groups:
		if key == "_acc":
			continue
		for entrada in _groups[key]:
			if entrada is Dictionary and entrada.has("precio"):
				_pinta_precio(entrada, String(key))









func _abre_compra(key: String, value: String, default_val: String, precio: int) -> void:
	var box: VBoxContainer = CareerUi.modal(_modal_host())
	if box == null:
		return
	CareerUi.head(box, I18n.t("¿Te la compras?"))
	var nombre: String = _nombre_de(key, value)
	if not nombre.is_empty():
		var n: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT)
		n.text = nombre
		n.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER


		n.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		box.add_child(n)
	var d: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
	d.text = I18n.t("Va a tu clóset: te la pones en PERSONALIZAR.")
	d.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	d.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	box.add_child(d)

	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 12)
	box.add_child(fila)
	var cancelar: Button = Button.new()
	cancelar.text = I18n.t("CANCELAR")
	cancelar.custom_minimum_size = Vector2(0, 92)
	cancelar.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	CareerTheme.apply_button(cancelar, CareerTheme.Kind.GHOST, 26)
	cancelar.pressed.connect(func() -> void: CareerUi.close_modal(box))
	fila.add_child(cancelar)
	var comprar: Button = Button.new()
	comprar.custom_minimum_size = Vector2(0, 92)
	comprar.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	comprar.clip_text = true
	if dinero < precio:
		comprar.text = I18n.tf("TE FALTA {0}", [CareerUi.short_money(precio - dinero)])
		CareerTheme.apply_button(comprar, CareerTheme.Kind.NEUTRAL, 22)
		comprar.disabled = true
	else:
		comprar.text = I18n.tf("COMPRAR ${0}", [CareerUi.money(precio)])
		CareerTheme.apply_button(comprar, CareerTheme.Kind.PRIMARY, 22)
		comprar.pressed.connect(func() -> void:
			CareerUi.close_modal(box)
			if not bool(pagar.call(key, value)):
				return
			dinero -= precio



			if key == "_preset":
				owned.append_array(Shop.casual_preset_ids(
					KitRecolor.WARDROBE.PRESETS.get(value, {}), owned))
			else:
				owned.append(Shop.wardrobe_id(key, value))
			_refresca_precios())
	fila.add_child(comprar)






func _nombre_de(key: String, value: String) -> String:
	for entrada in _groups.get(key, []):
		if entrada is Dictionary and String(entrada.get("value", "")) == value:
			return String((entrada["button"] as Button).tooltip_text)
	return ""


func _on_text_picked(key: String, value: String, default_val: String) -> void:


	if modo_tienda:
		var precio: int = _precio(key, value)
		if precio > 0:
			_abre_compra(key, value, default_val, precio)
		return
	_viste(key, value, default_val)




func _viste(key: String, value: String, default_val: String) -> void:
	if key == "_preset":
		_wear_outfit(KitRecolor.WARDROBE.PRESETS[value], "casual")
		return
	if key.begins_with("modular_"):
		_cfg[key] = value
	elif value == default_val:
		_cfg.erase(key)
	else:
		_cfg[key] = value
	_mark()
	changed.emit(cfg())










func _add_outfit_row() -> void:


	if modo_tienda:
		return
	var outfits: Array = Shop.casual_outfits(unlocked)
	if outfits.is_empty():
		return
	var row: Container = _fila_nueva(I18n.t("Atuendo"))
	for o in outfits:
		var b: Button = Button.new()
		b.text = CareerTheme.caps(I18n.t(String(o["name"])))
		b.custom_minimum_size = Vector2(0, TIRA_TEXTO if tira else 84.0)


		b.clip_text = true
		CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, 24)
		b.pressed.connect(_on_outfit_picked.bind(o["cfg"] as Dictionary))
		row.add_child(b)






const CASUAL_DEFAULTS: Dictionary = {
	"casual_shirt": null, "casual_shirt2": null, "casual_pants": null,
	"casual_print": "solid", "casual_sleeves": "corta", "acc_face": "none",
	"casual_top": "playera", "casual_pants_len": "largo",
	"acc_head": "none", "acc_head_color": null,
}








func _on_outfit_picked(outfit: Dictionary) -> void:
	for key in CASUAL_DEFAULTS:
		_cfg.erase(key)
	for key in outfit:
		var val: Variant = outfit[key]
		var def: Variant = _default_of(String(key))
		var same: bool =(val is Color and def is Color \
				and (val as Color).is_equal_approx(def as Color)) \
				or (not (val is Color) and val == def)
		if not same:
			_cfg[key] = val
	_mark()
	changed.emit(cfg())





func _default_of(key: String) -> Variant:
	match key:
		"casual_shirt":
			return KitRecolor.CASUAL_SHIRTS[0]
		"casual_shirt2":
			return KitRecolor.CASUAL_SHIRTS[1]
		"casual_pants":
			return KitRecolor.CASUAL_PANTS[0]
		"acc_head_color":
			return KitRecolor.HEAD_ACC_COLORS[0]
	return CASUAL_DEFAULTS.get(key, null)





func _add_accessory_row() -> void:


	if modo_tienda:
		return
	var row: Container = _fila_nueva(I18n.t("Accesorio de cabeza"))
	_groups["_acc"] = []
	for item in HEAD_ACC:
		var b: Button = Button.new()
		b.text = CareerTheme.caps(I18n.t(String(item["name"])))
		b.custom_minimum_size = Vector2(0, TIRA_TEXTO if tira else 84.0)
		CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, 24)
		b.pressed.connect(_on_acc_picked.bind(item))
		row.add_child(b)
		_groups["_acc"].append({"button": b, "value": item})


func _on_acc_picked(item: Dictionary) -> void:

	_cfg.erase("mask")
	_cfg.erase("headband")
	match String(item["id"]):
		"mask":
			_cfg["mask"] = true
		"none":
			pass
		_:
			_cfg["headband"] = item["color"]
	_mark()
	changed.emit(cfg())





func _acc_active_id() -> String:
	if _cfg.has("mask"):
		return "mask"
	if _cfg.has("headband"):
		var c: Color = _cfg["headband"]
		for item in HEAD_ACC:
			if item.has("color") and (item["color"] as Color).is_equal_approx(c):
				return String(item["id"])
		return ""
	return "none"




func _mark() -> void:
	for part in _part_buttons:
		_encola(_part_thumbs[part], PART_PREVIEWS[part][0], PART_PREVIEWS[part][1])
	var acc_id: String = _acc_active_id()
	for key in _groups:
		_apaga_fila(key)
		if key == "_acc":
			for entry in _groups[key]:
				var item: Dictionary = entry["value"]
				var on: bool = String(item["id"]) == acc_id
				_viste_boton(entry, on)
			continue



		if not _groups[key].is_empty() and _groups[key][0]["value"] is Color:




			var want: Color = _originals.get(key, Color.BLACK)
			if _cfg.has(key):
				want = _cfg[key]
			var preset_hit: bool = false
			for entry in _groups[key]:
				if not entry.get("libre", false) \
						and want.is_equal_approx(entry["value"]):
					preset_hit = true
					break
			for entry in _groups[key]:
				var selected: bool
				if entry.get("libre", false):



					selected = _cfg.has(key) and not preset_hit
					var sbl: StyleBoxFlat = entry["style"]
					sbl.bg_color =(_cfg[key] as Color) if selected \
							else CareerTheme.SURFACE_LINE
					(entry["button"] as Button).text = "" if selected else "+"
				else:
					selected = want.is_equal_approx(entry["value"])
				if entry.get("sel", false) != selected:
					var sb: StyleBoxFlat = entry["style"]
					sb.border_color = CareerTheme.accent_text() if selected \
							else CareerTheme.SURFACE_LINE
					sb.set_border_width_all(SWATCH_MARCA if selected else SWATCH_CANTO)
					entry["sel"] = selected
			continue

		for entry in _groups[key]:
			var v: Variant = entry["value"]
			var default_sel: bool = not _cfg.has(key) and v == _originals.get(key, _groups[key][0]["value"])
			var picked: bool =(_cfg.has(key) and String(_cfg[key]) == String(v)) \
					or default_sel
			if key == "_preset":
				picked = KitRecolor.WARDROBE.snapshot(_cfg, "casual") == KitRecolor.WARDROBE.PRESETS[v]
			if key == "casual_pants_len":
				var shorts: bool = str(_cfg.get("casual_pants_style", "recto")) in ["deportivo", "short_denim", "short_cargo", "short_chino", "bano"]
				(entry["button"] as Button).disabled = shorts
				if shorts:
					picked = str(v) == "corto"
			if key == "casual_sleeves":
				var forced: bool = str(_cfg.get("casual_top", "playera")) in KitRecolor.CASUAL_LONG_TOPS
				(entry["button"] as Button).disabled = forced or str(_cfg.get("casual_top", "playera")) in ["sin_mangas", "camisa_abierta"]
				if str(_cfg.get("casual_top", "playera")) in ["sin_mangas", "camisa_abierta"]:
					picked = str(v) == "corta"
				if forced:
					picked = str(v) == "larga"
			_viste_boton(entry, picked)



			if entry.has("thumb"):
				_encola(entry["thumb"] as TextureRect, String(key), String(v))
	_refresca_fichas()




const SWATCH_CANTO: int = 2
const SWATCH_MARCA: int = 7







const DEPENDE_DE: Dictionary = {
	"modular_face_tattoo_side": ["modular_face_tattoo", "none"],
	"face_tattoo_color": ["modular_face_tattoo", "none"],
	"tattoo_pattern": ["tattoo_style", "none"],
	"tattoo_color": ["tattoo_style", "none"],
	"neck_tattoo_color": ["modular_neck_tattoo", "none"],
	"tattoo_leg_pattern": ["tattoo_leg_style", "none"],
	"tattoo_leg_color": ["tattoo_leg_style", "none"],
	"wristband_color": ["wristband_style", "none"],
	"arm_sleeve_color": ["arm_sleeve_style", "none"],
	"sock_tape_color": ["sock_style", "none"],
	"knee_kind": ["knee_style", "none"],
}







func _viste_boton(entry: Dictionary, on: bool) -> void:
	var kind: int = CareerTheme.Kind.PRIMARY if on else CareerTheme.Kind.NEUTRAL
	if int(entry.get("kind", CareerTheme.Kind.NEUTRAL)) == kind:
		return
	CareerTheme.style_button(entry["button"], kind, 24)
	entry["kind"] = kind



func _apaga_fila(key: String) -> void:
	if not DEPENDE_DE.has(key):
		return
	var madre: Array = DEPENDE_DE[key]
	var apagada: bool = str(_cfg.get(madre[0], madre[1])) == str(madre[1])
	for entry in _groups[key]:
		if entry.get("apagada", false) == apagada:
			continue
		var b: Button = entry["button"]
		b.disabled = apagada
		b.modulate.a = 0.4 if apagada else 1.0
		entry["apagada"] = apagada
