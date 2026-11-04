class_name SleevePatch
extends RefCounted



























const AJUSTES: String = "res://assets/parche_manga.json"



















const DIR_PARCHE_BASE: String = "user://parche_emblemas"



static func dir_parche() -> String:
	return ToolStash.activa(DIR_PARCHE_BASE)





const ORO: Color = Color("e6b83c")
const ORO_OSCURO: Color = Color("a67c1e")




const CLARA: Color = Color(0.97, 0.97, 0.95)
const OSCURA: Color = Color(0.06, 0.06, 0.08)





const HALO_MIN: float = 0.35


const VISTA: String = "right"


const CAJA_DEF: Dictionary = {"alto": 5.0, "ancho": 5.0, "dx": 1.0, "dy": 40.0,
	"color": "auto", "giro": 0.0}










const DESLIZ_X: int = 6
const DESLIZ_Y: int = 4



const MIN_PLAYERA: float = 0.8

static var _caja: Dictionary = {}

static var _orden: Array = []




static var _sitios: Dictionary = {}
static var _recortes: Dictionary = {}





static var _cuadros: Dictionary = {}
static var _leido: bool = false



static var _emblemas: Dictionary = {}



static var _girados: Dictionary = {}


static func _lee() -> void:
	if _leido:
		return
	_leido = true
	_caja = CAJA_DEF.duplicate()
	var txt: String = FileAccess.get_file_as_string(AJUSTES)
	if txt.is_empty():
		return
	var d: Variant = JSON.parse_string(txt)
	if not (d is Dictionary):
		return
	var dic: Dictionary = d
	if dic.get("caja") is Dictionary:
		_caja.merge(dic["caja"], true)
	if dic.get("torneos") is Dictionary:
		_recortes = dic["torneos"]
	if dic.get("cuadros") is Dictionary:
		_cuadros = dic["cuadros"]






















const CON_PARCHE: Array[String] = ["champions", "europa", "conference", "clubes",
	"libertadores", "sudamericana", "concacaf",
	"liga_es", "liga_en", "liga_it", "liga_de", "liga_fr", "liga_pt", "liga_nl",
	"liga_be", "liga_tr", "liga_mx", "liga_ar", "liga_br", "liga_us", "liga_sa",
	"liga_jp", "liga_ch", "liga_at", "liga_gr", "liga_dk", "liga_no", "liga_se",
	"liga_pl", "liga_ru", "liga_ua", "liga_cz", "liga_sc", "copa", "mundial",
	"eurocopa", "america", "clasif"]





static func tipo_de(cfg: Dictionary) -> String:
	return String(cfg.get("comp_parche", ""))















static func _emblema(tipo: String) -> Image:
	_al_dia()
	if _emblemas.has(tipo):
		return _emblemas[tipo]
	_lee()






	var bytes: PackedByteArray = FileAccess.get_file_as_bytes(
		"%s/%s.png" % [CompLogos.dir(), tipo])
	var recortar: bool = true
	if bytes.is_empty():
		bytes = FileAccess.get_file_as_bytes("%s/%s.png" % [dir_parche(), tipo])
		recortar = false
	if bytes.is_empty():
		_emblemas[tipo] = null
		return null
	var img: Image = Image.new()
	if img.load_png_from_buffer(bytes) != OK:
		_emblemas[tipo] = null
		return null
	if img.get_format() != Image.FORMAT_RGBA8:
		img.convert(Image.FORMAT_RGBA8)






	var destapado: Image = Pecho.logo_limpio(img)
	if destapado != null:
		img = destapado




	img = _destapa(img)
	var bb: Rect2i = img.get_used_rect()
	if bb.size.x <= 0:
		_emblemas[tipo] = null
		return null
	var conf: Dictionary = _recortes.get(tipo, {})
	var rec: Variant = conf.get("rec")
	if recortar and rec is Array and (rec as Array).size() == 4:
		bb = Rect2i(bb.position + Vector2i(roundi(float(rec[0]) * bb.size.x),
				roundi(float(rec[1]) * bb.size.y)),
			Vector2i(maxi(roundi(float(rec[2]) * bb.size.x), 1),
				maxi(roundi(float(rec[3]) * bb.size.y), 1)))
	var cut: Image = Image.create(bb.size.x, bb.size.y, false, Image.FORMAT_RGBA8)
	cut.blit_rect(img, bb, Vector2i.ZERO)



	var bb2: Rect2i = cut.get_used_rect()
	if bb2.size.x > 0 and bb2 != Rect2i(Vector2i.ZERO, cut.get_size()):
		var c2: Image = Image.create(bb2.size.x, bb2.size.y, false, Image.FORMAT_RGBA8)
		c2.blit_rect(cut, bb2, Vector2i.ZERO)
		cut = c2
	_emblemas[tipo] = cut
	return cut







