extends RefCounted




static func paint(img: Image, mask: Dictionary, cfg: Dictionary,
		view: String, head_x: int) -> void:
	if mask.is_empty():
		return
	var top: String = str(cfg.get("street_garment", "playera"))
	var y0: int = img.get_height()
	var y1: int = -1
	for p: Vector2i in mask:
		if absi(p.x - head_x) <= 3:
			y0 = mini(y0, p.y)
			y1 = maxi(y1, p.y)
	if y1 - y0 < 7:
		return
	var side: bool = view in ["left", "right"]
	var front: bool = view != "back"
	var cx: int = head_x +(3 if view == "right" else (-3 if view == "left" else 0))


	if side:
		var left: int = img.get_width()
		var right: int = -1
		for p: Vector2i in mask:
			if p.y == y0 + 4:
				left = mini(left, p.x)
				right = maxi(right, p.x)
		if right >= left:
			cx = right - 1 if view == "right" else left + 1
	var cloth: Color = cfg.get("kit", Color("7a1226"))
	var accent: Color = cfg.get("casual_shirt2", Color("e8e6ea"))
	var seam: Color = cloth.darkened(0.38)
	var edge: Color = cloth.lightened(0.22)
	var metal: Color = Color("b4b7b9")
	for p: Vector2i in mask:
		var x: int = p.x - cx
		var y: int = p.y - y0
		var hem: int = y1 - y0
		var ink: Color = Color.TRANSPARENT
		match top:
			"playera":

				if y == hem and absi(x) <= 6:
					ink = img.get_pixelv(p).darkened(0.18)
			"polo", "camisa":
				if front:

					if y <= 3 and absi(x) == 3 - mini(y, 2):
						ink = edge
					if x == 0 and y >= 3 and (top == "camisa" or y <= 7):
						ink = edge if y % 4 == 0 else seam

					if top == "camisa" and not side and x in [3, 4, 5] and y == 7:
						ink = seam
				elif y == 3:
					ink = img.get_pixelv(p).darkened(0.16)
			"sueter":
				if (front and y <= 4 and absi(x) == 4 - y) or y >= hem - 1:
					ink = seam if p.x % 2 == 0 else edge
			"cuarto_cierre":


				if y <= 2 and absi(x) <=(3 if side else 4):
					ink = seam if p.x % 2 == 0 else edge
				elif front and x == 0 and y in range(2, 10):
					ink = metal if y in [2, 8] else seam
				elif front and y == 9 and absi(x) <= 2:
					ink = accent.darkened(0.18)
			"rugby":


				if front and y <= 3 and absi(x) == 3 - mini(y, 2):
					ink = edge
				elif front and x == 0 and y in range(3, 7):
					ink = edge if y == 3 else seam
				elif y in range(7, 11):
					ink = accent.darkened(0.1 if y in [7, 10] else 0.0)
		if ink.a > 0.0:
			img.set_pixelv(p, ink)




