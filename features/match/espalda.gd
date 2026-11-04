class_name Espalda
extends RefCounted
































const ATLAS_PNG: String = "res://assets/sprites/ui/espalda_atlas_%s.png"
const ATLAS_JSON: String = "res://assets/sprites/ui/espalda_atlas_%s.json"









const FAMILIAS: Array[String] = ["bloque", "estrecha", "palo", "serif", "redonda"]
const FAM_DEF: String = "bloque"




const CAJAS: String = "res://assets/sprites/dorsal_boxes.json"




const RES: int = 8




const NOMBRE_ANCHO: float = 13.0
const NOMBRE_CAP: float = 2.6
const NOMBRE_FLECHA: float = 1.0
const NOMBRE_TRACK: float = 0.06
const NUM_ALTO: float = 7.6
const BORDE: float = 0.35




const AIRE: float = 1.7





const NUM_BAJA: float = 1.0



const CAJA_REF: Vector2 = Vector2(7.0, 11.0)



const ESCALA_MIN: float = 0.55
const ESCALA_MAX: float = 1.2



const HACIA_CAM: float = 0.06


const LIENZO: int = 92











const CACHE_MAX: int = 96


static var _atlas: Dictionary = {}





static var _fam: String = FAM_DEF
static var _cajas: Dictionary = {}
static var _cargado: bool = false
static var _cache: Dictionary = {}











static func textura(apellido: String, numero: int,
		receta: Dictionary) -> ImageTexture:
	var v: Variant = _busca(apellido, numero, receta)
	if v is HornoEspalda:
		(v as HornoEspalda).avanza(1<<62)
		return (v as HornoEspalda).tex
	return v






static func horno(apellido: String, numero: int, receta: Dictionary) -> HornoEspalda:
	var v: Variant = _busca(apellido, numero, receta)
	return v if v is HornoEspalda else null





static func _busca(apellido: String, numero: int, receta: Dictionary) -> Variant:
	_cargar()
	var texto: String = apellido.strip_edges().to_upper()
	var num: String = str(numero) if numero > 0 else ""
	if texto.is_empty() and num.is_empty():
		return null
	_usar(String(receta.get("fuente", FAM_DEF)))
	var clave: String = _clave(texto, num, receta)
	if _cache.has(clave):
		return _toca(_cache, clave)
	if _hornos.has(clave):
		return _hornos[clave]
	var h: HornoEspalda = HornoEspalda.new(texto, num, _fam, receta, clave)
	_hornos[clave] = h
	return h




static func _clave(texto: String, num: String, receta: Dictionary) -> String:
	return "%s|%s|%s|%s|%s|%s|%s|%s|%d|%s" % [texto, num, _fam,
		Color(receta.get("tinta", Color.WHITE)).to_html(),
		Color(receta.get("halo", Color(0, 0, 0, 0))).to_html(),
		Color(receta.get("tinta2", Color.BLACK)).to_html(),
		String(receta.get("relleno", "solido")),
		String(receta.get("estilo", "auto")),
		int(receta.get("sombra", 0)),
		"%s%s" % [receta.get("cuerpo", true), receta.get("relieve", false)]]





static var _hornos: Dictionary = {}




static var _tramo_us: Dictionary = {}






const TRAMO_SEMILLA_US: int = 5000



static var _rasterizadas: int = 0