static func _giro_de(cuadro: String) -> float:
	var mano: Variant = _cuadros.get(cuadro)
	if mano is Dictionary and (mano as Dictionary).has("giro"):
		return float((mano as Dictionary)["giro"])
	return float(_caja.get("giro", 0.0))













static func _girado(tipo: String, grados: float) -> Image:
	var base: Image = _emblema(tipo)
	if base == null or is_zero_approx(grados):
		return base
	var llave: String = "%s|%.1f" % [tipo, grados]
	if _girados.has(llave):
		return _girados[llave]
	var r: float = deg_to_rad(grados)
	var co: float = cos(r)
	var si: float = sin(r)
	var w: int = base.get_width()
	var h: int = base.get_height()
	var nw: int = maxi(1, ceili(absf(w * co) + absf(h * si)))
	var nh: int = maxi(1, ceili(absf(w * si) + absf(h * co)))
	var out: Image = Image.create(nw, nh, false, Image.FORMAT_RGBA8)
	for y in nh:
		for x in nw:
			var dx: float = x + 0.5 - nw * 0.5
			var dy: float = y + 0.5 - nh * 0.5
			var sx: int = int(dx * co + dy * si + w * 0.5)
			var sy: int = int(- dx * si + dy * co + h * 0.5)
			if sx < 0 or sy < 0 or sx >= w or sy >= h:
				continue
			out.set_pixel(x, y, base.get_pixel(sx, sy))
	_girados[llave] = out
	return out





static func _es_borde(img: Image, x: int, y: int) -> bool:
	for d in [Vector2i(1, 0), Vector2i(-1, 0), Vector2i(0, 1), Vector2i(0, -1)]:
		var nx: int = x + d.x
		var ny: int = y + d.y
		if nx < 0 or nx >= img.get_width() or ny < 0 or ny >= img.get_height():
			return true
		if img.get_pixel(nx, ny).a <= 0.0:
			return true
	return false





static func _sitio(img: Image, alto: int, ancho: float, dx: float) -> Vector2:
	var minx: int = 9999
	var maxx: int = -1
	var y0: int = int(_caja.get("dy", 40.0))
	for dy in alto:
		var y: int = y0 + dy
		if y < 0 or y >= img.get_height():
			continue
		for x in img.get_width():
			if img.get_pixel(x, y).a > 0.0:
				minx = mini(minx, x)
				maxx = maxi(maxx, x)
	if maxx < 0:
		return Vector2(-1, -1)
	return Vector2((minx + maxx) * 0.5 - ancho * 0.5 + dx, float(y0))

















static func _encaja(img: Image, ex: int, ey: int, w: int, h: int,
		tonos: Array) -> Vector2i:
	var meta: int = w * h
	var minimo: int = int(ceilf(float(meta) * MIN_PLAYERA))
	var mejor: Vector2i = Vector2i(ex, ey)
	var mejor_punt: int = -1
	for o in _vecinos():
		var c: Vector2i = Vector2i(ex + o.x, ey + o.y)
		var cuenta: Vector2i = _tela(img, c.x, c.y, w, h, tonos)
		if cuenta.x >= meta and cuenta.y >= minimo:
			return c


		var punt: int = cuenta.x * meta + cuenta.y
		if punt > mejor_punt:
			mejor_punt = punt
			mejor = c
	return mejor




static func _vecinos() -> Array:
	if not _orden.is_empty():
		return _orden
	for dy in range(- DESLIZ_Y, DESLIZ_Y + 1):
		for dx in range(- DESLIZ_X, DESLIZ_X + 1):
			_orden.append(Vector2i(dx, dy))


	_orden.sort_custom(func(a: Vector2i, b: Vector2i) -> bool:
		return _coste(a) < _coste(b))
	return _orden


static func _coste(o: Vector2i) -> float:
	return absf(float(o.x)) + absf(float(o.y)) *(1.0 if o.y >= 0 else 2.0)