static func layers(img: Image, source: Image, mask: Dictionary, cfg: Dictionary,
		view: String, head_x: int, piernas: PackedByteArray = PackedByteArray()) -> void:
	if mask.is_empty():
		return
	var top_y: int = img.get_height()
	var hem_y: int = -1
	for p: Vector2i in mask:
		if absi(p.x - head_x) <= 3:
			top_y = mini(top_y, p.y)
			hem_y = maxi(hem_y, p.y)
	if hem_y - top_y < 7:
		return
	var left: int = img.get_width()
	var right: int = -1
	for p: Vector2i in mask:
		if p.y >= hem_y - 2 and p.y <= hem_y and absi(p.x - head_x) <= 9:
			left = mini(left, p.x)
			right = maxi(right, p.x)
	if right - left < 3:
		return
	var center: int =(left + right) / 2
	var side: bool = view in ["left", "right"]
	var front: bool = view != "back"
	var opening: int = center
	if side:
		opening = right - 1 if view == "right" else left + 1
	var outer: String = str(cfg.get("street_outer", "none"))
	var is_open: bool = str(cfg.get("casual_outer_state", "abierta")) != "cerrada"
	var col: Color = cfg.get("casual_outer_color", Color("e8e6ea"))
	var seam: Color = col.darkened(0.42)
	var light: Color = col.lightened(0.2)
	if outer != "none":
		for p: Vector2i in mask:
			var x: int = p.x - opening
			var y: int = p.y - top_y
			var h: int = hem_y - top_y
			var shade: float = clampf(source.get_pixelv(p).v / 0.98, 0.42, 1.0)
			var ink: Color = col * Color(shade, shade, shade, 1.0)

			if outer == "chaleco" and (p.x < left + 1 or p.x > right - 1):
				continue

			if front and is_open and absi(x) <=(1 if side else 2):
				continue
			if front and is_open and absi(x) ==(2 if side else 3):
				ink = seam

			if front and outer in ["abrigo", "blazer", "gabardina"] and y <= 6 and absi(x) == 6 - mini(y, 3):
				ink = light
			if outer == "chaleco" and y > 4 and y % 4 == 0:
				ink = seam
			if outer == "hoodie":
				if front and absi(x) == 2 and y >= 2 and y <= 5:
					ink = Color("ded8ca")
				if front and y >= h - 5 and y <= h - 2 and (absi(x) == 4 or (y == h - 2 and absi(x) < 4)):
					ink = seam
			if outer in ["chamarra", "abrigo"] and front and absi(x) in [5, 6] and y == h - 3:
				ink = seam
			match outer:
				"varsity":

					if absi(p.x - center) >=(4 if side else 6):
						ink =(cfg.get("casual_shirt2", Color("e2d6b8")) as Color).darkened(0.12 if p.x < center else 0.03)
					if y <= 1 or y >= h - 1: ink = light if y % 2 else seam
					if view == "front" and x in [-5, -4] and y in [4, 5, 6]: ink = Color("dfd3b4")
				"acolchada":
					if y % 4 == 0: ink = col.darkened(0.27)
					elif y % 4 == 1: ink = col.lightened(0.1)
				"gabardina":
					if y == h - 2: ink = seam
					if front and absi(x) == 3 and y in [7, 11]: ink = Color("bcb29e")
				"bomber":
					if y <= 2 or y >= h - 2:
						ink = seam if p.x % 2 == 0 else col.darkened(0.18)
					if side and y in [6, 7] and p.x == center:
						ink = light
				"mezclilla":
					if y == 4 or (front and absi(x) in [4, 5, 6] and y in [6, 9]):
						ink = light
					if front and absi(x) == 5 and y == 7:
						ink = seam
				"cuero":
					if front and x == 4 - mini(y / 3, 4):
						ink = Color("b6b8ba")
					elif absi(x) >= 5:
						ink = col.darkened(0.35)
				"rompevientos":
					if y >= 4 and y <= 6:
						ink = col.lightened(0.36)
					if y == 7:
						ink = seam
				"blazer":
					if front and y <= 7 and absi(x) == maxi(3, 6 - y / 2):
						ink = seam
					if front and x in [4, 5, 6] and y == 8:
						ink = light
				"sobrecamisa":


					if y <= 3 and absi(x) == 4 - mini(y, 2):
						ink = light
					if front and y in range(6, 10) and absi(x) in [4, 5, 6]:


						ink = seam if y in [6, 9] else col.darkened(0.16)
					if front and x == 0 and y % 4 == 0:
						ink = light
				"parka":


					if y in [4, 5]:
						ink = col.lightened(0.24) if y == 4 else seam
					if y == h - 4:
						ink = seam
					if front and y in range(h - 8, h - 4) and absi(x) in [4, 5, 6]:
						ink = col.darkened(0.24)
			if front and not is_open and x == 0:
				ink = light if y % 4 == 0 else seam
			if y == h and outer != "abrigo":
				ink = seam
			img.set_pixelv(p, ink)
		if outer in ["abrigo", "gabardina", "parka"]:


			var length: int = 12 if outer == "gabardina" else (11 if outer == "parka" else 9)
			for y in range(hem_y + 1, mini(hem_y + length + 1, img.get_height())):
				var flare: int = 1 if y > hem_y + 4 else 0
				for x in range(maxi(0, left - flare), mini(img.get_width(), right + flare + 1)):
					if front and is_open and absi(x - opening) <=(0 if side else 1):
						continue







					if piernas.is_empty():
						if absi(x - center) >(5 if side else 7) and _near_hand(source, Vector2i(x, y)):
							continue
					elif _es_mano(source, Vector2i(x, y), piernas):
						continue
					var border: bool = x == left - flare or x == right + flare or y == hem_y + length
					var ink: Color = seam if border else col.darkened(0.12 if x < center else 0.23)
					if front and absi(x - opening) ==(1 if side else 2):
						ink = seam
					img.set_pixel(x, y, ink)

	if front and str(cfg.get("acc_neck", "none")) in ["cadena", "dije"]:
		var metal: Color = cfg.get("acc_metal", Color("d7b76d"))


		var neck_y: int = top_y
		while neck_y < hem_y and not mask.has(Vector2i(opening, neck_y)):
			neck_y += 1
		for dx in range(-3, 4):
			var point: Vector2i = Vector2i(opening + dx, neck_y + 1 - absi(dx) / 2)
			if mask.has(point):
				img.set_pixelv(point, metal)
		if str(cfg.get("acc_neck", "none")) == "dije":
			for dy in range(2, 5):
				var p: Vector2i = Vector2i(opening, neck_y + dy)
				if mask.has(p):
					img.set_pixelv(p, metal)
			for dx in [-1, 1]:
				var p: Vector2i = Vector2i(opening + dx, neck_y + 3)
				if mask.has(p):
					img.set_pixelv(p, metal)
	_pants(img, source, cfg, hem_y, left, right)