class HornoEspalda extends RefCounted:
	const TRAMOS: Array[String] = ["arco", "recto", "anillo_num", "anillo_nom", "cuerpo", "sube"]

	var texto: String
	var num: String
	var fam: String
	var receta: Dictionary
	var clave: String
	var paso: int = 0

	var tex: ImageTexture = null

	var _w: int
	var _h: int
	var _base_y: float
	var _num_y0: int
	var _num_y1: int
	var _m_nom: PackedFloat32Array
	var _m_num: PackedFloat32Array
	var _bb_nom: Rect2i = Rect2i()
	var _bb_num: Rect2i = Rect2i()
	var _an_num: PackedFloat32Array
	var _an_nom: PackedFloat32Array
	var _bb_an_num: Array = [Rect2i()]
	var _bb_an_nom: Array = [Rect2i()]
	var _img: Image

	func _init(t: String, n: String, f: String, rec: Dictionary, k: String) -> void:
		texto = t
		num = n
		fam = f


		receta = rec.duplicate()
		clave = k
		var pad: int = int(ceil(BORDE * RES)) + RES
		_w = int(ceil(NOMBRE_ANCHO * RES)) + pad * 2
		var alto_bloque: float = NOMBRE_CAP + NOMBRE_FLECHA + AIRE + NUM_ALTO
		_h = int(ceil(alto_bloque * RES)) + pad * 2
		_base_y = pad +(NOMBRE_CAP + NOMBRE_FLECHA) * RES
		_num_y0 = int(_base_y + AIRE * RES)
		_num_y1 = int(_base_y +(AIRE + NUM_ALTO) * RES)

	func hecho() -> bool:
		return paso >= TRAMOS.size()



	func siguiente_us() -> int:
		return 0 if hecho() else int(Espalda._tramo_us.get(TRAMOS[paso], Espalda.TRAMO_SEMILLA_US))






	func avanza(deadline_us: int) -> bool:
		if hecho():
			return true
		Espalda._usar(fam)
		var primero: bool = true
		while not hecho():
			var t0: int = Time.get_ticks_usec()
			if not primero and t0 + siguiente_us() > deadline_us:
				return false
			primero = false
			_tramo(TRAMOS[paso])
			Espalda._tramo_us[TRAMOS[paso]] = Time.get_ticks_usec() - t0
			paso += 1
		return true

	func _tramo(que: String) -> void:
		match que:
			"arco":




				_m_nom = PackedFloat32Array()
				_m_num = PackedFloat32Array()
				_m_nom.resize(_w * _h)
				_m_num.resize(_w * _h)
				if not texto.is_empty():
					Espalda._rasterizadas += 1
					_bb_nom = Espalda._arco(_m_nom, _w, _h, texto, float(_w) * 0.5, _base_y,
						NOMBRE_ANCHO * RES, NOMBRE_CAP * RES, NOMBRE_FLECHA * RES)
			"recto":
				if not num.is_empty():
					_bb_num = Espalda._recto(_m_num, _w, _h, num, float(_w) * 0.5,
						float(_num_y1), NUM_ALTO * RES, float(receta.get("track", 0.0)),
						NOMBRE_ANCHO * RES)
			"anillo_num":
				_an_num = Espalda._anillo(_m_num, _w, _h, Espalda._radio_borde(),
					_bb_num, _bb_an_num)
			"anillo_nom":
				_an_nom = Espalda._anillo(_m_nom, _w, _h, Espalda._radio_borde(),
					_bb_nom, _bb_an_nom)
			"cuerpo":
				_img = Espalda._pintar_con(_m_nom, _m_num, _w, _h, receta, _num_y0,
					_num_y1, _bb_nom, _bb_num, _an_num, _bb_an_num[0], _an_nom,
					_bb_an_nom[0])
			"sube":
				tex = ImageTexture.create_from_image(_img)
				Espalda._guarda(Espalda._cache, clave, tex, CACHE_MAX)
				if Espalda._hornos.get(clave) == self:
					Espalda._hornos.erase(clave)


				_m_nom = PackedFloat32Array()
				_m_num = PackedFloat32Array()
				_an_num = PackedFloat32Array()
				_an_nom = PackedFloat32Array()
				_img = null





static func _toca(cache: Dictionary, clave: String) -> ImageTexture:
	var tex: ImageTexture = cache[clave]
	cache.erase(clave)
	cache[clave] = tex
	return tex





static func _guarda(cache: Dictionary, clave: String, tex: ImageTexture, tope: int) -> void:
	while cache.size() >= tope:
		var vieja: String = ""
		for k in cache:
			vieja = String(k)
			break
		cache.erase(vieja)
	cache[clave] = tex





static func metrica() -> Dictionary:
	var pad: float = ceil(BORDE * RES) + RES
	var alto_bloque: float = NOMBRE_CAP + NOMBRE_FLECHA + AIRE + NUM_ALTO
	var alto: float = alto_bloque + pad * 2.0 / RES

	var cy: float = pad / RES + NOMBRE_CAP + NOMBRE_FLECHA + AIRE + NUM_ALTO * 0.5
	return {"ancho": NOMBRE_ANCHO + pad * 2.0 / RES, "alto": alto, "cy": cy}












