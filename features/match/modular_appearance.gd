class_name ModularAppearance
extends RefCounted











const Placement = preload("res://features/match/modular_placement.gd")
const MANIFEST_PATH: String = "res://assets/sprites/modular/manifest.json"
const Catalog = preload("res://assets/sprites/modular/catalog.gd")

const CoachCatalog = preload("res://assets/sprites/modular/coach_catalog.gd")
const Appearance = preload("res://features/match/appearance_catalog.gd")
const Propias = preload("res://features/match/piezas_propias.gd")
const LookMigracion = preload("res://features/match/look_migracion.gd")
const DIRECTIONS: Array[String] = ["south", "east", "north", "west"]














const ORDER: Array[String] = ["hair_back", "base", "neck_acc", "torso_acc", "face_tattoo", "brows",
	"expresion", "face_acc", "hair_front", "beard", "hair_acc", "head_acc", "mask", "occlusion"]


const CAPAS_PROPIAS: Dictionary = {
	"neck_acc": ["modular_neck_acc", "neck_acc"],
	"torso_acc": ["modular_torso_acc", "torso_acc"],
	"face_acc": ["modular_face_acc", "face_acc"],
	"head_acc": ["modular_head_acc", "head_acc"],
}



















const DESVIO_CABEZA: Dictionary = {
	"south": Vector2i(0, 0), "north": Vector2i(0, 0),
	"east": Vector2i(0, 0), "west": Vector2i(0, 0),
}
const REF_COLOR: Color = Color("6b4226")
const OUTLINE_COLOR: Color = Color("090603")










const CACHE_MAX: int = 4096




const CACHE_PURGA: int = 1024


const MIN_TINTE_V: float = 0.11
const SEPARA_TINTE: float = 0.06
const LEGACY_HEAD_KEYS: Array[String] = ["hair", "hair_style", "facial_hair",
	"brows", "hair_tips", "modular_hair", "modular_brows", "modular_beard",
	"modular_hair_accessory", "modular_mask", "mask", "headband",
	"modular_face_tattoo", "modular_face_tattoo_side", "face_tattoo_color",
	"modular_neck_tattoo", "neck_tattoo_color",


	"modular_head_acc", "modular_face_acc", "modular_neck_acc", "modular_torso_acc"]

static var _manifest: Dictionary = {}
static var _manifest_loaded: bool = false
static var _textures: Dictionary = {}

























static var _tintadas: Dictionary = {}



static var _tintadas_n: int = 0
static var _composed: Dictionary = {}
static var _base_paths: Dictionary = {}








static func clear_cache(reload_manifest: bool = false) -> void:
	KitRecolor.candado_toma()
	_clear_cache_sin_candado(reload_manifest)
	KitRecolor.candado_suelta()


static func _clear_cache_sin_candado(reload_manifest: bool) -> void:


	for key in KitRecolor._cache.keys():
		for base_path in _base_paths:
			if String(key).begins_with(String(base_path)):
				KitRecolor._cache.erase(key)
				break
	_base_paths.clear()
	_textures.clear()
	_tintadas.clear()
	_tintadas_n = 0
	_composed.clear()


	KitRecolor.olvida_analisis()
	if reload_manifest:
		_manifest.clear()
		_manifest_loaded = false


static func _load_manifest() -> void:
	if _manifest_loaded:
		return
	_manifest_loaded = true
	if not FileAccess.file_exists(MANIFEST_PATH):
		_manifest = Catalog.DATA.duplicate(true)
	else:
		var raw: Variant = JSON.parse_string(FileAccess.get_file_as_string(MANIFEST_PATH))
		if raw is Dictionary and int(raw.get("version", 0)) == 1:
			_manifest = raw





	var frames_todos: Dictionary = _manifest.get("frames", {})
	for k in CoachCatalog.FRAMES:
		if not frames_todos.has(k):
			frames_todos[k] =(CoachCatalog.FRAMES[k] as Dictionary).duplicate(true)
	_manifest["frames"] = frames_todos
	for group in ["hair", "accessories"]:
		var combined: Dictionary = _manifest.get(group, {}).duplicate(true)
		combined.merge(Appearance.Extra.DATA.get(group, {}), true)
		_manifest[group] = combined






	for group in Propias.GRUPOS_CABEZA:
		var propias: Dictionary = Propias.group(group)
		if propias.is_empty():
			continue
		var con_propias: Dictionary =(_manifest.get(group, {}) as Dictionary).duplicate()
		con_propias.merge(propias, false)
		_manifest[group] = con_propias


static func _frame(path: String) -> Dictionary:
	KitRecolor.candado_toma()
	var entry: Dictionary = _frame_sin_candado(path)
	KitRecolor.candado_suelta()
	return entry