static func _tela(img: Image, ex: int, ey: int, w: int, h: int,
		tonos: Array) -> Vector2i:
	var n: int = 0
	var tela: int = 0
	for y in h:
		for x in w:
			var p: Vector2i = Vector2i(ex + x, ey + y)
			if p.x < 0 or p.y < 0 or p.x >= img.get_width() or p.y >= img.get_height():
				continue
			var c: Color = img.get_pixel(p.x, p.y)
			if c.a <= 0.0 or _es_borde(img, p.x, p.y):
				continue
			n += 1
			if tonos.is_empty() or _es_playera(c, tonos):
				tela += 1
	return Vector2i(n, tela)





static func _tonos_playera(cfg: Dictionary) -> Array:
	var out: Array = []
	for llave in ["kit", "kit_b"]:
		if cfg.get(llave) is Color:
			out.append(cfg[llave])
	return out




static func _es_playera(c: Color, tonos: Array) -> bool:
	for t in tonos:
		if _tono_cerca(c, t):
			return true
	return false





static func _peor(tinta: Color, tonos: Array) -> float:
	var out: float = 1.0
	for t in tonos:
		out = minf(out, absf(tinta.get_luminance() -(t as Color).get_luminance()))
	return out








static func halo_de(cfg: Dictionary) -> Variant:
	if String(_caja.get("color", "auto")) != "auto":
		return null
	if bool(cfg.get("parche_vigente", false)):
		return null
	var tonos: Array = _tonos_playera(cfg)
	if tonos.size() < 2:
		return null
	var clara: float = _peor(CLARA, tonos)
	var oscura: float = _peor(OSCURA, tonos)
	if maxf(clara, oscura) >= HALO_MIN:
		return null
	return OSCURA if clara >= oscura else CLARA





static func _tono_cerca(a: Color, b: Color) -> bool:
	if a.s < 0.12 or b.s < 0.12:
		return a.s < 0.12 and b.s < 0.12
	var d: float = absf(a.h - b.h)
	return minf(d, 1.0 - d) < 0.08





















static func tinta_cfg(cfg: Dictionary) -> Variant:
	var modo: String = String(_caja.get("color", "auto"))
	if modo != "auto" and modo.is_valid_html_color():
		return Color(modo)
	if bool(cfg.get("parche_vigente", false)):
		var k: Variant = cfg.get("kit")
		if k is Color and (k as Color).get_luminance() > 0.45:
			return ORO_OSCURO
		return ORO
	var tonos: Array = _tonos_playera(cfg)
	if tonos.is_empty():
		return null
	return CLARA if _peor(CLARA, tonos) >= _peor(OSCURA, tonos) else OSCURA


static func _tinta(img: Image, cfg: Dictionary, o: Vector2, alto: int,
		ancho: int) -> Color:
	var modo: String = String(_caja.get("color", "auto"))
	if modo != "auto" and modo.is_valid_html_color():
		return Color(modo)
	var suma: Color = Color(0, 0, 0)
	var n: int = 0









	if bool(cfg.get("parche_vigente", false)):
		var k: Variant = cfg.get("kit")
		if k is Color and (k as Color).get_luminance() > 0.45:
			return ORO_OSCURO
		return ORO







	var tonos: Array = _tonos_playera(cfg)
	if not tonos.is_empty():
		return CLARA if _peor(CLARA, tonos) >= _peor(OSCURA, tonos) else OSCURA



	if n == 0:
		for dy in alto:
			for dx in ancho:
				var p: Vector2i = Vector2i(int(o.x) + dx, int(o.y) + dy)
				if p.x < 0 or p.y < 0 or p.x >= img.get_width() \
						or p.y >= img.get_height():
					continue
				var c: Color = img.get_pixel(p.x, p.y)
				if c.a > 0.0 and not _es_borde(img, p.x, p.y):
					suma += c
					n += 1
	if n == 0:
		return CLARA
	return OSCURA if (suma / float(n)).get_luminance() > 0.45 else CLARA



















static func _base_de(cuadro: String) -> Image:
	for dir in ["anim", "players"]:
		var path: String = "res://assets/sprites/%s/%s.png" % [dir, cuadro]
		if not ResourceLoader.exists(path):
			continue
		var tex: Texture2D = load(path)
		if tex == null:
			continue
		var img: Image = tex.get_image()
		if img == null:
			continue
		img = img.duplicate()
		if img.get_format() != Image.FORMAT_RGBA8:
			img.convert(Image.FORMAT_RGBA8)
		return img
	return null