static func _arco(mask: PackedFloat32Array, w: int, h: int, texto: String,
		cx: float, base_y: float, cuerda: float, cap: float, flecha: float) -> Rect2i:





	var esc: float = minf(cuerda / maxf(_avance(texto, cap), 0.001), 1.0)
	for _intento in 2:
		var ancho: float = _tinta_ancho(texto, cap, esc, cuerda, flecha)
		if ancho <= cuerda or ancho <= 0.0:
			break
		esc *= cuerda / ancho
	var at: Array = _atlas_f(_fam)
	var bb: Rect2i = Rect2i()
	var ancho2: float = _avance(texto, cap) * esc

	var r: float = 0.0
	if flecha > 0.01:
		r = flecha * 0.5 +(cuerda * cuerda) /(8.0 * flecha)
	var x: float = cx - ancho2 * 0.5
	for i in texto.length():
		var g: Dictionary = _glifo(texto[i])
		if g.is_empty():
			continue
		var k: float = cap / _cap() * esc
		var adv: float = float(g["adv"]) * k

		var mx: float = x + adv * 0.5
		var ang: float = 0.0
		var sube: float = 0.0
		if r > 0.0:
			var o: float = mx - cx
			ang = atan2(o, r)

			sube = r - sqrt(maxf(r * r - o * o, 0.0))
		var esquina: Vector2 = Vector2(x + float(g["dx"]) * k,
			base_y + float(g["dy"]) * k)
		var piv: Vector2 = Vector2(mx, base_y)
		var piv_dst: Vector2 = Vector2(mx, base_y + sube)
		bb = _une(bb, _blit(mask, w, h, g, esquina, k, ang, piv, piv_dst, at[0], at[1]))
		x += adv + cap * NOMBRE_TRACK * esc
	return bb



static func _tinta_ancho(texto: String, cap: float, esc: float, cuerda: float,
		flecha: float) -> float:
	var r: Rect2 = _recorre_arco(texto, 0.0, 0.0, cuerda, cap, flecha, esc)
	return r.size.x





static func _recorre_arco(texto: String, cx: float, base_y: float, cuerda: float,
		cap: float, flecha: float, esc: float) -> Rect2:
	var ancho: float = _avance(texto, cap) * esc
	var r: float = 0.0
	if flecha > 0.01:
		r = flecha * 0.5 +(cuerda * cuerda) /(8.0 * flecha)
	var x: float = cx - ancho * 0.5
	var x_min: float = INF
	var x_max: float = - INF
	for i in texto.length():
		var g: Dictionary = _glifo(texto[i])
		if g.is_empty():
			continue
		var k: float = cap / _cap() * esc
		var adv: float = float(g["adv"]) * k
		var mx: float = x + adv * 0.5
		var ang: float = 0.0
		var sube: float = 0.0
		if r > 0.0:
			var o: float = mx - cx
			ang = atan2(o, r)
			sube = r - sqrt(maxf(r * r - o * o, 0.0))
		var esquina: Vector2 = Vector2(x + float(g["dx"]) * k,
			base_y + float(g["dy"]) * k)
		var piv: Vector2 = Vector2(mx, base_y)
		var piv_dst: Vector2 = Vector2(mx, base_y + sube)
		var caja: Rect2 = _caja_girada(g, esquina, k, ang, piv, piv_dst)
		x_min = minf(x_min, caja.position.x)
		x_max = maxf(x_max, caja.position.x + caja.size.x)
		x += adv + cap * NOMBRE_TRACK * esc
	if x_max < x_min:
		return Rect2()
	return Rect2(x_min, 0.0, x_max - x_min, 0.0)




static func _caja_girada(g: Dictionary, esquina: Vector2, k: float, ang: float,
		piv: Vector2, piv_dst: Vector2) -> Rect2:
	var dw: float = float(int(g["w"])) * k
	var dh: float = float(int(g["h"])) * k
	if dw <= 0.0 or dh <= 0.0:
		return Rect2(piv_dst.x, piv_dst.y, 0.0, 0.0)
	var co: float = cos(ang)
	var si: float = sin(ang)
	var rel: Vector2 = esquina + Vector2(dw, dh) * 0.5 - piv
	var c: Vector2 = piv_dst + Vector2(rel.x * co - rel.y * si,
		rel.x * si + rel.y * co)
	var ext: float =(absf(dw * co) + absf(dh * si)) * 0.5
	var eyt: float =(absf(dw * si) + absf(dh * co)) * 0.5
	return Rect2(c.x - ext, c.y - eyt, ext * 2.0, eyt * 2.0)




static func _recto(mask: PackedFloat32Array, w: int, h: int, texto: String,
		cx: float, base_y: float, alto_pedido: float, track: float = 0.0,
		ancho_max: float = 0.0) -> Rect2i:




	var alto: float = alto_pedido
	if ancho_max > 0.0:
		var w_nat: float = _avance(texto, alto) + track * alto \
				* float(maxi(texto.length() - 1, 0))
		if w_nat > ancho_max:
			alto *= ancho_max / w_nat
	var k: float = alto / _cap()
	var avance: float = _avance(texto, alto) + track * alto \
			* float(maxi(texto.length() - 1, 0))
	var x: float = cx - avance * 0.5
	var at: Array = _atlas_f(_fam)
	var bb: Rect2i = Rect2i()
	for i in texto.length():
		var g: Dictionary = _glifo(texto[i])
		if g.is_empty():
			continue
		bb = _une(bb, _blit(mask, w, h, g, Vector2(x + float(g["dx"]) * k,
			base_y + float(g["dy"]) * k), k, 0.0, Vector2.ZERO, Vector2.ZERO, at[0], at[1]))
		x += float(g["adv"]) * k + track * alto
	return bb


