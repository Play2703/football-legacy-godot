class_name ModularPlacement
extends RefCounted


const PIVOT = Vector2(45, 27)
static func place(source: Image, pose: Dictionary, size: Vector2i = Vector2i(92, 92)) -> Image:
	var out = Image.create(size.x, size.y, false, Image.FORMAT_RGBA8)
	var delta = pose.get("offset", [0, 0])
	var scale_xy = pose.get("scale", [1, 1])
	var angle = deg_to_rad(float(pose.get("angle", 0)))
	var transform = Transform2D(angle, Vector2(scale_xy[0], scale_xy[1]), 0, Vector2.ZERO)
	transform.origin = PIVOT + Vector2(delta[0], delta[1]) - transform * PIVOT



































	var dxf: float = float(delta[0])
	var dyf: float = float(delta[1])
	if angle == 0.0 \
			and float(scale_xy[0]) == 1.0 and float(scale_xy[1]) == 1.0 \
			and dxf == floorf(dxf) and dyf == floorf(dyf) \
			and source.get_format() == Image.FORMAT_RGBA8:
		var dx: int = int(dxf)
		var dy: int = int(dyf)



		var x0: int = maxi(0, dx)
		var y0: int = maxi(0, dy)
		var w: int = mini(size.x, dx + source.get_width()) - x0
		var h: int = mini(size.y, dy + source.get_height()) - y0
		if w > 0 and h > 0:
			out.blit_rect(source, Rect2i(x0 - dx, y0 - dy, w, h), Vector2i(x0, y0))


		return out
	var inverse = transform.affine_inverse()
























	if source.get_format() == Image.FORMAT_RGBA8:
		var inv: Transform2D = inverse
		var sw: int = source.get_width()
		var sh: int = source.get_height()
		var ancho: int = size.x
		var dst: PackedInt32Array = PackedInt32Array()
		dst.resize(size.x * size.y)
		dst.fill(0)
		var zona: Rect2i = _zona_girada(transform, _caja_con_bytes(source), size)
		if zona.size.x > 0 and zona.size.y > 0:
			var src: PackedInt32Array = source.get_data().to_int32_array()
			for y in range(zona.position.y, zona.end.y):
				var fila: int = y * ancho
				for x in range(zona.position.x, zona.end.x):
					var q: Vector2 =(inv * Vector2(x, y)).round()
					if q.x >= 0 and q.y >= 0 and q.x < sw and q.y < sh:
						dst[fila + x] = src[int(q.y) * sw + int(q.x)]
		return Image.create_from_data(size.x, size.y, false, Image.FORMAT_RGBA8,
			dst.to_byte_array())
	for y in size.y:
		for x in size.x:
			var p =(inverse * Vector2(x, y)).round()
			if p.x >= 0 and p.y >= 0 and p.x < source.get_width() and p.y < source.get_height():
				out.set_pixel(x, y, source.get_pixelv(Vector2i(p)))
	return out








static func _caja_con_bytes(source: Image) -> Rect2i:
	var usada: Rect2i = source.get_used_rect()
	var resto: Image = source.duplicate()
	resto.fill_rect(usada, Color(0, 0, 0, 0))
	var datos: PackedByteArray = resto.get_data()
	var ceros: PackedByteArray = PackedByteArray()
	ceros.resize(datos.size())
	ceros.fill(0)
	if datos == ceros:
		return usada
	return Rect2i(Vector2i.ZERO, source.get_size())








static func _zona_girada(transform: Transform2D, caja: Rect2i, size: Vector2i) -> Rect2i:
	if caja.size.x <= 0 or caja.size.y <= 0:
		return Rect2i()
	var a: Vector2 = Vector2(caja.position) - Vector2(0.5, 0.5)
	var b: Vector2 = Vector2(caja.end) - Vector2(0.5, 0.5)
	var lo: Vector2 = Vector2(INF, INF)
	var hi: Vector2 = Vector2(- INF, - INF)
	for e: Vector2 in [a, Vector2(b.x, a.y), Vector2(a.x, b.y), b]:
		var t: Vector2 = transform * e
		lo = lo.min(t)
		hi = hi.max(t)
	var x0: int = maxi(0, floori(lo.x) - 2)
	var y0: int = maxi(0, floori(lo.y) - 2)
	var x1: int = mini(size.x, ceili(hi.x) + 3)
	var y1: int = mini(size.y, ceili(hi.y) + 3)
	if x1 <= x0 or y1 <= y0:
		return Rect2i()
	return Rect2i(x0, y0, x1 - x0, y1 - y0)









































