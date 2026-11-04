class_name HeadAnchor
extends RefCounted
































const DATA_PATH: String = "res://assets/sprites/head_anchors.json"




const CROWN_LIFT: float = 0.85



const MIN_AXIS_PX: float = 1.5

static var _table: Dictionary = {}
static var _loaded: bool = false




static func for_frame(path: String) -> Dictionary:
	if not _loaded:
		_load_table()
	var key: String = path.get_file().get_basename()
	if _table.has(key):
		return _table[key]
	var tex: Texture2D = load(path)
	if tex == null:
		return {}
	return derive(_readable(tex))


static func _load_table() -> void:
	_loaded = true
	if not FileAccess.file_exists(DATA_PATH):
		return
	var f: FileAccess = FileAccess.open(DATA_PATH, FileAccess.READ)
	if f == null:
		return
	var raw: Variant = JSON.parse_string(f.get_as_text())
	if typeof(raw) != TYPE_DICTIONARY:
		return
	for k in (raw as Dictionary):
		var e: Dictionary = raw[k]
		_table[k] = {
			"pos": Vector2(e.get("x", 0.0), e.get("y", 0.0)),
			"up": Vector2(e.get("ux", 0.0), e.get("uy", -1.0)),
			"size": float(e.get("size", 0.0)),
			"src": String(e.get("src", "face")),
		}


static func _readable(tex: Texture2D) -> Image:
	var img: Image = tex.get_image()
	if img == null:
		return null
	if img.is_compressed():
		img.decompress()
	img.convert(Image.FORMAT_RGBA8)
	return img





static func derive(img: Image) -> Dictionary:
	if img == null:
		return {}
	var body: Rect2i = KitRecolor._body_rect(img)
	if body.size.y <= 0:
		return {}
	var head_bottom: int = body.position.y \
			+ int(round(float(body.size.y) * KitRecolor.HEAD_FRAC))

	var src: String = "face"
	var px: Array[Vector2i] = []
	var orig: Array[Color] = []
	var bb: Rect2i = KitRecolor._largest_skin_component(img, head_bottom, px, orig)
	if bb.size.x <= 0:

		bb = _largest_hair_component(img, head_bottom, px)
		src = "hair"
	if bb.size.x <= 0:
		return {}

	var head_c: Vector2 = _centroid(px)
	var torso_c: Vector2 = _kit_centroid(img, body)
	var size: float = float(maxi(bb.size.x, bb.size.y))

	var up: Vector2 = Vector2(0, -1)
	if torso_c != Vector2.INF:
		var axis: Vector2 = head_c - torso_c
		if axis.length() >= MIN_AXIS_PX:
			up = axis.normalized()

	return {
		"pos": head_c + up *(size * CROWN_LIFT * 0.5),
		"up": up,
		"size": size,
		"src": src,
	}





static func _largest_hair_component(img: Image, head_bottom: int,
		out_px: Array[Vector2i]) -> Rect2i:
	var hair: Dictionary = {}
	for y in mini(head_bottom, img.get_height()):
		for x in img.get_width():
			var c: Color = img.get_pixel(x, y)
			if c.a >= 0.5 and KitRecolor._is_hair(c.h * 360.0, c):
				hair[Vector2i(x, y)] = true
	var best: Array[Vector2i] = []
	var visited: Dictionary = {}
	for start in hair:
		if visited.has(start):
			continue
		var comp: Array[Vector2i] = []
		var queue: Array[Vector2i] = [start]
		visited[start] = true
		while not queue.is_empty():
			var p: Vector2i = queue.pop_back()
			comp.append(p)
			for off in [Vector2i(1, 0), Vector2i(-1, 0), Vector2i(0, 1), Vector2i(0, -1)]:
				var q: Vector2i = p + off
				if hair.has(q) and not visited.has(q):
					visited[q] = true
					queue.append(q)
		if comp.size() > best.size():
			best = comp
	if best.is_empty():
		return Rect2i()
	var bb: Rect2i = Rect2i(best[0], Vector2i.ONE)
	for p in best:
		bb = bb.expand(p)
		out_px.append(p)
	return bb




static func _kit_centroid(img: Image, body: Rect2i) -> Vector2:
	var sum: Vector2 = Vector2.ZERO
	var n: int = 0


	for red in [false, true]:
		var s: Vector2 = Vector2.ZERO
		var k: int = 0
		for y in range(body.position.y, mini(body.end.y, img.get_height())):
			for x in range(body.position.x, mini(body.end.x, img.get_width())):
				var c: Color = img.get_pixel(x, y)
				if c.a >= 0.5 and KitRecolor._is_kit_px(c.h * 360.0, c, red):
					s += Vector2(x, y)
					k += 1
		if k > n:
			n = k
			sum = s
	return Vector2.INF if n == 0 else sum / float(n)


static func _centroid(px: Array[Vector2i]) -> Vector2:
	if px.is_empty():
		return Vector2.ZERO
	var s: Vector2 = Vector2.ZERO
	for p in px:
		s += Vector2(p)
	return s / float(px.size())
