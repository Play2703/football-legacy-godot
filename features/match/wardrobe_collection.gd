extends RefCounted

const TOPS: Dictionary = {"entrenamiento": "Entrenamiento", "grafica": "Playera gráfica",
	"jersey_retro": "Jersey retro", "polo_tejido": "Polo tejido", "lino": "Camisa de lino",
	"cuarto_cierre": "Cierre corto", "rugby": "Polo rugby"}
const OUTERS: Dictionary = {"varsity": "Varsity", "gabardina": "Gabardina", "acolchada": "Acolchada",
	"sobrecamisa": "Sobrecamisa", "parka": "Parka"}
const PANTS: Dictionary = {"pants": "Pants deportivos", "pinzas": "Pantalón de pinzas",
	"barril": "Jeans barril", "tecnico": "Cargo técnico"}
const SHOES: Dictionary = {"retro": "Tenis retro", "running": "Tenis deportivos", "charol": "Zapatos de charol",
	"gruesos": "Tenis gruesos"}



const NECKWEAR: Dictionary = {"none": "Ninguno", "corbata": "Corbata", "mono": "Corbata de moño", "bufanda": "Bufanda"}
const BELTS: Dictionary = {"none": "Ninguno", "cuero": "Cinturón de cuero", "hebilla": "Hebilla metálica"}
const POCKETS: Dictionary = {"none": "Ninguno", "recto": "Pañuelo recto", "pico": "Pañuelo de pico"}
const PRESET_NAMES: Dictionary = {"entrenamiento": "Entrenamiento", "gimnasio": "Gimnasio",
	"streetwear": "Streetwear", "retro": "Retro", "elegante": "Casual elegante", "invierno": "Invierno", "varsity": "Varsity",
	"vaquero": "Vaquero", "playero": "Playero", "rockero": "Rockero", "urbano": "Urbano",
	"nevada": "Día de nieve", "festival": "Festival", "llegada": "Llegada al estadio",
	"aeropuerto": "Aeropuerto", "rueda_prensa": "Rueda de prensa", "terraza": "Terraza clásica"}