static func sin_sueltos(out: Image, source: Image, pose: Dictionary, contorno: Color) -> Dictionary:
	var scale_xy = pose.get("scale", [1, 1])
	var angle = deg_to_rad(float(pose.get("angle", 0)))

	var borrados: Dictionary = {}
	if angle == 0.0 and float(scale_xy[0]) == 1.0 and float(scale_xy[1]) == 1.0:
		return borrados
	var delta = pose.get("offset", [0, 0])
	var transform = Transform2D(angle, Vector2(scale_xy[0], scale_xy[1]), 0, Vector2.ZERO)
	transform.origin = PIVOT + Vector2(delta[0], delta[1]) - transform * PIVOT
	var inverse = transform.affine_inverse()










	var w: int = out.get_width()
	var h: int = out.get_height()
	var sw: int = source.get_width()
	var sh: int = source.get_height()
	var antes: PackedInt32Array = _enteros(out)
	var ahora: PackedInt32Array = antes.duplicate()
	var src: PackedInt32Array = _enteros(source)
	var negro_rgb: int = contorno.r8|(contorno.g8<<8)|(contorno.b8<<16)
	var caja: Rect2i = out.get_used_rect()
	for y in range(caja.position.y, caja.end.y):
		for x in range(caja.position.x, caja.end.x):
			var t: int = _suelto_n(antes, w, h, x, y, negro_rgb)
			if t == 0:
				continue
			var q: Vector2i = Vector2i((inverse * Vector2(x, y)).round())


			if q.x < 0 or q.y < 0 or q.x >= sw or q.y >= sh or (src[q.y * sw + q.x]&_ALFA) == 0:
				continue
			var s: int = _suelto_n(src, sw, sh, q.x, q.y, negro_rgb)
			var negro: bool =(antes[y * w + x]&16777215) == negro_rgb
			var flota: bool
			if s == 0 and negro:
				flota = false
			elif (s == 0 and not negro) or (s == 2 and t == 1):
				flota = true
			else:
				continue

			borrados[Vector2i(x, y)] = [out.get_pixel(x, y), flota]
			ahora[y * w + x] = 0
			out.set_pixel(x, y, Color(0, 0, 0, 0))








	for y in range(caja.position.y, caja.end.y):
		for x in range(caja.position.x, caja.end.x):
			if not _aislado_n(ahora, w, h, x, y) or _aislado_n(antes, w, h, x, y):
				continue
			var q2: Vector2i = Vector2i((inverse * Vector2(x, y)).round())
			if q2.x < 0 or q2.y < 0 or q2.x >= sw or q2.y >= sh \
					or (src[q2.y * sw + q2.x]&_ALFA) == 0 or _aislado_n(src, sw, sh, q2.x, q2.y):
				continue
			borrados[Vector2i(x, y)] = [out.get_pixel(x, y), true]
			ahora[y * w + x] = 0
			out.set_pixel(x, y, Color(0, 0, 0, 0))
	return borrados



const _ALFA: int = 4278190080



static func _enteros(img: Image) -> PackedInt32Array:
	if img.get_format() == Image.FORMAT_RGBA8:
		return img.get_data().to_int32_array()
	var copia: Image = img.duplicate()
	copia.convert(Image.FORMAT_RGBA8)
	return copia.get_data().to_int32_array()






