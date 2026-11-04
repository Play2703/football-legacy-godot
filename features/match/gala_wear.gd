extends RefCounted

const ECONOMIC: Array[String] = ["oficina", "grafito", "arena", "marron"]
const LUXURY: Array[String] = ["medianoche", "esmeralda", "champan", "blanco_oro", "negro_oro", "diplomatico"]
const MODERN: Array[String] = ["sin_corbata", "cuello_alto", "chaleco"]
const STYLES: Array[String] = ["clasico", "azul", "marfil", "vino", "gris", "cruzado",
	"oficina", "grafito", "arena", "marron", "medianoche", "esmeralda", "champan", "blanco_oro", "negro_oro", "diplomatico", "sin_corbata", "cuello_alto", "chaleco"]
const NAMES: Dictionary = {"clasico": "Esmoquin clásico", "azul": "Traje azul", "marfil": "Esmoquin marfil",
	"vino": "Terciopelo granate", "gris": "Tres piezas gris", "cruzado": "Traje cruzado",
	"oficina": "Oficina azul", "grafito": "Básico grafito", "arena": "Lino arena", "marron": "Traje café",
	"medianoche": "Satén medianoche", "esmeralda": "Terciopelo esmeralda", "champan": "Seda perla",
	"blanco_oro": "Marfil y oro", "negro_oro": "Negro y oro", "diplomatico": "Diplomático",
	"sin_corbata": "Traje sin corbata", "cuello_alto": "Saco y cuello alto", "chaleco": "Conjunto con chaleco"}
const PALETTES: Dictionary = {
	"sin_corbata": [Color("6c8194"), Color("465767"), Color("455666")],
	"cuello_alto": [Color("8b7663"), Color("343139"), Color("5b483e")],
	"chaleco": [Color("534c62"), Color("393440"), Color("342b3e")],
	"oficina": [Color("4b5b72"), Color("414b60"), Color("364252")],
	"grafito": [Color("60616a"), Color("505159"), Color("45464d")],
	"arena": [Color("bdac8d"), Color("a59377"), Color("97846b")],
	"marron": [Color("796052"), Color("604c43"), Color("514039")],
	"medianoche": [Color("1d294a"), Color("171e32"), Color("64779b")],
	"esmeralda": [Color("1c6551"), Color("172c2b"), Color("101f24")],
	"champan": [Color("c5a16b"), Color("65533e"), Color("ead4a6")],
	"blanco_oro": [Color("eee6d3"), Color("d5ccba"), Color("b28c40")],
	"negro_oro": [Color("242329"), Color("1c1c24"), Color("c5a357")],
	"diplomatico": [Color("394353"), Color("2c3544"), Color("222937")],
	"azul": [Color("344e7b"), Color("263951"), Color("152335")],
	"marfil": [Color("ded5bb"), Color("25252c"), Color("bcb59d")],
	"vino": [Color("763349"), Color("282530"), Color("401a32")],
	"gris": [Color("747580"), Color("515360"), Color("444852")],
	"cruzado": [Color("2d5650"), Color("28413e"), Color("172c29")],
}


static func base_path(path: String) -> String:
	var name: String = path.get_file()
	if name.begins_with("gala_clap_"):
		return "res://assets/sprites/anim/" + name.replace("gala_clap_", "clap_player_")
	if name.begins_with("gala_walk_"):
		var frame: int = int(name.get_basename().get_slice("_", 3)) + 1
		return "res://assets/sprites/anim/walk_player_%s_%02d.png" % [name.get_slice("_", 2), frame]
	if name.begins_with("gala_"):
		return "res://assets/sprites/anim/" + name.replace("gala_", "idle_")
	return path