const PRESETS: Dictionary = {
	"entrenamiento": {"casual_top": "entrenamiento", "casual_pants_style": "pants", "casual_shirt": Color("34465d"), "casual_shirt2": Color("ebe6d4"), "casual_pants": Color("34465d"), "casual_shoes": "running"},
	"gimnasio": {"casual_top": "sin_mangas", "casual_pants_style": "deportivo", "casual_shirt": Color("a9b99b"), "casual_pants": Color("30363c"), "casual_shoes": "running", "acc_watch": "deportivo"},
	"streetwear": {"casual_top": "grafica", "casual_pants_style": "cargo", "casual_shirt": Color("373642"), "casual_shirt2": Color("dda85a"), "casual_pants": Color("777959"), "casual_shoes": "retro", "acc_neck": "cadena"},
	"retro": {"casual_top": "jersey_retro", "casual_pants_style": "ancho", "casual_shirt": Color("873d4b"), "casual_shirt2": Color("e7d4ad"), "casual_pants": Color("495773"), "casual_shoes": "retro"},
	"elegante": {"casual_top": "polo_tejido", "casual_pants_style": "pinzas", "casual_shirt": Color("c6b393"), "casual_shirt2": Color("765d4b"), "casual_pants": Color("51473e"), "casual_shoes": "mocasines", "acc_belt": "cuero", "acc_watch": "reloj"},
	"invierno": {"casual_top": "cuello_alto", "casual_outer": "gabardina", "casual_outer_color": Color("aa8c68"), "casual_shirt": Color("343541"), "casual_pants_style": "pinzas", "casual_pants": Color("353842"), "casual_shoes": "chelsea", "acc_neckwear": "bufanda", "acc_cloth": Color("a14c4a")},
	"varsity": {"casual_top": "playera", "casual_outer": "varsity", "casual_outer_color": Color("37594e"), "casual_shirt2": Color("e2d6b8"), "casual_pants_style": "jeans", "casual_pants": Color("485b76"), "casual_shoes": "retro"},






	"vaquero": {"casual_top": "camisa", "casual_pants_style": "jeans", "casual_shirt": Color("d8cdb4"), "casual_pants": Color("3f5478"), "casual_shoes": "botas", "acc_belt": "hebilla", "acc_head": "p_sombrero_vaquero", "acc_neck": "p_panuelo_al_cuello"},
	"playero": {"casual_top": "p_camisa_hawaiana", "casual_pants_style": "chinos", "casual_shirt": Color("f0e6d0"), "casual_pants": Color("b89868"), "casual_shoes": "sandalias", "acc_head": "p_visera", "acc_face": "p_lentes_ambar"},
	"rockero": {"casual_top": "p_playera_calavera", "casual_pants_style": "jeans", "casual_shirt": Color("222228"), "casual_pants": Color("26272d"), "casual_shoes": "botas", "acc_belt": "hebilla", "acc_head": "p_bandana"},
	"urbano": {"casual_top": "p_playera_camuflaje", "casual_pants_style": "cargo", "casual_shirt": Color("4a5332"), "casual_pants": Color("2b2c30"), "casual_shoes": "altos", "acc_head": "p_gorra_trucker", "acc_neck": "p_cadena_cubana"},
	"nevada": {"casual_top": "cuello_alto", "casual_outer": "acolchada", "casual_outer_color": Color("b8323a"), "casual_shirt": Color("ece7da"), "casual_pants_style": "jeans", "casual_pants": Color("3b4a63"), "casual_shoes": "botas", "acc_head": "p_gorro_con_pompon"},
	"festival": {"casual_top": "p_playera_tie_dye", "casual_pants_style": "jeans", "casual_shirt": Color("e8c84a"), "casual_pants": Color("6f8fb5"), "casual_shoes": "slides", "acc_head": "p_audifonos", "acc_face": "p_visor_espejado"},
	"llegada": {"casual_top": "cuarto_cierre", "casual_pants_style": "tecnico", "casual_shirt": Color("263d52"), "casual_shirt2": Color("d2b56b"), "casual_pants": Color("303740"), "casual_shoes": "gruesos", "casual_shoes_color": Color("e5e1d7"), "acc_watch": "lujo"},
	"aeropuerto": {"casual_top": "oversize", "casual_outer": "sobrecamisa", "casual_outer_state": "abierta", "casual_shirt": Color("e7dfcf"), "casual_outer_color": Color("596b5d"), "casual_pants_style": "barril", "casual_pants": Color("4f6280"), "casual_shoes": "gruesos", "casual_shoes_color": Color("d8d3c7")},
	"rueda_prensa": {"casual_top": "polo_tejido", "casual_outer": "sobrecamisa", "casual_outer_state": "abierta", "casual_shirt": Color("d7c5a5"), "casual_shirt2": Color("6f5748"), "casual_outer_color": Color("3e4853"), "casual_pants_style": "pinzas", "casual_pants": Color("45484d"), "casual_shoes": "mocasines", "acc_watch": "reloj"},
	"terraza": {"casual_top": "rugby", "casual_outer": "parka", "casual_outer_state": "abierta", "casual_shirt": Color("e7dfcf"), "casual_shirt2": Color("7d3040"), "casual_outer_color": Color("384d42"), "casual_pants_style": "jeans", "casual_pants": Color("465a77"), "casual_shoes": "retro"},
}

static func belongs(key: String, kind: String) -> bool:
	return key.begins_with("gala_") if kind == "gala" else key.begins_with("casual_") or key.begins_with("acc_")

static func snapshot(base: Dictionary, kind: String) -> Dictionary:
	var result: Dictionary = {}
	for key in base:
		if belongs(str(key), kind):
			result[key] = base[key]
	return result

static func wear(base: Dictionary, clothes: Dictionary, kind: String) -> Dictionary:
	var result: Dictionary = base.duplicate()
	for key in result.keys():
		if belongs(str(key), kind):
			result.erase(key)
	result.merge(snapshot(clothes, kind), true)
	return result


static func sanitize(data: Variant) -> Array:
	var result: Array = []
	if not data is Array:
		return result
	for item in data:
		if not item is Dictionary or not item.get("look") is Dictionary:
			continue
		var kind: String = str(item.get("kind", "casual"))
		if kind not in ["casual", "gala"]:
			continue
		var look: Dictionary = {}
		for key in item.look:
			var value: Variant = item.look[key]
			if belongs(str(key), kind) and value is String:
				if str(key) in KitRecolor.STYLE_KEYS or Color.html_is_valid(value):
					look[key] = value
		result.append({"name": str(item.get("name", "Outfit")).strip_edges().left(32), "kind": kind, "look": look})
	return result