static func _suelto_n(px: PackedInt32Array, w: int, h: int, x: int, y: int, negro_rgb: int) -> int:
	if x < 0 or y < 0 or x >= w or y >= h:
		return 0
	var c: int = px[y * w + x]
	if (c&_ALFA) == 0:
		return 0
	var es_contorno: bool =(c&16777215) == negro_rgb
	var opacos: int = 0
	for py in range(maxi(y - 1, 0), mini(y + 2, h)):
		for qx in range(maxi(x - 1, 0), mini(x + 2, w)):
			if qx == x and py == y:
				continue
			var v: int = px[py * w + qx]
			if (v&_ALFA) == 0:
				continue
			if not es_contorno or (v&16777215) != negro_rgb:
				return 0
			opacos += 1
	return 1 if opacos == 0 else 2



static func _aislado_n(px: PackedInt32Array, w: int, h: int, x: int, y: int) -> bool:
	if (px[y * w + x]&_ALFA) == 0:
		return false
	for py in range(maxi(y - 1, 0), mini(y + 2, h)):
		for qx in range(maxi(x - 1, 0), mini(x + 2, w)):
			if (qx != x or py != y) and (px[py * w + qx]&_ALFA) != 0:
				return false
	return true
























const ZURCIDO_MAX: int = 4
static func zurce(out: Image, source: Image, pose: Dictionary, minimo: int = 2) -> Dictionary:
	var cosidos: Dictionary = {}
	var scale_xy = pose.get("scale", [1, 1])
	var angle = deg_to_rad(float(pose.get("angle", 0)))
	if angle == 0.0 and float(scale_xy[0]) == 1.0 and float(scale_xy[1]) == 1.0:
		return cosidos
	var delta = pose.get("offset", [0, 0])
	var transform = Transform2D(angle, Vector2(scale_xy[0], scale_xy[1]), 0, Vector2.ZERO)
	transform.origin = PIVOT + Vector2(delta[0], delta[1]) - transform * PIVOT
	var inverse = transform.affine_inverse()
	var mancha: Dictionary = _manchas(source)

	var de_mancha: Dictionary = {}
	for q: Vector2i in mancha:
		if not de_mancha.has(mancha[q]):
			de_mancha[mancha[q]] = []
		de_mancha[mancha[q]].append(q)




	for _vuelta in 8:
		var trozo: Dictionary = _manchas(out)
		var tam: Dictionary = {}
		var por_mancha: Dictionary = {}
		for p: Vector2i in trozo:
			tam[trozo[p]] = int(tam.get(trozo[p], 0)) + 1
			var q: Vector2i = Vector2i((inverse * Vector2(p)).round())
			if not mancha.has(q):
				continue
			if not por_mancha.has(mancha[q]):
				por_mancha[mancha[q]] = {}
			por_mancha[mancha[q]][trozo[p]] = true
		var cosio: bool = false
		for m in por_mancha:
			var ts: Array =(por_mancha[m] as Dictionary).keys()
			if ts.size() < 2:
				continue
			var mayor: int = ts[0]
			for t in ts:
				if int(tam[t]) > int(tam[mayor]):
					mayor = t
			for t in ts:
				if t == mayor or int(tam[t]) < minimo:
					continue
				var camino: Array = _camino(out, trozo, t, ts, de_mancha[m], inverse)
				for g: Vector2i in camino:
					var c: Color = source.get_pixelv(_cercano(de_mancha[m], inverse * Vector2(g)))
					out.set_pixelv(g, c)
					cosidos[g] = c
				if not camino.is_empty():
					cosio = true
		if not cosio:
			break
	return cosidos










