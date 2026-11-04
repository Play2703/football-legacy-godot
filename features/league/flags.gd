class_name Flags
extends RefCounted












const W: int = 30
const H: int = 20



const RED: Color = Color("d0313b")
const DRED: Color = Color("9e2530")
const CRIMSON: Color = Color("c8102e")
const YELLOW: Color = Color("f3c518")
const GOLD: Color = Color("e2b219")
const GREEN: Color = Color("2a9d5c")
const DGREEN: Color = Color("0b6e4f")
const BLUE: Color = Color("2247a0")
const NAVY: Color = Color("16305f")
const SKY: Color = Color("6ca6dc")
const WHITE: Color = Color("f4f1ec")
const BLACK: Color = Color("1c1c22")
const ORANGE: Color = Color("e0761e")
const BROWN: Color = Color("7a4a28")


const PALETTE: Dictionary = {
	"r": RED, "dr": DRED, "cr": CRIMSON, "y": YELLOW, "go": GOLD, "g": GREEN,
	"dg": DGREEN, "b": BLUE, "nv": NAVY, "sk": SKY, "w": WHITE, "k": BLACK,
	"o": ORANGE, "br": BROWN,
}

static var _cache: Dictionary = {}



static func _col(v: Variant) -> Color:
	if v is Color:
		return v
	var s: String = String(v)
	if PALETTE.has(s):
		return PALETTE[s]
	if Color.html_is_valid(s):
		return Color(s)
	return Color("6b7180")








const NAME_ALIAS: Dictionary = {
	"Francia": "fra", "Países Bajos": "ned", "Brasil": "bra", "Argentina": "arg",
	"Estados Unidos": "usa", "Arabia Saudí": "ksa", "Turquía": "tur", "Bélgica": "bel",

	"Escocia": "sco", "Grecia": "gre", "Ucrania": "ukr", "Austria": "aut", "Suiza": "sui",
	"Chequia": "cze", "Croacia": "cro", "Serbia": "srb", "Dinamarca": "din", "Noruega": "nor",
	"Japón": "jpn", "Corea del Sur": "kor", "Colombia": "col", "Chile": "chi", "Uruguay": "uru",
	"Egipto": "egy",



	"Sudáfrica": "rsa",




	"Catar": "qat",




	"Jordania": "jor",




	"Irán": "irn", "Uzbekistán": "uzb",





	"Paraguay": "par", "Ecuador": "ecu", "Perú": "per", "Bolivia": "bov", "Venezuela": "ven",





	"Marruecos": "mar", "Túnez": "tun",





	"Nueva Zelanda": "nzl", "Fiyi": "fij", "Tahití": "tah", "Nueva Caledonia": "ncal",






	"Suecia": "swe", "Rumanía": "rou",






	"Bosnia y Herzegovina": "bih",

}


static func texture(nation_id: String) -> Texture2D:




	var raw: String = String(NAME_ALIAS.get(nation_id, nation_id))
	var id: String = raw if (SPECS.has(raw) or RECIPES.has(raw)) else raw.to_lower()
	if _cache.has(id):
		return _cache[id]
	var img: Image = Image.create(W, H, false, Image.FORMAT_RGBA8)
	img.fill(Color(0, 0, 0, 0))
	_paint(img, id)
	_border(img, Color(0.08, 0.09, 0.11, 0.85))
	var tex: ImageTexture = ImageTexture.create_from_image(img)
	_cache[id] = tex
	return tex




static func for_team(team: Dictionary) -> Texture2D:
	return texture(String(team.get("country", "")))






static func make_rect(nation_id: String, height: float = 22.0) -> TextureRect:
	var tr: TextureRect = TextureRect.new()
	tr.texture = texture(nation_id)
	tr.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	tr.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	tr.stretch_mode = TextureRect.STRETCH_SCALE
	tr.custom_minimum_size = Vector2(round(height * W / float(H)), height)
	tr.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	tr.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return tr


static func has(nation_id: String) -> bool:
	var raw: String = String(NAME_ALIAS.get(nation_id, nation_id))
	return SPECS.has(raw) or SPECS.has(raw.to_lower()) \
			or RECIPES.has(raw) or RECIPES.has(raw.to_lower())




static func _rect(img: Image, x0: int, y0: int, x1: int, y1: int, c: Color) -> void:
	var xa: int = clampi(mini(x0, x1), 0, W)
	var xb: int = clampi(maxi(x0, x1), 0, W)
	var ya: int = clampi(mini(y0, y1), 0, H)
	var yb: int = clampi(maxi(y0, y1), 0, H)
	for y in range(ya, yb):
		for x in range(xa, xb):
			img.set_pixel(x, y, c)


static func _fill(img: Image, c: Color) -> void:
	_rect(img, 0, 0, W, H, c)


static func _hstripe(img: Image, a: float, b: float, c: Color) -> void:
	_rect(img, 0, int(round(a * H)), W, int(round(b * H)), c)


static func _vstripe(img: Image, a: float, b: float, c: Color) -> void:
	_rect(img, int(round(a * W)), 0, int(round(b * W)), H, c)


static func _hbands(img: Image, cols: Array) -> void:
	var n: int = cols.size()
	for i in n:
		_rect(img, 0, int(round(i * H / float(n))), W, int(round((i + 1) * H / float(n))), cols[i])


static func _vbands(img: Image, cols: Array) -> void:
	var n: int = cols.size()
	for i in n:
		_rect(img, int(round(i * W / float(n))), 0, int(round((i + 1) * W / float(n))), H, cols[i])


static func _cross(img: Image, c: Color, tw: int) -> void:
	_rect(img,(W - tw) / 2, 0,(W + tw) / 2, H, c)
	_rect(img, 0,(H - tw) / 2, W,(H + tw) / 2, c)


static func _nordic(img: Image, c: Color, tw: int, cx: int) -> void:
	_rect(img, cx, 0, cx + tw, H, c)
	_rect(img, 0,(H - tw) / 2, W,(H + tw) / 2, c)