static func _avance(texto: String, cap: float) -> float:
	var total: float = 0.0
	for i in texto.length():
		var g: Dictionary = _glifo(texto[i])
		if not g.is_empty():
			total += float(g["adv"]) * cap / _cap()
	return total
















static func _blit(mask: PackedFloat32Array, w: int, h: int, g: Dictionary,
		esquina: Vector2, k: float, ang: float, piv: Vector2, piv_dst: Vector2,
		af: PackedFloat32Array, aw: int) -> Rect2i:
	var gw: int = int(g["w"])
	var gh: int = int(g["h"])
	if gw <= 0 or gh <= 0 or k <= 0.0:
		return Rect2i()
	var dw: float = float(gw) * k
	var dh: float = float(gh) * k
	var co: float = cos(ang)
	var si: float = sin(ang)

	var rel: Vector2 = esquina + Vector2(dw, dh) * 0.5 - piv
	var c: Vector2 = piv_dst + Vector2(rel.x * co - rel.y * si,
		rel.x * si + rel.y * co)

	var ext: float =(absf(dw * co) + absf(dh * si)) * 0.5 + 1.0
	var eyt: float =(absf(dw * si) + absf(dh * co)) * 0.5 + 1.0
	var x0: int = maxi(int(floor(c.x - ext)), 0)
	var x1: int = mini(int(ceil(c.x + ext)), w - 1)
	var y0: int = maxi(int(floor(c.y - eyt)), 0)
	var y1: int = mini(int(ceil(c.y + eyt)), h - 1)
	var ax: int = int(g["x"])
	var ay: int = int(g["y"])
	var gw1: float = float(gw) - 1.0
	var gh1: float = float(gh) - 1.0
	for py in range(y0, y1 + 1):
		for px in range(x0, x1 + 1):

			var rx: float = float(px) + 0.5 - c.x
			var ry: float = float(py) + 0.5 - c.y
			var ux: float = rx * co + ry * si
			var uy: float = - rx * si + ry * co
			var sx: float =(ux + dw * 0.5) / k - 0.5
			var sy: float =(uy + dh * 0.5) / k - 0.5
			if sx < -1.0 or sy < -1.0 or sx > float(gw) or sy > float(gh):
				continue

			var fx: float = clampf(sx, 0.0, gw1)
			var fy: float = clampf(sy, 0.0, gh1)
			var ix: int = int(floor(fx))
			var iy: int = int(floor(fy))
			var tx: float = fx - float(ix)
			var ty: float = fy - float(iy)
			var jx: int = mini(ix + 1, gw - 1)
			var jy: int = mini(iy + 1, gh - 1)
			var f0: int =(ay + iy) * aw + ax
			var f1: int =(ay + jy) * aw + ax
			var v: float = lerpf(lerpf(af[f0 + ix], af[f0 + jx], tx),
				lerpf(af[f1 + ix], af[f1 + jx], tx), ty)
			if v <= 0.0:
				continue
			var idx: int = py * w + px
			mask[idx] = maxf(mask[idx], v)
	if x1 < x0 or y1 < y0:
		return Rect2i()
	return Rect2i(x0, y0, x1 - x0 + 1, y1 - y0 + 1)


static func _une(a: Rect2i, b: Rect2i) -> Rect2i:
	if a.size.x <= 0 or a.size.y <= 0:
		return b
	if b.size.x <= 0 or b.size.y <= 0:
		return a
	return a.merge(b)



static var _af: Dictionary = {}









static func _atlas_f(fam: String) -> Array:
	if _af.has(fam):
		return _af[fam]
	var im: Image = _atlas[fam]["img"]
	var rf: Image = im.duplicate()
	rf.convert(Image.FORMAT_RF)
	_af[fam] = [rf.get_data().to_float32_array(), im.get_width()]
	return _af[fam]





const SOMBRA_FRAC: float = 0.15
const RELIEVE_FRAC: float = 0.09





const NUM_TRACK: Dictionary = {"compacto": 0.0, "normal": 0.09}


