static func _frame_sin_candado(path: String) -> Dictionary:
	_load_manifest()
	var frames: Variant = _manifest.get("frames", {})
	if not frames is Dictionary:
		return {}
	var entry: Variant = frames.get(path, {})
	if not entry is Dictionary or String(entry.get("base", "")).is_empty() \
			or not DIRECTIONS.has(String(entry.get("direction", ""))):
		return {}
	var offset: Variant = entry.get("offset", [0, 0])
	if not offset is Array or offset.size() != 2:
		return {}
	return entry


static func supports(path: String) -> bool:
	KitRecolor.candado_toma()
	var entry: Dictionary = _frame(path)
	var ok: bool = not entry.is_empty() and _texture(String(entry["base"])) != null
	KitRecolor.candado_suelta()
	return ok




static func base_image(path: String) -> Image:
	KitRecolor.candado_toma()
	var entry: Dictionary = _frame(path)
	var tex: Texture2D = _texture(String(entry["base"])) if not entry.is_empty() else null
	var img: Image = _image(tex) if tex != null else null
	KitRecolor.candado_suelta()
	return img


static func _texture(path: String) -> Texture2D:
	if path.is_empty():
		return null
	KitRecolor.candado_toma()
	var tex: Texture2D = _texture_sin_candado(path)
	KitRecolor.candado_suelta()
	return tex


static func _texture_sin_candado(path: String) -> Texture2D:
	if _textures.has(path):
		return _textures[path]
	var tex: Texture2D


	var absolute: String = ProjectSettings.globalize_path(path)
	if FileAccess.file_exists(absolute):
		var img: Image = Image.load_from_file(absolute)
		if img != null and not img.is_empty():
			img.convert(Image.FORMAT_RGBA8)
			tex = ImageTexture.create_from_image(img)


			tex.resource_path = path


			tex.set_meta(KitRecolor.META_IMG_FUENTE, img)
	elif ResourceLoader.exists(path):
		tex = load(path) as Texture2D
	if tex != null:
		_textures[path] = tex
	return tex


static func _image(tex: Texture2D) -> Image:
	return KitRecolor.lee_imagen(tex, "modular")


static func _color(value: Variant, fallback: Color) -> Color:
	if value is Color:
		return value
	return Color.from_string(String(value), fallback)


static func _piece(group: String, style: String, direction: String) -> Dictionary:
	if style == "none":
		return {}
	var catalog: Variant = _manifest.get(group, {})
	if not catalog is Dictionary:
		return {}
	var views: Variant = catalog.get(style, {})
	if not views is Dictionary:
		return {}
	var entry: Variant = views.get(direction, {})
	return entry if entry is Dictionary else {}















const PIEL_HORNEADA: Array[Color] = [Color("fcb49e"), Color("f8b8a5"), Color("f1a58e"),
	Color("d7836c"), Color("d09a8b"), Color("c38c7b")]
static func _piel_horneada(img: Image, piel: Color) -> void:
	for y in img.get_height():
		for x in img.get_width():
			var c: Color = img.get_pixel(x, y)
			if c.a < 0.5 or c.s >= 0.45 or c.h * 360.0 < 8.0 or c.h * 360.0 > 22.0:
				continue
			for k: Color in PIEL_HORNEADA:
				if absi(c.r8 - k.r8) + absi(c.g8 - k.g8) + absi(c.b8 - k.b8) <= 40:
					img.set_pixel(x, y, KitRecolor._toned_skin(piel, KitRecolor.REF_SKIN, c))
					break


static func _tint(img: Image, target: Color, recipe: Dictionary) -> void:
	if target.a <= 0.0:
		return
	var reference: Color = _color(recipe.get("reference", REF_COLOR), REF_COLOR)
	var outline: Color = _color(recipe.get("outline", OUTLINE_COLOR), OUTLINE_COLOR)









	var suelo: float = maxf(target.v, MIN_TINTE_V)
	var apagado: float = 1.0 if target.v >= MIN_TINTE_V else target.v / MIN_TINTE_V
	for y in img.get_height():
		for x in img.get_width():
			var c: Color = img.get_pixel(x, y)
			if c.a <= 0.0 or (c.r8 == outline.r8 and c.g8 == outline.g8 and c.b8 == outline.b8):
				continue
			var ratio: float = c.v / maxf(reference.v, 0.01)
			var value: float = clampf(suelo * ratio +(ratio - 1.0) * SEPARA_TINTE, 0.0, 1.0)
			var saturation: float = clampf(target.s * apagado * clampf(c.s / maxf(reference.s, 0.01),
				0.8, 1.15), 0.0, 1.0)
			img.set_pixel(x, y, Color.from_hsv(target.h, saturation, value, c.a))


