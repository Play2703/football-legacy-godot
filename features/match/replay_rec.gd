class_name ReplayRec
extends RefCounted

























const HZ: float = 30.0



const WINDOW_S: float = 7.0


const STRIDE: int = 6



const F_FLIP: int = 1
const F_VISIBLE: int = 2



const META_OCULTO_GOLPEO: StringName = &"oculto_golpeo"



const CARA_SHIFT: int = 2



const FASE_SALTO_MAX: float = 1.5






const CAM_STRIDE: int = 8





const CAM_CORTE_M: float = 4.0
const CAM_CORTE_RAD: float = 0.6









const RING_STRIDE: int = 5


var _nodes: Array[Node3D] = []




var _force_vis: Dictionary = {}


var _cam_data: PackedFloat32Array = PackedFloat32Array()
var _cam_seen: bool = false



var _ring_data: PackedFloat32Array = PackedFloat32Array()
var _ring_seen: bool = false
var _ring_pos: Vector3 = Vector3.ZERO
var _ring_lado: float = 0.0
var _ring_word: int = -1
var _ring_words: Array[String] = []

var _data: PackedFloat32Array = PackedFloat32Array()

var _times: PackedFloat32Array = PackedFloat32Array()

var _walls: PackedInt64Array = PackedInt64Array()


var audio: ReplayAudio = null
var _cap: int = 0
var _stride: int = 0

var _head: int = 0

var _count: int = 0
var _last_t: float = -1.0



var _anim_ids: Dictionary = {}
var _anim_names: Array[StringName] = []
var _cara_ids: Dictionary = {}
var _caras: Array[String] = [""]


var armed: bool = false




func arm(nodes: Array, force_visible: Array = []) -> void:
	_nodes.clear()
	for n in nodes:
		if n is Node3D and is_instance_valid(n):
			_nodes.append(n)
	_force_vis.clear()
	for i in _nodes.size():
		if force_visible.has(_nodes[i]):
			_force_vis[i] = true
	_stride = _nodes.size() * STRIDE
	_cap = int(ceil(WINDOW_S * HZ))



	_data.resize(_cap * _stride)
	_times.resize(_cap)
	_walls.resize(_cap)
	_cam_data.resize(_cap * CAM_STRIDE)
	_cam_data.fill(0.0)
	_cam_seen = false
	_ring_data.resize(_cap * RING_STRIDE)
	_ring_data.fill(0.0)
	_ring_seen = false
	_ring_lado = 0.0
	_ring_word = -1
	_ring_words.clear()
	_head = 0
	_count = 0
	_last_t = -1.0
	_anim_ids.clear()
	_anim_names.clear()
	_cara_ids.clear()
	_caras = [""]
	armed = _stride > 0







func also_force_visible(n: Node3D) -> void:
	var i: int = _nodes.find(n)
	if i >= 0:
		_force_vis[i] = true



func disarm() -> void:
	armed = false
	_nodes.clear()
	_force_vis.clear()
	_cam_seen = false
	_ring_seen = false
	_count = 0
	_head = 0






func ring_state(pos: Vector3, lado: float, word: String) -> void:
	_ring_pos = pos
	_ring_lado = lado
	if word.is_empty():
		_ring_word = -1
		return
	var id: int = _ring_words.find(word)
	if id < 0:
		id = _ring_words.size()
		_ring_words.append(word)
	_ring_word = id
	_ring_seen = true




