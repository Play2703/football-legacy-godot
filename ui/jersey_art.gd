class_name JerseyArt
extends RefCounted























const SIZE: int = 32



const BODY_X0: int = 9
const BODY_X1: int = 22
const BODY_Y0: int = 7
const BODY_Y1: int = 26





const SHOULDER_OUT: int = 2
const SHOULDER_ROWS: int = 2




const SLEEVE_W: int = 3
const SLEEVE_Y0: int = 9
const SLEEVE_Y1: int = 16




const NUM_PX: int = 2

static var _cache: Dictionary = {}







const NAMED_ESC: int = 4

static var _cache_named: Dictionary = {}





























static func texture_named(cfg: Dictionary, number: int = 0,
		apellido: String = "", esc: int = NAMED_ESC) -> ImageTexture:
	var ape: String = apellido.strip_edges().to_upper()
	esc = maxi(esc, 1)
	var key: String = "%s|%s|%s|%d|%s|%d" % [
		Color(cfg.get("kit", Color("2a4bd7"))).to_html(),
		Color(cfg.get("kit_b", cfg.get("kit2", Color.BLACK))).to_html(),
		String(cfg.get("pattern", "solid")), number, ape, esc]
	if _cache_named.has(key):
		return _cache_named[key]




	var base: ImageTexture = texture(cfg, 0)
	if base == null:
		return null



	var img: Image = SceneFade.imagen_copia(base)
	if img == null:
		return base
	img.convert(Image.FORMAT_RGBA8)
	img.resize(SIZE * esc, SIZE * esc, Image.INTERPOLATE_NEAREST)
	if ape.is_empty() and number <= 0:
		var plano: ImageTexture = ImageTexture.create_from_image(img)
		_cache_named[key] = plano
		return plano


	var pecho: Rect2 = Rect2(BODY_X0, BODY_Y0 + 5, BODY_X1 - BODY_X0 + 1, 9)
	var rec: Dictionary = Espalda.receta_para(cfg, base.get_image(), pecho)
	var lam: ImageTexture = Espalda.textura(ape, number, rec)


	var li: Image = SceneFade.imagen(lam)
	if lam != null and li == null:
		return ImageTexture.create_from_image(img)
	if li != null:
		li.convert(Image.FORMAT_RGBA8)




		var util: float = float(BODY_X1 - BODY_X0 - 1)
		var f: float = float(esc) *(util / Espalda.NOMBRE_ANCHO) \
				/ float(Espalda.RES)
		var lw: int = maxi(int(round(float(li.get_width()) * f)), 1)
		var lh: int = maxi(int(round(float(li.get_height()) * f)), 1)
		if esc > NAMED_ESC:


			li.premultiply_alpha()
			li.resize(lw, lh, Image.INTERPOLATE_BILINEAR)
			_bordes_duros(li)
		else:
			li.resize(lw, lh, Image.INTERPOLATE_LANCZOS)




		var cy: float = float(Espalda.metrica()["cy"])
		var y0: int = int(round(num_center_y(number) * float(esc)
			- cy *(util / Espalda.NOMBRE_ANCHO) * float(esc)))
		var x0: int = int(round((float(SIZE * esc) - float(lw)) * 0.5))
		img.blend_rect(li, Rect2i(Vector2i.ZERO, li.get_size()),
			Vector2i(x0, y0))
	var tex: ImageTexture = ImageTexture.create_from_image(img)
	if _cache_named.size() > 24:
		_cache_named.clear()
	_cache_named[key] = tex
	return tex






static func _bordes_duros(img: Image) -> void:
	var d: PackedByteArray = img.get_data()
	for i in range(0, d.size(), 4):
		var a: int = d[i + 3]
		if a < 128:
			d[i] = 0
			d[i + 1] = 0
			d[i + 2] = 0
			d[i + 3] = 0
			continue

		d[i] = mini(255, d[i] * 255 / a)
		d[i + 1] = mini(255, d[i + 1] * 255 / a)
		d[i + 2] = mini(255, d[i + 2] * 255 / a)
		d[i + 3] = 255
	img.set_data(img.get_width(), img.get_height(), false, Image.FORMAT_RGBA8, d)




