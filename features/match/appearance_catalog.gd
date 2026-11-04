extends RefCounted

const Base = preload("res://assets/sprites/modular/catalog.gd")
const Extra = preload("res://assets/sprites/modular/viewer/catalog.gd")
const FaceTattoos = preload("res://features/match/facial_tattoos.gd")

const Propias = preload("res://features/match/piezas_propias.gd")
const STYLE_GROUPS: Dictionary = {"modular_hair": "hair", "modular_brows": "brows",
	"modular_beard": "beard", "modular_hair_accessory": "accessories"}


const TIED_HAIR: Array[String] = []



const SOLO_PROPIAS: Array[String] = ["hair", "beard"]



const PROPIAS_CALLE: Dictionary = {"modular_head_acc": "head_acc",
	"modular_face_acc": "face_acc", "modular_neck_acc": "neck_acc",
	"modular_torso_acc": "torso_acc"}









static func group(kind: String) -> Dictionary:
	if SOLO_PROPIAS.has(kind):
		return Propias.group(kind).duplicate(true)
	var out: Dictionary = Base.DATA.get(kind, {}).duplicate(true)
	out.merge(Extra.DATA.get(kind, {}), true)
	return out




static func jugables(kind: String) -> Dictionary:
	var out: Dictionary = group(kind)
	out.merge(Propias.group(kind), false)
	return out



static func names(kind: String) -> Dictionary:
	var out: Dictionary = Base.DATA.get("labels", {}).get(kind, {}).duplicate()
	out.merge(Extra.DATA.get("labels", {}).get(kind, {}), true)
	out.merge(Propias.names(kind), false)
	return out


static func cortes_atables() -> Array:

	var out: Array = []
	out.append_array(TIED_HAIR)
	for id in Propias.tied():
		if not out.has(str(id)):
			out.append(str(id))
	return out



static func es_atable(hair: String) -> bool:
	return TIED_HAIR.has(hair) or Propias.tied().has(hair)

static func valid(key: String, value: String) -> bool:
	if key == "modular_face_tattoo":
		return FaceTattoos.NAMES.has(value)
	if key == "modular_face_tattoo_side":
		return FaceTattoos.SIDES.has(value)
	if key == "modular_neck_tattoo":
		return FaceTattoos.NECK_NAMES.has(value)
	if key == "modular_mask":
		return value in ["none", "mask"]
	if PROPIAS_CALLE.has(key):
		return value == "none" or Propias.es_propia(PROPIAS_CALLE[key], value)
	if not STYLE_GROUPS.has(key):
		return false
	if key == "modular_hair_accessory":
		return value in ["none", "band", "ribbon", "tie"] \
				or Propias.es_propia("accessories", value)
	return value == "none" or group(STYLE_GROUPS[key]).has(value) \
			or Propias.es_propia(STYLE_GROUPS[key], value) \
			or (key == "modular_hair" and value in ["liga_coleta", "banda_pelo"])