static func preview_cfg(base: Dictionary) -> Dictionary:
	var cfg: Dictionary = base.duplicate()
	var style: String = KitRecolor._style(base, "gala_outfit", "clasico")
	if style not in STYLES:
		style = "clasico"
	var pal: Array = PALETTES.get(style, [Color("252832"), Color("20232a"), Color("11141d")])
	for key in KitRecolor.TEAM_KEYS:
		cfg.erase(key)
	for key in ["number", "crest_logo", "long_sleeves", "short_pants", "street_garment", "street_outer", "street_top", "street_face", "street_head", "kit_sleeves"]:
		cfg.erase(key)
	cfg.merge({"casual_top": "camisa", "casual_shirt": Color("ece9e1"), "casual_shirt2": Color("ece9e1"),
		"casual_print": "solid", "casual_sleeves": "larga", "casual_outer": "blazer",
		"casual_outer_state": "abierta", "casual_outer_color": pal[0], "casual_pants_style": "vestir",
		"casual_pants_len": "largo", "casual_pants": pal[1], "casual_shoes": "oxford",
		"casual_shoes_color": Color("191c23"), "acc_head": "none", "acc_face": "none",
		"acc_neck": "none", "acc_ear": "none", "acc_watch": "none", "acc_bracelet": "none"}, true)
	if style == "cuello_alto":
		cfg["casual_top"] = "cuello_alto"
		cfg["casual_shirt"] = Color("292730")
	if style == "chaleco": cfg["casual_outer"] = "chaleco"
	cfg["acc_neckwear"] = base.get("gala_neckwear", "auto")
	cfg["acc_pocket"] = base.get("gala_pocket", "auto")
	cfg["acc_belt"] = base.get("gala_belt", "none")
	cfg["acc_watch"] = base.get("gala_watch", "none")
	cfg["acc_neck"] = base.get("gala_chain", "none")
	cfg["acc_cloth"] = base.get("gala_accent", Color("733344"))
	cfg["acc_metal"] = base.get("gala_metal", Color("d7b76d"))
	cfg = KitRecolor.casual_of(cfg)
	cfg["gala_outfit"] = style
	cfg["_gala_preview"] = true
	return cfg



static func paint(img: Image, source: Image, mask: Dictionary, cfg: Dictionary, view: String, head: Vector2i) -> void:
	var box: Rect2i = KitRecolor.CASUAL_DETAILS._torso(mask, head.x)
	if box.size.y <= 0:
		return
	var style: String = str(cfg.get("gala_outfit", "clasico"))
	var pal: Array = PALETTES.get(style, [Color("252832"), Color("20232a"), Color("11141d")])
	var cx: int = box.get_center().x
	if view == "right": cx = box.end.x - 2
	elif view == "left": cx = box.position.x + 1
	var neckline: int = box.position.y
	while neckline < box.end.y and not mask.has(Vector2i(cx, neckline)):
		neckline += 1
	for p: Vector2i in mask:
		var dx: int = p.x - cx
		var y: int = p.y - neckline
		var col: Color = pal[0]

		if view == "back":
			if p.x == cx and p.y >= box.end.y - 3:
				img.set_pixelv(p, col.darkened(0.45))
			continue
		var opening: int = maxi(1, 4 - maxi(0, y) / 2)
		if absi(dx) <= opening and y <= 10:
			var ink: Color = Color("292730") if style == "cuello_alto" else Color("ece9e1")
			if style in ["gris", "diplomatico"] and y >= 5:
				ink = Color("444955")
			if cfg.get("acc_neckwear", "auto") == "auto" and style in ["azul", "gris", "oficina", "grafito", "marron", "diplomatico"] and absi(dx) <= 1 and y >= 1 and y <= 8:
				ink = Color("733344") if style == "azul" else Color("272d3b")
			elif cfg.get("acc_neckwear", "auto") == "auto" and style not in ["azul", "gris", "oficina", "grafito", "marron", "diplomatico", "arena", "sin_corbata", "cuello_alto", "chaleco"] and ((y == 0 and absi(dx) == 2) or (y == 1 and absi(dx) <= 2) or (y == 2 and absi(dx) == 2)):
				ink = Color("14171e")
			img.set_pixelv(p, ink)
		elif absi(dx) == opening + 1 and y >= -2 and y <= 10:
			img.set_pixelv(p, pal[2])
		elif y > 10 and p.y < box.end.y:
			img.set_pixelv(p, col.darkened(0.18))
		if p.y == box.end.y - 3 and dx == 1:
			img.set_pixelv(p, Color("b5b4ab"))
		if style == "cruzado" and p.y in [box.end.y - 4, box.end.y - 7] and absi(dx) == 3:
			img.set_pixelv(p, Color("c6ae71"))
		if style == "diplomatico" and absi(dx) > opening + 1 and posmod(p.x - cx, 3) == 0:
			img.set_pixelv(p, col.lightened(0.22))
		if cfg.get("acc_pocket", "auto") == "auto" and style in LUXURY and y == 5 and dx in [-5, -4]:
			img.set_pixelv(p, Color("f3e8cf"))
		if style in ["negro_oro", "blanco_oro"] and p.y in [box.end.y - 4, box.end.y - 7] and absi(dx) == 3:
			img.set_pixelv(p, Color("d8b765"))



	for y in range(box.end.y, mini(box.end.y + 5, source.get_height())):
		for x in range(box.position.x, box.end.x):
			var c: Color = source.get_pixel(x, y)
			if c.a > 0.5 and c.s < 0.18 and c.v > 0.5:
				img.set_pixel(x, y,(pal[1] as Color).darkened(0.12))