static func texture(cfg: Dictionary, number: int = 0) -> ImageTexture:
	var kit: Color = cfg.get("kit", Color("2a4bd7"))
	var kit_b: Color = cfg.get("kit_b", cfg.get("kit2", kit.darkened(0.35)))
	var pattern: String = String(cfg.get("pattern", "solid"))
	var pat_w: int = int(cfg.get("pat_w", 3))



	var trim: String = String(cfg.get("local_trim", ""))
	var trim_col: Color = cfg.get("trim_col", kit_b)
	var key: String = "%s|%s|%s|%s|%d" % [kit.to_html(), kit_b.to_html(),
		pattern, trim, number]
	if _cache.has(key):
		return _cache[key]
	var img: Image = Image.create(SIZE, SIZE, false, Image.FORMAT_RGBA8)
	img.fill(Color(0, 0, 0, 0))
	var mask: Array = _mask()

	var bb: Rect2i = Rect2i(BODY_X0, BODY_Y0, BODY_X1 - BODY_X0 + 1,
		BODY_Y1 - BODY_Y0 + 1)

	for y in SIZE:
		for x in SIZE:
			if not mask[y][x]:
				continue
			img.set_pixel(x, y, _cloth(x, y, kit, kit_b, pattern, pat_w,
				trim, trim_col, bb))


	_collar(img, kit)


	if number > 0:
		_stamp_number(img, number, kit)



	_outline(img, mask)
	var tex: ImageTexture = ImageTexture.create_from_image(img)
	_cache[key] = tex
	return tex











const INK: Color = Color("111111")



static func _mask() -> Array:
	var m: Array = []
	for y in SIZE:
		var row: Array = []
		row.resize(SIZE)
		row.fill(false)
		m.append(row)


	for y in range(BODY_Y0, BODY_Y1 + 1):
		var flare: int = 0 if y < BODY_Y1 - 7 else 1
		for x in range(BODY_X0 - flare, BODY_X1 + 1 + flare):
			m[y][x] = true


	for i in SHOULDER_ROWS:
		for x in range(BODY_X0 - SHOULDER_OUT, BODY_X1 + 1 + SHOULDER_OUT):
			m[BODY_Y0 + i][x] = true

	m[BODY_Y0][BODY_X0 - SHOULDER_OUT] = false
	m[BODY_Y0][BODY_X1 + SHOULDER_OUT] = false



	for y in range(SLEEVE_Y0, SLEEVE_Y1 + 1):
		var grow: int =(y - SLEEVE_Y0) / 2
		var w: int = mini(SLEEVE_W + grow, SLEEVE_W + 2)
		if y == SLEEVE_Y1:
			w -= 1
		for i in w:
			var lx: int = BODY_X0 - 1 - i
			var rx: int = BODY_X1 + 1 + i
			if lx >= 0:
				m[y][lx] = true
			if rx < SIZE:
				m[y][rx] = true






	var cx: int =(BODY_X0 + BODY_X1) / 2
	for y in range(BODY_Y0, BODY_Y0 + 2):
		var half: int = 3 -(y - BODY_Y0)
		for x in range(cx - half, cx + half + 1):
			m[y][x] = false
	return m






static func _cloth(x: int, y: int, kit: Color, kit_b: Color, pattern: String,
		pat_w: int, trim: String, trim_col: Color, bb: Rect2i) -> Color:
	var c: Color = KitPatternGeo.pixel(pattern, x, y, bb, kit, kit_b, pat_w)
	if trim != "" and KitPatternGeo.trim_hit(trim, x, y, bb):
		c = trim_col

	var shade: float = 0.0
	if y > BODY_Y1 - 5:
		shade += 0.14
	if x < BODY_X0 or x > BODY_X1:
		shade += 0.1
	return c.darkened(shade)



static func _collar(img: Image, kit: Color) -> void:
	var cx: int =(BODY_X0 + BODY_X1) / 2
	for y in range(BODY_Y0, BODY_Y0 + 3):
		var half: int = 3 -(y - BODY_Y0)
		for x in range(cx - half, cx + half + 1):
			img.set_pixel(x, y, kit.darkened(0.55) if y == BODY_Y0 + 2 \
					else Color(0, 0, 0, 0))




















static func num_center_y(number: int) -> float:
	var text: String = str(maxi(number, 1))
	var px: int = NUM_PX
	var body_w: int = BODY_X1 - BODY_X0 + 1
	while px > 1 and PixelText.text_width(text, px) > body_w:
		px -= 1
	var h: int = PixelText.GLYPH_H * px
	return float(BODY_Y0 + 5 +(BODY_Y1 - BODY_Y0 - 5 - h) / 2) + float(h) * 0.5


