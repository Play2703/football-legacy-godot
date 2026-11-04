class_name SelfieFotos
extends RefCounted














const CARPETA: String = "selfies/"
const ANCHO: int = 300
const ALTO: int = 400
const EXT: String = ".webp"

const CACHE_MAX: int = 8

static var _cache: Dictionary = {}


static func carpeta() -> String:
	return SaveSlots.slot_dir() + CARPETA


static func ruta(id: String, dir: String = "") -> String:
	return (carpeta() if dir.is_empty() else dir) + id + EXT




static func id_de(semilla: String, k: int) -> String:
	return "%08x" %(hash("selfie_foto|%s|%d" % [semilla, k])&2147483647)




static func guarda(img: Image, id: String, dir: String = "") -> bool:
	if GameState.readonly_save or img == null or img.is_empty() or id.is_empty():
		return false
	var d: String = carpeta() if dir.is_empty() else dir
	_cache.erase(ruta(id, d))
	if not DirAccess.dir_exists_absolute(d):
		DirAccess.make_dir_recursive_absolute(d)
	return encuadra(img).save_webp(ruta(id, d), false) == OK




static func encuadra(img: Image) -> Image:
	var out: Image = img.duplicate()
	if out.is_compressed():
		out.decompress()
	var w: int = out.get_width()
	var h: int = out.get_height()
	var cw: int = mini(w, int(round(float(h) * ANCHO / ALTO)))
	var ch: int = mini(h, int(round(float(cw) * ALTO / ANCHO)))
	out = out.get_region(Rect2i((w - cw) / 2,(h - ch) / 2, cw, ch))
	out.resize(ANCHO, ALTO, Image.INTERPOLATE_NEAREST)
	return out





static func carga(id: String, dir: String = "") -> Texture2D:
	var p: String = ruta(id, dir)
	if id.is_empty() or not FileAccess.file_exists(p):
		_cache.erase(p)
		return null
	if _cache.has(p):
		return _cache[p]
	var img: Image = Image.load_from_file(p)
	if img == null or img.is_empty():
		return null
	var tex: Texture2D = ImageTexture.create_from_image(img)
	if _cache.size() >= CACHE_MAX:
		_cache.erase(_cache.keys()[0])
	_cache[p] = tex
	return tex




static func poda(muro: Array, dir: String = "") -> int:
	if GameState.readonly_save:
		return 0
	var d: String = carpeta() if dir.is_empty() else dir
	if not DirAccess.dir_exists_absolute(d):
		return 0
	var vivas: Dictionary = {}
	for f in muro:
		if f is Dictionary and f.get("foto") is String:
			vivas[String(f["foto"]) + EXT] = true
	var borradas: int = 0
	for nombre in DirAccess.get_files_at(d):
		if nombre.ends_with(EXT) and not vivas.has(nombre):
			if DirAccess.remove_absolute(d + nombre) == OK:
				_cache.erase(d + nombre)
				borradas += 1
	return borradas
