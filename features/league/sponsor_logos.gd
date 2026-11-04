class_name SponsorLogos
extends RefCounted

























const DIR_BASE: String = "user://sponsors"



static func dir() -> String:
	return ToolStash.activa(DIR_BASE)






const MAX_PX: int = 256
const MAX_BYTES: int = 96 * 1024



static var version: int = 0











static var base_activos: bool = true

static var _index: Dictionary = {}
static var _indexed: bool = false
static var _cache: Dictionary = {}
static var _rotas: Dictionary = {}




















static func nombres_path() -> String:
	return dir() + "/_nombres.json"


const NOMBRE_MAX: int = 40







const SaveSlotsScript = preload("res://autoload/save_slots.gd")
static var _nombres: Dictionary = {}
static var _nombres_leidos: bool = false





static func name_of(marca: String) -> String:
	if marca.is_empty():
		return ""
	if Anuncios.es_id(marca):
		return Anuncios.nombre(marca)
	_ensure_nombres()


	var suyo: String = String(_nombres.get(marca, ""))
	if not suyo.is_empty():
		return suyo
	return PatrosBase.nombre(marca) if de_fabrica() else ""











static func set_nombre(marca: String, nombre: String) -> String:
	if marca.is_empty():
		return I18n.t("id vacío")


	if TeamEdits.id_de_archivo(marca) != marca:
		return I18n.t("marca desconocida")
	var limpio: String = nombre.strip_edges()
	if limpio.is_empty():
		return I18n.t("nombre vacío")
	if limpio.length() > NOMBRE_MAX:
		limpio = limpio.substr(0, NOMBRE_MAX).strip_edges()
	_ensure_nombres()
	if String(_nombres.get(marca, "")) == limpio:
		return ""
	_nombres[marca] = limpio
	_guarda_nombres()
	version += 1
	return ""



static func has(marca: String) -> bool:


	if Anuncios.es_id(marca):
		return Anuncios.logo(marca) != null
	_ensure_indexed()
	if _index.has(marca):
		return true
	return de_fabrica() and PatrosBase.has(marca)



static func count() -> int:
	_ensure_indexed()
	return _index.size()









static func marcas() -> Array:
	_ensure_indexed()
	if de_fabrica():
		return PatrosBase.ids()
	var out: Array = _index.keys()
	out.sort()
	return out







static func de_fabrica() -> bool:
	_ensure_indexed()
	return base_activos and _index.is_empty()










static func for_team(team_id: String, retro: bool = false) -> Texture2D:



	var marca: String = RetroKits.sponsor_of(team_id) if retro \
			else KitDeals.sponsor_of(team_id)
	return texture(marca) if not marca.is_empty() else null


static func texture(marca: String) -> Texture2D:
	if Anuncios.es_id(marca):
		return Anuncios.logo(marca)
	if not has(marca) or _rotas.has(marca):
		return null
	if _cache.has(marca):
		return _cache[marca]
	var img: Image = Image.new()
	if not _index.has(marca):









		var col: Color = PatrosBase.color(marca)
		var base: Image = null
		var texto: String = PatrosBase.rotulo(marca)
		if not texto.is_empty():
			base = RotuloMarca.imagen(texto, PatrosBase.estilo(marca), col)
		else:
			base = Image.new()
			if base.load_svg_from_string(
					_pinta(PatrosBase.svg(marca), col),
					float(MAX_PX) / 64.0) != OK:
				base = null
		if base == null:
			_rotas[marca] = true
			return null
		var tex_base: ImageTexture = ImageTexture.create_from_image(base)
		_cache[marca] = tex_base
		return tex_base
	if img.load(_path(marca)) != OK:








		_rotas[marca] = true
		return null






	var limpia: Image = Pecho.logo_limpio(img)
	if limpia == null:





		_rotas[marca] = true
		return null
	var tex: ImageTexture = ImageTexture.create_from_image(limpia)
	_cache[marca] = tex
	return tex







static func _pinta(svg: String, col: Color) -> String:
	return svg.replace("{C}", "#" + col.to_html(false)) \
			.replace("{D}", "#" + col.darkened(0.42).to_html(false))






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
	var f: FileAccess = FileAccess.open(_path(marca), FileAccess.WRITE)
	if f == null:
		return I18n.t("no se pudo escribir")
	f.store_buffer(bytes)
	f.close()
	_ensure_indexed()
	_index[marca] = true
	_cache.erase(marca)
	version += 1
	return ""



static func clear_all() -> void:
	_ensure_indexed()
	for marca in _index.keys():
		DirAccess.remove_absolute(_path(String(marca)))
	_index = {}
	_cache = {}


	DirAccess.remove_absolute(nombres_path())
	_nombres = {}
	_nombres_leidos = true
	version += 1















static func _test_rompe(marca: String) -> void:
	_ensure_indexed()
	DirAccess.remove_absolute(_path(marca))
	_cache.erase(marca)


static func _test_quita(marca: String) -> void:
	_ensure_indexed()
	DirAccess.remove_absolute(_path(marca))
	_index.erase(marca)
	_cache.erase(marca)
	_rotas.erase(marca)
	version += 1


static func invalidate() -> void:
	_indexed = false
	_index = {}
	_cache = {}
	_rotas = {}
	_nombres_leidos = false
	_nombres = {}
	version += 1


static func _path(marca: String) -> String:
	return "%s/%s.png" % [dir(), marca]


static func _ensure_nombres() -> void:
	if _nombres_leidos:
		return
	_nombres_leidos = true
	_nombres = {}
	if not FileAccess.file_exists(nombres_path()):
		return
	var f: FileAccess = FileAccess.open(nombres_path(), FileAccess.READ)
	if f == null:
		return
	var raw: Variant = JSON.parse_string(f.get_as_text())
	f.close()



	if raw is Dictionary:
		for k in (raw as Dictionary):
			_nombres[String(k)] = String((raw as Dictionary)[k])


static func _guarda_nombres() -> void:
	DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path(dir()))


	SaveSlotsScript.escribe_atomico(nombres_path(), JSON.stringify(_nombres))


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
