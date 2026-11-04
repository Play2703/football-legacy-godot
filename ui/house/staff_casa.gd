extends RefCounted






























const ChefCasa := preload("res://ui/house/chef_casa.gd")
const LookMigracion := preload("res://features/match/look_migracion.gd")

const DIRS: Array[String] = ["south", "north", "east", "west"]








const STAFF: Dictionary = {
	"nutricionista": {"kinds": ["consultorio_nutri"], "punto": 0.14},
	"entrenador": {"kinds": ["gimnasio"], "punto": 0.34},
}


const HOJA_NUTRI: String = "res://assets/sprites/anim/mujer_look_traje_idle_%s_00.png"



const GRIS_A_BATA: Dictionary = {
	"53585b": Color("f7f5f0"), "4e5458": Color("ebe7de"),
	"3d4044": Color("d6d0c4"), "393b3f": Color("d6d0c4"), "34373b": Color("b3ab9e"),
}


const MEDIAS: Array[String] = ["664f4a", "3f2f2a"]


const FALDA_FILAS: int = 10
const CINTA: Color = Color("f2c94c")
const CINTA_SOMBRA: Color = Color("c79a2a")
const PLUMA: Color = Color("2f6fd0")
const BOLSILLO: Color = Color("b3ab9e")

const FALDA: Color = Color("4e5458")




const NUTRI_PIEL: int = 3







const RESPIRA: Array[int] = [0, 1, 1, 0]
const RESPIRA_FPS: float = 3.0


const RESPIRA_CORTE: float = 0.32


const HOJA_ENTRE: String = "res://assets/sprites/anim/idle_%s_%02d.png"
const SEMILLA_ENTRE: String = "entrenador_de_casa"


const NEGRO: Color = Color("26262b")


const CORDON: Color = Color("c1121f")
const METAL: Color = Color("cfd5d8")
const METAL_SOMBRA: Color = Color("8a949a")

static var _nutri: SpriteFrames = null
static var _entre: SpriteFrames = null



static func frames(quien: String) -> SpriteFrames:
	match quien:
		"nutricionista":
			if _nutri == null:
				_nutri = _frames_nutri()
			return _nutri
		"entrenador":
			if _entre == null:
				_entre = _frames_entre()
			return _entre
	return null




static func hoja_pies(quien: String) -> String:
	return HOJA_NUTRI % "south" if quien == "nutricionista" else HOJA_ENTRE % ["south", 0]





static func pixel_size(quien: String) -> float:
	return Ceremony.PAREJA_PIXEL if quien == "nutricionista" \
			else Ceremony.PLAYER_HEIGHT_M / Ceremony.PLAYER_METRICS.x


static func _frames_nutri() -> SpriteFrames:
	var sf: SpriteFrames = SpriteFrames.new()
	var cfg: Dictionary = {"skin": KitRecolor.SKIN_TONES[NUTRI_PIEL]}
	for d in DIRS:
		var anim: String = "idle_" + d
		sf.add_animation(anim)
		sf.set_animation_loop(anim, true)
		sf.set_animation_speed(anim, RESPIRA_FPS)
		var img: Image = nutri_vestida(d, cfg)
		if img == null:
			continue

		for k in RESPIRA:
			sf.add_frame(anim, ImageTexture.create_from_image(respira(img, k)))
	return sf




static func nutri_vestida(d: String, cfg: Dictionary = {}) -> Image:
	var path: String = HOJA_NUTRI % d
	if not ResourceLoader.exists(path):
		return null
	if cfg.is_empty():
		cfg = {"skin": KitRecolor.SKIN_TONES[NUTRI_PIEL]}
	var tex: Texture2D = load(path)



	var img: Image = ChefCasa._img(KitRecolor.apply(tex, cfg))
	var orig: Image = ChefCasa._img(tex) if img != null else null
	if orig == null:
		return null
	bata(img, orig, d)
	return img



static func hechos(quien: String) -> SpriteFrames:
	return _nutri if quien == "nutricionista" else _entre





static func respira(img: Image, k: int) -> Image:
	var out: Image = img.duplicate()
	if k <= 0:
		return out
	var top: int = -1
	var bottom: int = -1
	for y in img.get_height():
		for x in img.get_width():
			if img.get_pixel(x, y).a > 0.5:
				if top < 0:
					top = y
				bottom = y
				break
	if top < k:
		return out
	var corte: int = top + roundi(float(bottom - top) * RESPIRA_CORTE)
	for y in range(top - k, corte):
		for x in img.get_width():
			out.set_pixel(x, y, img.get_pixel(x, y + k))
	return out





