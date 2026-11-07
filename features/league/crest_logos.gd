class_name CrestLogos
extends RefCounted





















const DIR_BASE: String = "user://logos"
const DIR_CUSTOM: String = "user://custom_crests"



static func dir() -> String:
	return ToolStash.activa(DIR_BASE)


static func dir_custom() -> String:
	return ToolStash.activa(DIR_CUSTOM)













const NAT_PREFIJO: String = "nat_"





static func key_of(team: Dictionary) -> String:
	var id: String = String(team.get("id", ""))
	if id.is_empty():
		return ""
	return (NAT_PREFIJO + id) if bool(team.get("is_nation", false)) else id







const MAX_PX: int = 512
const MAX_BYTES: int = 96 * 1024









const _CACHE_MAX: int = 128






static var version: int = 0

static var _index: Dictionary = {}
static var _svg_map: Dictionary = {}
static var _user_custom: Dictionary = {}
static var _indexed: bool = false
static var _cache: Dictionary = {}
static var _orden: Array[String] = []



static func has(team_id: String) -> bool:
	_ensure_indexed()
	return _user_custom.has(team_id) or _svg_map.has(team_id) or _index.has(team_id)



static func count() -> int:
	_ensure_indexed()
	var total: int = _index.size()
	for k in _svg_map:
		if not _index.has(k):
			total += 1
	for k in _user_custom:
		if not _svg_map.has(k) and not _index.has(k):
			total += 1
	return total


static func get_badge_source(team_id: String) -> String:
	_ensure_indexed()
	if _user_custom.has(team_id):
		return "USER_CUSTOM_PNG"
	elif _svg_map.has(team_id):
		return "OFFICIAL_SVG"
	elif _index.has(team_id):
		return "PNG_FALLBACK"
	return ""


static func get_svg_path(team_id: String) -> String:
	_ensure_indexed()
	return String(_svg_map.get(team_id, ""))







static func texture(team_id: String, retro: bool = false, target_px: int = 512) -> Texture2D:
	if not has(team_id):
		return null
	if retro:
		return _retro(team_id, target_px)
	var cache_key: String = "%s|%d" % [team_id, target_px]
	if _cache.has(cache_key):
		_orden.erase(cache_key)
		_orden.append(cache_key)
		return _cache[cache_key]

	var img: Image = null

	# Prioridade 1: Escudo personalizado do usuário em user://custom_crests/<id>.png
	if _user_custom.has(team_id):
		var u_img: Image = Image.new()
		var u_path = "%s/%s.png" % [dir_custom(), team_id]
		if u_img.load(u_path) == OK and not u_img.is_empty():
			img = u_img
		else:
			_user_custom.erase(team_id)

	# Prioridade 2: Escudo SVG vetorial oficial integrado
	if img == null and _svg_map.has(team_id):
		var svg_path: String = String(_svg_map[team_id])
		if FileAccess.file_exists(svg_path):
			var sf: FileAccess = FileAccess.open(svg_path, FileAccess.READ)
			if sf != null:
				var svg_text: String = sf.get_as_text()
				sf.close()
				var probe: Image = Image.new()
				if probe.load_svg_from_string(svg_text, 1.0) == OK and not probe.is_empty():
					var max_dim: float = maxf(float(probe.get_width()), float(probe_img_h(probe)))
					var desired_px: float = float(target_px if target_px > 0 else MAX_PX)
					var scale_factor: float = desired_px / max_dim if max_dim > 0.0 else 1.0
					var scaled_img: Image = Image.new()
					if scaled_img.load_svg_from_string(svg_text, scale_factor) == OK and not scaled_img.is_empty():
						img = scaled_img
					else:
						img = probe

	# Prioridade 3: PNG legado de fallback em user://logos/<id>.png
	if img == null and _index.has(team_id):
		var f_img: Image = Image.new()
		if f_img.load(_path(team_id)) == OK and not f_img.is_empty():
			img = f_img
		else:
			_index.erase(team_id)

	if img == null or img.is_empty():
		return null

	if not img.has_mipmaps():
		img.generate_mipmaps()
	var tex: ImageTexture = ImageTexture.create_from_image(img)
	_cache[cache_key] = tex
	_orden.append(cache_key)
	while _orden.size() > _CACHE_MAX:
		_cache.erase(_orden.pop_front())
	return tex


static func probe_img_h(p_img: Image) -> float:
	return float(p_img.get_height()) if p_img != null else 1.0






const ORO_EPOCA: Color = Color("e0bc55")




const ORO_PISO: float = 0.42