static func _stamp_number(img: Image, number: int, _kit: Color) -> void:
	var text: String = str(number)




	var px: int = NUM_PX
	var body_w: int = BODY_X1 - BODY_X0 + 1
	while px > 1 and PixelText.text_width(text, px) > body_w:
		px -= 1
	var w: int = PixelText.text_width(text, px)
	var h: int = PixelText.GLYPH_H * px
	var x0: int =(BODY_X0 + BODY_X1 + 1 - w) / 2
	var y0: int = BODY_Y0 + 5 +(BODY_Y1 - BODY_Y0 - 5 - h) / 2



	var lum_sum: float = 0.0
	var lum_n: int = 0
	for y in range(y0, mini(y0 + h, SIZE)):
		for x in range(x0, mini(x0 + w, SIZE)):
			if x >= 0 and y >= 0 and img.get_pixel(x, y).a > 0.0:
				lum_sum += img.get_pixel(x, y).get_luminance()
				lum_n += 1
	var mean: float = lum_sum / float(maxi(lum_n, 1))
	var dark: Color = Color(0.06, 0.07, 0.09)
	var light: Color = Color(0.98, 0.98, 1.0)
	var ink: Color = dark if mean > 0.5 else light
	var halo: Color = light if mean > 0.5 else dark
	for i in text.length():
		var gx: int = x0 + i *(PixelText.GLYPH_W + 1) * px

		for d in [Vector2i(-1, 0), Vector2i(1, 0), Vector2i(0, -1), Vector2i(0, 1),
				Vector2i(-1, -1), Vector2i(1, 1), Vector2i(-1, 1), Vector2i(1, -1)]:
			_glyph(img, gx + d.x, y0 + d.y, text[i], halo, px)
		_glyph(img, gx, y0, text[i], ink, px)




static func _glyph(img: Image, x0: int, y0: int, ch: String, ink: Color,
		px: int = NUM_PX) -> void:
	var glyph: Array = PixelText.FONT.get(ch, [])
	if glyph.is_empty():
		return
	for row in PixelText.GLYPH_H:
		var bits: int = glyph[row]
		for col in PixelText.GLYPH_W:
			if not (bits&(4>>col)):
				continue
			for dy in px:
				for dx in px:
					var x: int = x0 + col * px + dx
					var y: int = y0 + row * px + dy
					if x < 0 or y < 0 or x >= SIZE or y >= SIZE:
						continue


					if img.get_pixel(x, y).a > 0.0:
						img.set_pixel(x, y, ink)




static func _outline(img: Image, mask: Array) -> void:
	for y in SIZE:
		for x in SIZE:
			if mask[y][x]:
				continue
			var touches: bool = false
			for d in [Vector2i(1, 0), Vector2i(-1, 0), Vector2i(0, 1), Vector2i(0, -1)]:
				var nx: int = x + d.x
				var ny: int = y + d.y
				if nx >= 0 and ny >= 0 and nx < SIZE and ny < SIZE and mask[ny][nx]:
					touches = true
					break
			if touches:
				img.set_pixel(x, y, INK)












































const DRESS_ESC: int = 4

static var _cache_dressed: Dictionary = {}

















const CREST_W: int = 5
const CREST_H: int = 5




static func body_rect() -> Rect2i:
	return Rect2i(BODY_X0, BODY_Y0, BODY_X1 - BODY_X0 + 1, BODY_Y1 - BODY_Y0 + 1)





static func crest_box() -> Rect2i:
	var bb: Rect2i = body_rect()
	return Rect2i(bb.position.x + bb.size.x - CREST_W - 1, bb.position.y + 4,
		CREST_W, CREST_H)





static func brand_box() -> Rect2i:
	var bb: Rect2i = body_rect()
	var esc: Rect2i = crest_box()
	return Rect2i(bb.position.x + bb.size.x - CREST_W -(esc.position.x - bb.position.x),
		esc.position.y, CREST_W, CREST_H)




static func sponsor_box() -> Rect2i:
	var bb: Rect2i = body_rect()
	var esc: Rect2i = crest_box()
	return Rect2i(bb.position.x + 1, esc.position.y + CREST_H + 1, bb.size.x - 2, 4)