static func _empty(size: Vector2i) -> Image:
	var img: Image = Image.create(size.x, size.y, false, Image.FORMAT_RGBA8)
	img.fill(Color.TRANSPARENT)
	return img


static func _layer(recipe: Dictionary, part: String, size: Vector2i,
		offset: Vector2i, target: Color, pose: Dictionary = {},
		desvio: Vector2i = Vector2i.ZERO, limpia: bool = false, cose: bool = true,
		cose_minimo: int = 2, piel: Color = Color.TRANSPARENT) -> Image:
	var out: Image = _empty(size)
	var ruta: String = String(recipe.get(part, ""))
	var tex: Texture2D = _texture(ruta)
	if tex == null:
		return out

















	var llave: Color = target if piel.a <= 0.0 else piel
	var por_ruta: Dictionary = _tintadas.get(ruta, {})
	var piece: Image = por_ruta.get(llave) as Image
	if piece == null:
		piece = _image(tex)
		_tint(piece, target, recipe)
		if piel.a > 0.0:
			_piel_horneada(piece, piel)
		if por_ruta.is_empty():
			_tintadas[ruta] = por_ruta
		por_ruta[llave] = piece


		_tintadas_n += 1
		_purga_tintadas()
	if pose.has("angle") and (float(pose.get("angle", 0)) != 0 or pose.get("scale", [1, 1]) != [1, 1]):
		var girada: Image = Placement.place(piece, _pose_girada(pose, desvio), size)



		if limpia:
			_limpia_giro(girada, recipe, part, llave, pose, desvio)


		if cose:
			_cose_giro(girada, recipe, part, llave, pose, desvio, cose_minimo)
		return girada
	var clipped: Rect2i = Rect2i(offset, piece.get_size()).intersection(Rect2i(Vector2i.ZERO, size))
	if clipped.size.x > 0 and clipped.size.y > 0:
		out.blend_rect(piece, Rect2i(clipped.position - offset, clipped.size), clipped.position)
	return out




static func layer_images(path: String, cfg: Dictionary) -> Dictionary:
	KitRecolor.candado_toma()
	var capas: Dictionary = _layer_images_sin_candado(path, cfg)
	KitRecolor.candado_suelta()
	return capas


