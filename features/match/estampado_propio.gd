extends RefCounted


































const Propias = preload("res://features/match/piezas_propias.gd")
const CasualDetails = preload("res://features/match/casual_details.gd")

const TORSO_REF_PATH: String = "res://assets/sprites/modular/propias/torso_ref.json"

const DIRECCION: Dictionary = {"front": "south", "right": "east", "left": "west", "back": "north"}





static var capturando: bool = false
static var capturas: Array = []

static var _ref: Dictionary = {}
static var _ref_leido: bool = false


static var _imagenes: Dictionary = {}




static func olvida() -> void:
	_ref = {}
	_ref_leido = false
	_imagenes.clear()





static func torso_ref() -> Dictionary:
	if _ref_leido:
		return _ref
	_ref_leido = true
	if not FileAccess.file_exists(TORSO_REF_PATH):
		return _ref
	var raw: Variant = JSON.parse_string(FileAccess.get_file_as_string(TORSO_REF_PATH))
	if raw is Dictionary:
		_ref = raw
	return _ref



static func ancla(box: Rect2i) -> Vector2i:
	return Vector2i(box.position.x + box.size.x / 2, box.position.y)






static func imagen(ruta: String) -> Image:
	if _imagenes.has(ruta):
		return _imagenes[ruta]
	var img: Image = null
	if ruta.begins_with("res://") and ResourceLoader.exists(ruta):
		var tex: Texture2D = load(ruta) as Texture2D
		if tex != null:
			img = tex.get_image()
			if img != null:
				img = img.duplicate()
	if img == null:
		var disco: String = ProjectSettings.globalize_path(ruta)
		if FileAccess.file_exists(disco):
			img = Image.load_from_file(disco)
	if img != null:
		if img.is_compressed():
			img.decompress()
		if img.get_format() != Image.FORMAT_RGBA8:
			img.convert(Image.FORMAT_RGBA8)
	_imagenes[ruta] = img
	return img





static func paint(img: Image, source: Image, mask: Dictionary, cfg: Dictionary,
		view: String, head: Vector2i) -> void:
	var box: Rect2i = CasualDetails._torso(mask, head.x)
	if capturando:
		capturas.append({"view": view, "box": box, "head": head, "mask": mask.keys()})
	var id: String = str(cfg.get("print_asset", ""))
	if id.is_empty() or box.size.y < 1:
		return
	var prenda: Variant = Propias.group("prendas").get(id, null)
	if not (prenda is Dictionary):
		return
	var dir: String = str(DIRECCION.get(view, "south"))
	var ruta: String = str((prenda as Dictionary).get(dir, ""))
	if ruta.is_empty():
		return
	var ref_box: Array =(torso_ref().get(dir, {}) as Dictionary).get("box", [])
	if ref_box.size() != 4:
		return
	var dibujo: Image = imagen(ruta)
	if dibujo == null:
		return
	var desplaza: Vector2i = ancla(Rect2i(int(ref_box[0]), int(ref_box[1]),
		int(ref_box[2]), int(ref_box[3]))) - ancla(box)
	var principal: Color = cfg.get("casual_shirt", KitRecolor.CASUAL_SHIRTS[0])
	var secundario: Color = cfg.get("casual_shirt2", KitRecolor.CASUAL_SHIRTS[1])
	var ref_gama: Color = KitRecolor._base_ref(KitRecolor._kit_base(cfg))
	var roles: Dictionary = KitRecolor._roles_map()
	var ref_rol: Color = KitRecolor._roles_ref.get(KitRecolor.RolZona.KIT, ref_gama)
	var w: int = dibujo.get_width()
	var h: int = dibujo.get_height()
	for p: Vector2i in mask:
		var q: Vector2i = p + desplaza
		if q.x < 0 or q.y < 0 or q.x >= w or q.y >= h:
			continue
		var c: Color = dibujo.get_pixelv(q)
		if c.a8 < 8:
			continue
		var fuente: Color = source.get_pixelv(p)
		var pintado: Color
		var comodin: bool = c.b8 == 255 and ((c.r8 == 255 and c.g8 == 0) or (c.r8 == 0 and c.g8 == 255))
		if comodin:
			var tinta: Color = principal if c.r8 == 255 else secundario
			var rgb24: int =(fuente.r8<<16)|(fuente.g8<<8)|fuente.b8
			var es_rol: bool = int(roles.get(rgb24, -1)) == KitRecolor.RolZona.KIT


			pintado = KitRecolor._toned(tinta,
				KitRecolor._ref_kit_de(rgb24, ref_rol) if es_rol else ref_gama, fuente)
		else:
			var sombra: float = clampf(fuente.v / 0.98, 0.68, 1.0)
			pintado = Color(c.r * sombra, c.g * sombra, c.b * sombra)
		pintado.a = 1.0
		if c.a8 < 255:

			pintado = img.get_pixelv(p).lerp(pintado, c.a)
		pintado.a = img.get_pixelv(p).a
		img.set_pixelv(p, pintado)