static func _es_mano(source: Image, p: Vector2i, piernas: PackedByteArray) -> bool:
	var c: Color = source.get_pixelv(p)
	if c.a > 0.5 and KitRecolor._is_skin(c.h * 360.0, c):
		return piernas[p.y * source.get_width() + p.x] != 1
	if c.a > 0.5 and c.v >= 0.3:
		return false
	return _near_hand(source, p, piernas)




static func _near_hand(source: Image, point: Vector2i,
		piernas: PackedByteArray = PackedByteArray()) -> bool:
	for dy in range(-1, 2):
		for dx in range(-1, 2):
			var q: Vector2i = point + Vector2i(dx, dy)
			if q.x < 0 or q.y < 0 or q.x >= source.get_width() or q.y >= source.get_height():
				continue
			if not piernas.is_empty() and piernas[q.y * source.get_width() + q.x] == 1:
				continue
			var c: Color = source.get_pixelv(q)
			if c.a > 0.5 and KitRecolor._is_skin(c.h * 360.0, c):
				return true
	return false


static func _pants(img: Image, source: Image, cfg: Dictionary, hem: int, left: int, right: int) -> void:
	var style: String = str(cfg.get("casual_pants_style", "recto"))
	if style == "recto" or str(cfg.get("street_outer", "none")) in ["abrigo", "gabardina", "parka"]:
		return
	var col: Color = cfg.get("casual_pants", Color("393b40"))
	var stitch: Color = col.lightened(0.2)
	var seam: Color = col.darkened(0.3)


	var waist: int = img.get_height()
	for y in range(hem + 1, mini(hem + 11, img.get_height())):
		for x in range(maxi(left, 0), mini(right + 1, img.get_width())):
			var c: Color = source.get_pixel(x, y)
			if c.a > 0.5 and c.s < 0.18 and c.v > 0.5:
				waist = mini(waist, y)
	for y in range(hem + 1, mini(hem + 11, img.get_height())):
		for x in range(maxi(left, 0), mini(right + 1, img.get_width())):
			var p: Vector2i = Vector2i(x, y)
			var c: Color = source.get_pixelv(p)

			if c.a < 0.5 or c.s >= 0.18 or c.v <= 0.5:
				continue
			var edge: bool = x <= left + 2 or x >= right - 2
			match style:
				"pinzas":
					if x in [left + 3, right - 3]: img.set_pixelv(p, seam)
					if y == waist + 1 and x in [left + 4, right - 4]: img.set_pixelv(p, stitch)
				"pants":
					if x in [left + 1, right - 1]: img.set_pixelv(p, Color("deddd5"))
					if y == waist and absi(x -(left + right) / 2) <= 1: img.set_pixelv(p, stitch)
				"jeans", "short_denim":
					if (y == hem + 1 or (edge and y <= hem + 4)):
						img.set_pixelv(p, stitch)
				"cargo", "short_cargo":
					if edge and y >= hem + 4 and y <= hem + 7:
						img.set_pixelv(p, seam if y in [hem + 4, hem + 7] else col.lightened(0.08))
				"chinos", "short_chino":
					if edge and y <= waist + 3:
						img.set_pixelv(p, seam)
				"ancho":
					if y == waist + 1:
						img.set_pixelv(p, stitch)
				"vestir":
					if x in [left + 3, right - 3]:
						img.set_pixelv(p, stitch)
				"deportivo":
					if edge:
						img.set_pixelv(p, stitch)
					elif y == waist:
						img.set_pixelv(p, seam)
				"bano":
					img.set_pixelv(p, stitch if (x + y * 2) % 6 < 2 else col)
				"jogger":
					if y <= waist + 1:
						img.set_pixelv(p, seam)
				"barril":
					if y == waist + 1:
						img.set_pixelv(p, stitch)
					elif edge and y >= waist + 3:
						img.set_pixelv(p, seam)
				"tecnico":
					if edge and y in range(waist + 2, waist + 7):
						img.set_pixelv(p, seam if y in [waist + 2, waist + 6] else col.lightened(0.09))
					elif y == waist or (y == waist + 8 and p.x % 2 == 0):
						img.set_pixelv(p, stitch)