static func _pintar(nom: PackedFloat32Array, num: PackedFloat32Array, w: int,
		h: int, rec: Dictionary, num_y0: int, num_y1: int, bb_nom: Rect2i = TODA,
		bb_num: Rect2i = TODA) -> Image:
	var bb_an_num: Array = [Rect2i()]
	var an_num: PackedFloat32Array = _anillo(num, w, h, _radio_borde(), bb_num, bb_an_num)
	var bb_an_nom: Array = [Rect2i()]
	var an_nom: PackedFloat32Array = _anillo(nom, w, h, _radio_borde(), bb_nom, bb_an_nom)
	return _pintar_con(nom, num, w, h, rec, num_y0, num_y1, bb_nom, bb_num, an_num,
		bb_an_num[0], an_nom, bb_an_nom[0])



const TODA: Rect2i = Rect2i(0, 0, 1<<20, 1<<20)



static func _radio_borde() -> int:
	return maxi(int(round(BORDE * RES)), 1)






static func _pintar_con(nom: PackedFloat32Array, num: PackedFloat32Array, w: int,
		h: int, rec: Dictionary, num_y0: int, num_y1: int, bb_nom: Rect2i,
		bb_num: Rect2i, anillo: PackedFloat32Array, bb_anillo: Rect2i,
		an_nom: PackedFloat32Array, bb_an_nom: Rect2i) -> Image:
	var img: Image = Image.create(w, h, false, Image.FORMAT_RGBA8)
	var tinta: Color = rec.get("tinta", Color(0.98, 0.98, 1.0))
	var halo: Color = rec.get("halo", Color(0, 0, 0, 0))
	var tinta2: Color = rec.get("tinta2", tinta)
	var relleno: String = String(rec.get("relleno", "solido"))
	var cuerpo: bool = bool(rec.get("cuerpo", true))
	var relieve: bool = bool(rec.get("relieve", false))
	var sombra: int = int(rec.get("sombra", 0))
	var claro: Color = Color(0.98, 0.98, 1.0)
	var oscuro: Color = Color(0.06, 0.07, 0.09)
	var alto_num: float = maxf(float(num_y1 - num_y0), 1.0)
	var lam: Rect2i = Rect2i(0, 0, w, h)
	var cn: Rect2i = bb_num.intersection(lam)


	if sombra > 0:
		var d: int = maxi(int(round(alto_num * SOMBRA_FRAC)), 1)
		var tono: Color = oscuro if tinta.get_luminance() > 0.5 else claro
		_capa(img, num, w, h, tono, d, d, bb_num)
	if relieve:
		var d2: int = maxi(int(round(alto_num * RELIEVE_FRAC)), 1)
		_capa(img, num, w, h, claro, - d2, - d2, bb_num)
		_capa(img, num, w, h, oscuro, d2, d2, bb_num)
	if not cuerpo:


		_capa(img, anillo, w, h, tinta, 0, 0, bb_anillo)
	else:
		if halo.a > 0.0:
			_capa(img, anillo, w, h, halo, 0, 0, bb_anillo)
		for y in range(cn.position.y, cn.end.y):



			var t: float = clampf((float(y) - float(num_y0)) / alto_num, 0.0, 1.0)
			var col: Color = tinta
			match relleno:
				"bicolor":
					if t >= 0.5:
						col = tinta2
				"rayado":
					if int(t * 5.0) % 2 == 1:
						col = tinta2
				"degradado":
					col = tinta.lerp(tinta2, t)
			for x in range(cn.position.x, cn.end.x):
				var a: float = num[y * w + x]
				if a > 0.0:
					_pixel(img, x, y, col, a)






	var borde_nom: Color = halo if halo.a > 0.0 \
			else (claro if tinta.get_luminance() < 0.5 else oscuro)
	_capa(img, an_nom, w, h, borde_nom, 0, 0, bb_an_nom)
	var cm: Rect2i = bb_nom.intersection(lam)
	for y in range(cm.position.y, cm.end.y):
		for x in range(cm.position.x, cm.end.x):
			var a2: float = nom[y * w + x]
			if a2 > 0.0:
				_pixel(img, x, y, tinta, a2)
	return img














