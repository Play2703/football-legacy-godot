class_name Puddles
extends RefCounted


























const FIELD_HALF_W: float = 34.0
const FIELD_DEPTH: float = 105.0





const COUNT_MIN: int = 5
const COUNT_MAX: int = 9





const R_MIN: float = 1.6
const R_MAX: float = 4.2



const DEPTH_MIN: float = 0.35
const DEPTH_MAX: float = 1.0




const RIM: float = 0.22




const MARGIN_X: float = 2.0
const MARGIN_Z: float = 4.0




const SEP: float = 0.95




const WOBBLE_2: float = 0.16
const WOBBLE_3: float = 0.11




const TEXELS_PER_M: float = 4.0











const MAX_TRIES: int = 640




var list: Array[Dictionary] = []
















func _init(seed_value: int = 0, count: int = -1, shape: Dictionary = {}) -> void:
	var rng := RandomNumberGenerator.new()
	if seed_value > 0:
		rng.seed = seed_value
	else:
		rng.randomize()
	var c_min: int = int(shape.get("count_min", COUNT_MIN))
	var c_max: int = maxi(c_min, int(shape.get("count_max", COUNT_MAX)))
	var r_lo: float = float(shape.get("r_min", R_MIN))
	var r_hi: float = maxf(r_lo, float(shape.get("r_max", R_MAX)))
	var d_lo: float = float(shape.get("depth_min", DEPTH_MIN))
	var d_hi: float = maxf(d_lo, float(shape.get("depth_max", DEPTH_MAX)))
	var want: int = count if count >= 0 else rng.randi_range(c_min, c_max)
	var tries: int = 0
	while list.size() < want and tries < MAX_TRIES:
		tries += 1
		var r: float = rng.randf_range(r_lo, r_hi)
		var p := {
			"x": rng.randf_range(-(FIELD_HALF_W - MARGIN_X), FIELD_HALF_W - MARGIN_X),
			"z": rng.randf_range(MARGIN_Z, FIELD_DEPTH - MARGIN_Z),
			"r": r,
			"depth": rng.randf_range(d_lo, d_hi),
			"w2": rng.randf_range(- WOBBLE_2, WOBBLE_2),
			"p2": rng.randf_range(0.0, TAU),
			"w3": rng.randf_range(- WOBBLE_3, WOBBLE_3),
			"p3": rng.randf_range(0.0, TAU),
		}
		if _fits(p):
			list.append(p)



func _fits(p: Dictionary) -> bool:
	for q in list:
		var dx: float = float(p["x"]) - float(q["x"])
		var dz: float = float(p["z"]) - float(q["z"])
		var need: float =(float(p["r"]) + float(q["r"])) * SEP
		if dx * dx + dz * dz < need * need:
			return false
	return true


func is_empty() -> bool:
	return list.is_empty()










func depth_at(x: float, z: float) -> float:
	var best: float = 0.0
	for p in list:
		var dx: float = x - float(p["x"])
		var dz: float = z - float(p["z"])
		var d2: float = dx * dx + dz * dz




		var rmax: float = float(p["r"]) * 1.3
		if d2 >= rmax * rmax:
			continue
		var d: float = sqrt(d2)
		var ang: float = atan2(dz, dx)
		var rr: float = float(p["r"]) *(1.0
			+ float(p["w2"]) * sin(2.0 * ang + float(p["p2"]))
			+ float(p["w3"]) * sin(3.0 * ang + float(p["p3"])))
		if d >= rr:
			continue
		var t: float = clampf((1.0 - d / rr) / RIM, 0.0, 1.0)
		best = maxf(best, t * float(p["depth"]))
		if best >= 0.999:
			break
	return best










func bake_mask(origin: Vector2, span: Vector2) -> Image:
	var w: int = maxi(8, int(round(span.x * TEXELS_PER_M)))
	var h: int = maxi(8, int(round(span.y * TEXELS_PER_M)))
	var data := PackedByteArray()
	data.resize(w * h)
	if not list.is_empty():
		var mx: float = float(w) / span.x
		var mz: float = float(h) / span.y
		for p in list:
			var rmax: float = float(p["r"]) * 1.3
			var x0: int = maxi(0, int(floor((float(p["x"]) - rmax - origin.x) * mx)))
			var x1: int = mini(w - 1, int(ceil((float(p["x"]) + rmax - origin.x) * mx)))
			var z0: int = maxi(0, int(floor((float(p["z"]) - rmax - origin.y) * mz)))
			var z1: int = mini(h - 1, int(ceil((float(p["z"]) + rmax - origin.y) * mz)))
			for iz in range(z0, z1 + 1):
				var wz: float = origin.y +(float(iz) + 0.5) / mz
				var row: int = iz * w
				for ix in range(x0, x1 + 1):
					var wx: float = origin.x +(float(ix) + 0.5) / mx
					var v: int = int(round(depth_at(wx, wz) * 255.0))


					if v > data[row + ix]:
						data[row + ix] = v
	return Image.create_from_data(w, h, false, Image.FORMAT_R8, data)