static func _layer_images_sin_candado(path: String, cfg: Dictionary) -> Dictionary:
	var entry: Dictionary = _frame(path)
	if entry.is_empty():
		return {}
	var base_tex: Texture2D = _texture(String(entry["base"]))
	if base_tex == null:
		return {}
	_base_paths[String(entry["base"])] = true
	var base_cfg: Dictionary = cfg.duplicate()
	for key in LEGACY_HEAD_KEYS:
		base_cfg.erase(key)
	if base_cfg.has("bib"):
		base_cfg["_sprite_source_path"] = path



	if entry.has("cabeza_hasta"):
		base_cfg["_cabeza_hasta"] = int(entry["cabeza_hasta"])




	var base: Image = KitRecolor.base_imagen(base_tex, base_cfg)
	if base == null:
		var base_rec: Texture2D = KitRecolor.apply(base_tex, base_cfg)
		base = KitRecolor.imagen_de(base_rec)
		if base == null:
			base = _image(base_rec)



	if base == null:
		return {}
	var size: Vector2i = base.get_size()
	var offset: Vector2i = Vector2i(int(entry.get("offset", [0, 0])[0]),
		int(entry.get("offset", [0, 0])[1]))
	var direction: String = String(entry.get("head_direction", entry["direction"]))


	var off_cab: Vector2i = offset +(DESVIO_CABEZA.get(direction, Vector2i.ZERO) as Vector2i)
	var desv: Vector2i = DESVIO_CABEZA.get(direction, Vector2i.ZERO)


	var hair_style: String = String(cfg.get("modular_hair", LookMigracion.PELO_POR_DEFECTO))
	var hair_piece_style: String = LookMigracion.pelo(String(cfg.get("modular_hair",
		LookMigracion.PELO_POR_DEFECTO)))
	var hair: Dictionary = _piece("hair", hair_piece_style, direction)
	var brows: Dictionary = _piece("brows", String(cfg.get("modular_brows", "natural")), direction)
	var beard: Dictionary = _piece("beard", LookMigracion.barba(String(cfg.get("modular_beard", "none"))), direction)
	var hair_color: Color = _color(cfg.get("hair", Color.TRANSPARENT), Color.TRANSPARENT)
	var brow_color: Color = _color(cfg.get("brows", hair_color), hair_color)
	var accessory: String = String(cfg.get("modular_hair_accessory",
		"band" if hair_style == "banda_pelo" or cfg.has("headband") else
		("tie" if hair_style == "liga_coleta" else "none")))




	if accessory == "tie" and not Appearance.es_atable(hair_piece_style):
		accessory = "none"
	var mask_style: String = String(cfg.get("modular_mask", "mask" if cfg.get("mask", false) else "none"))
	var frente: Image = _frente_pelo(hair, size, off_cab, hair_color, entry, desv, base)
	var cejas: Image = _layer(brows, "front", size, off_cab, brow_color, entry, desv, false, true, 1)



	var expresion: Image = null
	var cejas_look: Image = cejas
	if cfg.has("expresion"):



		var ceja_color: Color = brow_color
		if ceja_color.a <= 0.0:
			ceja_color = Expresiones.PARPADO
			var r: Rect2i = cejas.get_used_rect()
			for y in range(r.position.y, r.end.y):
				for x in range(r.position.x, r.end.x):
					if cejas.get_pixel(x, y).a > 0.5 and ceja_color == Expresiones.PARPADO:
						ceja_color = cejas.get_pixel(x, y)



		var tuerce: bool = Expresiones.quita_cejas(cfg) and not cejas.is_invisible()
		expresion = Expresiones.capa(cfg, String(entry["base"]), base, ceja_color, not tuerce)
		if tuerce:
			cejas_look = cejas
			cejas = Expresiones.deforma_cejas(cejas, cfg, String(entry["base"]))
		elif expresion != null and Expresiones.quita_cejas(cfg):
			cejas = _empty(size)
	if cfg.has("hair_tips"):
		_puntas(frente, _frente_pelo(hair, size, off_cab,
			_color(cfg["hair_tips"], hair_color), entry, desv, base), cejas_look)
	var receta_acc: Dictionary = _piece("accessories", accessory, direction)
	var capas: Dictionary = {
		"hair_back": _layer(hair, "back", size, off_cab, hair_color, entry, desv, true),
			"face_tattoo": Appearance.FaceTattoos.layer(cfg, direction, entry, size),
			"base": base,
			"hair_front": frente,
			"hair_acc": _layer(receta_acc, "front", size, off_cab, Color.TRANSPARENT, entry, desv),
			"mask": _layer(_piece("accessories", mask_style, direction), "front", size, off_cab, Color.TRANSPARENT, entry, desv),
			"brows": cejas,
			"beard": _layer(beard, "front", size, off_cab, hair_color, entry, desv, true),
			"occlusion": _occlusion(entry, base),
		}
	if expresion != null:
		capas["expresion"] = expresion








	var clips: Array[Image] = []
	if receta_acc.has("clip"):
		clips.append(_layer(receta_acc, "clip", size, off_cab, Color.TRANSPARENT, entry, desv))
	var piel_propia: Color = cfg.get("skin", Color.TRANSPARENT)
	for capa in CAPAS_PROPIAS:
		var llave: String = CAPAS_PROPIAS[capa][0]
		if not cfg.has(llave):
			continue
		var receta: Dictionary = _piece(CAPAS_PROPIAS[capa][1], str(cfg[llave]), direction)
		if receta.is_empty():


			continue
		capas[capa] = _layer(receta, "front", size, off_cab, Color.TRANSPARENT, entry, desv,
			false, true, 2, piel_propia if not capa in ["neck_acc", "torso_acc"] else Color.TRANSPARENT)
		if capa == "head_acc" and receta.has("clip"):


			clips.append(_layer(receta, "clip", size, off_cab, Color.TRANSPARENT, entry, desv))
	_repone_motas(capas)



	for clip in clips:
		_recorta_bajo(capas["hair_front"], clip)
		_recorta_bajo(capas["hair_back"], clip)
	return capas


























const SUELTOS_GIRO: StringName = &"sueltos_giro"



const MOTA_TOLERANCIA: int = 60
static func _repone_motas(capas: Dictionary) -> void:
	var tocadas: Array[String] = []
	for nombre in ORDER:
		var capa: Image = capas.get(nombre)
		if capa != null and capa.has_meta(SUELTOS_GIRO):
			tocadas.append(nombre)
	if tocadas.is_empty():
		return
	var vista: Image = _empty((capas["base"] as Image).get_size())
	for nombre in ORDER:
		var capa: Image = capas.get(nombre)
		if capa != null:
			vista.blend_rect(capa, Rect2i(Vector2i.ZERO, capa.get_size()), Vector2i.ZERO)


	var destapados: Dictionary = {}
	for nombre in tocadas:
		var capa: Image = capas[nombre]
		var borrados: Dictionary = capa.get_meta(SUELTOS_GIRO)
		capa.remove_meta(SUELTOS_GIRO)
		for p: Vector2i in borrados:
			if capa.get_pixelv(p).a <= 0.0:
				if not destapados.has(p):
					destapados[p] = []
				destapados[p].append([capa, borrados[p][0], borrados[p][1]])

	var tocados: Array[Vector2i] = []
	for p: Vector2i in destapados:
		var trozo: bool = false
		for par: Array in destapados[p]:
			trozo = trozo or bool(par[2])
		if trozo and not _en_el_aire(vista, p):
			tocados.append(p)
	_repone(capas, vista, destapados, tocados)

	for p: Vector2i in destapados.keys():
		if destapados.has(p):
			_repone(capas, vista, destapados, _mota(vista, p, destapados))