static func _camino(out: Image, trozo: Dictionary, t: int, ts: Array, fuente: Array,
		inverse: Transform2D) -> Array:
	var w: int = out.get_width()
	var h: int = out.get_height()
	var otros: Dictionary = {}
	for x in ts:
		if x != t:
			otros[x] = true

	var mejor: Dictionary = {}
	var frente: Array = []
	for p: Vector2i in trozo:
		if trozo[p] != t:
			continue
		for d in _OCHO:
			var g: Vector2i = p + d
			if g.x < 0 or g.y < 0 or g.x >= w or g.y >= h or out.get_pixelv(g).a > 0.0:
				continue
			var coste: float = _lejos(fuente, inverse * Vector2(g))
			if not mejor.has(g) or float(mejor[g][0]) > coste:
				mejor[g] = [coste, [g]]
				if not frente.has(g):
					frente.append(g)

	var reserva: Array = []
	var reserva_coste: float = INF
	for _paso in ZURCIDO_MAX:


		var fin: Array = []
		var fin_coste: float = INF
		for g: Vector2i in frente:
			for d in _OCHO:
				var v: Vector2i = g + d
				if trozo.has(v) and otros.has(trozo[v]):
					var coste: float = float(mejor[g][0])
					if not _encierra(out, mejor[g][1]):
						if coste < fin_coste:
							fin_coste = coste
							fin = mejor[g][1]
					elif reserva.is_empty() and coste < reserva_coste:
						reserva_coste = coste
						reserva = mejor[g][1]
					break
		if not fin.is_empty():
			return fin
		var siguiente: Array = []
		var nuevo: Dictionary = {}
		for g: Vector2i in frente:
			for d in _OCHO:
				var v: Vector2i = g + d
				if v.x < 0 or v.y < 0 or v.x >= w or v.y >= h or out.get_pixelv(v).a > 0.0 \
						or mejor.has(v):
					continue
				var coste: float = float(mejor[g][0]) + _lejos(fuente, inverse * Vector2(v))
				if not nuevo.has(v) or float(nuevo[v][0]) > coste:
					nuevo[v] = [coste,(mejor[g][1] as Array) + [v]]
		for v in nuevo:
			mejor[v] = nuevo[v]
			siguiente.append(v)
		frente = siguiente
	return reserva




static func _encierra(out: Image, camino: Array) -> bool:
	var w: int = out.get_width()
	var h: int = out.get_height()
	var cuatro: Array[Vector2i] = [Vector2i(1, 0), Vector2i(-1, 0), Vector2i(0, 1), Vector2i(0, -1)]
	for g: Vector2i in camino:
		for d in cuatro:
			var e: Vector2i = g + d
			if e.x < 0 or e.y < 0 or e.x >= w or e.y >= h or out.get_pixelv(e).a > 0.0 \
					or camino.has(e):
				continue
			var cerrado: bool = true
			for d2 in cuatro:
				var v: Vector2i = e + d2
				if v.x < 0 or v.y < 0 or v.x >= w or v.y >= h \
						or (out.get_pixelv(v).a <= 0.0 and not camino.has(v)):
					cerrado = false
					break
			if cerrado:
				return true
	return false


const _OCHO: Array[Vector2i] = [Vector2i(-1, -1), Vector2i(0, -1), Vector2i(1, -1), Vector2i(-1, 0),
	Vector2i(1, 0), Vector2i(-1, 1), Vector2i(0, 1), Vector2i(1, 1)]


static func _cercano(fuente: Array, p: Vector2) -> Vector2i:
	var mejor: Vector2i = fuente[0]
	var d: float = INF
	for q: Vector2i in fuente:
		var e: float = p.distance_squared_to(Vector2(q))
		if e < d:
			d = e
			mejor = q
	return mejor


static func _lejos(fuente: Array, p: Vector2) -> float:
	return p.distance_to(Vector2(_cercano(fuente, p)))



static func _manchas(img: Image) -> Dictionary:
	var r: Dictionary = {}
	var caja: Rect2i = img.get_used_rect()
	var n: int = 0
	for y in range(caja.position.y, caja.end.y):
		for x in range(caja.position.x, caja.end.x):
			var p := Vector2i(x, y)
			if r.has(p) or img.get_pixelv(p).a <= 0.0:
				continue
			r[p] = n
			var pila: Array[Vector2i] = [p]
			while not pila.is_empty():
				var c: Vector2i = pila.pop_back()
				for d in _OCHO:
					var v: Vector2i = c + d
					if r.has(v) or not caja.has_point(v) or img.get_pixelv(v).a <= 0.0:
						continue
					r[v] = n
					pila.append(v)
			n += 1
	return r
