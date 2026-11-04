extends RefCounted



static func _put(img: Image, p: Vector2i, color: Color) -> void:
	if p.x >= 0 and p.y >= 0 and p.x < img.get_width() and p.y < img.get_height():
		img.set_pixelv(p, color)

static func _torso(mask: Dictionary, center: int) -> Rect2i:
	var y0: int = 999
	var y1: int = -1
	for p: Vector2i in mask:
		if absi(p.x - center) <= 3:
			y0 = mini(y0, p.y)
			y1 = maxi(y1, p.y)
	var x0: int = 999
	var x1: int = -1
	for p: Vector2i in mask:
		if p.y >= y1 - 2 and absi(p.x - center) <= 9:
			x0 = mini(x0, p.x)
			x1 = maxi(x1, p.x)
	return Rect2i(x0, y0, x1 - x0 + 1, y1 - y0 + 1) if x1 > x0 and y1 > y0 else Rect2i()

static func base_garments(img: Image, source: Image, mask: Dictionary, cfg: Dictionary,
		view: String, head: Vector2i, face: Rect2i) -> void:
	var box: Rect2i = _torso(mask, head.x)
	if box.size.x <= 0:
		return
	var top: String = str(cfg.get("street_garment", "playera"))
	var outer: String = str(cfg.get("street_outer", "none"))
	var cloth: Color = cfg.get("casual_shirt", Color("e8e6ea"))
	var inner: Color = cfg.get("casual_shirt2", Color("e8e6ea"))
	var skin: Color = cfg.get("skin", KitRecolor.REF_SKIN)
	var cx: int = box.get_center().x
	var front: bool = view != "back"
	var profile: bool = view in ["right", "left"]
	if view == "right":
		cx = box.end.x - 2
	elif view == "left":
		cx = box.position.x + 1



	for y in range(maxi(face.end.y, box.position.y - 2), box.end.y - 2):
		for x in range(maxi(0, box.position.x - 4), mini(img.get_width(), box.end.x + 4)):
			var p := Vector2i(x, y)
			var c: Color = source.get_pixelv(p)
			var near_neck: bool = absi(x - cx) <= 5 and y <= box.position.y + 3
			var near_cuff: bool =(x < box.position.x or x >= box.end.x) and y <= box.position.y + int(box.size.y * 0.72)
			if not near_neck and not near_cuff:
				continue



			if c.a < 0.5 or c.s > 0.18 or c.v < 0.82:
				continue
			if top == "sin_mangas" and (x < box.position.x or x >= box.end.x):
				img.set_pixelv(p, skin.darkened(0.17))
			else:
				img.set_pixelv(p, cloth.darkened(0.1 if x < cx else 0.16))
	for p: Vector2i in mask:
		var dx: int = p.x - cx
		var y: int = p.y - box.position.y
		if top == "sin_mangas" and (p.x <= box.position.x or p.x >= box.end.x - 1):
			img.set_pixelv(p, skin.darkened(0.13 if p.x < cx else 0.25))
		elif top == "camisa_abierta" and front:
			if absi(dx) <=(1 if profile else 3):
				img.set_pixelv(p, inner.darkened(0.08))
			elif absi(dx) ==(2 if profile else 4):
				img.set_pixelv(p, cloth.darkened(0.4))
			elif y <= 5 and absi(dx) == 7 - y:
				img.set_pixelv(p, cloth.lightened(0.22))
		elif top == "cuello_alto" and y <= 3:
			img.set_pixelv(p, cloth.darkened(0.25 if p.x % 2 == 0 else 0.1))


	if top == "cuello_alto":
		for y in range(maxi(face.end.y, box.position.y - 2), box.end.y - 3):
			for x in range(maxi(0, box.position.x - 4), mini(img.get_width(), box.end.x + 4)):
				var p: Vector2i = Vector2i(x, y)
				var c: Color = source.get_pixelv(p)
				if c.a < 0.5:
					continue
				if absi(x - cx) <= 4 and y <= box.position.y + 3:
					img.set_pixelv(p, cloth.darkened(0.18))



	if top == "oversize" and outer == "none":
		var extra: int = 3
		for y in range(box.end.y - 2, box.end.y + extra):
			var inset: int = 1 if y == box.end.y + extra - 1 else 0
			for x in range(box.position.x - 1 + inset, box.end.x + 1 - inset):
				var p: Vector2i = Vector2i(x, y)
				if KitRecolor.CASUAL_TAILORING._near_hand(source, p):
					continue
				_put(img, p, cloth.darkened(0.35 if y == box.end.y + extra - 1 else 0.12))

		for p: Vector2i in mask:
			if p.y < box.position.y + 8:
				for dx in [-1, 1]:
					var q: Vector2i = p + Vector2i(dx, 0)
					if q.x >= 0 and q.x < img.get_width() and source.get_pixelv(q).a < 0.5:


						_put(img, q, cloth.darkened(0.62))
						if source.get_pixelv(p).v < 0.22:
							_put(img, p, cloth.darkened(0.22))
	_wide_pants(img, source, cfg, box)
	_leg_details(img, source, cfg, box)

