extends Node















const BLOQUE: int = 24
const PURGA: int = 5
const BLOQUES: int = 34

var _mat: ShaderMaterial
var _vp: Viewport

func _ready() -> void:
	GameState.readonly_save = true
	_vp = get_viewport()
	Engine.max_fps = 0
	var root: Node3D = Node3D.new()
	add_child(root)
	var st: Stadium = Stadium.new()
	st.div = 1
	st.home_club = "club_0"
	st.footprint = "rect_open"
	root.add_child(st)
	st.apply_weather("day")
	_mat = st._pitch_mat
	var cam: Camera3D = Camera3D.new()
	cam.fov = 58.0
	cam.far = 600.0
	root.add_child(cam)
	cam.current = true
	cam.position = Vector3(0.0, 15.3, 39.1)
	cam.look_at(Vector3(0.0, 0.6, 19.0), Vector3.UP)
	_vp.scaling_3d_mode = Viewport.SCALING_3D_MODE_BILINEAR
	_vp.scaling_3d_scale = 1.5
	await SceneFade.timer(2.0).timeout

	var px: float = float(_vp.size.x) * 1.5 * float(_vp.size.y) * 1.5 / 1000000.0
	var nat: float = float(_vp.size.x) * float(_vp.size.y) / 1000000.0
	print("BENCHPASTO2 === iPhone, separando franja y grano ===")
	print("BENCHPASTO2 gpu=%s  nativa=%dx%d (%.2f Mpx)  banco=%dx%d (%.2f Mpx)  factor %.3f"
		% [RenderingServer.get_video_adapter_name(), _vp.size.x, _vp.size.y, nat,
			int(_vp.size.x * 1.5), int(_vp.size.y * 1.5), px, nat / px])


	for c in [["solo-franja", 1.0, 0.0, 0.0],
			["franja+octava-fina", 1.0, 0.2, 0.0],
			["franja+grano-entero", 1.0, 0.2, 0.14],
			["TESTIGO-apagado", 0.0, 0.0, 0.0],
			["solo-franja-BIS", 1.0, 0.0, 0.0]]:
		await _duelo(String(c[0]), float(c[1]), float(c[2]), float(c[3]), px, nat)
	print("BENCHPASTO2 === fin ===")
	await SceneFade.timer(1.0).timeout


	if not is_inside_tree():
		return
	get_tree().quit()






func _duelo(nombre: String, real: float, fino: float, mata: float, px: float,
		nat: float) -> void:
	var a: PackedFloat64Array = PackedFloat64Array()
	var b: PackedFloat64Array = PackedFloat64Array()
	for i in 40:
		await RenderingServer.frame_post_draw
	var t0: int = Time.get_ticks_usec()
	for blq in BLOQUES * 2:
		var es_b: bool =(blq % 2) == 1
		if es_b:
			_pon(real, fino, mata)
		else:
			_pon(0.0, 0.0, 0.0)
		for i in BLOQUE:
			await RenderingServer.frame_post_draw
			var t1: int = Time.get_ticks_usec()
			var ms: float = float(t1 - t0) / 1000.0
			t0 = t1
			if i < PURGA:
				continue
			if es_b:
				b.append(ms)
			else:
				a.append(ms)
	var ma: Array = _stats(a)
	var mb: Array = _stats(b)
	var d: float = float(mb[0]) - float(ma[0])
	var se: float = sqrt(pow(float(ma[1]), 2.0) + pow(float(mb[1]), 2.0))



	var tope: String = "  <<TOPADO" if float(ma[0]) < 8.4 else ""
	print("BENCHPASTO2   %-22s off %.3f -> on %.3f   D %+.4f ms +-%.4f   nativa %+.4f ms%s"
		% [nombre, float(ma[0]), float(mb[0]), d, se, d *(nat / px), tope])


func _pon(real: float, fino: float, mata: float) -> void:
	_mat.set_shader_parameter("grass_real", real)
	_mat.set_shader_parameter("grain_fine", fino)
	_mat.set_shader_parameter("grain_tuft", mata)



func _stats(v: PackedFloat64Array) -> Array:
	var a: Array = Array(v)
	a.sort()
	var n: int = int(a.size() * 0.9)
	if n < 2:
		return [0.0, 0.0, 0.0]
	var tot: float = 0.0
	for i in n:
		tot += float(a[i])
	var m: float = tot / float(n)
	var s2: float = 0.0
	for i in n:
		s2 += pow(float(a[i]) - m, 2.0)
	var sd: float = sqrt(s2 / float(n))
	return [m, sd / sqrt(float(n)), sd]