static func _disc(img: Image, cx: float, cy: float, r: float, c: Color) -> void:
	var r2: float = r * r
	for y in H:
		for x in W:
			var dx: float = x + 0.5 - cx
			var dy: float = y + 0.5 - cy
			if dx * dx + dy * dy <= r2:
				img.set_pixel(x, y, c)


static func _diamond(img: Image, cx: float, cy: float, hw: float, hh: float, c: Color) -> void:
	for y in H:
		for x in W:
			if absf(x + 0.5 - cx) / hw + absf(y + 0.5 - cy) / hh <= 1.0:
				img.set_pixel(x, y, c)


static func _star(img: Image, cx: float, cy: float, r: float, c: Color) -> void:
	var poly: PackedVector2Array = PackedVector2Array()
	for i in 10:
		var ang: float = - PI / 2.0 + i * PI / 5.0
		var rr: float = r if i % 2 == 0 else r * 0.42
		poly.append(Vector2(cx + cos(ang) * rr, cy + sin(ang) * rr))
	for y in H:
		for x in W:
			if Geometry2D.is_point_in_polygon(Vector2(x + 0.5, y + 0.5), poly):
				img.set_pixel(x, y, c)



static func _saltire(img: Image, c: Color, tw: float) -> void:
	var half: float = tw * 0.5
	for y in H:
		for x in W:
			var fx: float =(x + 0.5) / W
			var fy: float =(y + 0.5) / H

			var d1: float = absf(fy - fx) * H
			var d2: float = absf(fy -(1.0 - fx)) * H
			if d1 <= half or d2 <= half:
				img.set_pixel(x, y, c)



static func _border(img: Image, c: Color) -> void:
	for x in W:
		img.set_pixel(x, 0, c)
		img.set_pixel(x, H - 1, c)
	for y in H:
		img.set_pixel(0, y, c)
		img.set_pixel(W - 1, y, c)




const SPECS: Dictionary = {
	"España": 1, "Inglaterra": 1, "Italia": 1, "Alemania": 1, "Portugal": 1, "México": 1,
	"fra": 1, "ned": 1, "bel": 1, "cro": 1, "sui": 1, "din": 1, "pol": 1, "srb": 1,
	"aut": 1, "tur": 1, "arg": 1, "bra": 1, "uru": 1, "col": 1, "ecu": 1, "per": 1,
	"usa": 1, "can": 1, "crc": 1, "pan": 1, "hon": 1, "jam": 1, "mar": 1, "sen": 1,
	"jpn": 1, "kor": 1, "nga": 1, "aus": 1, "egy": 1, "gha": 1,
	"sco": 1, "wal": 1, "swe": 1, "nor": 1, "gre": 1, "cze": 1, "ukr": 1, "hun": 1,
	"chi": 1, "par": 1, "ven": 1, "ksa": 1, "irn": 1, "civ": 1, "cmr": 1, "alg": 1,
}





