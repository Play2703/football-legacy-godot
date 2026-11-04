class_name FieldMarks
extends Node3D






















const CHEV_N: int = 5
const CHEV_GAP: float = 2.6



const MARCH: float = 1.5



const START_M: float = 1.7
const END_M: float = 1.4


const ALTURA: float = 0.06



const RING_IN: float = 0.62
const RING_OUT: float = 0.9
const SEGS: int = 26





const CHEV_W: float = 0.95
const CHEV_L: float = 1.0




var _source: Callable = Callable()
var _ring: MeshInstance3D = null
var _chevs: Array = []
var _t: float = 0.0


func setup(source: Callable) -> void:
	_source = source


func _ready() -> void:




	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	mat.cull_mode = BaseMaterial3D.CULL_DISABLED
	var acc: Color = CareerTheme.accent()
	mat.albedo_color = Color(acc.r, acc.g, acc.b, 0.7)
	_ring = MeshInstance3D.new()
	_ring.mesh = _ring_mesh()
	_ring.material_override = mat
	_ring.visible = false
	add_child(_ring)
	var arrow: ArrayMesh = _chev_mesh()
	for _i in CHEV_N:
		var c: MeshInstance3D = MeshInstance3D.new()
		c.mesh = arrow
		c.material_override = mat
		c.visible = false
		add_child(c)
		_chevs.append(c)


func _process(delta: float) -> void:
	_t += delta
	if not _source.is_valid():
		_hide()
		return
	var live: Array = _source.call()
	if live.size() < 2:
		_hide()
		return
	var me: Vector3 = live[0]
	var to: Vector3 = live[1]
	var flat: Vector3 = to - me
	flat.y = 0.0
	var d: float = flat.length()
	if d < 0.5:
		_hide()
		return
	var dir: Vector3 = flat / d


	_ring.visible = true
	_ring.position = Vector3(me.x, ALTURA, me.z)
	var pulse: float = 1.0 + 0.07 * sin(_t * TAU * 0.9)
	_ring.scale = Vector3(pulse, 1.0, pulse)



	var span: float = d - START_M - END_M
	if span <= 0.4:
		for c in _chevs:
			c.visible = false
		return
	var phase: float = fmod(_t * MARCH, CHEV_GAP)
	for i in CHEV_N:
		var c: MeshInstance3D = _chevs[i]
		var off: float = START_M + phase + CHEV_GAP * float(i)
		if off > START_M + span:
			c.visible = false
			continue
		c.visible = true
		var p: Vector3 = me + dir * off
		c.position = Vector3(p.x, ALTURA, p.z)


		c.look_at(c.position + dir, Vector3.UP)


func _hide() -> void:
	if _ring != null:
		_ring.visible = false
	for c in _chevs:
		c.visible = false





func _ring_mesh() -> ArrayMesh:
	var vts: PackedVector3Array = PackedVector3Array()
	for i in SEGS:
		var a0: float = TAU * float(i) / float(SEGS)
		var a1: float = TAU * float(i + 1) / float(SEGS)
		var i0: Vector3 = Vector3(cos(a0) * RING_IN, 0.0, sin(a0) * RING_IN)
		var o0: Vector3 = Vector3(cos(a0) * RING_OUT, 0.0, sin(a0) * RING_OUT)
		var i1: Vector3 = Vector3(cos(a1) * RING_IN, 0.0, sin(a1) * RING_IN)
		var o1: Vector3 = Vector3(cos(a1) * RING_OUT, 0.0, sin(a1) * RING_OUT)
		vts.append_array([i0, o0, i1, i1, o0, o1])
	return _mesh_of(vts)




func _chev_mesh() -> ArrayMesh:
	var tip: Vector3 = Vector3(0.0, 0.0, - CHEV_L * 0.5)
	var right: Vector3 = Vector3(CHEV_W * 0.5, 0.0, CHEV_L * 0.5)
	var left: Vector3 = Vector3(- CHEV_W * 0.5, 0.0, CHEV_L * 0.5)
	var notch: Vector3 = Vector3(0.0, 0.0, CHEV_L * 0.08)
	var vts: PackedVector3Array = PackedVector3Array(
		[tip, right, notch, tip, notch, left])
	return _mesh_of(vts)


func _mesh_of(vts: PackedVector3Array) -> ArrayMesh:
	var arr: Array = []
	arr.resize(Mesh.ARRAY_MAX)
	arr[Mesh.ARRAY_VERTEX] = vts
	var m: ArrayMesh = ArrayMesh.new()
	m.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arr)
	return m