static func rect(img: Image, cfg: Dictionary, cuadro: String = "") -> Rect2i:
	_lee()


	var emb: Image = _girado(tipo_de(cfg), _giro_de(cuadro))
	if emb == null:
		return Rect2i()
	var alto: int = int(_caja.get("alto", 5.0))
	var ancho: float = float(_caja.get("ancho", 5.0))
	if int(_caja.get("dy", 40.0)) + alto > img.get_height():
		return Rect2i()
	if _sitios.has(cuadro):
		return _sitios[cuadro]





	var veto: Variant = _cuadros.get(cuadro)
	if veto is Dictionary and bool((veto as Dictionary).get("sin", false)):
		return Rect2i()


	var ref: Image = _base_de(cuadro) if not cuadro.is_empty() else null
	if ref == null:
		ref = img
	var o: Vector2 = _sitio(ref, alto, ancho, float(_caja.get("dx", 0.0)))
	if o.x < 0:
		return Rect2i()





	var esc: float = minf(ancho / float(emb.get_width()),
		float(alto) / float(emb.get_height()))
	var w: int = maxi(roundi(emb.get_width() * esc), 1)
	var h: int = maxi(roundi(emb.get_height() * esc), 1)
	var ex: int = roundi(o.x +(ancho - w) * 0.5)
	var ey: int = roundi(o.y +(alto - h) * 0.5)



	var mano: Variant = _cuadros.get(cuadro)
	if mano is Dictionary:
		var a_mano: Rect2i = Rect2i(ex + int(mano.get("dx", 0)),
			ey + int(mano.get("dy", 0)), w, h)
		_sitios[cuadro] = a_mano
		return a_mano




	var fin: Rect2i = Rect2i(_encaja(ref, ex, ey, w, h,
		[KitRecolor.REF_KIT] if ref != img else _tonos_playera(cfg)),
		Vector2i(w, h))
	if not cuadro.is_empty():
		_sitios[cuadro] = fin
	return fin



static func bake(img: Image, cfg: Dictionary, view: String,
		cuadro: String = "") -> void:




	if bool(cfg.get("parche_lamina", false)):
		return
	if view != VISTA:
		return
	var tipo: String = tipo_de(cfg)
	if tipo.is_empty():
		return
	_lee()
	var emb: Image = _girado(tipo, _giro_de(cuadro))
	if emb == null:
		return
	var r: Rect2i = rect(img, cfg, cuadro)
	if r.size.x <= 0:
		return
	var ex: int = r.position.x
	var ey: int = r.position.y
	var w: int = r.size.x
	var h: int = r.size.y


	var col: Color = _tinta(img, cfg, Vector2(ex, ey), h, w)
	var chico: Image = emb.duplicate()
	chico.resize(w, h, Image.INTERPOLATE_LANCZOS)
	_aviva_alfa(chico)




	var halo: Variant = halo_de(cfg)
	if halo is Color:
		for y in range(-1, h + 1):
			for x in range(-1, w + 1):
				if _lleno(chico, x, y, w, h):
					continue


				if not (_lleno(chico, x - 1, y, w, h) or _lleno(chico, x + 1, y, w, h)
						or _lleno(chico, x, y - 1, w, h) or _lleno(chico, x, y + 1, w, h)):
					continue
				var q: Vector2i = Vector2i(ex + x, ey + y)
				if q.x < 0 or q.y < 0 or q.x >= img.get_width() \
						or q.y >= img.get_height():
					continue
				var d: Color = img.get_pixel(q.x, q.y)
				if d.a <= 0.0 or _es_borde(img, q.x, q.y):
					continue
				img.set_pixel(q.x, q.y, Color((halo as Color).r,(halo as Color).g,
					(halo as Color).b, d.a))
	for y in h:
		for x in w:
			var p: Vector2i = Vector2i(ex + x, ey + y)
			if p.x < 0 or p.y < 0 or p.x >= img.get_width() or p.y >= img.get_height():
				continue


			var bajo: Color = img.get_pixel(p.x, p.y)
			if bajo.a <= 0.0 or _es_borde(img, p.x, p.y):
				continue
			var c: Color = chico.get_pixel(x, y)
			if c.a <= 0.02:
				continue
			img.set_pixel(p.x, p.y, bajo.lerp(Color(col.r, col.g, col.b, bajo.a), c.a))