const RECIPES: Dictionary = {
	"rou": [["vbands", ["b", "y", "r"]]],
	"rus": [["hbands", ["w", "b", "r"]]],
	"bul": [["hbands", ["w", "g", "r"]]],
	"svk": [["hbands", ["w", "b", "r"]], ["rect", 4, 6, 9, 15, "r"], ["rect", 5, 7, 8, 13, "w"]],
	"svn": [["hbands", ["w", "b", "r"]], ["rect", 3, 3, 9, 9, "w"], ["rect", 4, 4, 8, 7, "b"]],
	"irl": [["vbands", ["g", "w", "o"]]],
	"isl": [["fill", "nv"], ["nordic", "w", 6, 8], ["nordic", "r", 2, 9]],
	"fin": [["fill", "w"], ["nordic", "b", 4, 9]],
	"alba": [["fill", "dr"], ["disc", 15, 10, 4.2, "k"]],
	"mkd": [["fill", "r"], ["disc", 15, 10, 3.2, "y"]],
	"isr": [["fill", "w"], ["hstripe", 0.12, 0.28, "b"], ["hstripe", 0.72, 0.88, "b"], ["star", 15, 10, 2.6, "b"]],
	"bih": [["fill", "nv"], ["vstripe", 0.34, 0.5, "y"], ["star", 13, 6, 1.4, "w"], ["star", 16, 10, 1.4, "w"], ["star", 19, 14, 1.4, "w"]],
	"geo": [["fill", "w"], ["cross", "cr", 4], ["rect", 4, 4, 7, 7, "cr"], ["rect", 23, 4, 26, 7, "cr"], ["rect", 4, 13, 7, 16, "cr"], ["rect", 23, 13, 26, 16, "cr"]],
	"mne": [["fill", "dr"], ["disc", 15, 10, 3.4, "go"]],
	"nir": [["fill", "w"], ["cross", "cr", 4], ["disc", 15, 10, 2.6, "w"], ["star", 15, 10, 1.9, "cr"]],
	"bov": [["hbands", ["r", "y", "g"]]],
	"slv": [["hbands", ["b", "w", "b"]], ["disc", 15, 10, 1.7, "y"]],
	"gtm": [["vbands", ["sk", "w", "sk"]]],
	"tto": [["fill", "r"], ["saltire", "w", 6], ["saltire", "k", 3]],
	"hai": [["hbands", ["nv", "r"]]],
	"tun": [["fill", "r"], ["disc", 15, 10, 4.2, "w"], ["disc", 16.3, 10, 3.3, "r"], ["star", 17.6, 10, 1.7, "r"]],



	"rsa": [["pallY", "r", "nv", "g", "w", "k", "go"]],
	"mli": [["vbands", ["g", "y", "r"]]],
	"bfa": [["hbands", ["r", "g"]], ["star", 15, 10, 3, "y"]],
	"cod": [["fill", "sk"], ["star", 8, 6, 2.4, "y"]],
	"gin": [["vbands", ["r", "y", "g"]]],
	"zam": [["fill", "g"], ["rect", 22, 5, 27, 16, "o"]],
	"agl": [["hbands", ["r", "k"]], ["disc", 15, 10, 2.6, "y"]],
	"qat": [["vstripe", 0, 0.32, "w"], ["vstripe", 0.32, 1, "8d1b3d"]],
	"uae": [["hbands", ["g", "w", "k"]], ["rect", 0, 0, 8, 20, "r"]],
	"irq": [["hbands", ["r", "w", "k"]], ["star", 11, 10, 1.4, "g"], ["star", 15, 10, 1.4, "g"], ["star", 19, 10, 1.4, "g"]],
	"uzb": [["hbands", ["sk", "w", "g"]]],
	"chn": [["fill", "r"], ["star", 7, 6, 3, "y"], ["star", 12, 3, 1, "y"], ["star", 13, 6, 1, "y"], ["star", 13, 9, 1, "y"], ["star", 12, 12, 1, "y"]],
	"jor": [["hbands", ["k", "w", "g"]], ["triL", "r"], ["star", 6, 10, 1.6, "w"]],
	"syr": [["hbands", ["r", "w", "k"]], ["star", 13, 10, 1.5, "g"], ["star", 17, 10, 1.5, "g"]],
	"vie": [["fill", "r"], ["star", 15, 10, 4, "y"]],
	"tha": [["hbands", ["r", "w", "nv", "w", "r"]]],
	"idi": [["hbands", ["o", "w", "g"]], ["disc", 15, 10, 1.9, "b"]],
	"idn": [["hbands", ["r", "w"]]],
	"blr": [["hstripe", 0, 0.66, "r"], ["hstripe", 0.66, 1, "g"], ["vstripe", 0, 0.16, "w"], ["rect", 1, 2, 4, 7, "r"], ["rect", 1, 13, 4, 18, "r"]],
	"ltu": [["hbands", ["y", "g", "r"]]],
	"lva": [["hstripe", 0, 0.4, "7d1a1a"], ["hstripe", 0.4, 0.6, "w"], ["hstripe", 0.6, 1, "7d1a1a"]],
	"esto": [["hbands", ["b", "k", "w"]]],
	"mda": [["vbands", ["b", "y", "r"]], ["disc", 15, 10, 1.8, "dr"]],
	"arm": [["hbands", ["r", "b", "o"]]],
	"aze": [["hbands", ["sk", "r", "g"]], ["disc", 14, 10, 1.7, "w"], ["disc", 14.9, 10, 1.3, "r"], ["star", 16.6, 10, 1, "w"]],
	"kaz": [["fill", "00afca"], ["disc", 15, 9, 2.4, "y"]],
	"kos": [["fill", "nv"], ["disc", 15, 9, 2.2, "go"], ["star", 10, 4, 0.9, "w"], ["star", 15, 3.2, 0.9, "w"], ["star", 20, 4, 0.9, "w"]],
	"cyp": [["fill", "w"], ["disc", 14, 9, 2.2, "c87f3a"], ["rect", 11, 12, 19, 14, "g"]],
	"omn": [["hbands", ["w", "r", "g"]], ["rect", 0, 0, 8, 20, "r"]],
	"bhr": [["vstripe", 0, 0.35, "w"], ["vstripe", 0.35, 1, "r"]],
	"kuw": [["hbands", ["g", "w", "r"]], ["triL", "k"]],
	"lbn": [["hstripe", 0, 0.25, "r"], ["hstripe", 0.25, 0.75, "w"], ["hstripe", 0.75, 1, "r"], ["star", 15, 10, 2.2, "g"]],
	"pse": [["hbands", ["k", "w", "g"]], ["triL", "r"]],
	"yem": [["hbands", ["r", "w", "k"]]],
	"prk": [["hstripe", 0, 0.22, "b"], ["hstripe", 0.22, 0.32, "w"], ["hstripe", 0.32, 0.68, "r"], ["hstripe", 0.68, 0.78, "w"], ["hstripe", 0.78, 1, "b"], ["disc", 10, 10, 2.3, "w"], ["star", 10, 10, 1.7, "r"]],
	"mas": [["hbands", ["r", "w", "r", "w", "r", "w"]], ["canton", "nv"], ["disc", 5, 5, 1.6, "y"], ["star", 8, 5, 1.3, "y"]],
	"fil": [["hstripe", 0, 0.5, "b"], ["hstripe", 0.5, 1, "r"], ["triL", "w"], ["disc", 4, 10, 1.4, "y"]],
	"kgz": [["fill", "r"], ["disc", 15, 10, 3, "y"]],
	"cpv": [["fill", "b"], ["hstripe", 0.5, 0.62, "w"], ["hstripe", 0.62, 0.72, "r"], ["hstripe", 0.72, 0.84, "w"], ["star", 11, 9, 1, "y"], ["star", 15, 9, 1, "y"], ["star", 19, 9, 1, "y"]],
	"gab": [["hbands", ["g", "y", "b"]]],
	"cog": [["hbands", ["g", "y", "r"]]],
	"uga": [["hbands", ["k", "y", "r", "k", "y", "r"]], ["disc", 15, 10, 2, "w"]],
	"ken": [["hbands", ["k", "r", "g"]], ["rect", 12, 6, 18, 14, "w"], ["rect", 13, 7, 17, 13, "dr"]],
	"zim": [["hbands", ["g", "y", "r", "k", "r", "y", "g"]], ["triL", "w"]],
	"moz": [["hbands", ["g", "k", "y"]], ["triL", "r"], ["star", 6, 10, 1.6, "w"]],
	"bni": [["vstripe", 0, 0.4, "g"], ["rect", 12, 0, 30, 10, "y"], ["rect", 12, 10, 30, 20, "r"]],
	"tog": [["hbands", ["g", "y", "g", "y", "g"]], ["canton", "r"], ["star", 6, 5, 1.8, "w"]],
	"lby": [["hbands", ["r", "k", "g"]], ["disc", 15, 10, 1.7, "w"], ["star", 16.6, 10, 1, "w"]],
	"sdn": [["hbands", ["r", "w", "k"]], ["triL", "g"]],
	"mad": [["vstripe", 0, 0.33, "w"], ["rect", 10, 0, 30, 10, "r"], ["rect", 10, 10, 30, 20, "g"]],

	"andr": [["vbands", ["nv", "y", "r"]], ["rect", 12, 6, 18, 13, "cr"], ["rect", 12, 6, 15, 9, "go"], ["rect", 15, 9, 18, 13, "go"]],
	"gib": [["hbands", ["w", "w", "r"]], ["rect", 11, 5, 19, 11, "r"], ["rect", 11, 3, 13, 5, "r"], ["rect", 14, 2, 16, 5, "r"], ["rect", 17, 3, 19, 5, "r"], ["rect", 14, 11, 16, 13, "go"]],
	"fro": [["fill", "w"], ["nordic", "b", 5, 9], ["nordic", "r", 3, 10]],
	"liec": [["hbands", ["b", "r"]], ["disc", 7, 5, 2.3, "go"], ["rect", 4, 6, 11, 8, "go"]],
	"lux": [["hbands", ["r", "w", "sk"]]],
	"mlt": [["vbands", ["w", "r"]], ["rect", 3, 2, 6, 9, "#9aa0a6"], ["rect", 1, 4, 8, 7, "#9aa0a6"]],
	"smr": [["hbands", ["w", "sk"]], ["disc", 15, 10, 2.6, "go"], ["disc", 15, 10, 1.4, "w"]],
	"nzl": [["fill", "nv"], ["rect", 0, 4, 13, 6, "w"], ["rect", 5, 0, 8, 10, "w"], ["star", 22, 4.5, 2.2, "r"], ["star", 26, 11, 2.2, "r"], ["star", 19.5, 13.5, 2.0, "r"]],
	"ncal": [["hbands", ["b", "r", "g"]], ["disc", 9, 10, 5.0, "k"], ["disc", 9, 10, 4.0, "y"]],
	"sol": [["hbands", ["b", "g"]], ["hstripe", 0.45, 0.55, "y"], ["star", 4, 2.6, 1.5, "w"], ["star", 9.5, 2.6, 1.5, "w"], ["star", 4, 6.6, 1.5, "w"], ["star", 9.5, 6.6, 1.5, "w"]],
	"fij": [["fill", "sk"], ["rect", 0, 4, 13, 6, "w"], ["rect", 5, 0, 8, 10, "w"], ["rect", 0, 5, 13, 5, "r"], ["rect", 6, 0, 7, 10, "r"], ["disc", 22, 11, 2.8, "w"]],
	"tah": [["fill", "r"], ["hstripe", 0.25, 0.75, "w"], ["disc", 15, 10, 2.7, "r"]],
	"van": [["fill", "r"], ["hstripe", 0.5, 1.0, "g"], ["hstripe", 0.43, 0.57, "y"], ["triL", "k"], ["disc", 4, 10, 1.6, "y"]],
	"png": [["hbands", ["r", "k"]], ["star", 21, 5.5, 2.8, "y"], ["star", 4.5, 12.2, 1.5, "w"], ["star", 9.5, 14.0, 1.5, "w"], ["star", 4.0, 16.5, 1.4, "w"], ["star", 8.0, 17.6, 1.1, "w"]],
	"samo": [["fill", "r"], ["canton", "nv"], ["star", 7.0, 2.0, 1.3, "w"], ["star", 3.5, 5.0, 1.5, "w"], ["star", 10.0, 5.5, 1.5, "w"], ["star", 6.5, 8.3, 1.5, "w"]],
	"tga": [["fill", "r"], ["canton", "w"], ["rect", 5, 1, 8, 9, "r"], ["rect", 2, 4, 11, 6, "r"]],
	"cok": [["fill", "nv"], ["rect", 0, 4, 13, 6, "w"], ["rect", 5, 0, 8, 10, "w"], ["disc", 21, 10, 4.6, "w"], ["disc", 21, 10, 3.0, "nv"]],
	"asa": [["fill", "nv"], ["rect", 6, 7, 16, 12, "r"], ["rect", 16, 2, 29, 17, "r"], ["rect", 8, 8, 17, 11, "w"], ["rect", 17, 4, 29, 15, "w"]],
	"cuw": [["fill", "nv"], ["hstripe", 0.6, 0.78, "y"], ["star", 7, 5.5, 3.4, "w"], ["star", 12.5, 10, 2.2, "w"]],
	"sur": [["fill", "dg"], ["hstripe", 0.2, 0.8, "w"], ["hstripe", 0.3, 0.7, "r"], ["star", 15, 10, 3.8, "y"]],
	"dom": [["vbands", ["b", "r"]], ["hstripe", 0.5, 1.0, "b"], ["rect", 0, 10, 14, 19, "r"], ["cross", "w", 4]],
	"nca": [["hbands", ["sk", "w", "sk"]], ["disc", 15, 10, 3.9, "go"], ["disc", 15, 10, 3.0, "w"], ["diamond", 15, 10.3, 2.5, 2.5, "sk"]],
	"atg": [["fill", "r"], ["hstripe", 0.0, 0.45, "k"], ["disc", 15, 9.6, 4.3, "y"], ["rect", 4, 9, 26, 13, "sk"], ["rect", 8, 13, 22, 17, "w"]],
	"skn": [["fill", "dg"], ["diamond", 29, 19, 33.6, 22.0, "y"], ["diamond", 29, 19, 31.9, 20.9, "k"], ["diamond", 29, 19, 26.1, 17.1, "r"], ["star", 8, 13.8, 2.2, "w"], ["star", 18, 7.2, 2.2, "w"]],
	"guy": [["fill", "dg"], ["diamond", 0, 10, 29, 10, "y"], ["diamond", 0, 10, 16, 10, "k"], ["diamond", 0, 10, 13.5, 10, "r"]],
	"ber": [["fill", "cr"], ["canton", "nv"], ["rect", 0, 4, 13, 6, "w"], ["rect", 6, 0, 8, 10, "w"], ["disc", 21, 11, 3.8, "w"], ["disc", 21, 11, 1.8, "cr"]],
	"grn": [["fill", "r"], ["rect", 4, 3, 26, 17, "y"], ["diamond", 15, 10, 12, 7, "dg"], ["disc", 15, 10, 3.8, "r"], ["star", 15, 10, 3.0, "y"]],
	"brb": [["vbands", ["nv", "y", "nv"]], ["rect", 11, 3, 13, 9, "k"], ["rect", 17, 3, 19, 9, "k"], ["rect", 11, 8, 19, 10, "k"], ["rect", 14, 3, 16, 17, "k"]],
	"cub": [["hbands", ["b", "w", "b", "w", "b"]], ["triL", "r"], ["star", 5.5, 10, 3.2, "w"]],
	"blz": [["fill", "b"], ["hstripe", 0.0, 0.13, "r"], ["hstripe", 0.87, 1.0, "r"], ["disc", 15, 10, 6.5, "w"], ["disc", 15, 10, 2.4, "dg"]],
	"pur": [["hbands", ["r", "w", "r", "w", "r"]], ["triL", "nv"], ["star", 4, 10, 2.2, "w"]],
	"vin": [["vbands", ["b", "y", "y", "g"]], ["diamond", 12, 7, 1.7, 2.3, "g"], ["diamond", 18, 7, 1.7, 2.3, "g"], ["diamond", 15, 14, 1.7, 2.3, "g"]],
	"lca": [["fill", "sk"], ["diamond", 15, 11, 6, 8, "w"], ["diamond", 15, 11, 4.5, 6.5, "k"], ["diamond", 15, 14, 4, 3.5, "y"]],
	"dma": [["fill", "g"], ["cross", "y", 9], ["cross", "k", 6], ["cross", "w", 3], ["disc", 15, 10, 3.0, "r"]],
	"msr": [["fill", "nv"], ["rect", 0, 4, 13, 6, "w"], ["rect", 6, 0, 7, 10, "w"], ["disc", 22, 10, 4, "g"], ["star", 22, 10, 2.4, "y"]],
	"cay": [["fill", "nv"], ["rect", 0, 4, 13, 6, "w"], ["rect", 6, 0, 7, 10, "w"], ["disc", 22, 10, 4, "w"], ["disc", 22, 10, 2.2, "r"]],
	"aru": [["fill", "sk"], ["rect", 0, 14, 29, 15, "y"], ["rect", 0, 17, 29, 18, "y"], ["star", 7, 6, 3.2, "w"], ["star", 7, 6, 2.1, "r"]],
	"bhs": [["hbands", ["#00abc9", "#ffc72c", "#00abc9"]], ["triL", "k"]],
	"tca": [["fill", "nv"], ["rect", 0, 4, 13, 6, "w"], ["rect", 6, 0, 7, 10, "w"], ["disc", 22, 10, 4, "y"], ["disc", 22, 10, 1.9, "cr"]],
	"vgb": [["fill", "nv"], ["rect", 0, 4, 13, 6, "w"], ["rect", 6, 0, 7, 10, "w"], ["diamond", 22, 10, 4.5, 5.5, "w"], ["star", 22, 10, 2.3, "g"]],
	"aia": [["fill", "nv"], ["rect", 0, 4, 13, 6, "w"], ["rect", 6, 0, 7, 10, "w"], ["disc", 22, 10, 4, "o"], ["disc", 22, 10, 1.8, "w"]],
	"vir": [["fill", "w"], ["disc", 15, 10, 5.5, "go"], ["rect", 13, 7, 17, 13, "w"], ["rect", 13, 7, 17, 9, "nv"], ["rect", 13, 11, 17, 11, "r"], ["rect", 13, 13, 17, 13, "r"]],
	"tjk": [["hbands", ["r", "w", "g"]], ["star", 15, 10, 2.2, "go"]],
	"tkm": [["fill", "dg"], ["vstripe", 0.13, 0.27, "cr"], ["disc", 12, 7, 3.2, "w"], ["disc", 13.5, 6.6, 2.6, "dg"], ["star", 17, 6, 1.2, "w"]],
	"hkg": [["fill", "r"], ["star", 15, 10, 4.6, "w"], ["disc", 15, 10, 1.1, "r"]],
	"sgp": [["hbands", ["r", "w"]], ["disc", 6, 5, 3.2, "w"], ["disc", 7.6, 5, 2.6, "r"], ["star", 11, 2.6, 1.1, "w"], ["star", 12.8, 5, 1.1, "w"], ["star", 11, 7.4, 1.1, "w"]],
	"mya": [["hbands", ["y", "g", "r"]], ["star", 15, 10, 5.5, "w"]],
	"mdv": [["fill", "r"], ["rect", 6, 4, 23, 15, "g"], ["disc", 15, 10, 3.4, "w"], ["disc", 16.6, 10, 2.8, "g"]],
	"nep": [["fill", "nv"], ["triL", "cr"], ["disc", 5.5, 6, 1.7, "w"], ["star", 5.5, 13, 2.0, "w"]],
	"camb": [["fill", "nv"], ["hstripe", 0.25, 0.75, "r"], ["rect", 10, 12, 20, 13, "w"], ["rect", 14, 7, 16, 12, "w"], ["rect", 11, 9, 12, 12, "w"], ["rect", 18, 9, 19, 12, "w"]],
	"bang": [["fill", "dg"], ["disc", 13.5, 10, 5.0, "r"]],
	"lao": [["fill", "r"], ["hstripe", 0.25, 0.75, "nv"], ["disc", 15, 10, 4.2, "w"]],
	"sri": [["fill", "#8d153a"], ["vstripe", 0.02, 0.16, "g"], ["vstripe", 0.16, 0.3, "o"], ["star", 20, 10, 2.6, "go"]],
	"afg": [["vbands", ["k", "r", "g"]], ["disc", 15, 10, 3.4, "w"]],
	"tpe": [["fill", "r"], ["canton", "nv"], ["star", 6.5, 5, 3.2, "w"]],
	"mng": [["vbands", ["r", "b", "r"]], ["rect", 3, 5, 6, 15, "y"], ["disc", 4.5, 3.5, 1.7, "y"]],
	"bhu": [["fill", "o"], ["rect", 0, 0, 8, 17, "y"], ["rect", 8, 0, 15, 12, "y"], ["rect", 15, 0, 22, 7, "y"], ["rect", 22, 0, 29, 2, "y"], ["disc", 15, 10, 3.2, "w"]],
	"bru": [["fill", "y"], ["hstripe", 0.3, 0.5, "w"], ["hstripe", 0.5, 0.7, "k"], ["disc", 15, 10, 2.6, "r"]],
	"mac": [["fill", "dg"], ["disc", 15, 13, 3.8, "w"], ["star", 15, 4.5, 2.4, "y"], ["star", 9.5, 7, 1.5, "y"], ["star", 20.5, 7, 1.5, "y"]],
	"tls": [["fill", "r"], ["triL", "y"], ["diamond", 0, 10, 10, 10, "k"], ["star", 4.2, 10, 2.6, "w"]],
	"pak": [["fill", "dg"], ["vstripe", 0.0, 0.25, "w"], ["disc", 19, 10, 4.2, "w"], ["disc", 20.8, 9.2, 3.6, "dg"], ["star", 22.6, 6.4, 1.7, "w"]],
	"gum": [["fill", "r"], ["rect", 2, 2, 28, 18, "nv"], ["diamond", 15, 10, 4.8, 6.4, "r"], ["diamond", 15, 10, 3.6, 5.2, "sk"]],
	"nmi": [["fill", "b"], ["disc", 15, 10, 7, "#c9a86a"], ["disc", 15, 10, 5.4, "#9aa5b1"], ["star", 15, 10, 3.6, "w"]],
	"eqg": [["hbands", ["g", "w", "r"]], ["triL", "b"]],
	"gam": [["fill", "r"], ["hstripe", 0.33, 0.39, "w"], ["hstripe", 0.39, 0.61, "b"], ["hstripe", 0.61, 0.67, "w"], ["hstripe", 0.67, 1.0, "g"]],
	"tan": [["fill", "sk"], ["rect", 0, 0, 21, 13, "g"], ["rect", 0, 13, 11, 19, "k"], ["rect", 11, 6, 21, 13, "k"], ["rect", 21, 0, 29, 6, "k"]],
	"nam": [["fill", "g"], ["rect", 0, 0, 21, 13, "b"], ["rect", 0, 13, 11, 19, "r"], ["rect", 11, 6, 21, 13, "r"], ["rect", 21, 0, 29, 6, "r"], ["star", 7, 4, 3.2, "y"]],
	"nig": [["hbands", ["o", "w", "g"]], ["disc", 15, 10, 2.2, "o"]],
	"cta": [["hbands", ["b", "w", "g", "y"]], ["vstripe", 0.44, 0.56, "r"], ["star", 4, 3, 1.6, "y"]],
	"sle": [["hbands", ["g", "w", "#0072c6"]]],
	"rwa": [["fill", "#00a1de"], ["hstripe", 0.5, 0.75, "y"], ["hstripe", 0.75, 1.0, "g"], ["disc", 24, 5, 2.0, "y"]],
	"bdi": [["hbands", ["r", "g", "r"]], ["saltire", "w", 3], ["disc", 15, 10, 4.0, "w"], ["star", 15, 7.6, 1.5, "r"], ["star", 12.2, 11.6, 1.5, "r"], ["star", 17.8, 11.6, 1.5, "r"]],
	"bots": [["fill", "sk"], ["hstripe", 0.35, 0.65, "w"], ["hstripe", 0.4, 0.6, "k"]],
	"eth": [["hbands", ["g", "y", "r"]], ["disc", 15, 10, 4.2, "b"], ["star", 15, 10, 3.0, "y"]],
	"lbr": [["hbands", ["r", "w", "r", "w", "r"]], ["canton", "nv"], ["star", 6, 5, 3.2, "w"]],
	"chad": [["vbands", ["nv", "y", "r"]]],
	"mtn": [["fill", "g"], ["hstripe", 0.0, 0.12, "r"], ["hstripe", 0.88, 1.0, "r"], ["disc", 15, 11, 4.5, "y"], ["disc", 15, 8.5, 4.2, "g"], ["star", 15, 8.5, 1.8, "y"]],
	"comr": [["hbands", ["y", "w", "r", "b"]], ["triL", "g"], ["disc", 6, 10, 3.2, "w"], ["disc", 7.6, 10, 2.8, "g"]],
	"mwi": [["hbands", ["k", "r", "g"]], ["disc", 15, 4, 3.0, "r"]],
	"gnb": [["hbands", ["y", "g"]], ["vstripe", 0.0, 0.34, "r"], ["star", 5, 10, 3.0, "k"]],
	"les": [["hbands", ["b", "w", "g"]], ["diamond", 15, 10, 3.0, 3.4, "k"]],
	"swz": [["fill", "b"], ["hstripe", 0.21, 0.79, "y"], ["hstripe", 0.29, 0.71, "cr"], ["rect", 10, 8, 19, 11, "w"], ["rect", 13, 8, 16, 11, "k"]],
	"ssd": [["hbands", ["k", "r", "g"]], ["hstripe", 0.3, 0.36, "w"], ["hstripe", 0.64, 0.7, "w"], ["triL", "b"], ["star", 5, 10, 2.4, "y"]],
	"mri": [["hbands", ["r", "b", "y", "g"]]],
	"stp": [["hbands", ["g", "y", "g"]], ["triL", "r"], ["star", 16, 10, 2.0, "k"], ["star", 22, 10, 2.0, "k"]],
	"dji": [["hbands", ["sk", "g"]], ["triL", "w"], ["star", 5, 10, 2.6, "r"]],
	"som": [["fill", "sk"], ["star", 15, 10, 6.0, "w"]],
	"sey": [["fill", "g"], ["rect", 0, 0, 4, 19, "b"], ["rect", 5, 0, 11, 14, "y"], ["rect", 12, 0, 19, 9, "r"], ["rect", 20, 0, 29, 5, "w"]],
	"eri": [["hbands", ["g", "b"]], ["triL", "r"], ["disc", 6, 10, 2.4, "go"]],

}


