extends RefCounted
























const PetSpritesLib := preload("res://ui/house/pet_sprites.gd")




const SPECIES: Dictionary = {
	"mascota": {"sheet": "res://assets/sprites/anim/pet_",
		"speed": 1.3, "rest_lo": 1.2, "rest_hi": 3.0,
		"reacts": ["bark"], "greet": "bark"},
	"mascota_gato": {"sheet": "res://assets/sprites/anim/gato_",
		"speed": 1.0, "rest_lo": 2.0, "rest_hi": 5.0,
		"reacts": ["sit", "yawn"], "greet": "yawn", "settle": "sit"},



	"mascota_gallina": {"proc": "gallina",
		"speed": 1.15, "rest_lo": 0.7, "rest_hi": 2.2, "reacts": []},
	"mascota_loro": {"proc": "loro",
		"speed": 0.9, "rest_lo": 0.6, "rest_hi": 2.0, "reacts": []},



	"mascota_pinguino": {"sheet": "res://assets/sprites/anim/pinguino_",
		"speed": 0.7, "rest_lo": 1.5, "rest_hi": 4.0, "reacts": []},



	"mascota_chihuahua": {"sheet": "res://assets/sprites/anim/perro_chihuahua_",
		"speed": 1.4, "rest_lo": 0.8, "rest_hi": 2.2, "reacts": ["bark"], "greet": "bark"},
	"mascota_salchicha": {"sheet": "res://assets/sprites/anim/perro_salchicha_",
		"speed": 1.0, "rest_lo": 1.4, "rest_hi": 3.2, "reacts": ["bark"], "greet": "bark"},
	"mascota_golden": {"sheet": "res://assets/sprites/anim/perro_golden_",
		"speed": 1.3, "rest_lo": 1.5, "rest_hi": 3.5, "reacts": ["bark"], "greet": "bark"},
	"mascota_husky": {"sheet": "res://assets/sprites/anim/perro_husky_",
		"speed": 1.5, "rest_lo": 0.9, "rest_hi": 2.4, "reacts": ["bark"], "greet": "bark"},
	"mascota_gato_negro": {"sheet": "res://assets/sprites/anim/gato_negro_",
		"speed": 1.05, "rest_lo": 2.0, "rest_hi": 5.0,
		"reacts": ["sit", "yawn"], "greet": "yawn", "settle": "sit"},
	"mascota_gato_gris": {"sheet": "res://assets/sprites/anim/gato_gris_",
		"speed": 1.0, "rest_lo": 2.2, "rest_hi": 5.5,
		"reacts": ["sit", "yawn"], "greet": "yawn", "settle": "sit"},
	"mascota_siames": {"sheet": "res://assets/sprites/anim/gato_siames_",
		"speed": 1.1, "rest_lo": 1.6, "rest_hi": 4.2,
		"reacts": ["sit", "yawn"], "greet": "yawn", "settle": "sit"},
	"mascota_persa": {"sheet": "res://assets/sprites/anim/gato_persa_",
		"speed": 0.8, "rest_lo": 3.0, "rest_hi": 7.0,
		"reacts": ["sit", "yawn"], "greet": "yawn", "settle": "sit"},
}



const FRAMES: int = 8
const IDLE_FRAMES: int = 8
const WALK_FPS: float = 9.0
const IDLE_FPS: float = 5.0
const DIRS: Array[String] = ["south", "north", "east", "west"]

const REACT_FRAMES: int = 12
const REACT_FPS: float = 7.0


const DOG_FOLLOW_AT: float = 2.6





const PET_GAP: float = 0.34


static var _frames: Dictionary = {}

static var _pies: Dictionary = {}


static var montadas: int = 0
static var medidas: int = 0




static func frames(id: String) -> SpriteFrames:
	var sf: SpriteFrames = _frames.get(id) as SpriteFrames
	if sf == null:
		sf = build(SPECIES.get(id, {}))
		_frames[id] = sf
	return sf





static func build(cfg: Dictionary) -> SpriteFrames:
	montadas += 1



	if cfg.has("proc"):
		return PetSpritesLib.build(String(cfg["proc"]))
	var sf: SpriteFrames = SpriteFrames.new()
	sf.remove_animation("default")
	if not cfg.has("sheet"):
		return sf
	for d in DIRS:
		_anim(sf, cfg, "walk_" + d, "walk_%s" % d, FRAMES, WALK_FPS)
		_anim(sf, cfg, "idle_" + d, "idle_%s" % d, IDLE_FRAMES, IDLE_FPS)



		for ra in cfg.get("reacts", []):
			_anim(sf, cfg, String(ra) + "_" + d, "%s_%s" % [ra, d], REACT_FRAMES, REACT_FPS)
	return sf


static func _anim(sf: SpriteFrames, cfg: Dictionary, anim: String, stem: String,
		n: int, fps: float) -> void:





	var desde: int = int(cfg.get("desde", 1))
	var added: int = 0
	for i in range(desde, desde + n):
		var path: String = _ruta(cfg, stem, i)
		if not ResourceLoader.exists(path):
			continue
		if added == 0:
			sf.add_animation(anim)
			sf.set_animation_loop(anim, true)
			sf.set_animation_speed(anim, fps)



		var tex: Texture2D = load(path)
		if cfg.has("recolor"):
			tex = KitRecolor.apply(tex, cfg["recolor"])
		sf.add_frame(anim, tex)
		added += 1


static func _ruta(cfg: Dictionary, stem: String, i: int) -> String:
	return "%s%s_%02d.png" % [String(cfg["sheet"]), stem, i]






static func rutas(id: String) -> PackedStringArray:
	var out: PackedStringArray = []
	var cfg: Dictionary = SPECIES.get(id, {})
	if cfg.has("proc") or not cfg.has("sheet"):
		return out
	var desde: int = int(cfg.get("desde", 1))
	for d in DIRS:
		var tiras: Array = [["walk_%s" % d, FRAMES], ["idle_%s" % d, IDLE_FRAMES]]
		for ra in cfg.get("reacts", []):
			tiras.append(["%s_%s" % [ra, d], REACT_FRAMES])
		for t in tiras:
			for i in range(desde, desde + int(t[1])):
				var path: String = _ruta(cfg, String(t[0]), i)
				if ResourceLoader.exists(path):
					out.append(path)
	return out



static func montada(id: String) -> bool:
	return _frames.has(id) and _pies.has(id)








static func pies_px(id: String) -> float:
	if _pies.has(id):
		return float(_pies[id])
	medidas += 1
	var cfg: Dictionary = SPECIES.get(id, {})
	var px: float = Ceremony.PLAYER_METRICS.y
	if cfg.has("proc"):
		var img: Image = PetSpritesLib._view(String(cfg["proc"]), "front", 0)
		var used: Rect2i = img.get_used_rect() if img != null else Rect2i()
		if used.size.y > 0:
			px = float(img.get_height()) * 0.5 - float(img.get_height() - used.end.y)
	elif cfg.has("sheet"):
		px = Ceremony.feet_offset_px("%sidle_south_%02d.png"
			% [String(cfg["sheet"]), int(cfg.get("desde", 1))])
	_pies[id] = px
	return px





static func encendidas(extras: Array, off: Array, tope: int) -> Array:
	var out: Array = []
	for id in House.pets_owned(extras):
		if out.size() >= tope:
			break
		if off.has(String(id)) or not SPECIES.has(String(id)):
			continue
		out.append(String(id))
	return out





static func olvida() -> void:
	_frames.clear()
	_pies.clear()