static func _leg_details(img: Image, source: Image, cfg: Dictionary, box: Rect2i) -> void:
	if str(cfg.get("casual_pants_style", "recto")) != "tecnico":
		return
	var col: Color = cfg.get("casual_pants", Color("35445a"))
	var bb: Rect2i = KitRecolor._body_rect(source)
	var top: int = box.end.y + 7
	var bottom: int = bb.end.y - 8
	if bottom - top < 6:
		return
	var knee: int = top + int((bottom - top) * 0.58)


	for y in range(knee - 2, knee + 3):
		for x in range(bb.position.x, bb.end.x):
			var p := Vector2i(x, y)
			if absi(x - box.get_center().x) > 10 or source.get_pixelv(p).a < 0.5:
				continue
			var visible: Color = img.get_pixelv(p)
			if visible.a < 0.5 or visible.v < 0.12:
				continue
			img.set_pixelv(p, col.lightened(0.15) if y in [knee - 2, knee + 2] else col.darkened(0.12))

static func _wide_pants(img: Image, source: Image, cfg: Dictionary, box: Rect2i) -> void:
	var style: String = str(cfg.get("casual_pants_style", "recto"))
	if style not in ["ancho", "barril"]:
		return
	var col: Color = cfg.get("casual_pants", Color("35445a"))
	var bb: Rect2i = KitRecolor._body_rect(source)
	var limit: int = bb.end.y - 6
	if str(cfg.get("casual_pants_len", "largo")) == "corto":
		limit = box.end.y + 9
	var before: Image = img.duplicate()
	var outline: Color = col.darkened(0.62)
	var center: int = box.get_center().x
	for y in range(box.end.y + 4, limit):
		var progress: float = float(y - box.end.y - 4) / maxf(1.0, float(limit - box.end.y - 4))


		if style == "barril" and progress > 0.72:
			continue
		for x in range(1, img.get_width() - 1):



			if absi(x - center) > 10:
				continue
			var c: Color = source.get_pixel(x, y)
			if c.a < 0.5:
				continue
			for dx in [-1, 1]:
				var q: Vector2i = Vector2i(x + dx, y)
				if before.get_pixelv(q).a < 0.5:


					img.set_pixelv(q, outline)
					if source.get_pixelv(Vector2i(x, y)).v < 0.22:
						img.set_pixel(x, y, col.darkened(0.22))

static func shoes(img: Image, source: Image, mask: Dictionary, cfg: Dictionary) -> void:
	if mask.is_empty():
		return
	var style: String = str(cfg.get("casual_shoes", "bajos"))
	var col: Color = cfg.get("casual_shoes_color", Color("20242a"))
	var skin: Color = cfg.get("skin", KitRecolor.REF_SKIN)
	var sole: Color = Color("d9d9d4") if style in ["bajos", "altos", "running", "gruesos"] else (Color("b89c76") if style == "retro" else col.darkened(0.55))
	var bottom: Dictionary = {}
	var top: Dictionary = {}
	for p: Vector2i in mask:
		bottom[p.x] = maxi(bottom.get(p.x, -1), p.y)
		top[p.x] = mini(top.get(p.x, 999), p.y)
	for p: Vector2i in mask:
		var c: Color = col
		if p.y == bottom[p.x]:
			c = sole
		elif style in ["sandalias", "slides"]:
			c = col if p.y == top[p.x] + 1 or (style == "slides" and p.y == top[p.x]) else skin.darkened(0.15)
		elif style == "mocasines":
			c = col.lightened(0.23) if p.y == top[p.x] + 1 else col.darkened(0.2)
		elif style == "oxford":
			c = col.lightened(0.35) if p.y == top[p.x] + 2 else col.darkened(0.15)
		elif style == "charol":
			c = Color("b6bec8") if p.y == top[p.x] + 1 and p.x % 3 != 0 else col.darkened(0.25)
		elif style == "retro":
			c = Color("e5d9c0") if p.x % 4 < 2 else col
		elif style == "running":
			c = Color("99b8be") if (p.x + p.y) % 3 == 0 else col.lightened(0.16)
		elif style == "gruesos":
			c = sole if p.y >= bottom[p.x] - 1 else (col.lightened(0.28) if (p.x + p.y) % 4 == 0 else col)
		elif style in ["botas", "chelsea"]:
			c = col.darkened(0.15 if p.x % 3 else 0.4)
		elif p.y == top[p.x] + 1 and p.x % 2 == 0:
			c = Color("d9d9d4")
		img.set_pixelv(p, c)
	if style == "gruesos":


		for x: int in bottom:
			var p := Vector2i(x, int(bottom[x]) + 1)
			if p.y < img.get_height() and source.get_pixelv(p).a < 0.5:
				img.set_pixelv(p, col.darkened(0.68))
	if style in ["altos", "botas", "chelsea"]:
		for x: int in top:
			for dy in range(1, 4 if style in ["botas", "chelsea"] else 3):
				var p: Vector2i = Vector2i(x, top[x] - dy)
				if p.y >= 0 and source.get_pixelv(p).a > 0.5:
					img.set_pixelv(p, col.darkened(0.6 if style == "chelsea" and x % 3 == 0 else (0.28 if dy > 1 else 0.1)))