static func _paint(img: Image, id: String) -> void:


	if RECIPES.has(id):
		_paint_recipe(img, RECIPES[id])
		return
	match id:

		"España":
			_hstripe(img, 0.0, 0.25, RED);_hstripe(img, 0.25, 0.75, YELLOW);_hstripe(img, 0.75, 1.0, RED)
			_rect(img, 6, 8, 10, 13, DRED)
		"Inglaterra":
			_fill(img, WHITE);_cross(img, CRIMSON, 5)
		"Italia":
			_vbands(img, [GREEN, WHITE, RED])
		"Alemania":
			_hbands(img, [BLACK, RED, GOLD])
		"Portugal":
			_vstripe(img, 0.0, 0.4, DGREEN);_vstripe(img, 0.4, 1.0, RED)
			_disc(img, 0.4 * W, H * 0.5, 3.0, GOLD);_disc(img, 0.4 * W, H * 0.5, 1.4, DRED)
		"México":
			_vbands(img, [DGREEN, WHITE, RED]);_rect(img, 13, 8, 17, 12, BROWN)

		"fra":
			_vbands(img, [BLUE, WHITE, RED])
		"ned":
			_hbands(img, [RED, WHITE, BLUE])
		"bel":
			_vbands(img, [BLACK, YELLOW, RED])
		"cro":
			_hbands(img, [RED, WHITE, BLUE]);_rect(img, 12, 6, 18, 12, WHITE);_rect(img, 13, 7, 15, 9, RED);_rect(img, 15, 9, 17, 11, RED)
		"sui":
			_fill(img, RED);_rect(img, 13, 5, 17, 15, WHITE);_rect(img, 9, 8, 21, 12, WHITE)
		"din":
			_fill(img, RED);_nordic(img, WHITE, 4, 9)
		"pol":
			_hbands(img, [WHITE, RED])
		"srb":
			_hbands(img, [RED, BLUE, WHITE]);_rect(img, 10, 6, 15, 13, DRED)
		"aut":
			_hbands(img, [RED, WHITE, RED])
		"tur":
			_fill(img, RED);_disc(img, 12.0, 10.0, 4.2, WHITE);_disc(img, 13.6, 10.0, 3.4, RED);_star(img, 18.0, 10.0, 2.4, WHITE)

		"arg":
			_hbands(img, [SKY, WHITE, SKY]);_disc(img, W * 0.5, H * 0.5, 2.0, GOLD)
		"bra":
			_fill(img, GREEN);_diamond(img, W * 0.5, H * 0.5, 12.0, 8.0, YELLOW);_disc(img, W * 0.5, H * 0.5, 3.4, BLUE)
		"uru":
			_hbands(img, [WHITE, SKY, WHITE, SKY, WHITE]);_rect(img, 0, 0, 13, 8, WHITE);_disc(img, 6.0, 4.0, 2.4, GOLD)
		"col":
			_hstripe(img, 0.0, 0.5, YELLOW);_hstripe(img, 0.5, 0.75, BLUE);_hstripe(img, 0.75, 1.0, RED)
		"ecu":
			_hstripe(img, 0.0, 0.5, YELLOW);_hstripe(img, 0.5, 0.75, BLUE);_hstripe(img, 0.75, 1.0, RED);_rect(img, 13, 6, 17, 13, BROWN)
		"per":
			_vbands(img, [RED, WHITE, RED])

		"usa":
			for i in 7:
				_rect(img, 0, int(round(i * H / 7.0)), W, int(round((i + 1) * H / 7.0)), RED if i % 2 == 0 else WHITE)
			_rect(img, 0, 0, 13, 10, NAVY)
			for sy in [2, 5, 8]:
				for sx in [3, 7, 11]:
					img.set_pixel(sx, sy, WHITE)
		"can":
			_vstripe(img, 0.0, 0.25, RED);_vstripe(img, 0.25, 0.75, WHITE);_vstripe(img, 0.75, 1.0, RED);_star(img, W * 0.5, H * 0.5, 3.6, RED)
		"crc":
			_hbands(img, [BLUE, WHITE, RED, RED, WHITE, BLUE])
		"pan":
			_rect(img, 0, 0, 15, 10, WHITE);_rect(img, 15, 0, 30, 10, RED);_rect(img, 0, 10, 15, 20, BLUE);_rect(img, 15, 10, 30, 20, WHITE);_star(img, 7.0, 5.0, 2.6, BLUE);_star(img, 22.0, 15.0, 2.6, RED)
		"hon":
			_hbands(img, [SKY, WHITE, SKY]);_disc(img, W * 0.5, H * 0.5, 1.0, SKY);_disc(img, 11.0, 10.0, 0.9, SKY);_disc(img, 19.0, 10.0, 0.9, SKY)
		"jam":
			_fill(img, GREEN);_saltire(img, GOLD, 4.0);_poly_tri_top_bottom(img, BLACK)
		"mar":
			_fill(img, DRED);_star(img, W * 0.5, H * 0.5, 4.5, GREEN)
		"sen":
			_vbands(img, [GREEN, YELLOW, RED]);_star(img, W * 0.5, H * 0.5, 3.0, GREEN)

		"jpn":
			_fill(img, WHITE);_disc(img, W * 0.5, H * 0.5, 4.6, CRIMSON)
		"kor":
			_fill(img, WHITE);_disc_half(img, W * 0.5, H * 0.5, 4.6, RED, BLUE)
		"nga":
			_vbands(img, [GREEN, WHITE, GREEN])
		"aus":
			_fill(img, NAVY);_rect(img, 0, 0, 13, 10, NAVY);_cross_small(img, WHITE);_star(img, 22.0, 14.0, 2.6, WHITE)
		"egy":
			_hbands(img, [RED, WHITE, BLACK]);_disc(img, W * 0.5, H * 0.5, 1.6, GOLD)
		"gha":
			_hbands(img, [RED, GOLD, GREEN]);_star(img, W * 0.5, H * 0.5, 2.8, BLACK)

		"sco":
			_fill(img, BLUE);_saltire(img, WHITE, 4.0)
		"wal":
			_hbands(img, [WHITE, GREEN]);_diamond(img, W * 0.5, H * 0.5, 5.0, 4.0, RED)
		"swe":
			_fill(img, BLUE);_nordic(img, YELLOW, 4, 9)
		"nor":
			_fill(img, RED);_nordic(img, WHITE, 6, 8);_nordic(img, NAVY, 2, 9)
		"gre":
			_hbands(img, [BLUE, WHITE, BLUE, WHITE, BLUE])
			_rect(img, 0, 0, 12, 8, BLUE);_rect(img, 4, 0, 8, 8, WHITE);_rect(img, 0, 2, 12, 6, WHITE)
		"cze":
			_hbands(img, [WHITE, RED]);_tri_left(img, BLUE)
		"ukr":
			_hbands(img, [BLUE, YELLOW])
		"hun":
			_hbands(img, [RED, WHITE, GREEN])
		"chi":
			_hbands(img, [WHITE, RED]);_rect(img, 0, 0, 10, 10, BLUE);_star(img, 5.0, 5.0, 3.2, WHITE)
		"par":
			_hbands(img, [RED, WHITE, BLUE]);_disc(img, W * 0.5, H * 0.5, 2.0, GREEN)
		"ven":
			_hbands(img, [YELLOW, BLUE, RED])
			for sx in [10, 13, 16, 19]:
				_disc(img, float(sx), 10.0, 0.9, WHITE)
		"ksa":
			_fill(img, DGREEN);_rect(img, 6, 12, 24, 15, WHITE)
		"irn":
			_hbands(img, [DGREEN, WHITE, RED]);_disc(img, W * 0.5, H * 0.5, 1.6, RED)
		"civ":
			_vbands(img, [ORANGE, WHITE, GREEN])
		"cmr":
			_vbands(img, [GREEN, RED, YELLOW]);_star(img, W * 0.5, H * 0.5, 3.0, YELLOW)
		"alg":
			_vstripe(img, 0.0, 0.5, DGREEN);_vstripe(img, 0.5, 1.0, WHITE)
			_disc(img, 14.0, 10.0, 3.5, RED);_disc(img, 15.6, 10.0, 2.8, WHITE);_star(img, 18.5, 10.0, 1.8, RED)
		_:

			_hbands(img, [Color("6b7180"), Color("8a909c"), Color("6b7180")])