static func _lleno(chico: Image, x: int, y: int, w: int, h: int) -> bool:
	if x < 0 or y < 0 or x >= w or y >= h:
		return false
	return chico.get_pixel(x, y).a > 0.02


















static func _aviva_alfa(img: Image) -> void:
	var amax: float = 0.0
	for y in img.get_height():
		for x in img.get_width():
			amax = maxf(amax, img.get_pixel(x, y).a)


	if amax <= 0.0 or amax >= 0.99:
		return
	var k: float = 1.0 / amax
	for y in img.get_height():
		for x in img.get_width():
			var c: Color = img.get_pixel(x, y)
			c.a = minf(c.a * k, 1.0)
			img.set_pixel(x, y, c)




















static var _texturas: Dictionary = {}

static func textura(cfg: Dictionary, grados: float = 0.0) -> Texture2D:
	var tipo: String = tipo_de(cfg)
	if tipo.is_empty():
		return null



	_al_dia()


	var forzada: Variant = _tinta_forzada(cfg)
	var halo: Variant = halo_de(cfg)
	var llave: String = "%s|%s|%s|%s|%.1f" % [tipo,
		(forzada as Color).to_html(false) if forzada is Color else "auto",
		(halo as Color).to_html(false) if halo is Color else "-",
		(cfg.get("kit", Color.WHITE) as Color).to_html(false), grados]
	if _texturas.has(llave):
		return _texturas[llave]
	var img: Image = _girado(tipo, grados)
	if img == null:
		_texturas[llave] = null
		return null
	img = img.duplicate()
	if img.get_format() != Image.FORMAT_RGBA8:
		img.convert(Image.FORMAT_RGBA8)
	if forzada is Color:
		var col: Color = forzada
		for y in img.get_height():
			for x in img.get_width():
				var c: Color = img.get_pixel(x, y)
				if c.a > 0.0:
					img.set_pixel(x, y, Color(col.r, col.g, col.b, c.a))
		if halo is Color:
			img = _halo_grande(img, halo as Color)
	else:















		var cruda: ImageTexture = ImageTexture.create_from_image(img)
		var tenida: Texture2D = Pecho.marca_para(cruda, cfg, "man")



		var tenida_img: Image = SceneFade.imagen_copia(tenida)
		if tenida_img != null:
			img = tenida_img
			if img.get_format() != Image.FORMAT_RGBA8:
				img.convert(Image.FORMAT_RGBA8)







		if not _se_lee(img, cfg):
			img = _a_un_color(img, _contraste_cfg(cfg))
	_aviva_alfa(img)





	img.generate_mipmaps()
	var tex: ImageTexture = ImageTexture.create_from_image(img)
	_texturas[llave] = tex
	return tex














const OPACO_SOSPECHA: float = 0.7


const TOL_FONDO: float = 0.34

static func _destapa(img: Image) -> Image:
	var w: int = img.get_width()
	var h: int = img.get_height()
	if w <= 2 or h <= 2:
		return img
	var opacos: int = 0
	for y in h:
		for x in w:
			if img.get_pixel(x, y).a > 0.9:
				opacos += 1
	if float(opacos) / float(w * h) < OPACO_SOSPECHA:
		return img
	var out: Image = img.duplicate()
	var visto: PackedByteArray = PackedByteArray()
	visto.resize(w * h)
	var cola: Array[Vector2i] = []



	for x in w:
		cola.append(Vector2i(x, 0))
		cola.append(Vector2i(x, h - 1))
	for y in h:
		cola.append(Vector2i(0, y))
		cola.append(Vector2i(w - 1, y))
	var i: int = 0
	while i < cola.size():
		var p: Vector2i = cola[i]
		i += 1
		if p.x < 0 or p.y < 0 or p.x >= w or p.y >= h:
			continue
		var k: int = p.y * w + p.x
		if visto[k] == 1:
			continue
		visto[k] = 1
		var c: Color = img.get_pixel(p.x, p.y)
		if c.a <= 0.02:

			for d in [Vector2i(1, 0), Vector2i(-1, 0), Vector2i(0, 1), Vector2i(0, -1)]:
				cola.append(p + d)
			continue



		var ref: Color = img.get_pixel(clampi(p.x, 0, w - 1),
			0 if p.y < h / 2 else h - 1)
		var d1: float = absf(c.r - ref.r) + absf(c.g - ref.g) + absf(c.b - ref.b)
		var ref2: Color = img.get_pixel(0 if p.x < w / 2 else w - 1,
			clampi(p.y, 0, h - 1))
		var d2: float = absf(c.r - ref2.r) + absf(c.g - ref2.g) + absf(c.b - ref2.b)
		if minf(d1, d2) > TOL_FONDO:
			continue
		out.set_pixel(p.x, p.y, Color(c.r, c.g, c.b, 0.0))
		for d in [Vector2i(1, 0), Vector2i(-1, 0), Vector2i(0, 1), Vector2i(0, -1)]:
			cola.append(p + d)

	if out.get_used_rect().size.x <= 0:
		return img
	return out
















