extends RefCounted




































const Catalogo = preload("res://assets/sprites/modular/propias/catalog.gd")

const DIRS: Array[String] = ["south", "east", "west", "north"]
const GRUPOS_CABEZA: Array[String] = ["hair", "beard", "accessories", "head_acc",
	"face_acc", "neck_acc", "torso_acc", "mask"]
const LOCALES: Array[String] = ["en", "fr", "it", "pt", "de", "id", "tr", "ar", "ko", "ru"]


const PRINCIPAL := "ff00ff"
const SECUNDARIO := "00ffff"

const PRECIO_MIN := 2000
const PRECIO_MAX := 20000


static var _override: Dictionary = {}
static var _usa_override: bool = false


static func data() -> Dictionary:
	return _override if _usa_override else Catalogo.DATA





static func usar(d: Dictionary) -> void:
	_override = d
	_usa_override = true


static func restaura() -> void:
	_override = {}
	_usa_override = false




static func carga_json(ruta: String) -> bool:
	var abs_ruta: String = ProjectSettings.globalize_path(ruta)
	if not FileAccess.file_exists(abs_ruta):
		return false
	var parsed: Variant = JSON.parse_string(FileAccess.get_file_as_string(abs_ruta))
	if not (parsed is Dictionary):
		return false
	usar(parsed)
	return true




static func group(kind: String) -> Dictionary:
	return data().get(kind, {})


static func names(kind: String) -> Dictionary:
	return data().get("labels", {}).get(kind, {})


static func es_propia(kind: String, id: String) -> bool:
	return group(kind).has(id)



static func hair_groups() -> Dictionary:
	return data().get("hair_groups", {})



static func tied() -> Array:
	return data().get("tied", [])






static func precio(kind: String, id: String) -> int:
	return int(data().get("prices", {}).get(kind, {}).get(id, 0))




static func i18n(code: String) -> Dictionary:
	return data().get("i18n", {}).get(code, {})



static func etiquetas() -> Array:
	var out: Array = []
	var labels: Dictionary = data().get("labels", {})
	for kind in labels:
		for id in labels[kind]:
			out.append([kind, id, str(labels[kind][id])])
	return out