static func _en_el_aire(vista: Image, p: Vector2i) -> bool:
	for dy in range(-1, 2):
		for dx in range(-1, 2):
			var r: Vector2i = p + Vector2i(dx, dy)
			if r.x >= 0 and r.y >= 0 and r.x < vista.get_width() and r.y < vista.get_height() \
					and vista.get_pixelv(r).a > 0.0:
				return false
	return true



static func _repone(capas: Dictionary, vista: Image, destapados: Dictionary,
		grupo: Array[Vector2i]) -> void:
	for q in grupo:
		for par: Array in destapados[q]:
			(par[0] as Image).set_pixelv(q, par[1])
		destapados.erase(q)
		var c: Color = Color(0, 0, 0, 0)
		for nombre in ORDER:
			var capa: Image = capas.get(nombre)
			if capa != null:
				c = c.blend(capa.get_pixelv(q))
		vista.set_pixelv(q, c)



static func _mota(vista: Image, p: Vector2i, destapados: Dictionary) -> Array[Vector2i]:
	var semilla: Color = vista.get_pixelv(p)
	var grupo: Array[Vector2i] = [p]
	var visto: Dictionary = {p: true}
	var i: int = 0
	while i < grupo.size():
		var q: Vector2i = grupo[i]
		i += 1
		for d: Vector2i in [Vector2i(1, 0), Vector2i(-1, 0), Vector2i(0, 1), Vector2i(0, -1)]:
			var r: Vector2i = q + d
			var fuera: bool = r.x < 0 or r.y < 0 or r.x >= vista.get_width() or r.y >= vista.get_height()
			var c: Color = Color(0, 0, 0, 0) if fuera else vista.get_pixelv(r)
			if not _mismo_tono(c, semilla):
				continue
			if fuera or not destapados.has(r):
				return []
			if not visto.has(r):
				visto[r] = true
				grupo.append(r)
	return grupo


static func _mismo_tono(a: Color, b: Color) -> bool:
	if a.a <= 0.0 or b.a <= 0.0:
		return a.a <= 0.0 and b.a <= 0.0
	return absi(a.r8 - b.r8) + absi(a.g8 - b.g8) + absi(a.b8 - b.b8) <= MOTA_TOLERANCIA







static func _frente_pelo(hair: Dictionary, size: Vector2i, offset: Vector2i, target: Color,
		entry: Dictionary, desvio: Vector2i, base: Image) -> Image:
	var capa: Image = _layer(hair, "front", size, offset, target, entry, desvio, false, false)
	_sin_contorno_interior(capa, base)
	_tapa_agujeros(capa, base)
	_tapa_esquinas(capa, base)





	if entry.has("angle") and (float(entry.get("angle", 0)) != 0 or entry.get("scale", [1, 1]) != [1, 1]):
		_limpia_giro(capa, hair, "front", target, entry, desvio)
		_cose_giro(capa, hair, "front", target, entry, desvio)
	return capa




static func _pose_girada(pose: Dictionary, desvio: Vector2i) -> Dictionary:
	if desvio == Vector2i.ZERO:
		return pose
	var pose_g: Dictionary = pose.duplicate()
	var o: Array = pose.get("offset", [0, 0])
	pose_g["offset"] = [float(o[0]) + desvio.x, float(o[1]) + desvio.y]
	return pose_g







static func _limpia_giro(capa: Image, recipe: Dictionary, part: String, target: Color,
		pose: Dictionary, desvio: Vector2i) -> void:
	var piece: Image =(_tintadas.get(String(recipe.get(part, "")), {}) as Dictionary).get(target) as Image
	if piece == null:
		return
	var borrados: Dictionary = Placement.sin_sueltos(capa, piece, _pose_girada(pose, desvio),
		_color(recipe.get("outline", OUTLINE_COLOR), OUTLINE_COLOR))
	if not borrados.is_empty():
		capa.set_meta(SUELTOS_GIRO, borrados)



