func sample(now_s: float, cam: Camera3D = null) -> void:
	if not armed:
		return






	if _last_t >= 0.0 and now_s - _last_t < 0.99 / HZ:
		return
	_last_t = now_s
	var base: int = _head * _stride
	for i in _nodes.size():
		_write(base + i * STRIDE, _nodes[i], _force_vis.has(i))



	if cam != null and is_instance_valid(cam):
		var cb: int = _head * CAM_STRIDE
		var cp: Vector3 = cam.global_position
		var cq: Quaternion = cam.global_transform.basis.get_rotation_quaternion()
		_cam_data[cb] = cp.x
		_cam_data[cb + 1] = cp.y
		_cam_data[cb + 2] = cp.z
		_cam_data[cb + 3] = cq.x
		_cam_data[cb + 4] = cq.y
		_cam_data[cb + 5] = cq.z
		_cam_data[cb + 6] = cq.w
		_cam_data[cb + 7] = cam.fov
		_cam_seen = true
	if _ring_data.size() >=(_head + 1) * RING_STRIDE:
		var rb: int = _head * RING_STRIDE
		_ring_data[rb] = _ring_pos.x
		_ring_data[rb + 1] = _ring_pos.y
		_ring_data[rb + 2] = _ring_pos.z
		_ring_data[rb + 3] = _ring_lado
		_ring_data[rb + 4] = float(_ring_word)
		if _ring_lado > 0.0:
			_ring_seen = true
	_times[_head] = now_s
	_walls[_head] = Time.get_ticks_usec()
	_head =(_head + 1) % _cap
	_count = mini(_count + 1, _cap)












func _write(at: int, n, force_vis: bool = false) -> void:
	if not is_instance_valid(n):
		_data[at] = 0.0
		_data[at + 1] = 0.0
		_data[at + 2] = 0.0
		_data[at + 3] = 0.0
		_data[at + 4] = 0.0
		_data[at + 5] = 0.0
		return
	var p: Vector3 = n.position
	_data[at] = p.x
	_data[at + 1] = p.y
	_data[at + 2] = p.z
	var anim: int = 0


	var fase: float = 0.0



	var flags: int = F_VISIBLE if (force_vis or n.visible
		or n.has_meta(META_OCULTO_GOLPEO)) else 0
	if n is AnimatedSprite3D:
		var s: AnimatedSprite3D = n
		anim = _anim_id(s.animation)
		fase = float(s.frame) + clampf(s.frame_progress, 0.0, 0.999)
		if s.flip_h:
			flags |= F_FLIP



		var c: CaraEncima = CaraEncima.de(s)
		if c != null and c.visible:
			flags |= _cara_id(c.estado())<<CARA_SHIFT
	_data[at + 3] = float(anim)
	_data[at + 4] = fase
	_data[at + 5] = float(flags)


func _cara_id(estado: String) -> int:
	if estado.is_empty():
		return 0
	var id: Variant = _cara_ids.get(estado)
	if id != null:
		return int(id)
	_caras.append(estado)
	_cara_ids[estado] = _caras.size() - 1
	return _caras.size() - 1


func _anim_id(name: StringName) -> int:
	var id: Variant = _anim_ids.get(name)
	if id != null:
		return int(id)
	var nid: int = _anim_names.size()
	_anim_names.append(name)
	_anim_ids[name] = nid
	return nid













func freeze(label: String = "") -> Clip:
	if not armed or _count < 2:
		return null
	var clip: Clip = Clip.new()
	clip.label = label
	clip.stride = _stride
	clip.slots = _nodes.size()
	clip.anims = _anim_names.duplicate()
	clip.caras = _caras.duplicate()
	clip.data = PackedFloat32Array()
	clip.data.resize(_count * _stride)
	clip.times = PackedFloat32Array()
	clip.times.resize(_count)



	var first: int =(_head - _count + _cap) % _cap
	if _cam_seen:
		clip.cam_data.resize(_count * CAM_STRIDE)
	if _ring_seen:
		clip.ring_data.resize(_count * RING_STRIDE)
		clip.ring_words = _ring_words.duplicate()
	for s in _count:
		var src: int =((first + s) % _cap) * _stride
		var dst: int = s * _stride
		for f in _stride:
			clip.data[dst + f] = _data[src + f]
		clip.times[s] = _times[(first + s) % _cap]
		clip.walls.append(_walls[(first + s) % _cap])


		if _cam_seen:
			var csrc: int =((first + s) % _cap) * CAM_STRIDE
			var cdst: int = s * CAM_STRIDE
			for f in CAM_STRIDE:
				clip.cam_data[cdst + f] = _cam_data[csrc + f]
		if _ring_seen:
			var rsrc: int =((first + s) % _cap) * RING_STRIDE
			var rdst: int = s * RING_STRIDE
			for f in RING_STRIDE:
				clip.ring_data[rdst + f] = _ring_data[rsrc + f]

	var t0: float = clip.times[0]
	for s in _count:
		clip.times[s] -= t0
	for i in _nodes.size():
		clip.recipes.append(_recipe(_nodes[i]))
	for i in _nodes.size():
		_rellena_huecos(clip.data, clip.times, _stride, i * STRIDE, 3)
		_rellena_fases(clip.data, clip.times, _stride, i * STRIDE,
			clip.recipes[i].get("frames"), clip.anims)
	if _cam_seen:
		_rellena_huecos(clip.cam_data, clip.times, CAM_STRIDE, 0, CAM_STRIDE, true)
	if audio != null and is_instance_valid(audio):
		audio.engancha(clip)
	return clip
















