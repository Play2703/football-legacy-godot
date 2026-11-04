extends RefCounted

static func eyes(source: Image, view: String) -> Array[Vector2i]:
	var out: Array[Vector2i] = []
	if view == "back": return out
	var bb: Rect2i = KitRecolor._body_rect(source)
	var rows: Dictionary = {}
	for y in range(bb.position.y + 3, bb.position.y + int(bb.size.y * 0.26)):
		var xs: Array[int] = []
		for x in range(bb.position.x, bb.end.x):
			if KitRecolor._es_esclera(source.get_pixel(x, y)):
				xs.append(x)
		if xs.size() >= 2:
			rows[y] = xs
	if rows.is_empty(): return out
	var eye_y: int = -1
	var best: int = 0
	for y: int in rows:
		if rows[y].size() > best:
			best = rows[y].size()
			eye_y = y
	var xs: Array = rows[eye_y]
	if view == "front":
		var middle: float =(xs.front() + xs.back()) * 0.5
		for side in [-1, 1]:
			var lo: int = 999
			var hi: int = -1
			for x: int in xs:
				if (x - middle) * side > 0:
					lo = mini(lo, x)
					hi = maxi(hi, x)
			if hi >= lo:
				out.append(Vector2i(ceili((lo + hi) * 0.5) if side < 0 else floori((lo + hi) * 0.5), eye_y))
	else:
		out.append(Vector2i(roundi((xs.front() + xs.back()) * 0.5), eye_y))
	return out

static func ears(eye_points: Array[Vector2i], view: String) -> Array[Vector2i]:
	var out: Array[Vector2i] = []
	if eye_points.is_empty(): return out
	if view == "front" and eye_points.size() == 2:
		out.assign([eye_points[0] + Vector2i(-3, 3), eye_points[1] + Vector2i(3, 3)])
	elif view in ["right", "left"]:
		out.append(eye_points[0] + Vector2i(-6 if view == "right" else 6, 3))
	return out

static func head_layer(path: String, cfg: Dictionary) -> Image:
	var modular = load("res://features/match/modular_appearance.gd")
	var pose: Dictionary = modular._frame(path)
	var dir: String = str(pose.get("head_direction", pose.get("direction", "south")))
	var view: String = {"south": "front", "east": "right", "north": "back", "west": "left"}[dir]
	var ref_path: String = "res://assets/sprites/anim/idle_%s_00.png" % dir
	var source: Image = modular.base_image(ref_path)
	var layer: Image = Image.create(92, 92, false, Image.FORMAT_RGBA8)
	if source == null: return layer
	var eye_points: Array[Vector2i] = eyes(source, view)
	var bb: Rect2i = KitRecolor._body_rect(source)
	var head: Vector2i = KitRecolor.head_anchor(source, bb, bb.position.y + 10)
	var pixels: Array[Vector2i] = []
	var colors: Array[Color] = []
	var face: Rect2i = KitRecolor._largest_skin_component(source, bb.position.y + int(bb.size.y * KitRecolor.HEAD_FRAC), pixels, colors)
	var hat_path: String = str(KitRecolor.HEAD_SPRITES.get(str(cfg.get("acc_head", "none")), {}).get(view, ""))
	if not hat_path.is_empty():
		KitRecolor._blit_acc(layer, hat_path, head - Vector2i(KitRecolor.HEAD_REF[view]), cfg.get("acc_head_color", KitRecolor.HEAD_ACC_COLORS[0]))
	KitRecolor.CASUAL_TAILORING.earrings(layer, cfg, view, face, ears(eye_points, view))
	var glasses_path: String = str(KitRecolor.ACC_SPRITES.get(str(cfg.get("acc_face", "none")), {}).get(view, ""))
	if not glasses_path.is_empty():

		KitRecolor._blit_acc(layer, glasses_path, Vector2i.ZERO)
	KitRecolor.CASUAL_DETAILS.headwear(layer, cfg, view, head, face, eye_points)


	var ref_pose: Dictionary = modular._frame(ref_path)
	var offset: Array = ref_pose.get("offset", [0, 0])
	var canonical: Image = Image.create(92, 92, false, Image.FORMAT_RGBA8)
	canonical.blit_rect(layer, Rect2i(0, 0, 92, 92), - Vector2i(roundi(offset[0]), roundi(offset[1])))
	return modular.Placement.place(canonical, pose)