static func _cose_giro(capa: Image, recipe: Dictionary, part: String, target: Color,
		pose: Dictionary, desvio: Vector2i, minimo: int = 2) -> void:
	var piece: Image =(_tintadas.get(String(recipe.get(part, "")), {}) as Dictionary).get(target) as Image
	if piece == null:
		return
	var cosidos: Dictionary = Placement.zurce(capa, piece, _pose_girada(pose, desvio), minimo)
	if cosidos.is_empty() or not capa.has_meta(SUELTOS_GIRO):
		return
	var borrados: Dictionary = capa.get_meta(SUELTOS_GIRO)
	for p in cosidos:
		borrados.erase(p)
	if borrados.is_empty():
		capa.remove_meta(SUELTOS_GIRO)















const PUNTAS_HASTA: float = 0.5
static func _puntas(frente: Image, puntas: Image, cejas: Image) -> void:
	var caja: Rect2i = frente.get_used_rect()
	if caja.size.y <= 0:
		return
	var arriba: float = float(caja.position.y)
	var caja_cejas: Rect2i = cejas.get_used_rect()
	var ancla: float = float(caja_cejas.position.y) if caja_cejas.size.y > 0 \
			else arriba + float(caja.size.y) * 0.5
	var borde: float = arriba + maxf((ancla - arriba) * PUNTAS_HASTA, 1.0)
	for y in range(caja.position.y, mini(caja.end.y, int(ceil(borde)) + 1)):
		var mezcla: float = clampf(borde - float(y) + 0.5, 0.0, 1.0)
		if mezcla <= 0.0:
			continue
		for x in range(caja.position.x, caja.end.x):
			var c: Color = frente.get_pixel(x, y)
			var p: Color = puntas.get_pixel(x, y)
			if c.a <= 0.0 or p.a <= 0.0:
				continue
			frente.set_pixel(x, y, c.lerp(p, mezcla))









static var _vacio_clip: Image = null


static func _recorta_bajo(capa: Image, clip: Image) -> void:
	if clip.get_size() != capa.get_size():
		return
	var caja: Rect2i = clip.get_used_rect()
	if caja.size == Vector2i.ZERO:
		return
	if _vacio_clip == null or _vacio_clip.get_size() != capa.get_size() \
			or _vacio_clip.get_format() != capa.get_format():
		_vacio_clip = Image.create(capa.get_width(), capa.get_height(), false, capa.get_format())
	capa.blit_rect_mask(_vacio_clip, clip, caja, caja.position)







































static func _sin_contorno_interior(capa: Image, base: Image) -> void:
	var antes: Image = capa.duplicate(true)








	var caja: Rect2i = capa.get_used_rect()
	for y in range(caja.position.y, caja.end.y):
		for x in range(caja.position.x, caja.end.x):
			if not _es_contorno_de_dentro(antes, base, x, y):
				continue










			var quedan: int = 0
			for d: Vector2i in [Vector2i(1, 0), Vector2i(-1, 0), Vector2i(0, 1), Vector2i(0, -1)]:
				if not _es_contorno_de_dentro(antes, base, x + d.x, y + d.y):
					quedan += 1
			if quedan < 3:
				continue
			capa.set_pixel(x, y, Color(0, 0, 0, 0))





static func _es_contorno_de_dentro(antes: Image, base: Image, x: int, y: int) -> bool:
	if x <= 0 or y <= 0 or x >= antes.get_width() - 1 or y >= antes.get_height() - 1:
		return false
	var c: Color = antes.get_pixel(x, y)
	if c.a <= 0.0 or not c.is_equal_approx(OUTLINE_COLOR):
		return false
	if x >= base.get_width() or y >= base.get_height() or base.get_pixel(x, y).a <= 0.0:
		return false
	return antes.get_pixel(x - 1, y).a > 0.0 and antes.get_pixel(x + 1, y).a > 0.0 \
			and antes.get_pixel(x, y - 1).a > 0.0 and antes.get_pixel(x, y + 1).a > 0.0




















static func _tapa_agujeros(capa: Image, base: Image) -> void:
	var antes: Image = capa.duplicate(true)
	var an: int = mini(capa.get_width(), base.get_width())
	var al: int = mini(capa.get_height(), base.get_height())





	var caja: Rect2i = capa.get_used_rect().grow(1).intersection(
		Rect2i(1, 1, maxi(0, an - 2), maxi(0, al - 2)))
	for y in range(caja.position.y, caja.end.y):
		for x in range(caja.position.x, caja.end.x):
			if antes.get_pixel(x, y).a > 0.0 or base.get_pixel(x, y).a <= 0.0:
				continue
			var cuenta: Dictionary = {}
			var n: int = 0
			for d: Vector2i in [Vector2i(1, 0), Vector2i(-1, 0), Vector2i(0, 1), Vector2i(0, -1)]:
				var c: Color = antes.get_pixel(x + d.x, y + d.y)
				if c.a > 0.0:
					n += 1
					cuenta[c] = int(cuenta.get(c, 0)) + 1
			if n < 3:
				continue
			var mejor: Color = Color(0, 0, 0, 0)
			var veces: int = 0
			for c: Color in cuenta:
				if int(cuenta[c]) > veces:
					veces = int(cuenta[c])
					mejor = c
			capa.set_pixel(x, y, mejor)



