const HUECO_MAX: int = 3
const HUECO_SALTO_M: float = 3.0


static func _rellena_huecos(d: PackedFloat32Array, times: PackedFloat32Array,
		stride: int, off: int, comps: int, quat: bool = false) -> void:
	var n: int = times.size()
	var k: int = 1
	while k < n - 1:
		var a: int =(k - 1) * stride + off
		if not _igual(d, a, a + stride, comps):
			k += 1
			continue

		var e: int = k
		while e < n and _igual(d, a, e * stride + off, comps):
			e += 1
		var largo: int = e - k
		if e >= n or largo > HUECO_MAX or k < 2 \
				or _igual(d,(k - 2) * stride + off, a, comps) \
				or _dist3(d, a, e * stride + off) > HUECO_SALTO_M:
			k = e
			continue
		var b: int = e * stride + off
		var span: float = times[e] - times[k - 1]
		for s in range(k, e):
			var f: float =(times[s] - times[k - 1]) / span if span > 0.0 else 0.0
			var c: int = s * stride + off
			for x in comps:
				d[c + x] = lerpf(d[a + x], d[b + x], f)
			var q: Quaternion = Quaternion(d[c + 3], d[c + 4], d[c + 5], d[c + 6]) \
					if quat else Quaternion.IDENTITY
			if quat and q.length_squared() > 0.5:
				q = q.normalized()
				d[c + 3] = q.x
				d[c + 4] = q.y
				d[c + 5] = q.z
				d[c + 6] = q.w
		k = e









static func _rellena_fases(d: PackedFloat32Array, times: PackedFloat32Array, stride: int,
		off: int, sf: SpriteFrames, anims: Array) -> void:
	if sf == null:
		return
	var n: int = times.size()
	var k: int = 2
	while k < n - 1:
		var a: int =(k - 1) * stride + off
		if not _igual(d, a + 3, k * stride + off + 3, 2):
			k += 1
			continue
		var e: int = k
		while e < n and _igual(d, a + 3, e * stride + off + 3, 2):
			e += 1
		var largo: int = e - k
		var p: int =(k - 2) * stride + off
		var b: int = e * stride + off
		if e >= n or largo > HUECO_MAX or d[p + 3] != d[a + 3] or d[p + 4] == d[a + 4] \
				or d[b + 3] != d[a + 3]:
			k = e
			continue
		var id: int = int(d[a + 3])
		var nombre: StringName = anims[id] if id >= 0 and id < anims.size() else &""
		var avance: float = d[b + 4] - d[a + 4]
		var cuadros: int = 0
		if avance < 0.0:
			if not sf.has_animation(nombre) or not sf.get_animation_loop(nombre):
				k = e
				continue
			cuadros = sf.get_frame_count(nombre)
			avance += float(cuadros)
		if avance < 0.0 or avance > FASE_SALTO_MAX * float(largo + 1):
			k = e
			continue
		var span: float = times[e] - times[k - 1]
		for s in range(k, e):
			var f: float =(times[s] - times[k - 1]) / span if span > 0.0 else 0.0
			var v: float = d[a + 4] + avance * f
			if cuadros > 0:



				v = fmod(v, float(cuadros))
				if v > float(cuadros) - 0.001:
					v = 0.0
			d[s * stride + off + 4] = v
		k = e