static func wrists(img: Image, source: Image, cfg: Dictionary, bb: Rect2i, view: String = "front") -> void:
	if str(cfg.get("acc_watch", "none")) == "none" and str(cfg.get("acc_bracelet", "none")) == "none": return
	var candidates: Dictionary = {}
	var face_px: Array[Vector2i] = []
	var face_colors: Array[Color] = []
	var face: Rect2i = KitRecolor._largest_skin_component(source, bb.position.y + int(bb.size.y * KitRecolor.HEAD_FRAC), face_px, face_colors)
	for y in range(bb.position.y, bb.position.y + int(bb.size.y * 0.78)):
		for x in range(bb.position.x, bb.end.x):
			var p: Vector2i = Vector2i(x, y)
			var c: Color = source.get_pixelv(p)
			if not face.grow(1).has_point(p) and c.a > 0.5 and KitRecolor._is_skin(c.h * 360.0, c):
				candidates[p] = true
	var visited: Dictionary = {}
	var arms: Array = []
	for start: Vector2i in candidates:
		if visited.has(start): continue
		var component: Array[Vector2i] = [start]
		var seeds: Array[Vector2i] = []
		visited[start] = true
		var cursor: int = 0
		while cursor < component.size():
			var p: Vector2i = component[cursor]
			cursor += 1
			var touches_sleeve: bool = false
			for delta in [Vector2i.LEFT, Vector2i.RIGHT, Vector2i.UP, Vector2i.DOWN]:
				var q: Vector2i = p + delta
				if candidates.has(q) and not visited.has(q):
					visited[q] = true
					component.append(q)
				for distance in [1, 2]:
					var near: Vector2i = p + delta * distance
					if near.x < 0 or near.y < 0 or near.x >= source.get_width() or near.y >= source.get_height(): continue
					var c: Color = source.get_pixelv(near)
					touches_sleeve = touches_sleeve or (c.a > 0.5 and c.b > c.r * 1.4 and c.b > c.g * 0.9 and c.s > 0.5)
			if touches_sleeve: seeds.append(p)
		if component.size() < 5 or seeds.is_empty(): continue
		var distance: Dictionary = {}
		var queue: Array[Vector2i] = []
		var origin_x: float = 0.0
		for p in seeds:
			distance[p] = 0
			queue.append(p)
			origin_x += p.x
		origin_x /= seeds.size()
		cursor = 0
		var farthest: int = 0
		while cursor < queue.size():
			var p: Vector2i = queue[cursor]
			cursor += 1
			for delta in [Vector2i.LEFT, Vector2i.RIGHT, Vector2i.UP, Vector2i.DOWN]:
				var q: Vector2i = p + delta
				if candidates.has(q) and not distance.has(q):
					distance[q] = distance[p] + 1
					farthest = maxi(farthest, distance[q])
					queue.append(q)
		if farthest < 4: continue
		var band: Array[Vector2i] = []
		for p: Vector2i in distance:
			if distance[p] == farthest - 3: band.append(p)
		arms.append({"x": origin_x, "band": band, "size": component.size()})

	if view in ["left", "right"] and arms.size() > 1:
		arms.sort_custom(func(a: Dictionary, b: Dictionary) -> bool: return a.size > b.size)
		arms = [arms[0]]
	var metal: Color = cfg.get("acc_metal", Color("d7b76d"))
	for arm in arms:
		var watch_side: bool =(arm.x >= bb.get_center().x) if view == "front" else (arm.x < bb.get_center().x)
		if view in ["left", "right"]: watch_side = view == "right"
		var kind: String = str(cfg.get("acc_watch" if watch_side else "acc_bracelet", "none"))
		if kind == "none": continue
		var first: bool = true
		for p: Vector2i in arm.band:
			if not _piel_al_aire(img.get_pixelv(p), source.get_pixelv(p), cfg): continue
			var watch: bool = kind in ["reloj", "deportivo", "lujo"]
			var strap: Color = Color("293c4c") if kind == "deportivo" else metal
			img.set_pixelv(p,(Color("c9f4e2") if kind == "deportivo" else Color("323941")) if watch and first else strap)
			first = false