const CONTORNO_BASE_V: float = 0.12
const ESQUINA_FILAS: int = 5
static func _tapa_esquinas(capa: Image, base: Image) -> void:
	var antes: Image = capa.duplicate(true)
	var an: int = mini(capa.get_width(), base.get_width())
	var al: int = mini(capa.get_height(), base.get_height())
	var caja: Rect2i = capa.get_used_rect().grow(1).intersection(
		Rect2i(1, 1, maxi(0, an - 2), maxi(0, al - 2)))
	var coronilla: int = base.get_used_rect().position.y + ESQUINA_FILAS
	for y in range(caja.position.y, caja.end.y):
		for x in range(caja.position.x, caja.end.x):
			if antes.get_pixel(x, y).a > 0.0:
				continue
			var debajo: Color = base.get_pixel(x, y)
			if debajo.a <= 0.0 or debajo.v < CONTORNO_BASE_V:
				continue
			var cuenta: Dictionary = {}
			var n: int = 0
			var cercado: bool = true
			for d: Vector2i in [Vector2i(1, 0), Vector2i(-1, 0), Vector2i(0, 1), Vector2i(0, -1)]:
				var c: Color = antes.get_pixel(x + d.x, y + d.y)
				if c.a > 0.0:
					n += 1
					cuenta[c] = int(cuenta.get(c, 0)) + 1
					continue
				var b: Color = base.get_pixel(x + d.x, y + d.y)
				if b.a <= 0.0 or b.v >= CONTORNO_BASE_V:
					cercado = false
					break
			if not cercado:
				continue
			if n == 4:
				var mejor: Color = OUTLINE_COLOR
				var veces: int = 0
				for c: Color in cuenta:
					if int(cuenta[c]) > veces:
						veces = int(cuenta[c])
						mejor = c
				capa.set_pixel(x, y, mejor)
			elif n >= 2 and y < coronilla:
				capa.set_pixel(x, y, OUTLINE_COLOR)


const HAIR_ACC_DARK: Color = Color("141418")
const HAIR_ACC_LIGHT: Color = Color("f0f0f0")
static func _hair_acc_layer(style: String, size: Vector2i, offset: Vector2i,
		direction: String) -> Image:
	var out: Image = _empty(size)
	if style == "banda_pelo":
		var y: int = offset.y +(25 if direction == "north" else 22)
		for x in range(offset.x + 39, offset.x + 53):
			for yy in range(y, y + 2):
				_put(out, Vector2i(x, yy), HAIR_ACC_DARK)
	elif style == "liga_coleta":
		var c: Vector2i = Vector2i(offset.x + 46, offset.y + 25)
		if direction == "east":
			c = Vector2i(offset.x + 41, offset.y + 25)
		elif direction == "west":
			c = Vector2i(offset.x + 51, offset.y + 25)
		elif direction == "north":
			c = Vector2i(offset.x + 46, offset.y + 24)
		_disc(out, c, 1, HAIR_ACC_LIGHT)
	return out


static func _put(img: Image, p: Vector2i, color: Color) -> void:
	if p.x < 0 or p.y < 0 or p.x >= img.get_width() or p.y >= img.get_height():
		return
	img.set_pixel(p.x, p.y, color)


static func _disc(img: Image, center: Vector2i, radius: int, color: Color) -> void:
	for y in range(center.y - radius, center.y + radius + 1):
		for x in range(center.x - radius, center.x + radius + 1):
			var dx: int = x - center.x
			var dy: int = y - center.y
			if dx * dx + dy * dy <= radius * radius:
				_put(img, Vector2i(x, y), color)


static func _occlusion(entry: Dictionary, base: Image) -> Image:
	var out = _empty(base.get_size())
	var tex = _texture(String(entry.get("occlusion", "")))
	if tex == null:
		return out
	var mask = _image(tex)
	for y in base.get_height():
		for x in base.get_width():
			if mask.get_pixel(x, y).a > 0:
				out.set_pixel(x, y, base.get_pixel(x, y))
	return out










static func pieza_en_cuadro(path: String, vistas: Dictionary) -> Image:
	KitRecolor.candado_toma()
	var img: Image = _pieza_en_cuadro_sin_candado(path, vistas)
	KitRecolor.candado_suelta()
	return img


