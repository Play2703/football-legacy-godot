extends RefCounted
















const Placement = preload("res://features/match/modular_placement.gd")

const NAMES: Dictionary = {"none": "Ninguno", "dot": "Punto", "double_dot": "Dos puntos",
	"line": "Línea corta", "cross": "Cruz pequeña", "diamond": "Rombo pequeño",

	"tear": "Lágrima", "star": "Estrella", "bar": "Barra", "triangle": "Triángulo",
	"chevron": "Galón", "arrow": "Flecha", "square": "Cuadro", "ring": "Anillo",
	"hook": "Gancho", "zig": "Zigzag"}
const SIDES: Dictionary = {"left": "Izquierda", "right": "Derecha", "both": "Ambas"}



const MOTIFS: Dictionary = {
	"dot": [Vector2i(0, 0)],
	"double_dot": [Vector2i(0, 0), Vector2i(0, 2)],
	"line": [Vector2i(0, 0), Vector2i(0, 1)],
	"cross": [Vector2i(1, 0), Vector2i(0, 1), Vector2i(1, 1), Vector2i(2, 1), Vector2i(1, 2)],
	"diamond": [Vector2i(1, 0), Vector2i(0, 1), Vector2i(2, 1), Vector2i(1, 2)],
	"tear": [Vector2i(1, 0), Vector2i(1, 1), Vector2i(0, 2), Vector2i(1, 2)],
	"star": [Vector2i(1, 0), Vector2i(0, 1), Vector2i(1, 1), Vector2i(2, 1), Vector2i(0, 2),
		Vector2i(2, 2)],
	"bar": [Vector2i(0, 0), Vector2i(1, 0), Vector2i(2, 0)],
	"triangle": [Vector2i(1, 0), Vector2i(0, 1), Vector2i(2, 1)],
	"chevron": [Vector2i(0, 0), Vector2i(1, 1), Vector2i(2, 0)],
	"arrow": [Vector2i(1, 0), Vector2i(0, 1), Vector2i(2, 1), Vector2i(1, 1), Vector2i(1, 2)],
	"square": [Vector2i(0, 0), Vector2i(1, 0), Vector2i(0, 1), Vector2i(1, 1)],
	"ring": [Vector2i(0, 0), Vector2i(1, 0), Vector2i(2, 0), Vector2i(0, 1), Vector2i(2, 1),
		Vector2i(0, 2), Vector2i(1, 2), Vector2i(2, 2)],
	"hook": [Vector2i(0, 0), Vector2i(1, 0), Vector2i(1, 1), Vector2i(1, 2), Vector2i(0, 2)],
	"zig": [Vector2i(0, 0), Vector2i(1, 1), Vector2i(2, 2)]}





const NECK_NAMES: Dictionary = {"none": "Ninguno", "punto": "Punto", "raya": "Raya corta",
	"barras": "Dos barras", "cruz": "Cruz", "flecha": "Flecha", "zigzag": "Zigzag",
	"estrellas": "Estrellas", "banda": "Franja", "doble_banda": "Franja ancha",
	"puntos": "Tres puntos", "rombo": "Rombo", "gancho": "Gancho"}




const NECK_MOTIFS: Dictionary = {
	"punto": [Vector2i(2, 0)],
	"raya": [Vector2i(1, 0), Vector2i(2, 0), Vector2i(3, 0)],
	"barras": [Vector2i(1, 0), Vector2i(1, 1), Vector2i(3, 0), Vector2i(3, 1)],
	"cruz": [Vector2i(2, 0), Vector2i(1, 1), Vector2i(2, 1), Vector2i(3, 1)],
	"flecha": [Vector2i(2, 0), Vector2i(1, 1), Vector2i(3, 1)],
	"zigzag": [Vector2i(0, 1), Vector2i(1, 0), Vector2i(2, 1), Vector2i(3, 0), Vector2i(4, 1)],
	"estrellas": [Vector2i(0, 0), Vector2i(2, 0), Vector2i(4, 0), Vector2i(1, 1), Vector2i(3, 1)],
	"banda": [Vector2i(0, 0), Vector2i(1, 0), Vector2i(2, 0), Vector2i(3, 0), Vector2i(4, 0)],
	"doble_banda": [Vector2i(0, 0), Vector2i(1, 0), Vector2i(2, 0), Vector2i(3, 0), Vector2i(4, 0),
		Vector2i(0, 1), Vector2i(1, 1), Vector2i(2, 1), Vector2i(3, 1), Vector2i(4, 1)],
	"puntos": [Vector2i(0, 0), Vector2i(2, 0), Vector2i(4, 0)],
	"rombo": [Vector2i(1, 0), Vector2i(3, 0), Vector2i(2, 1)],
	"gancho": [Vector2i(1, 0), Vector2i(2, 0), Vector2i(3, 0), Vector2i(3, 1)]}







const NECK_ANCHORS: Dictionary = {
	"south": Vector2i(44, 36), "east": Vector2i(44, 35),
	"west": Vector2i(44, 34), "north": Vector2i(44, 34)}

const INK_DEF: Color = Color("31404f")


static func layer(cfg: Dictionary, direction: String, pose: Dictionary, size: Vector2i) -> Image:
	var source: Image = Image.create(92, 92, false, Image.FORMAT_RGBA8)
	var pinto: bool = _cara(cfg, direction, source)
	pinto = _cuello(cfg, direction, source) or pinto
	if not pinto:
		return Image.create(size.x, size.y, false, Image.FORMAT_RGBA8)
	return Placement.place(source, pose, size)




static func _cara(cfg: Dictionary, direction: String, source: Image) -> bool:
	var style: String = str(cfg.get("modular_face_tattoo", "none"))
	if not MOTIFS.has(style) or direction == "north":
		return false
	var side: String = str(cfg.get("modular_face_tattoo_side", "left"))
	var ink: Color = INK_DEF
	if cfg.get("face_tattoo_color") is Color:
		ink = cfg.face_tattoo_color
	var anchors: Array[Vector2i] = []




	var ancho: int = 1
	for point: Vector2i in MOTIFS[style]:
		ancho = maxi(ancho, point.x + 1)
	if direction == "south":
		if side in ["left", "both"]:
			anchors.append(Vector2i(50 - ancho, 31))
		if side in ["right", "both"]:
			anchors.append(Vector2i(41, 31))
	elif (direction == "east" and side in ["left", "both"]) or (direction == "west" and side in ["right", "both"]):
		anchors.append(Vector2i(49, 30))
	if anchors.is_empty():
		return false
	for anchor in anchors:
		for point: Vector2i in MOTIFS[style]:
			var p: Vector2i = anchor + point
			if direction == "west":
				p.x = 91 - p.x
			source.set_pixelv(p, ink)
	return true




static func _cuello(cfg: Dictionary, direction: String, source: Image) -> bool:
	var style: String = str(cfg.get("modular_neck_tattoo", "none"))
	if not NECK_MOTIFS.has(style) or not NECK_ANCHORS.has(direction):
		return false
	var ink: Color = INK_DEF
	if cfg.get("neck_tattoo_color") is Color:
		ink = cfg.neck_tattoo_color
	elif cfg.get("face_tattoo_color") is Color:



		ink = cfg.face_tattoo_color
	var anchor: Vector2i = NECK_ANCHORS[direction]
	for point: Vector2i in NECK_MOTIFS[style]:
		source.set_pixelv(anchor + point, ink)
	return true