static func _paint_recipe(img: Image, ops: Array) -> void:
	for op in ops:
		match String(op[0]):
			"fill":
				_fill(img, _col(op[1]))
			"hbands":
				var hc: Array = []
				for c in op[1]:
					hc.append(_col(c))
				_hbands(img, hc)
			"vbands":
				var vc: Array = []
				for c in op[1]:
					vc.append(_col(c))
				_vbands(img, vc)
			"hstripe":
				_hstripe(img, float(op[1]), float(op[2]), _col(op[3]))
			"vstripe":
				_vstripe(img, float(op[1]), float(op[2]), _col(op[3]))
			"rect":
				_rect(img, int(op[1]), int(op[2]), int(op[3]), int(op[4]), _col(op[5]))
			"disc":
				_disc(img, float(op[1]), float(op[2]), float(op[3]), _col(op[4]))
			"star":
				_star(img, float(op[1]), float(op[2]), float(op[3]), _col(op[4]))
			"diamond":
				_diamond(img, float(op[1]), float(op[2]), float(op[3]), float(op[4]), _col(op[5]))
			"cross":
				_cross(img, _col(op[1]), int(op[2]))
			"nordic":
				_nordic(img, _col(op[1]), int(op[2]), int(op[3]))
			"saltire":
				_saltire(img, _col(op[1]), float(op[2]))
			"triL":
				_tri_left(img, _col(op[1]))
			"pallY":
				_pall_y(img, _col(op[1]), _col(op[2]), _col(op[3]), _col(op[4]), _col(op[5]), _col(op[6]))
			"canton":
				_rect(img, 0, 0, 13, 10, _col(op[1]))