static func _pieza_en_cuadro_sin_candado(path: String, vistas: Dictionary) -> Image:
	var entry: Dictionary = _frame(path)
	if entry.is_empty():
		return null
	var base_tex: Texture2D = _texture(String(entry["base"]))
	if base_tex == null:
		return null
	var direction: String = String(entry.get("head_direction", entry["direction"]))
	if not vistas.has(direction):
		return null
	var offset: Vector2i = Vector2i(int(entry.get("offset", [0, 0])[0]),
		int(entry.get("offset", [0, 0])[1]))
	var desv: Vector2i = DESVIO_CABEZA.get(direction, Vector2i.ZERO)
	var capa: Image = _layer({"front": String(vistas[direction])}, "front",
		Vector2i(base_tex.get_width(), base_tex.get_height()), offset + desv,
		Color.TRANSPARENT, entry, desv)
	var tapa: Texture2D = _texture(String(entry.get("occlusion", "")))
	if tapa != null:
		var mascara: Image = _image(tapa)
		var r: Rect2i = capa.get_used_rect().intersection(
			Rect2i(Vector2i.ZERO, mascara.get_size()))
		for y in range(r.position.y, r.end.y):
			for x in range(r.position.x, r.end.x):
				if mascara.get_pixel(x, y).a > 0.0:
					capa.set_pixel(x, y, Color.TRANSPARENT)
	return null if capa.is_invisible() else capa




static func compose(path: String, cfg: Dictionary) -> ImageTexture:
	KitRecolor.candado_toma()
	var tex: ImageTexture = _compose_sin_candado(path, cfg)
	KitRecolor.candado_suelta()
	return tex


static func _compose_sin_candado(path: String, cfg: Dictionary) -> ImageTexture:
	var key: String = path + var_to_str(cfg)
	if _composed.has(key):
		return _composed[key]
	var layers: Dictionary = layer_images(path, cfg)
	if layers.is_empty():
		return null


	if (layers["hair_back"] as Image).is_invisible() \
			and (layers["hair_front"] as Image).is_invisible() \
			and (layers["brows"] as Image).is_invisible() \
			and (layers["hair_acc"] as Image).is_invisible() \
			and (layers["face_tattoo"] as Image).is_invisible() \
			and (layers["mask"] as Image).is_invisible() \
			and (layers["beard"] as Image).is_invisible() \
			and _propias_invisibles(layers) \
			and not layers.has("expresion"):
		var bare: ImageTexture = ImageTexture.create_from_image(layers["base"])

		KitRecolor.apunta_compuesta(bare, layers["base"], key)
		_purga_composed()
		_composed[key] = bare
		KitRecolor._apunta_clave(key, true)
		return bare
	var out: Image = _empty((layers["base"] as Image).get_size())
	for name in ORDER:

		var layer: Image = layers.get(name)
		if layer == null:
			continue
		out.blend_rect(layer, Rect2i(Vector2i.ZERO, layer.get_size()), Vector2i.ZERO)
	var tex: ImageTexture = ImageTexture.create_from_image(out)
	KitRecolor.apunta_compuesta(tex, out, key)
	_purga_composed()
	_composed[key] = tex
	KitRecolor._apunta_clave(key, true)
	return tex








static func expulsa_compuesta(key: String) -> bool:
	KitRecolor.candado_toma()
	var habia: bool = _composed.erase(key)
	KitRecolor.candado_suelta()
	return habia





static func expulsa_compuesta_si(key: String, tex: Texture2D) -> bool:
	KitRecolor.candado_toma()
	var habia: bool = is_same(_composed.get(key), tex) and _composed.erase(key)
	KitRecolor.candado_suelta()
	return habia


static func _propias_invisibles(layers: Dictionary) -> bool:
	for capa in CAPAS_PROPIAS:
		if layers.has(capa) and not (layers[capa] as Image).is_invisible():
			return false
	return true


















static func _purga_tintadas() -> void:
	if _tintadas_n < CACHE_MAX:
		return
	var objetivo: int = CACHE_MAX - CACHE_PURGA
	for k in _tintadas.keys():
		if _tintadas_n <= objetivo:
			break
		_tintadas_n -=(_tintadas[k] as Dictionary).size()
		_tintadas.erase(k)
	if _tintadas.is_empty():
		_tintadas_n = 0


static func _purga_composed() -> void:
	if _composed.size() < CACHE_MAX:
		return
	for k in _composed.keys().slice(0, CACHE_PURGA):
		_composed.erase(k)




static func _test_set_manifest(manifest: Dictionary) -> void:
	clear_cache()
	_manifest = manifest.duplicate(true)
	_manifest_loaded = true