const MACIZO_MIN: float = 0.62

static func _a_un_color(img: Image, tinta: Color) -> Image:
	var bb: Rect2i = img.get_used_rect()
	if bb.size.x <= 0 or bb.size.y <= 0:
		return img
	var lum: Array[float] = []
	var suma: float = 0.0
	for y in range(bb.position.y, bb.position.y + bb.size.y):
		for x in range(bb.position.x, bb.position.x + bb.size.x):
			var c: Color = img.get_pixel(x, y)
			if c.a <= 0.5:
				continue
			var l: float = c.get_luminance()
			lum.append(l)
			suma += l
	var total: int = bb.size.x * bb.size.y
	var out: Image = img.duplicate()

	if lum.is_empty() or float(lum.size()) / float(total) < MACIZO_MIN:
		for y in img.get_height():
			for x in img.get_width():
				var c2: Color = img.get_pixel(x, y)
				if c2.a > 0.0:
					out.set_pixel(x, y, Color(tinta.r, tinta.g, tinta.b, c2.a))
		return out
	var media: float = suma / float(lum.size())
	var claros: int = 0
	for l2 in lum:
		if l2 > media:
			claros += 1



	var quedan_claros: bool = claros * 2 >= lum.size()
	for y in img.get_height():
		for x in img.get_width():
			var c3: Color = img.get_pixel(x, y)
			if c3.a <= 0.0:
				continue
			var es_claro: bool = c3.get_luminance() > media
			if es_claro == quedan_claros:
				out.set_pixel(x, y, Color(tinta.r, tinta.g, tinta.b, c3.a))
			else:
				out.set_pixel(x, y, Color(tinta.r, tinta.g, tinta.b, 0.0))
	if out.get_used_rect().size.x <= 0:
		return img
	return out





const CONTRASTE_MIN: float = 0.22

static func _se_lee(img: Image, cfg: Dictionary) -> bool:
	var tonos: Array = _tonos_playera(cfg)
	if tonos.is_empty():
		return true
	var suma: float = 0.0
	var n: int = 0
	for y in img.get_height():
		for x in img.get_width():
			var c: Color = img.get_pixel(x, y)
			if c.a > 0.5:
				suma += c.get_luminance()
				n += 1
	if n == 0:
		return true
	var lum: float = suma / float(n)


	var peor: float = 1.0
	for t in tonos:
		peor = minf(peor, absf(lum -(t as Color).get_luminance()))
	return peor >= CONTRASTE_MIN



static func _contraste_cfg(cfg: Dictionary) -> Color:
	var tonos: Array = _tonos_playera(cfg)
	if tonos.is_empty():
		return CLARA
	return CLARA if _peor(CLARA, tonos) >= _peor(OSCURA, tonos) else OSCURA




static func _tinta_forzada(cfg: Dictionary) -> Variant:


	if bool(cfg.get("oro_forzado", false)):
		var ko: Variant = cfg.get("kit")
		return ORO_OSCURO if ko is Color and (ko as Color).get_luminance() > 0.45 else ORO
	var modo: String = String(_caja.get("color", "auto"))
	if modo != "auto" and modo.is_valid_html_color():
		return Color(modo)
	if bool(cfg.get("parche_vigente", false)):
		var k: Variant = cfg.get("kit")
		if k is Color and (k as Color).get_luminance() > 0.45:
			return ORO_OSCURO
		return ORO
	return null