static func _pall_y(img: Image, top: Color, bottom: Color, band: Color, fim: Color, tri: Color, tri_fim: Color) -> void:
	var xa: float = 13.0
	var cy: float = H * 0.5
	var m: float = cy / xa
	var k: float = sqrt(1.0 + m * m)
	var gh: float = 1.7
	var fh: float = 2.7
	for y in H:
		for x in W:
			var fx: float = x + 0.5
			var fy: float = y + 0.5
			var c: Color = top if fy < cy else bottom
			var dy: float = absf(fy - cy)
			var d: float = dy
			if fx < xa:
				var lim: float = m *(xa - fx)
				if dy < lim - fh * k:
					c = tri_fim
				if dy < lim -(fh + 1.0) * k:
					c = tri
				d = absf(dy - lim) / k
			if d < fh:
				c = fim
			if d < gh:
				c = band
			img.set_pixel(x, y, c)



static func _poly_tri_top_bottom(img: Image, c: Color) -> void:
	for y in H:
		for x in W:
			var fx: float =(x + 0.5) / W
			var fy: float =(y + 0.5) / H
			var top: bool = fy < 0.5 and absf(fx - 0.5) <(0.5 - fy)
			var bot: bool = fy > 0.5 and absf(fx - 0.5) <(fy - 0.5)
			if top or bot:
				img.set_pixel(x, y, c)




static func _disc_half(img: Image, cx: float, cy: float, r: float, a: Color, b: Color) -> void:
	var r2: float = r * r
	for y in H:
		for x in W:
			var dx: float = x + 0.5 - cx
			var dy: float = y + 0.5 - cy
			if dx * dx + dy * dy <= r2:
				img.set_pixel(x, y, a if dy < 0.0 else b)



static func _cross_small(img: Image, c: Color) -> void:
	_rect(img, 5, 0, 8, 10, c)
	_rect(img, 0, 3, 13, 6, c)



static func _tri_left(img: Image, c: Color) -> void:
	for y in H:
		var edge: float = 0.5 *(1.0 - absf((y + 0.5) / H - 0.5) * 2.0)
		for x in W:
			if (x + 0.5) / W < edge:
				img.set_pixel(x, y, c)