static func _anillo(mask: PackedFloat32Array, w: int, h: int, r: int,
		bb: Rect2i = TODA, bb_out: Array = [Rect2i()]) -> PackedFloat32Array:
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(w * h)
	var cb: Rect2i = bb.intersection(Rect2i(0, 0, w, h))
	if cb.size.x <= 0 or cb.size.y <= 0:
		bb_out[0] = Rect2i()
		return out
	var bx0: int = cb.position.x
	var bx1: int = cb.end.x - 1
	var by0: int = cb.position.y
	var by1: int = cb.end.y - 1
	var ox0: int = maxi(bx0 - r, 0)
	var ox1: int = mini(bx1 + r, w - 1)
	var oy0: int = maxi(by0 - r, 0)
	var oy1: int = mini(by1 + r, h - 1)

	var tmp: PackedFloat32Array = PackedFloat32Array()
	tmp.resize(w * h)
	for y in range(by0, by1 + 1):
		var fila: int = y * w
		for x in range(ox0, ox1 + 1):
			var m: float = 0.0
			for nx in range(maxi(x - r, bx0), mini(x + r, bx1) + 1):
				m = maxf(m, mask[fila + nx])
			tmp[fila + x] = m
	for y in range(oy0, oy1 + 1):
		var fila2: int = y * w
		for x in range(ox0, ox1 + 1):
			var m2: float = 0.0
			for ny in range(maxi(y - r, by0), mini(y + r, by1) + 1):
				m2 = maxf(m2, tmp[ny * w + x])
			out[fila2 + x] = clampf(m2 - mask[fila2 + x], 0.0, 1.0)
	bb_out[0] = Rect2i(ox0, oy0, ox1 - ox0 + 1, oy1 - oy0 + 1)
	return out






static func _capa(img: Image, mask: PackedFloat32Array, w: int, h: int,
		col: Color, ox: int, oy: int, bb: Rect2i = TODA) -> void:
	var cb: Rect2i = bb.intersection(Rect2i(0, 0, w, h))
	for sy in range(cb.position.y, cb.end.y):
		var y: int = sy + oy
		if y < 0 or y >= h:
			continue
		for sx in range(cb.position.x, cb.end.x):
			var x: int = sx + ox
			if x < 0 or x >= w:
				continue
			var a: float = mask[sy * w + sx]
			if a > 0.0:
				_pixel(img, x, y, col, a)






static func _pixel(img: Image, x: int, y: int, col: Color, a: float) -> void:
	var d: Color = img.get_pixel(x, y)
	var oa: float = a + d.a *(1.0 - a)
	if oa <= 0.0:
		return
	var c: Color = Color(
		(col.r * a + d.r * d.a *(1.0 - a)) / oa,
		(col.g * a + d.g * d.a *(1.0 - a)) / oa,
		(col.b * a + d.b * d.a *(1.0 - a)) / oa, oa)
	img.set_pixel(x, y, c)






const PARTICULAS: Array[String] = ["VAN", "DER", "DEN", "DE", "DI", "DA", "DOS",
	"DEL", "LA", "LE", "MC", "O", "ST", "SAN", "BIN", "AL"]

static func apellido_de(nombre: String) -> String:
	var partes: PackedStringArray = nombre.strip_edges().to_upper().split(" ", false)
	if partes.is_empty():
		return ""
	var i: int = partes.size() - 1


	var pasos: int = 0
	while i > 0 and pasos < 2 and PARTICULAS.has(partes[i - 1]):
		i -= 1
		pasos += 1
	var out: String = ""
	for j in range(i, partes.size()):
		out +=(" " if not out.is_empty() else "") + partes[j]
	return out





static func inicio_apellido(partes: PackedStringArray) -> int:
	if partes.is_empty():
		return 0
	var i: int = partes.size() - 1
	var pasos: int = 0
	while i > 0 and pasos < 2 and PARTICULAS.has(partes[i - 1].to_upper()):
		i -= 1
		pasos += 1
	return i














static func acorta_nombre(nombre: String, tope: int) -> String:
	var limpio: String = nombre.strip_edges()
	if limpio.length() <= tope:
		return limpio
	var partes: PackedStringArray = limpio.split(" ", false)
	var corte: int = inicio_apellido(partes)
	for j in corte:
		if partes[j].length() <= 2:
			continue
		partes[j] = partes[j].substr(0, 1) + "."
		if " ".join(partes).length() <= tope:
			return " ".join(partes)
	return " ".join(partes).substr(0, tope).strip_edges()














static func receta_para(cfg: Dictionary, frame: Image, caja: Rect2) -> Dictionary:
	var media: float = -1.0
	var rango: float = 0.0
	if frame != null and caja.size.x > 0.0:
		var lo: float = 1.0
		var hi: float = 0.0
		var suma: float = 0.0
		var n: int = 0
		for y in range(int(caja.position.y), int(caja.position.y + caja.size.y)):
			for x in range(int(caja.position.x), int(caja.position.x + caja.size.x)):
				if x < 0 or y < 0 or x >= frame.get_width() \
						or y >= frame.get_height():
					continue
				var c: Color = frame.get_pixel(x, y)
				if c.a <= 0.0:
					continue
				var l: float = c.get_luminance()
				suma += l
				lo = minf(lo, l)
				hi = maxf(hi, l)
				n += 1
		if n > 0:
			media = suma / float(n)
			rango = hi - lo
	if media < 0.0:
		var kit: Color = cfg.get("kit", Color("2a4bd7"))
		media = kit.get_luminance()











		if String(cfg.get("pattern", "solid")) != "solid":
			rango = 1.0
	var rec: Dictionary = KitRecolor.dorsal_receta(cfg, media, rango)
	rec["track"] = float(NUM_TRACK.get(String(cfg.get("num_size", "compacto")), 0.0))
	rec["fuente"] = String(cfg.get("num_font", FAM_DEF))
	return rec