static func _halo_grande(src: Image, col: Color) -> Image:
	var w: int = src.get_width()
	var h: int = src.get_height()
	var g: int = maxi(1, roundi(float(maxi(w, h)) / 24.0))
	var out: Image = Image.create(w + g * 2, h + g * 2, false, Image.FORMAT_RGBA8)
	for y in out.get_height():
		for x in out.get_width():
			var sx: int = x - g
			var sy: int = y - g
			var dentro: bool = sx >= 0 and sy >= 0 and sx < w and sy < h \
					and src.get_pixel(sx, sy).a > 0.02
			if dentro:
				out.set_pixel(x, y, src.get_pixel(sx, sy))
				continue

			var toca: bool = false
			for d in [Vector2i(g, 0), Vector2i(- g, 0), Vector2i(0, g), Vector2i(0, - g)]:
				var px: int = sx + d.x
				var py: int = sy + d.y
				if px >= 0 and py >= 0 and px < w and py < h \
						and src.get_pixel(px, py).a > 0.02:
					toca = true
					break
			if toca:
				out.set_pixel(x, y, col)
	return out





static func rect_de(cuadro: String, cfg: Dictionary) -> Rect2:
	if cuadro.is_empty() or tipo_de(cfg).is_empty():
		return Rect2()
	if not cuadro.contains("east"):
		return Rect2()
	var base: Image = _base_de(cuadro)
	if base == null:
		return Rect2()
	var r: Rect2i = rect(base, cfg, cuadro)
	if r.size.x <= 0:
		return Rect2()
	return Rect2(r.position, r.size)





static var _indice: Dictionary = {}









static var _por_base: Dictionary = {}
static var _cfg_indice: Dictionary = {}

static func build_index(anims: Array, cfg: Dictionary) -> void:


	_al_dia()
	_indice.clear()
	_por_base.clear()
	_cfg_indice = {}
	if tipo_de(cfg).is_empty():
		return
	_cfg_indice = cfg.duplicate()


	for spec in anims:
		if not (spec is Dictionary):
			continue
		var d: Dictionary = spec
		var dirs: Array = ["south", "north", "east", "west"] \
				if bool(d.get("dirs", false)) else [""]
		for dir in dirs:
			var anim: String = String(d.get("anim", ""))
			if anim.is_empty():
				continue
			if not dir.is_empty():
				anim = anim % dir
			var lista: Array = []
			var alguno: bool = false
			for i in range(int(d.get("from", 0)), int(d.get("to", 0)) + 1):
				var fichero: String =(String(d.get("path", "")) % [dir, i]) \
						if not dir.is_empty() else (String(d.get("path", "")) % i)
				var r: Rect2 = rect_de(fichero.get_file().get_basename(), cfg)
				if r.size.x > 0.0:
					alguno = true
				lista.append(r)


			if alguno:
				_indice[anim] = lista




static func rects(anim: String, i: int) -> Rect2:
	var lista: Variant = _indice.get(anim)
	if not (lista is Array):
		return Rect2()
	var a: Array = lista
	if i < 0 or i >= a.size():
		return Rect2()
	return a[i]




static func rects_base(base: String) -> Rect2:
	if base.is_empty() or _cfg_indice.is_empty():
		return Rect2()
	if not _por_base.has(base):
		_por_base[base] = rect_de(base, _cfg_indice)
	return _por_base[base]





static func calienta(sf: SpriteFrames) -> void:
	if sf == null or _cfg_indice.is_empty():
		return
	for llave in sf.get_meta_list():
		if not String(llave).begins_with("pecho_bases"):
			continue
		var v: Variant = sf.get_meta(llave)
		if not (v is PackedStringArray):
			continue
		for b in (v as PackedStringArray):
			if b.contains("east"):
				rects_base(b)




static var _ruta_pack: String = ""
static var _ruta_parche: String = ""















static func _al_dia() -> void:
	var pack: String = CompLogos.dir()
	var parche: String = dir_parche()
	if pack == _ruta_pack and parche == _ruta_parche:
		return





	if not _ruta_pack.is_empty():
		invalida()
	_ruta_pack = pack
	_ruta_parche = parche









static func stash_for_tool() -> void:
	ToolStash.desvia(DIR_PARCHE_BASE)
	invalida()


static func unstash_for_tool() -> void:
	ToolStash.devuelve(DIR_PARCHE_BASE)
	invalida()



static func invalida() -> void:
	_leido = false
	_texturas.clear()
	_indice.clear()
	_por_base.clear()
	_cfg_indice = {}
	_emblemas.clear()
	_girados.clear()
	_recortes.clear()
	_cuadros.clear()
	_sitios.clear()
