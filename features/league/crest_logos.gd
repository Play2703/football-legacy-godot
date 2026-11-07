class_name CrestLogos
extends RefCounted





















const DIR_BASE: String = "user://logos"



static func dir() -> String:
	return ToolStash.activa(DIR_BASE)













const NAT_PREFIJO: String = "nat_"





static func key_of(team: Dictionary) -> String:
	var id: String = String(team.get("id", ""))
	if id.is_empty():
		return ""
	return (NAT_PREFIJO + id) if bool(team.get("is_nation", false)) else id







const MAX_PX: int = 256
const MAX_BYTES: int = 96 * 1024









const _CACHE_MAX: int = 48






static var version: int = 0

static var _index: Dictionary = {}
static var _indexed: bool = false
static var _cache: Dictionary = {}
static var _orden: Array[String] = []



static func has(team_id: String) -> bool:
	_ensure_indexed()
	return _index.has(team_id)



static func count() -> int:
	_ensure_indexed()
	return _index.size()










static func texture(team_id: String, retro: bool = false) -> Texture2D:
	if not has(team_id):
		return null
	if retro:
		return _retro(team_id)
	if _cache.has(team_id):




		_orden.erase(team_id)
		_orden.append(team_id)
		return _cache[team_id]
	var img: Image = Image.new()
	if img.load(_path(team_id)) != OK:


		_index.erase(team_id)
		return null
	if not img.has_mipmaps():
		img.generate_mipmaps()
	var tex: ImageTexture = ImageTexture.create_from_image(img)
	_cache[team_id] = tex
	_orden.append(team_id)
	while _orden.size() > _CACHE_MAX:
		_cache.erase(_orden.pop_front())
	return tex





const ORO_EPOCA: Color = Color("e0bc55")




const ORO_PISO: float = 0.42












static func _retro(team_id: String) -> Texture2D:
	var ck: String = team_id + "|retro"
	if _cache.has(ck):
		_orden.erase(ck)
		_orden.append(ck)
		return _cache[ck]
	var img: Image = Image.new()
	if img.load(_path(team_id)) != OK:
		_index.erase(team_id)
		return null
	img.convert(Image.FORMAT_RGBA8)
	for y in img.get_height():
		for x in img.get_width():
			var px: Color = img.get_pixel(x, y)
			if px.a <= 0.0:
				continue
			var k: float = ORO_PISO +(1.0 - ORO_PISO) * px.get_luminance()
			img.set_pixel(x, y, Color(ORO_EPOCA.r * k, ORO_EPOCA.g * k,
				ORO_EPOCA.b * k, px.a))
	if not img.has_mipmaps():
		img.generate_mipmaps()
	var tex: ImageTexture = ImageTexture.create_from_image(img)
	_cache[ck] = tex
	_orden.append(ck)
	while _orden.size() > _CACHE_MAX:
		_cache.erase(_orden.pop_front())
	return tex







static func set_png(team_id: String, bytes: PackedByteArray) -> String:
	if team_id.is_empty():
		return I18n.t("club desconocido")
	if bytes.size() > MAX_BYTES:
		return I18n.tf("pesa {0} KB (tope {1})", [bytes.size() / 1024, MAX_BYTES / 1024])
	var img: Image = Image.new()
	if img.load_png_from_buffer(bytes) != OK:
		return I18n.t("no es un PNG válido")
	if img.get_width() > MAX_PX or img.get_height() > MAX_PX:
		return I18n.tf("{0}x{1} (tope {2}x{3})", [img.get_width(), img.get_height(), MAX_PX, MAX_PX])
	DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path(dir()))
	var f: FileAccess = FileAccess.open(_path(team_id), FileAccess.WRITE)
	if f == null:
		return I18n.t("no se pudo escribir")
	f.store_buffer(bytes)
	f.close()
	_ensure_indexed()
	_index[team_id] = true
	_forget(team_id)
	version += 1
	return ""



static func clear_team(team_id: String) -> void:
	_ensure_indexed()
	if not _index.has(team_id):
		return
	DirAccess.remove_absolute(_path(team_id))
	_index.erase(team_id)
	_forget(team_id)
	version += 1



static func clear_all() -> void:
	_ensure_indexed()
	for team_id in _index.keys():
		DirAccess.remove_absolute(_path(String(team_id)))
	_index = {}
	_cache = {}
	_orden = []
	version += 1




static func invalidate() -> void:
	_indexed = false
	_index = {}
	_cache = {}
	_orden = []
	version += 1


static func _path(team_id: String) -> String:
	return "%s/%s.png" % [dir(), team_id]


static func _forget(team_id: String) -> void:
	_cache.erase(team_id)
	_orden.erase(team_id)



	var ck: String = team_id + "|retro"
	_cache.erase(ck)
	_orden.erase(ck)


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