static func nodo(tex: Texture2D) -> Sprite3D:
	var s: Sprite3D = Sprite3D.new()
	s.texture = tex
	s.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	s.texture_filter = BaseMaterial3D.TEXTURE_FILTER_LINEAR_WITH_MIPMAPS
	s.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	s.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	s.visible = false
	return s




static func caja(anim: String, i: int) -> Rect2:
	_cargar()
	var lista: Variant = _cajas.get(anim)
	if not (lista is Array):
		return Rect2()
	var a: Array = lista
	return a[i] if i >= 0 and i < a.size() else Rect2()























static func nodo_prenda(tex: Texture2D, prenda: Sprite3D, ancho_util: float,
		centro_y: float, alto_prenda: float) -> Sprite3D:
	var s: Sprite3D = Sprite3D.new()
	s.texture = tex
	s.billboard = prenda.billboard
	s.no_depth_test = prenda.no_depth_test
	s.render_priority = prenda.render_priority + 1
	s.texture_filter = BaseMaterial3D.TEXTURE_FILTER_LINEAR_WITH_MIPMAPS
	s.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF






	s.alpha_cut = SpriteBase3D.ALPHA_CUT_DISABLED

	var k: float = ancho_util / NOMBRE_ANCHO
	s.pixel_size = prenda.pixel_size * k / float(RES)

	var sube: float =(alto_prenda * 0.5 - centro_y) * prenda.pixel_size






	s.position = Vector3(0.0, sube, 0.0)
	prenda.add_child(s)
	return s








static func caja_fichero(base: String) -> Rect2:
	_cargar()
	var b: Variant = _cajas_crudas().get(base)
	if not (b is Array) or (b as Array).size() < 4:
		return Rect2()
	var a: Array = b
	return Rect2(float(a[0]), float(a[1]), float(a[2]), float(a[3]))



static func centro(anim: String, i: int) -> float:
	_cargar()
	var lista: Variant = _centros.get(anim)
	if not (lista is Array):
		return -1.0
	var a: Array = lista
	return float(a[i]) if i >= 0 and i < a.size() else -1.0










static func centro_fichero(base: String) -> float:
	_cargar()
	var b: Variant = _cajas_crudas().get(base)
	if not (b is Array) or (b as Array).size() < 5:
		return -1.0
	return float((b as Array)[4])














static func giro_fichero(base: String) -> float:
	_cargar()
	var b: Variant = _cajas_crudas().get(base)
	if not (b is Array) or (b as Array).size() < 6:
		return 0.0
	return float((b as Array)[5])



static func giro(anim: String, i: int) -> float:
	_cargar()
	var lista: Variant = _giros.get(anim)
	if not (lista is Array):
		return 0.0
	var a: Array = lista
	return float(a[i]) if i >= 0 and i < a.size() else 0.0



static var _giros: Dictionary = {}





static var _centros: Dictionary = {}


static func build_index(anims: Array) -> void:
	_cargar()
	var crudas: Dictionary = _cajas_crudas()
	_cajas = {}
	_centros = {}
	_giros = {}
	for spec in anims:
		var d: Dictionary = spec
		var dirs: Array = ["south", "north", "east", "west"] \
				if bool(d.get("dirs", false)) else [""]
		for dir in dirs:
			var anim: String = String(d["anim"])
			if not dir.is_empty():
				anim = anim % dir
			var lista: Array = []
			var centros: Array = []
			var giros: Array = []
			var alguna: bool = false
			for i in range(int(d["from"]), int(d["to"]) + 1):
				var fichero: String =(String(d["path"]) % [dir, i]) if not dir.is_empty() \
						else (String(d["path"]) % i)
				var b: Variant = crudas.get(fichero.get_file().get_basename())
				if b is Array and (b as Array).size() >= 4:
					var arr: Array = b
					lista.append(Rect2(float(arr[0]), float(arr[1]),
						float(arr[2]), float(arr[3])))
					centros.append(float(arr[4]) if arr.size() >= 5 else -1.0)
					giros.append(float(arr[5]) if arr.size() >= 6 else 0.0)
					alguna = true
				else:
					lista.append(Rect2())
					centros.append(-1.0)
					giros.append(0.0)


			if alguna:
				_cajas[anim] = lista
				_centros[anim] = centros
				_giros[anim] = giros










