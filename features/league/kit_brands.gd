class_name KitBrands
extends RefCounted













































const DIR_BASE: String = "user://kit_brands"



static func dir() -> String:
	return ToolStash.activa(DIR_BASE)








const MAX_BYTES: int = 64 * 1024





const MAX_PX: int = 256




const HUECO: String = "{C}"



static var version: int = 0



















static var base_activas: bool = true

static var _index: Dictionary = {}
static var _indexed: bool = false
static var _cache: Dictionary = {}
static var _rotas: Dictionary = {}


















const VARIANTES_JSON: String = "_variantes.json"



const SLOT_LLAVE: Dictionary = {1: "visita", 2: "tercera"}

static var _variantes: Dictionary = {}



static func has(marca: String) -> bool:


	if Anuncios.es_id(marca):
		return Anuncios.logo(marca) != null
	_ensure_indexed()
	if _index.has(marca):
		return true
	return _base_activo() and MarcasBase.has(marca)



static func count() -> int:
	_ensure_indexed()
	return _index.size()



static func marcas() -> Array:
	_ensure_indexed()
	if _base_activo():
		return MarcasBase.ids()
	var out: Array = _index.keys()
	out.sort()
	return out







static func de_fabrica() -> bool:
	_ensure_indexed()
	return base_activas and _index.is_empty()




static func _base_activo() -> bool:
	return base_activas and _index.is_empty()










static func for_team(team_id: String, retro: bool = false, slot: int = 0) -> Texture2D:








	if JuegosOlimpicos.en_juego() and Teams.by_id(team_id).is_empty() \
			and not Nations.by_id(team_id).is_empty():
		return CompLogos.texture(JuegosOlimpicos.LOGO) \
				if CompLogos.has(JuegosOlimpicos.LOGO) else JuegosOlimpicos.marca()



	var marca: String = RetroKits.brand_of(team_id) if retro \
			else KitDeals.brand_of(team_id)
	if marca.is_empty():
		return null



	if not retro:
		var otra: String = variante(marca, slot)
		if otra != marca:
			var tex: Texture2D = texture(otra)

			if tex != null:
				return tex
	return texture(marca)





static func variante(marca: String, slot: int) -> String:
	_ensure_indexed()
	if marca.is_empty() or _base_activo() or not SLOT_LLAVE.has(slot):
		return marca
	var reglas: Dictionary = _variantes.get(marca, {})
	var otra: String = String(reglas.get(SLOT_LLAVE[slot], ""))




	if otra.is_empty() and slot == 2:
		otra = String(reglas.get("visita", ""))
	if otra.is_empty() or otra == marca or not has(otra):
		return marca
	return otra








static func bases() -> Array:
	var todas: Array = marcas()
	if _variantes.is_empty() or _base_activo():
		return todas
	var dibujos: Dictionary = {}
	for reglas in _variantes.values():
		for id in (reglas as Dictionary).values():
			dibujos[String(id)] = true
	var out: Array = []
	for m in todas:

		if not dibujos.has(String(m)) or _variantes.has(String(m)):
			out.append(m)
	return out






static func set_variantes(marca: String, reglas: Dictionary) -> void:
	if marca.is_empty() or TeamEdits.id_de_archivo(marca) != marca:
		return
	_ensure_indexed()
	var limpias: Dictionary = {}
	for llave in SLOT_LLAVE.values():


		var id: String = TeamEdits.id_de_archivo(String(reglas.get(llave, "")).strip_edges())
		if not id.is_empty() and id != marca:
			limpias[llave] = id
	if limpias.is_empty():
		if not _variantes.has(marca):
			return
		_variantes.erase(marca)
	else:
		_variantes[marca] = limpias
	_escribe_variantes()
	version += 1









static func texture(marca: String, col: Color = Color.WHITE) -> Texture2D:
	if Anuncios.es_id(marca):
		return Anuncios.logo(marca)
	if not has(marca) or _rotas.has(marca):
		return null
	var llave: String = "%s|%s" % [marca, col.to_html(false)]
	if _cache.has(llave):
		return _cache[llave]
	var img: Image = null
	if not _index.has(marca):






		var suyo: Color = MarcasBase.color(marca) if col == Color.WHITE else col
		var texto: String = MarcasBase.rotulo(marca)
		img = RotuloMarca.imagen(texto, MarcasBase.estilo(marca), suyo) \
				if not texto.is_empty() else _raster(MarcasBase.svg(marca), suyo)
	elif String(_index.get(marca, "svg")) == "png":



		var raster: Image = Image.new()
		if raster.load(_path(marca)) == OK:
			img = raster
	else:
		var svg: String = _leer(marca)
		if not svg.is_empty():
			img = _raster(svg, col)
	if img == null:




		_rotas[marca] = true
		return null






	var limpia: Image = Pecho.logo_limpio(img)
	if limpia == null:
		_rotas[marca] = true
		return null
	var tex: ImageTexture = ImageTexture.create_from_image(limpia)
	if _cache.size() > 64:
		_cache.clear()
	_cache[llave] = tex
	return tex