static func bata(img: Image, orig: Image, dir: String) -> void:
	var medias: int = img.get_height()
	for y in orig.get_height():
		for x in orig.get_width():
			var c: Color = orig.get_pixel(x, y)
			if c.a > 0.5 and c.to_html(false) in MEDIAS:
				medias = mini(medias, y)
	if medias >= img.get_height():
		return
	var falda: int = medias - FALDA_FILAS

	var x0: int = img.get_width()
	var x1: int = -1
	for x in orig.get_width():
		var c2: Color = orig.get_pixel(x, falda + 3)
		if c2.a > 0.5 and GRIS_A_BATA.has(c2.to_html(false)):
			x0 = mini(x0, x)
			x1 = maxi(x1, x)
	var cx: int =(x0 + x1) / 2 if x1 >= 0 else img.get_width() / 2
	for y in medias:
		for x in orig.get_width():
			var c: Color = orig.get_pixel(x, y)
			if c.a < 0.5:
				continue
			var h: String = c.to_html(false)
			if not GRIS_A_BATA.has(h):
				continue
			var col: Color = GRIS_A_BATA[h]



			if dir == "south" and y >= falda:
				var abre: int =(y - falda) / 3
				var dx: int = absi(x - cx)
				if dx < abre:
					col = FALDA
				elif dx == abre:
					col = ChefCasa.CONTORNO

			elif dir == "north" and y >= falda + 3 and x == cx:
				col = Color("b3ab9e")
			img.set_pixel(x, y, col)
	if dir == "south":
		_cinta_metrica(img, orig, cx)
		_bolsillo(img, orig, cx)
	elif dir == "east" or dir == "west":
		_cinta_perfil(img, orig, dir)






static func _cinta_metrica(img: Image, orig: Image, cx: int) -> void:
	var arriba: int = _arriba_bata(orig)
	if arriba < 0:
		return
	for lado in [-1, 1]:
		var x: int = cx + lado * 3
		for k in 11:
			var y: int = arriba + k
			if not _es_bata(orig, x, y):
				continue
			img.set_pixel(x, y, CINTA_SOMBRA if k % 4 == 3 or k == 10 else CINTA)



static func _cinta_perfil(img: Image, orig: Image, dir: String) -> void:
	var arriba: int = _arriba_bata(orig)
	if arriba < 0:
		return
	for k in 9:
		var y: int = arriba + 1 + k

		var x: int = -1
		for xx in orig.get_width():
			if _es_bata(orig, xx, y):
				if dir == "east":
					x = xx
				elif x < 0:
					x = xx
		if x < 0:
			continue
		x += -1 if dir == "east" else 1
		if _es_bata(orig, x, y):
			img.set_pixel(x, y, CINTA_SOMBRA if k % 4 == 3 else CINTA)




static func _bolsillo(img: Image, orig: Image, cx: int) -> void:
	var arriba: int = _arriba_bata(orig)
	if arriba < 0:
		return
	var y: int = arriba + 8
	for x in range(cx + 5, cx + 9):
		if _es_bata(orig, x, y):
			img.set_pixel(x, y, BOLSILLO)
	for dy in [1, 2]:
		if _es_bata(orig, cx + 6, y - dy):
			img.set_pixel(cx + 6, y - dy, PLUMA)



static func _arriba_bata(orig: Image) -> int:
	for y in range(30, orig.get_height()):
		for x in orig.get_width():
			if _es_bata(orig, x, y):
				return y
	return -1


static func _es_bata(orig: Image, x: int, y: int) -> bool:
	if x < 0 or y < 0 or x >= orig.get_width() or y >= orig.get_height():
		return false
	var c: Color = orig.get_pixel(x, y)
	return c.a > 0.5 and GRIS_A_BATA.has(c.to_html(false))






static func cfg_entre() -> Dictionary:
	var base: Dictionary = KitRecolor.appearance_for(SEMILLA_ENTRE, {})
	for k in ["acc_face", "acc_ear", "acc_head", "street_face", "street_head", "hair_style",
			"hair_tips", "modular_face_acc", "modular_head_acc", "modular_neck_acc", "modular_torso_acc",
			"pattern", "kit_b", "number", "crest_fill", "crest_logo", "mask", "headband",
			"kit_sleeves", "long_sleeves", "long_pants", "short_pants", "sock_style",
			"wristband_style", "arm_sleeve_style", "arm_wrap_style", "field_gloves_color",
			"tights_style", "knee_style", "knee_kind",
			"tattoo", "tattoo_style", "tattoo_pattern", "tattoo_pat", "tattoo_ink",
			"tattoo_color", "tattoo_leg", "tattoo_leg_style", "tattoo_leg_pattern",
			"tattoo_leg_pat", "tattoo_leg_ink", "tattoo_leg_color"]:
		base.erase(k)
	base["kit"] = NEGRO
	base["kit2"] = NEGRO
	base["modular_hair"] = LookMigracion.PELO_POR_DEFECTO


	base["hair"] = KitRecolor.HAIR_COLORS[0]
	return KitRecolor.sin_pelirrojo_oscuro(base)