static func seguir(lamina: Sprite3D, duenio: Node3D, r: Rect2, ps: float,
		cam: Camera3D, cx_playera: float = -1.0, giro_deg: float = 0.0) -> void:
	if r.size.x <= 0.0 or cam == null:
		lamina.visible = false
		return
	var m: Dictionary = metrica()
	var esc: float = clampf(r.size.x / CAJA_REF.x, ESCALA_MIN, ESCALA_MAX)



	lamina.pixel_size = ps / float(RES) * esc




	var cx_art: float =(cx_playera if cx_playera >= 0.0 \
			else r.position.x + r.size.x * 0.5) - float(LIENZO) * 0.5
	var cy_art: float = r.position.y + r.size.y * 0.5 - float(LIENZO) * 0.5


	var dy_art: float =(m["alto"] * 0.5 - m["cy"]) * esc
	var off: Vector2 = Vector2(cx_art, -(cy_art + dy_art + NUM_BAJA * esc)) * ps


	var esp: SpriteBase3D = duenio as SpriteBase3D
	if esp != null and esp.flip_h:
		off.x = - off.x
	var der: Vector3 = cam.global_transform.basis.x
	var hacia: Vector3 = cam.global_transform.basis.z * HACIA_CAM
	var pos: Vector3 = duenio.global_position \
			+ der * off.x + Vector3(0.0, off.y, 0.0) + hacia











	var quiere: int = BaseMaterial3D.BILLBOARD_DISABLED if absf(giro_deg) > 0.01 \
			else BaseMaterial3D.BILLBOARD_FIXED_Y
	if lamina.billboard != quiere:
		lamina.billboard = quiere as BaseMaterial3D.BillboardMode
	if quiere == BaseMaterial3D.BILLBOARD_DISABLED:
		var cz: Vector3 = cam.global_transform.basis.z
		cz.y = 0.0
		cz = cz.normalized() if cz.length_squared() > 1e-06 else Vector3.BACK
		var b: Basis = Basis(Vector3.UP.cross(cz).normalized(), Vector3.UP, cz)










		var signo: float = -1.0 if (esp != null and esp.flip_h) else 1.0
		lamina.global_transform = Transform3D(
			b.rotated(cz, - deg_to_rad(giro_deg) * signo), pos)
	else:
		lamina.global_position = pos
	lamina.visible = true





static func _glifo(ch: String) -> Dictionary:
	var g: Variant =(_atlas[_fam]["glifos"] as Dictionary).get(ch)
	return g if g is Dictionary else {}



static func _cap() -> float:
	return float(_atlas[_fam]["cap"])





static func _usar(fam: String) -> void:
	var f: String = fam if FAMILIAS.has(fam) else FAM_DEF
	_fam = f
	if _atlas.has(f):
		return
	var fila: Dictionary = {"img": null, "glifos": {}, "cap": 64.0}
	var tex: Texture2D = load(ATLAS_PNG % f) as Texture2D
	if tex != null:
		var img: Image = tex.get_image()

		if img != null and img.is_compressed():
			img.decompress()
		fila["img"] = img
	var raw: Variant = _json(ATLAS_JSON % f)
	if raw is Dictionary:
		var d: Dictionary = raw
		fila["cap"] = float(d.get("cap", 64))
		var gl: Variant = d.get("glifos")
		if gl is Dictionary:
			fila["glifos"] = gl
	_atlas[f] = fila


	if fila["img"] == null and f != FAM_DEF:
		_usar(FAM_DEF)


static func _cargar() -> void:
	if _cargado:
		return
	_cargado = true
	_usar(FAM_DEF)


static var _crudas: Dictionary = {}
static var _crudas_ok: bool = false





static func _cajas_crudas() -> Dictionary:
	if _crudas_ok:
		return _crudas
	_crudas_ok = true
	var raw: Variant = _json(CAJAS)
	if raw is Dictionary:
		_crudas = raw
	return _crudas


static func _json(ruta: String) -> Variant:
	if not FileAccess.file_exists(ruta):
		return null
	return JSON.parse_string(FileAccess.get_file_as_string(ruta))


static func _test_reset() -> void:
	_cargado = false
	_cache.clear()

	_hornos.clear()
	_af.clear()
	_cajas.clear()
	_crudas.clear()
	_crudas_ok = false
	_atlas.clear()