static func paint(img: Image, source: Image, mask: Dictionary, cfg: Dictionary, view: String, head: Vector2i) -> void:
	var box: Rect2i = KitRecolor.CASUAL_DETAILS._torso(mask, head.x)
	if box.size.y < 1:
		return
	var cx: int = box.get_center().x
	if view == "right": cx = box.end.x - 2
	elif view == "left": cx = box.position.x + 1
	var front: bool = view != "back"
	var profile: bool = view in ["left", "right"]
	var outer: String = str(cfg.get("street_outer", "none"))
	var top: String = str(cfg.get("street_garment", "playera"))
	var cloth: Color = cfg.get("casual_shirt", Color("e8e6ea"))
	var accent: Color = cfg.get("casual_shirt2", Color("b69b75"))
	var accessory: Color = cfg.get("acc_cloth", Color("733344"))
	var metal: Color = cfg.get("acc_metal", Color("d7b76d"))
	var neckwear: String = str(cfg.get("acc_neckwear", "none"))
	var pocket: String = str(cfg.get("acc_pocket", "none"))
	var neck_y: int = box.position.y
	while neck_y < box.end.y and not mask.has(Vector2i(cx, neck_y)):
		neck_y += 1
	for p: Vector2i in mask:
		var x: int = p.x - cx
		var y: int = p.y - box.position.y
		var n: int = p.y - neck_y
		var ink: Color = Color.TRANSPARENT
		var exposed: bool = outer == "none" or (front and cfg.get("casual_outer_state", "abierta") == "abierta" and absi(x) <= 2)
		if exposed:
			match top:
				"grafica":

					if view == "front" and y in range(5, 12) and absi(x) <= 3:
						if absi(x) + absi(y - 8) in [2, 3]: ink = accent
				"entrenamiento":
					if absi(x) in [5, 6] or (front and x in [-3, -2] and y == 5): ink = accent
				"jersey_retro":
					if posmod(x, 5) <= 1: ink = accent
					if y <= 2: ink = cloth.darkened(0.4)
				"polo_tejido":
					if posmod(x, 3) == 0 and posmod(y, 2) == 0: ink = cloth.darkened(0.1)
					if front and y <= 4 and absi(x) == maxi(1, 3 - y): ink = accent
					if front and x == 0 and y in [4, 6]: ink = accent
				"lino":
					if posmod(x + y * 2, 7) == 0: ink = cloth.lightened(0.06)
					if front and x == 0 and y >= 3: ink = cloth.darkened(0.23) if y % 4 else Color("ded4bc")
		if front and neckwear == "corbata" and n in range(0, 9) and absi(x) <=(1 if n < 7 and not profile else 0):
			ink = accessory.lightened(0.12) if x == 0 else accessory.darkened(0.25)
		elif front and neckwear == "mono" and ((n == 1 and absi(x) <=(1 if profile else 2)) or (n in [0, 2] and absi(x) == 2 and not profile)):
			ink = accessory.darkened(0.3) if x == 0 else accessory
		elif neckwear == "bufanda" and ((y in [0, 1, 2] and absi(x) <= 5) or (front and x in ([0, 1] if profile else [2, 3]) and y in range(3, 10))):
			ink = accessory.darkened(0.24) if y % 3 == 0 else accessory
		var chain: String = str(cfg.get("acc_neck", "none"))
		if front and chain in ["cadena", "dije"]:
			if absi(x) <= 3 and n == 1 - absi(x) / 2: ink = metal
			if chain == "dije" and ((x == 0 and n in [2, 3, 4]) or (absi(x) == 1 and n == 3)): ink = metal
		if view == "front" and pocket != "none" and outer in ["blazer", "gabardina", "abrigo"]:
			if x in [-5, -4, -3] and n == 4 or (pocket == "pico" and x == -4 and n == 3):
				ink = accessory.lightened(0.3)
		if ink.a > 0.0:
			var shade: float = clampf(source.get_pixelv(p).v / 0.98, 0.68, 1.0)
			img.set_pixelv(p, ink * Color(shade, shade, shade, 1.0))

	if neckwear == "bufanda":
		for y in range(maxi(0, box.position.y - 1), mini(box.position.y + 3, img.get_height())):
			for x in range(maxi(0, cx - 5), mini(cx + 6, img.get_width())):
				var p: Vector2i = Vector2i(x, y)
				var c: Color = source.get_pixelv(p)
				if c.a > 0.5 and c.s < 0.18 and c.v > 0.5:
					img.set_pixelv(p, accessory.darkened(0.22 if y == box.position.y + 2 else 0.05))

	var belt: String = str(cfg.get("acc_belt", "none"))
	if belt != "none" and outer not in ["abrigo", "gabardina"]:
		var waist: int = -1
		for y in range(box.end.y, mini(box.end.y + 7, img.get_height())):
			for x in range(maxi(box.position.x, 0), mini(box.end.x, img.get_width())):
				var c: Color = source.get_pixel(x, y)
				if c.a > 0.5 and c.s < 0.18 and c.v > 0.5:
					if waist == -1: waist = y
					if y == waist: img.set_pixel(x, y, metal if front and absi(x - cx) <=(1 if belt == "hebilla" else 0) else Color("403129"))