static func _igual(d: PackedFloat32Array, a: int, b: int, comps: int) -> bool:
	for x in comps:
		if d[a + x] != d[b + x]:
			return false
	return true


static func _dist3(d: PackedFloat32Array, a: int, b: int) -> float:
	return Vector3(d[a], d[a + 1], d[a + 2]).distance_to(Vector3(d[b], d[b + 1], d[b + 2]))




func _recipe(n) -> Dictionary:
	var r: Dictionary = {"frames": null, "pixel_size": 0.01, "modulate": Color.WHITE}
	if not is_instance_valid(n):
		return r
	if not (n is AnimatedSprite3D):




		if n.has_method("receta_repeticion"):
			r.merge(n.receta_repeticion(), true)
		return r
	var s: AnimatedSprite3D = n
	r["frames"] = s.sprite_frames
	r["pixel_size"] = s.pixel_size
	r["modulate"] = s.modulate


















	if s.has_meta("cara_rutas"):
		r["cara_rutas"] = s.get_meta("cara_rutas")
		r["cara_cfg"] = s.get_meta("anim_cfg", s.get_meta("cara_cfg", {}))
	for k in ["lam_esc", "lam_par", "lam_pat", "lam_fab", "lam_cmp", "lam_esp", "lam_shn",
			"lam_cap"]:
		if s.has_meta(k):
			r[k] = s.get_meta(k)
	return r