static func set_svg(marca: String, texto: String) -> String:


	if marca.is_empty() or TeamEdits.id_de_archivo(marca) != marca:
		return I18n.t("marca desconocida")
	if texto.to_utf8_buffer().size() > MAX_BYTES:
		return I18n.tf("pesa {0} KB (tope {1})", [
			texto.to_utf8_buffer().size() / 1024, MAX_BYTES / 1024])
	if not texto.contains("<svg"):
		return I18n.t("no es un SVG válido")
	if _raster(texto, Color.WHITE) == null:
		return I18n.t("no es un SVG válido")
	DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path(dir()))
	_ensure_indexed()



	var antes: Variant = _index.get(marca)
	_index[marca] = "svg"
	var f: FileAccess = FileAccess.open(_path(marca), FileAccess.WRITE)
	if f == null:
		if antes == null:
			_index.erase(marca)
		else:
			_index[marca] = antes
		return I18n.t("no se pudo escribir")
	f.store_string(texto)
	f.close()
	_olvida(marca)
	version += 1
	return ""






static func set_png(marca: String, bytes: PackedByteArray) -> String:

	if marca.is_empty() or TeamEdits.id_de_archivo(marca) != marca:
		return I18n.t("marca desconocida")
	if bytes.size() > MAX_BYTES:
		return I18n.tf("pesa {0} KB (tope {1})", [bytes.size() / 1024, MAX_BYTES / 1024])
	var img: Image = Image.new()
	if img.load_png_from_buffer(bytes) != OK:
		return I18n.t("no es un PNG válido")
	if img.get_width() > MAX_PX or img.get_height() > MAX_PX:
		return I18n.tf("{0}x{1} (tope {2}x{3})", [img.get_width(), img.get_height(), MAX_PX, MAX_PX])
	DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path(dir()))
	_ensure_indexed()

	_index[marca] = "png"
	var f: FileAccess = FileAccess.open(_path(marca), FileAccess.WRITE)
	if f == null:
		_index.erase(marca)
		return I18n.t("no se pudo escribir")
	f.store_buffer(bytes)
	f.close()
	_olvida(marca)
	version += 1
	return ""



static func clear_all() -> void:
	_ensure_indexed()
	for marca in _index.keys():
		DirAccess.remove_absolute(_path(String(marca)))


	DirAccess.remove_absolute(dir() + "/" + VARIANTES_JSON)
	_index = {}
	_variantes = {}
	_cache = {}
	version += 1


static func invalidate() -> void:
	_indexed = false
	_index = {}
	_variantes = {}
	_cache = {}
	_rotas = {}
	version += 1













static func _raster(svg: String, col: Color) -> Image:




	var texto: String = svg.replace(HUECO, "#" + col.to_html(false)) \
			.replace("{D}", "#" + col.darkened(0.42).to_html(false))
	var base: Image = Image.new()
	if base.load_svg_from_string(texto, 1.0) != OK:
		return null
	var lado: int = maxi(base.get_width(), base.get_height())
	if lado <= 0:
		return null
	if lado == MAX_PX:
		return base
	var img: Image = Image.new()
	if img.load_svg_from_string(texto, float(MAX_PX) / float(lado)) != OK:
		return base
	return img


static func _leer(marca: String) -> String:
	var f: FileAccess = FileAccess.open(_path(marca), FileAccess.READ)
	if f == null:
		return ""
	var s: String = f.get_as_text()
	f.close()
	return s





static func _olvida(marca: String) -> void:
	for k in _cache.keys():
		if String(k).begins_with(marca + "|"):
			_cache.erase(k)


static func _path(marca: String) -> String:
	_ensure_indexed()
	return "%s/%s.%s" % [dir(), marca, String(_index.get(marca, "svg"))]


static func _ensure_indexed() -> void:
	if _indexed:
		return
	_indexed = true
	_index = {}
	_variantes = {}
	var d: DirAccess = DirAccess.open(dir())
	if d == null:
		return
	for name in d.get_files():
		var ext: String = String(name).get_extension().to_lower()
		if ext == "svg" or ext == "png":

			var id: String = String(name).get_basename()
			if ext == "svg" or not _index.has(id):
				_index[id] = ext
	_variantes = _lee_variantes()



static func _lee_variantes() -> Dictionary:
	var f: FileAccess = FileAccess.open(dir() + "/" + VARIANTES_JSON, FileAccess.READ)
	if f == null:
		return {}
	var datos: Variant = JSON.parse_string(f.get_as_text())
	f.close()
	var out: Dictionary = {}
	if datos is Dictionary:
		var dic: Dictionary = datos
		for marca in dic:
			if dic[marca] is Dictionary:
				out[String(marca)] = dic[marca]
	return out




static func _escribe_variantes() -> void:
	var ruta: String = dir() + "/" + VARIANTES_JSON
	if _variantes.is_empty():
		DirAccess.remove_absolute(ruta)
		return
	DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path(dir()))
	var f: FileAccess = FileAccess.open(ruta, FileAccess.WRITE)
	if f == null:
		return
	f.store_string(JSON.stringify(_variantes, "\t"))
	f.close()









static func stash_for_tool() -> void:
	ToolStash.desvia(DIR_BASE)
	invalidate()


static func unstash_for_tool() -> void:
	ToolStash.devuelve(DIR_BASE)
	invalidate()