static func earrings(img: Image, cfg: Dictionary, view: String, face: Rect2i, ear_points: Array[Vector2i] = []) -> void:
	var style: String = str(cfg.get("acc_ear", "none"))
	if style == "none" or view == "back" or face.size.x <= 0:
		return
	var metal: Color = cfg.get("acc_metal", Color("d7b76d"))
	var ears: Array[int] = [face.position.x - 1, face.end.x]
	if view == "right":
		ears = [face.position.x - 1]
	elif view == "left":
		ears = [face.end.x]
	if ear_points.is_empty():
		for x in ears: ear_points.append(Vector2i(x, face.end.y - 3))
	for anchor in ear_points:
		var x: int = anchor.x
		var y: int = anchor.y
		var points: Array[Vector2i] = [Vector2i.ZERO]
		match style:
			"hoop": points.assign([Vector2i(0, 0), Vector2i(0, 1)])
			"diamante": points.assign([Vector2i(0, 0), Vector2i(-1, 1), Vector2i(1, 1), Vector2i(0, 2)])
			"doble_aro": points.assign([Vector2i(0, -2), Vector2i(0, -1), Vector2i(1, 1), Vector2i(1, 2)])
			"colgante": points.assign([Vector2i(0, 0), Vector2i(0, 1), Vector2i(0, 2), Vector2i(-1, 3), Vector2i(1, 3), Vector2i(0, 4)])
			"ear_cuff": points.assign([Vector2i(0, -3), Vector2i(-1, -2), Vector2i(0, -1)])
		for offset in points:
			var side: int = -1 if x < face.get_center().x else 1
			var p: Vector2i = Vector2i(x, y) + Vector2i(offset.x * side, offset.y)
			if p.x >= 0 and p.x < img.get_width() and p.y >= 0 and p.y < img.get_height():
				img.set_pixelv(p, Color("e8f5ff") if style == "diamante" else metal)