static func _frames_entre() -> SpriteFrames:
	var sf: SpriteFrames = SpriteFrames.new()
	var c: Dictionary = cfg_entre()
	for d in DIRS:
		var anim: String = "idle_" + d
		sf.add_animation(anim)
		sf.set_animation_loop(anim, true)
		sf.set_animation_speed(anim, 4.5)
		for i in 4:
			var cuadro: Texture2D = cuadro_entre(d, i, c)
			if cuadro != null:
				sf.add_frame(anim, cuadro)
	return sf



static func cuadro_entre(d: String, i: int, c: Dictionary = {}) -> Texture2D:
	var path: String = HOJA_ENTRE % [d, i]
	if not ResourceLoader.exists(path):
		return null
	if c.is_empty():
		c = cfg_entre()
	var molde: Image = ChefCasa._img(load(path))
	var img: Image = ChefCasa._img(KitRecolor.apply(load(path), c)) if molde != null else null
	if img == null:



		return KitRecolor.apply(load(path), c)
	sin_medias(img, molde, c.get("skin", KitRecolor.REF_SKIN))
	if d == "south":
		silbato(img, molde)
	return ImageTexture.create_from_image(img)












static func sin_medias(img: Image, molde: Image, piel: Color) -> void:
	var caja: Rect2i = molde.get_used_rect()
	var alto: int = mini(caja.end.y, img.get_height())
	var rodilla: int = caja.position.y + int(caja.size.y * KitRecolor.CASUAL_LEG_TOP)
	for x in range(caja.position.x, mini(caja.end.x, img.get_width())):
		var pierna: bool = false
		for y in range(rodilla, alto):
			var c: Color = molde.get_pixel(x, y)
			if c.a < 0.5:
				continue
			if _es_media(c) or KitRecolor._is_skin(c.h * 360.0, c):
				pierna = true
			if pierna and (_es_media(c) or (c.s < 0.18 and c.v > 0.5)):
				img.set_pixel(x, y, KitRecolor._toned_skin(piel, KitRecolor.REF_SKIN
						if c.s < 0.18 else KitRecolor.REF_KIT, c))
	for y in range(caja.position.y + int(caja.size.y * 0.25), rodilla):
		for x in range(caja.position.x, mini(caja.end.x, img.get_width())):
			var c: Color = img.get_pixel(x, y)
			if _es_uniforme(c):
				img.set_pixel(x, y, KitRecolor._toned(NEGRO, KitRecolor.REF_KIT, c))
			elif y >= caja.position.y + int(caja.size.y * 0.45) and c.a > 0.5 \
					and c.s < 0.18 and c.v > 0.75:
				img.set_pixel(x, y, NEGRO)




static func _es_media(c: Color) -> bool:
	var h: float = c.h * 360.0
	return _es_uniforme(c) or (c.a > 0.5 and h > 180.0 and h < 225.0 and c.s > 0.5
			and c.v > 0.15)








static func silbato(img: Image, molde: Image) -> void:
	var cuello: int = -1
	var x0: int = img.get_width()
	var x1: int = -1
	for y in range(30, molde.get_height()):
		for x in molde.get_width():
			if _es_uniforme(molde.get_pixel(x, y)):
				if cuello < 0:
					cuello = y
				if y == cuello + 6:
					x0 = mini(x0, x)
					x1 = maxi(x1, x)
		if cuello >= 0 and y > cuello + 6:
			break
	if cuello < 0 or x1 < 0:
		return
	var cx: int =(x0 + x1) / 2
	for k in 7:
		for lado in [-1, 1]:
			var x: int = cx + lado *(3 - k / 2)
			var y: int = cuello + k


			var c: Color = molde.get_pixel(x, y)
			if c.a > 0.5 and c.v > 0.15:
				img.set_pixel(x, y, CORDON)


	var s: int = cuello + 7
	for dx in range(-1, 3):
		img.set_pixel(cx + dx, s, METAL)
	img.set_pixel(cx - 1, s + 1, ChefCasa.CONTORNO)
	img.set_pixel(cx, s + 1, METAL)
	img.set_pixel(cx + 1, s + 1, METAL_SOMBRA)
	img.set_pixel(cx + 2, s + 1, METAL_SOMBRA)
	for dx in range(-1, 3):
		img.set_pixel(cx + dx, s + 2, ChefCasa.CONTORNO)




static func _es_uniforme(c: Color) -> bool:
	return c.a > 0.5 and c.b > 0.4 and c.g > 0.3 and c.r < c.b * 0.5




static func sitio(plano: Dictionary, quien: String) -> Dictionary:
	var fila: Dictionary = STAFF.get(quien, {})
	for kind in fila.get("kinds", []):
		for prop in plano.get("props", []):
			var pr: Dictionary = prop
			if String(pr.get("kind", "")) != String(kind) or not ChefCasa._en_casa(pr):
				continue
			var s: Dictionary = ChefCasa.sitio_en(pr, String(kind), float(fila["punto"]))
			s["firma"] = quien + "|" + String(s["firma"])
			return s
	return {}