static func texture_dressed(cfg: Dictionary, team: Dictionary) -> ImageTexture:
	var base: ImageTexture = texture(cfg, 0)
	if base == null:
		return null



	var epoca: bool = bool(cfg.get("retro", false))
	var id: String = String(team.get("id", cfg.get("club", "")))
	var clave: String = CrestLogos.key_of(team)
	var esc_tex: Texture2D = CrestLogos.texture(clave, epoca) \
			if not clave.is_empty() and CrestLogos.has(clave) else null


	var pat_src: Texture2D = SponsorLogos.for_team(id, epoca)
	var pat_tex: Texture2D = Pecho.marca_para(pat_src, cfg, "pat") \
			if pat_src != null else null
	var fab_src: Texture2D = KitBrands.for_team(id, epoca,
		int(cfg.get("kit_slot", 0)))
	var fab_tex: Texture2D = Pecho.marca_para(fab_src, cfg, "fab") \
			if fab_src != null else null






	var key: String = "%s|%s|%s|%s|%s|%s|%s" % [
		Color(cfg.get("kit", Color("2a4bd7"))).to_html(),
		Color(cfg.get("kit_b", cfg.get("kit2", Color.BLACK))).to_html(),
		String(cfg.get("pattern", "solid")), String(cfg.get("local_trim", "")),
		_id_de(esc_tex), _id_de(pat_tex), _id_de(fab_tex)]
	if _cache_dressed.has(key):
		return _cache_dressed[key]


	var img: Image = SceneFade.imagen_copia(base)
	if img == null:
		return base
	img.convert(Image.FORMAT_RGBA8)




	if esc_tex == null:
		KitRecolor.stamp_patch(img, cfg, crest_box().position)



	var uso: Rect2i = img.get_used_rect()
	if uso.size.x <= 0 or uso.size.y <= 0:
		return null
	img = img.get_region(uso)
	img.resize(uso.size.x * DRESS_ESC, uso.size.y * DRESS_ESC,
		Image.INTERPOLATE_NEAREST)
	_pegar(img, esc_tex, _en_grande(crest_box(), uso))
	_pegar(img, pat_tex, _en_grande(sponsor_box(), uso))
	_pegar(img, fab_tex, _en_grande(brand_box(), uso))
	var tex: ImageTexture = ImageTexture.create_from_image(img)



	if _cache_dressed.size() > 24:
		_cache_dressed.clear()
	_cache_dressed[key] = tex
	return tex




static func _en_grande(r: Rect2i, uso: Rect2i) -> Rect2i:
	return Rect2i((r.position - uso.position) * DRESS_ESC, r.size * DRESS_ESC)






static func _id_de(tex: Texture2D) -> String:
	if tex == null:
		return "-"
	return tex.resource_path if not tex.resource_path.is_empty() \
			else str(tex.get_instance_id())






static func _pegar(img: Image, tex: Texture2D, caja: Rect2i) -> void:
	if tex == null or caja.size.x <= 0 or caja.size.y <= 0:
		return
	var src: Image = tex.get_image()
	if src == null or src.get_width() <= 0 or src.get_height() <= 0:
		return



	src = src.duplicate()
	src.convert(Image.FORMAT_RGBA8)
	var e: float = minf(float(caja.size.x) / float(src.get_width()),
		float(caja.size.y) / float(src.get_height()))
	var w: int = maxi(int(round(float(src.get_width()) * e)), 1)
	var h: int = maxi(int(round(float(src.get_height()) * e)), 1)
	src.resize(w, h, Image.INTERPOLATE_LANCZOS)
	img.blend_rect(src, Rect2i(Vector2i.ZERO, src.get_size()),
		caja.position +(caja.size - Vector2i(w, h)) / 2)

























const BOTON_PAD: float = 4.0

static var _boton_on: StyleBoxFlat
static var _boton_off: StyleBoxFlat

static func boton_look(b: Button, elegido: bool) -> void:
	if _boton_on == null:
		_boton_on = StyleBoxFlat.new()
		_boton_on.bg_color = UiKit.PLATE_BG
		_boton_on.border_color = UiKit.INK_BODY
		_boton_on.set_border_width_all(3)
		_boton_on.set_corner_radius_all(CareerTheme.RADIUS)
		_boton_on.content_margin_left = BOTON_PAD
		_boton_on.content_margin_right = BOTON_PAD
		_boton_on.content_margin_top = BOTON_PAD
		_boton_on.content_margin_bottom = BOTON_PAD


		_boton_off = _boton_on.duplicate()
		_boton_off.bg_color = UiKit.CLEAR
		_boton_off.border_color = UiKit.CLEAR
	var sb: StyleBoxFlat = _boton_on if elegido else _boton_off
	for estado in ["normal", "hover", "pressed", "focus", "hover_pressed"]:
		b.add_theme_stylebox_override(estado, sb)
	b.modulate = Color.WHITE if elegido else CareerTheme.MUTED