static func _retro(team_id: String, target_px: int = 512) -> Texture2D:
	var ck: String = "%s|%d|retro" % [team_id, target_px]
	if _cache.has(ck):
		_orden.erase(ck)
		_orden.append(ck)
		return _cache[ck]
	var base_tex: Texture2D = texture(team_id, false, target_px)
	if base_tex == null:
		return null
	var img: Image = base_tex.get_image()
	if img == null or img.is_empty():
		return null
	var retro_img: Image = img.duplicate()
	retro_img.convert(Image.FORMAT_RGBA8)
	for y in retro_img.get_height():
		for x in retro_img.get_width():
			var px: Color = retro_img.get_pixel(x, y)
			if px.a <= 0.0:
				continue
			var k: float = ORO_PISO +(1.0 - ORO_PISO) * px.get_luminance()
			retro_img.set_pixel(x, y, Color(ORO_EPOCA.r * k, ORO_EPOCA.g * k,
				ORO_EPOCA.b * k, px.a))
	if not retro_img.has_mipmaps():
		retro_img.generate_mipmaps()
	var tex: ImageTexture = ImageTexture.create_from_image(retro_img)
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
	
	DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path(dir_custom()))
	var custom_path = "%s/%s.png" % [dir_custom(), team_id]
	var f: FileAccess = FileAccess.open(custom_path, FileAccess.WRITE)
	if f == null:
		return I18n.t("no se pudo escribir")
	f.store_buffer(bytes)
	f.close()
	
	_ensure_indexed()
	_user_custom[team_id] = true
	_forget(team_id)
	version += 1
	return ""



static func clear_team(team_id: String) -> void:
	_ensure_indexed()
	var custom_path = "%s/%s.png" % [dir_custom(), team_id]
	if FileAccess.file_exists(custom_path):
		DirAccess.remove_absolute(custom_path)
	_user_custom.erase(team_id)
	_forget(team_id)
	version += 1



static func clear_all() -> void:
	_ensure_indexed()
	for team_id in _user_custom.keys():
		var cp = "%s/%s.png" % [dir_custom(), String(team_id)]
		if FileAccess.file_exists(cp):
			DirAccess.remove_absolute(cp)
	_user_custom = {}
	_cache = {}
	_orden = []
	version += 1




static func invalidate() -> void:
	_indexed = false
	_index = {}
	_svg_map = {}
	_user_custom = {}
	_cache = {}
	_orden = []
	version += 1


static func _path(team_id: String) -> String:
	return "%s/%s.png" % [dir(), team_id]


static func _forget(team_id: String) -> void:
	var prefix: String = team_id + "|"
	var to_erase: Array[String] = []
	for k in _cache.keys():
		var ks: String = String(k)
		if ks == team_id or ks.begins_with(prefix):
			to_erase.append(ks)
	for k in to_erase:
		_cache.erase(k)
		_orden.erase(k)


static func _ensure_indexed() -> void:
	if _indexed:
		return
	_indexed = true
	_index = {}
	_svg_map = {}
	_user_custom = {}

	# 1. Indexar escudos personalizados do usuário (user://custom_crests/*.png)
	var cd: DirAccess = DirAccess.open(dir_custom())
	if cd != null:
		for name in cd.get_files():
			if String(name).ends_with(".png"):
				_user_custom[String(name).get_basename()] = true

	# 2. Indexar mapeamento dos escudos SVG oficiais integrados
	var map_path: String = "res://assets/logos/svg_team_mapping.json"
	if FileAccess.file_exists(map_path):
		var mf: FileAccess = FileAccess.open(map_path, FileAccess.READ)
		if mf != null:
			var txt: String = mf.get_as_text()
			mf.close()
			var json: JSON = JSON.new()
			if json.parse(txt) == OK and json.data is Dictionary:
				var m_by_id = json.data.get("mapping_by_club_id", {})
				for cid in m_by_id:
					var item = m_by_id[cid]
					if item is Dictionary and item.has("svg_path"):
						_svg_map[String(cid)] = String(item["svg_path"])

	# 3. Indexar escudos PNG existentes como fallback (user://logos/*.png)
	var d: DirAccess = DirAccess.open(dir())
	if d != null:
		for name in d.get_files():
			if String(name).ends_with(".png"):
				_index[String(name).get_basename()] = true









static func stash_for_tool() -> void:
	ToolStash.desvia(DIR_BASE)
	invalidate()


static func unstash_for_tool() -> void:
	ToolStash.devuelve(DIR_BASE)
	invalidate()