class Clip extends RefCounted:
	var label: String = ""





	var ajeno: bool = false






	var mini: Dictionary = {}



	var cano_t: float = -1.0
	var stride: int = 0
	var slots: int = 0
	var data: PackedFloat32Array = PackedFloat32Array()
	var times: PackedFloat32Array = PackedFloat32Array()


	var cam_data: PackedFloat32Array = PackedFloat32Array()
	var anims: Array = []

	var caras: Array = [""]
	var recipes: Array = []


	var ring_data: PackedFloat32Array = PackedFloat32Array()
	var ring_words: Array = []







	var walls: PackedInt64Array = PackedInt64Array()
	var audio: PackedVector2Array = PackedVector2Array()
	var audio_us0: int = 0
	var audio_rate: int = 0

	func has_ring() -> bool:
		return ring_data.size() >= ReplayRec.RING_STRIDE * 2





	func ring_pose(t: float) -> Dictionary:
		var n: int = times.size()
		var i: int = _index_at(t)
		var j: int = mini(i + 1, n - 1)
		var f: float = 0.0
		if j > i:
			var dt: float = times[j] - times[i]
			if dt > 0.0:
				f = clampf((t - times[i]) / dt, 0.0, 1.0)
		var a: int = i * ReplayRec.RING_STRIDE
		var b: int = j * ReplayRec.RING_STRIDE
		var pa: Vector3 = Vector3(ring_data[a], ring_data[a + 1], ring_data[a + 2])
		var pb: Vector3 = Vector3(ring_data[b], ring_data[b + 1], ring_data[b + 2])


		if ring_data[b + 3] <= 0.0:
			pb = pa
		var w: int = int(ring_data[a + 4])
		return {
			"pos": pa.lerp(pb, f),
			"lado": ring_data[a + 3],
			"word": String(ring_words[w]) if w >= 0 and w < ring_words.size() else "",
		}

	func length() -> float:
		return times[times.size() - 1] if times.size() > 0 else 0.0

	func samples() -> int:
		return times.size()



	func has_cam() -> bool:
		return cam_data.size() >= ReplayRec.CAM_STRIDE * 2







	func cam_pose(t: float) -> Dictionary:
		var n: int = times.size()
		var i: int = _index_at(t)
		var j: int = mini(i + 1, n - 1)
		var f: float = 0.0
		if j > i:
			var dt: float = times[j] - times[i]
			if dt > 0.0:
				f = clampf((t - times[i]) / dt, 0.0, 1.0)
		var a: int = i * ReplayRec.CAM_STRIDE
		var b: int = j * ReplayRec.CAM_STRIDE
		var pa: Vector3 = Vector3(cam_data[a], cam_data[a + 1], cam_data[a + 2])
		var pb: Vector3 = Vector3(cam_data[b], cam_data[b + 1], cam_data[b + 2])
		var qa: Quaternion = Quaternion(cam_data[a + 3], cam_data[a + 4],
			cam_data[a + 5], cam_data[a + 6])
		var qb: Quaternion = Quaternion(cam_data[b + 3], cam_data[b + 4],
			cam_data[b + 5], cam_data[b + 6])
		if qa.length_squared() < 0.5:
			qa = Quaternion.IDENTITY
		if qb.length_squared() < 0.5:
			qb = qa
		if f > 0.0 and f < 1.0 and (pa.distance_to(pb) > ReplayRec.CAM_CORTE_M
				or qa.angle_to(qb) > ReplayRec.CAM_CORTE_RAD):
			f = 0.0
		return {
			"pos": pa.lerp(pb, f),
			"quat": qa.slerp(qb, f),
			"fov": lerpf(cam_data[a + 7], cam_data[b + 7], f),
		}



	func anim_name(id: int) -> StringName:
		return anims[id] if id >= 0 and id < anims.size() else &""




















	func pose(slot: int, t: float) -> Dictionary:
		var n: int = times.size()
		var i: int = _index_at(t)
		var j: int = mini(i + 1, n - 1)
		var f: float = 0.0
		if j > i:
			var dt: float = times[j] - times[i]
			if dt > 0.0:
				f = clampf((t - times[i]) / dt, 0.0, 1.0)
		var a: int = i * stride + slot * ReplayRec.STRIDE
		var b: int = j * stride + slot * ReplayRec.STRIDE
		var pa: Vector3 = Vector3(data[a], data[a + 1], data[a + 2])
		var pb: Vector3 = Vector3(data[b], data[b + 1], data[b + 2])
		var flags: int = int(data[a + 5])
		var anim_id: int = int(data[a + 3])
		var nombre: StringName = anim_name(anim_id)
		var fase: float = data[a + 4]
		if f > 0.0 and j > i and int(data[b + 3]) == anim_id:
			fase = _fase_entre(slot, nombre, fase, data[b + 4], f)
		return {
			"pos": pa.lerp(pb, f),
			"anim": nombre,
			"frame": int(fase),
			"flip":(flags&ReplayRec.F_FLIP) != 0,
			"visible":(flags&F_VISIBLE) != 0,
			"cara": caras[flags>>ReplayRec.CARA_SHIFT] \
					if (flags>>ReplayRec.CARA_SHIFT) < caras.size() else "",
		}







	func _fase_entre(slot: int, nombre: StringName, fa: float, fb: float, f: float) -> float:
		var d: float = fb - fa
		var n: int = 0
		if d < 0.0:
			var sf: SpriteFrames = recipes[slot].get("frames") if slot < recipes.size() else null
			if sf == null or not sf.has_animation(nombre) or not sf.get_animation_loop(nombre):
				return fa
			n = sf.get_frame_count(nombre)
			d += float(n)
		if d < 0.0 or d > ReplayRec.FASE_SALTO_MAX:
			return fa
		var fase: float = fa + d * f
		return fmod(fase, float(n)) if n > 0 else fase




	func _index_at(t: float) -> int:
		var n: int = times.size()
		if n == 0:
			return 0
		if t <= times[0]:
			return 0
		if t >= times[n - 1]:
			return n - 1
		var lo: int = 0
		var hi: int = n - 1
		while lo + 1 < hi:
			var mid: int =(lo + hi) / 2
			if times[mid] <= t:
				lo = mid
			else:
				hi = mid
		return lo




	func ball_path() -> PackedVector3Array:
		var out: PackedVector3Array = PackedVector3Array()
		if slots <= 0:
			return out
		for s in times.size():
			var a: int = s * stride
			out.append(Vector3(data[a], data[a + 1], data[a + 2]))
		return out
