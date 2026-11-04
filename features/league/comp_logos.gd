class_name CompLogos
extends RefCounted




























const DIR_BASE: String = "user://comp_logos"



static func dir() -> String:
	return ToolStash.activa(DIR_BASE)







const MAX_PX: int = 256
const MAX_BYTES: int = 96 * 1024

static var _index: Dictionary = {}
static var _indexed: bool = false
static var _cache: Dictionary = {}
static var _luma: Dictionary = {}



static func has(tipo: String) -> bool:
	_ensure_indexed()
	return _index.has(tipo)



static func count() -> int:
	_ensure_indexed()
	return _index.size()


static func texture(tipo: String) -> Texture2D:
	if not has(tipo):
		return null
	if _cache.has(tipo):
		return _cache[tipo]
	var img: Image = Image.new()
	if img.load(_path(tipo)) != OK:


		_index.erase(tipo)
		return null
	var tex: ImageTexture = ImageTexture.create_from_image(img)



	_luma[tipo] = _measure_luma(img)
	_cache[tipo] = tex
	return tex













static func luma(tipo: String) -> float:
	if not _luma.has(tipo):
		texture(tipo)

	return float(_luma.get(tipo, 1.0))





static func _measure_luma(img: Image) -> float:
	var w: int = img.get_width()
	var h: int = img.get_height()
	if w <= 0 or h <= 0:
		return 1.0
	var paso: int = maxi(1, int(maxf(float(w), float(h)) / 48.0))
	var suma: float = 0.0
	var peso: float = 0.0
	var y: int = 0
	while y < h:
		var x: int = 0
		while x < w:
			var px: Color = img.get_pixel(x, y)
			suma += px.get_luminance() * px.a
			peso += px.a
			x += paso
		y += paso
	if peso <= 0.001:
		return 1.0
	return suma / peso






static func set_png(tipo: String, bytes: PackedByteArray) -> String:



	if tipo.is_empty() or TeamEdits.id_de_archivo(tipo) != tipo:
		return I18n.t("competición desconocida")
	if bytes.size() > MAX_BYTES:
		return I18n.tf("pesa {0} KB (tope {1})", [bytes.size() / 1024, MAX_BYTES / 1024])
	var img: Image = Image.new()
	if img.load_png_from_buffer(bytes) != OK:
		return I18n.t("no es un PNG válido")
	if img.get_width() > MAX_PX or img.get_height() > MAX_PX:
		return I18n.tf("{0}x{1} (tope {2}x{3})", [img.get_width(), img.get_height(), MAX_PX, MAX_PX])
	DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path(dir()))
	var f: FileAccess = FileAccess.open(_path(tipo), FileAccess.WRITE)
	if f == null:
		return I18n.t("no se pudo escribir")
	f.store_buffer(bytes)
	f.close()
	_ensure_indexed()
	_index[tipo] = true
	_cache.erase(tipo)
	_luma.erase(tipo)
	return ""



static func clear_comp(tipo: String) -> void:
	_ensure_indexed()
	if not _index.has(tipo):
		return
	DirAccess.remove_absolute(_path(tipo))
	_index.erase(tipo)
	_cache.erase(tipo)
	_luma.erase(tipo)



static func clear_all() -> void:
	_ensure_indexed()
	for tipo in _index.keys():
		DirAccess.remove_absolute(_path(String(tipo)))
	_index = {}
	_cache = {}
	_luma = {}




static func invalidate() -> void:
	_indexed = false
	_index = {}
	_cache = {}
	_luma = {}


static func _path(tipo: String) -> String:
	return "%s/%s.png" % [dir(), tipo]


static func _ensure_indexed() -> void:
	if _indexed:
		return
	_indexed = true
	_index = {}
	var d: DirAccess = DirAccess.open(dir())
	if d == null:
		return
	for name in d.get_files():
		if String(name).ends_with(".png"):
			_index[String(name).get_basename()] = true









static func stash_for_tool() -> void:
	ToolStash.desvia(DIR_BASE)
	invalidate()


static func unstash_for_tool() -> void:
	ToolStash.devuelve(DIR_BASE)
	invalidate()