static func _piel_al_aire(visible: Color, original: Color, cfg: Dictionary) -> bool:
	if KitRecolor._is_skin(visible.h * 360.0, visible): return true
	if visible.a < 0.5: return false
	var esperada: Color = original
	if cfg.has("skin"):
		esperada = KitRecolor._toned_skin(cfg["skin"],
			KitRecolor._roles_ref.get(KitRecolor.RolZona.PIEL, KitRecolor.REF_SKIN), original)
	return absi(visible.r8 - esperada.r8) <= 2 and absi(visible.g8 - esperada.g8) <= 2 \
			and absi(visible.b8 - esperada.b8) <= 2

static func headwear(img: Image, cfg: Dictionary, view: String, head: Vector2i, face: Rect2i, eye_points: Array[Vector2i] = []) -> void:
	var hat: String = str(cfg.get("acc_head", "none"))
	var col: Color = cfg.get("acc_head_color", Color("56647e"))
	var outline: Color = col.darkened(0.6)
	if hat in ["gorra_atras", "tejido", "bucket"]:
		for dy in range(-1, 6):
			var width: int = 3 if dy == -1 else (4 if dy == 0 else 5)
			for dx in range(- width, width + 1):
				var c: Color = outline if absi(dx) == width else col.lightened(0.1 if dx < 0 else 0.0)
				if hat == "tejido" and dy >= 3:
					c = col.darkened(0.28 if dx % 2 == 0 else 0.12)
				_put(img, head + Vector2i(dx, dy), c)
		if hat == "bucket":
			for dx in range(-7, 8):
				_put(img, head + Vector2i(dx, 5), outline)
				if absi(dx) <= 6:
					_put(img, head + Vector2i(dx, 6), col.darkened(0.15))
		elif hat == "gorra_atras":
			if view in ["front", "left", "right"]:
				for dx in range(-2, 3):
					_put(img, head + Vector2i(dx, 4), outline)
			if view in ["left", "right"]:
				var direction: int = -1 if view == "right" else 1
				for dx in range(5, 9):
					_put(img, head + Vector2i(dx * direction, 4), outline)
			elif view == "back":
				for dx in range(-6, 7):
					_put(img, head + Vector2i(dx, 6), outline)
	var glasses: String = str(cfg.get("acc_face", "none"))
	if glasses not in ["redondos", "aviador", "rectangulares", "deportivos"] or face.size.x <= 0 or view == "back":
		return
	var center: int = face.get_center().x
	if eye_points.is_empty():
		if view == "front":
			eye_points.assign([Vector2i(center - 3, face.position.y + 3), Vector2i(center + 3, face.position.y + 3)])
		else:
			eye_points.append(Vector2i(center +(1 if view == "right" else -1), face.position.y + 3))
	var lens: Color = Color("192d42") if glasses in ["aviador", "deportivos"] else Color("a9bdc3")
	var frame: Color = cfg.get("acc_metal", Color("d7b76d")) if glasses == "aviador" else Color("242830")
	if glasses == "deportivos":
		var left: int = eye_points[0].x - 2
		var right: int = eye_points.back().x + 2
		for x in range(left, right + 1):
			_put(img, Vector2i(x, eye_points[0].y - 1), Color("557c99"))
			for dy in [0, 1]: _put(img, Vector2i(x, eye_points[0].y + dy), lens)
	else:
		for eye in eye_points:
			for dy in range(-1, 3):
				for dx in range(-2, 3):
					if (glasses == "redondos" and absi(dx) == 2 and dy in [-1, 2]) or (glasses == "aviador" and dy == 2 and absi(dx) == 2):
						continue
					_put(img, eye + Vector2i(dx, dy), lens if absi(dx) <= 1 and dy in [0, 1] else frame)
		if eye_points.size() == 2:
			for x in range(eye_points[0].x + 3, eye_points[1].x - 2):
				_put(img, Vector2i(x, eye_points[0].y), frame)

	if view in ["left", "right"]:
		var ear_dir: int = -1 if view == "right" else 1
		for dx in range(3, 7):
			_put(img, eye_points[0] + Vector2i(dx * ear_dir, -1), frame)
