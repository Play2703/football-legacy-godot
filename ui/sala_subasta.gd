class_name SalaSubasta
extends Control





























const PLAYER_HEIGHT_M: float = 1.78
const PLAYER_METRICS_X: float = 65.0
const PX: float = PLAYER_HEIGHT_M / PLAYER_METRICS_X
const HOJA: String = "res://assets/sprites/anim/"
const SENTADO: String = HOJA + "sentado_foto_south_"
const POSES: Dictionary = {
	"puja": HOJA + "sentado_lanza_south_03.png",
	"piensa": HOJA + "sentado_pierde_south_01.png",
	"lamenta": HOJA + "sentado_pierde_south_03.png",
	"fuera": HOJA + "sentado_brazos_south_01.png",
}


const MANO_PX: Vector2 = Vector2(35.0, 9.0)
const LIENZO_PX: float = 92.0
const COJIN_FRENTE: float = 0.24


const RECINTO_X: float = 4.6
const RECINTO_Z0: float = -5.2
const RECINTO_Z1: float = 6.4
const TECHO: float = 4.4
const ESTRADO_Z: float = 2.5
const ESTRADO_H: float = 0.42
const PILASTRA_PASO: float = 2.3


const SEAT_W: float = 0.95


const FILAS: Array = [[0.0, 0.5, 8], [-1.35, 0.0, 9], [-2.7, 0.5, 10]]



const SITIOS: Array = [[0, -2], [0, 1], [1, 0], [2, 0]]


const CABALLETE: Vector3 = Vector3(-0.72, ESTRADO_H, 3.55)
const PLAYERA_H: float = 0.62
const ATRIL: Vector3 = Vector3(0.78, ESTRADO_H, 3.35)
const NURIA_Z: float = 3.78
const NURIA: String = "Nuria Sanz"
const TELON_X: float = 1.95






const CAM_SALA: Vector3 = Vector3(0.0, 3.2, 4.6)
const AIM_SALA: Vector3 = Vector3(0.0, 0.85, -1.5)
const CAM_ESTRADO: Vector3 = Vector3(0.05, 1.52, 0.35)
const AIM_ESTRADO: Vector3 = Vector3(0.05, 1.42, 3.6)
const FOV: float = 44.0

const ORO: Color = Color("e3b23c")

var _vp: SubViewport
var _cam: Camera3D
var _cam_pos: Vector3 = CAM_ESTRADO
var _cam_aim: Vector3 = AIM_ESTRADO
var _t: float = 0.0
var _postores: Array = []
var _foco: OmniLight3D
var _mazo: Node3D
var _playera: Sprite3D
var _nums: Array = []
var _semilla: int = 0
var _halo_tex: ImageTexture
var _paleta_tex: ImageTexture
const FUENTE: Font = preload("res://assets/fonts/PressStart2P-Regular.ttf")




func monta(nums: Array, semilla: int, tex: Texture2D) -> void:
	_nums = nums
	_semilla = semilla
	_build_world(tex)


func _build_world(tex: Texture2D) -> void:
	var box: SubViewportContainer = SubViewportContainer.new()
	box.stretch = true
	box.set_anchors_preset(Control.PRESET_FULL_RECT)
	box.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(box)
	_vp = SubViewport.new()
	_vp.transparent_bg = false
	_vp.render_target_update_mode = SubViewport.UPDATE_ALWAYS
	_vp.msaa_3d = Viewport.MSAA_DISABLED
	UiKit.aplica_escala_3d_sub(_vp, get_viewport())
	box.add_child(_vp)
	add_to_group(CareerUi.LIVE_3D_GROUP)
	_halo_tex = _tex_halo()

	var env: Environment = Environment.new()
	env.background_mode = Environment.BG_COLOR
	env.background_color = Color("0b0b0d")
	env.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	env.ambient_light_color = Color("4a3428")
	env.ambient_light_energy = 0.62
	env.fog_enabled = true
	env.fog_light_color = Color("0e0b0a")
	env.fog_density = 0.028
	var we: WorldEnvironment = WorldEnvironment.new()
	we.environment = env
	_vp.add_child(we)

	_cam = Camera3D.new()
	_cam.current = true
	_cam.fov = FOV
	_vp.add_child(_cam)
	_aplica_cam()

	_recinto()
	_estrado()
	_butacas()
	_gente()
	_utileria(tex)
	_luces()



func _caja(sz: Vector3, pos: Vector3, mat: Material, padre: Node3D = null) -> MeshInstance3D:
	var mi: MeshInstance3D = MeshInstance3D.new()
	var bm: BoxMesh = BoxMesh.new()
	bm.size = sz
	mi.mesh = bm
	mi.material_override = mat
	mi.position = pos
	(padre if padre != null else _vp as Node).add_child(mi)
	return mi


func _mat(c: Color, rough: float = 0.8, emision: Color = Color.BLACK,
		metal: float = 0.0) -> StandardMaterial3D:
	var m: StandardMaterial3D = StandardMaterial3D.new()
	m.albedo_color = c
	m.roughness = rough
	m.metallic = metal
	if emision != Color.BLACK:
		m.emission_enabled = true
		m.emission = emision
	return m


func _mat_luz(c: Color) -> StandardMaterial3D:
	var m: StandardMaterial3D = StandardMaterial3D.new()
	m.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	m.albedo_color = c
	return m


func _multi(mesh: Mesh, trs: Array[Transform3D]) -> void:
	var mm: MultiMesh = MultiMesh.new()
	mm.transform_format = MultiMesh.TRANSFORM_3D
	mm.mesh = mesh
	mm.instance_count = trs.size()
	for i in trs.size():
		mm.set_instance_transform(i, trs[i])
	var mi: MultiMeshInstance3D = MultiMeshInstance3D.new()
	mi.multimesh = mm
	_vp.add_child(mi)





func _recinto() -> void:
	var largo: float = RECINTO_Z1 - RECINTO_Z0
	var zc: float =(RECINTO_Z1 + RECINTO_Z0) * 0.5
	var madera: StandardMaterial3D = _mat(Color.WHITE, 0.7, Color(0.085, 0.045, 0.04))
	madera.albedo_texture = _tex_paneles()
	madera.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	madera.uv1_triplanar = true
	madera.uv1_scale = Vector3(0.5, 0.5, 0.5)
	var moqueta: StandardMaterial3D = _mat(Color("5a161c"), 1.0, Color(0.05, 0.012, 0.014))
	moqueta.albedo_texture = _tex_moqueta()
	moqueta.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	moqueta.uv1_triplanar = true
	moqueta.uv1_scale = Vector3(0.6, 0.6, 0.6)
	var techo_m: StandardMaterial3D = _mat(Color(0.06, 0.05, 0.05), 0.9, Color(0.035, 0.028, 0.03))
	var oro: StandardMaterial3D = _mat(Color("b8892c"), 0.4, Color("4a3410"), 0.35)
	_caja(Vector3(2.0 * RECINTO_X, 0.2, largo), Vector3(0.0, -0.1, zc), moqueta)
	_caja(Vector3(2.0 * RECINTO_X, 0.3, largo), Vector3(0.0, TECHO + 0.15, zc), techo_m)
	for sx in [-1.0, 1.0]:
		_caja(Vector3(0.3, TECHO, largo), Vector3(float(sx) * RECINTO_X, TECHO * 0.5, zc), madera)
	for z in [RECINTO_Z0, RECINTO_Z1]:
		_caja(Vector3(2.0 * RECINTO_X, TECHO, 0.3), Vector3(0.0, TECHO * 0.5, float(z)), madera)

	for y in [0.95, TECHO - 0.5]:
		for sx in [-1.0, 1.0]:
			_caja(Vector3(0.06, 0.07, largo), Vector3(float(sx) *(RECINTO_X - 0.17), y, zc), oro)
		_caja(Vector3(2.0 * RECINTO_X, 0.07, 0.06), Vector3(0.0, y, RECINTO_Z0 + 0.17), oro)

	var pil_m: BoxMesh = BoxMesh.new()
	pil_m.size = Vector3(0.22, TECHO - 0.5, 0.42)
	pil_m.material = madera
	var luz_m: BoxMesh = BoxMesh.new()
	luz_m.size = Vector3(0.1, 0.3, 0.18)
	luz_m.material = _mat_luz(Color("ffd9a0"))
	var pil: Array[Transform3D] = []
	var luces: Array[Transform3D] = []
	var hacia: Array[Vector3] = []
	var z: float = RECINTO_Z0 + 1.4
	while z < RECINTO_Z1 - 0.6:
		for sx in [-1.0, 1.0]:
			var x: float = float(sx) *(RECINTO_X - 0.25)
			pil.append(Transform3D(Basis(), Vector3(x,(TECHO - 0.5) * 0.5, z)))
			luces.append(Transform3D(Basis(), Vector3(x - float(sx) * 0.15, 2.7, z)))
			hacia.append(Vector3(- float(sx), 0.0, 0.0))
		z += PILASTRA_PASO
	var x2: float = - RECINTO_X + 1.3
	while x2 < RECINTO_X - 1.0:

		if absf(x2) > 1.0:
			pil.append(Transform3D(Basis(Vector3.UP, PI * 0.5),
				Vector3(x2,(TECHO - 0.5) * 0.5, RECINTO_Z0 + 0.25)))
			luces.append(Transform3D(Basis(Vector3.UP, PI * 0.5),
				Vector3(x2, 2.7, RECINTO_Z0 + 0.4)))
			hacia.append(Vector3(0.0, 0.0, 1.0))
		x2 += PILASTRA_PASO

	for sx in [-1.0, 1.0]:
		luces.append(Transform3D(Basis(Vector3.UP, PI * 0.5),
			Vector3(float(sx) * 3.35, 2.7, RECINTO_Z1 - 0.2)))
		hacia.append(Vector3(0.0, 0.0, -1.0))
	_multi(pil_m, pil)
	_multi(luz_m, luces)


	var halo_m: StandardMaterial3D = _mat_luz(Color(1.0, 0.72, 0.42, 0.24))
	halo_m.albedo_texture = _halo_tex
	halo_m.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	halo_m.blend_mode = BaseMaterial3D.BLEND_MODE_ADD
	var halo_q: QuadMesh = QuadMesh.new()
	halo_q.size = Vector2(1.7, 2.3)
	halo_q.material = halo_m
	var halos: Array[Transform3D] = []
	for i in luces.size():
		halos.append(Transform3D(Basis.looking_at(- hacia[i], Vector3.UP),
			luces[i].origin + hacia[i] * 0.02 + Vector3(0.0, 0.35, 0.0)))
	_multi(halo_q, halos)


	var puerta: StandardMaterial3D = _mat(Color("24150f"), 0.6, Color(0.03, 0.015, 0.01))
	var marco: StandardMaterial3D = _mat(Color("3e2719"), 0.6, Color(0.05, 0.03, 0.02))
	_caja(Vector3(2.1, 2.75, 0.1), Vector3(0.0, 1.375, RECINTO_Z0 + 0.18), marco)
	for sx in [-1.0, 1.0]:
		_caja(Vector3(0.86, 2.55, 0.08), Vector3(float(sx) * 0.46, 1.275, RECINTO_Z0 + 0.24), puerta)
		_caja(Vector3(0.05, 0.3, 0.05), Vector3(float(sx) * 0.12, 1.25, RECINTO_Z0 + 0.31), oro)

	var punto: BoxMesh = BoxMesh.new()
	punto.size = Vector3(0.14, 0.04, 0.14)
	punto.material = _mat_luz(Color("ffd9a0"))
	var dots: Array[Transform3D] = []
	var dz: float = RECINTO_Z0 + 1.1
	while dz < RECINTO_Z1 - 0.5:
		var dx: float = - RECINTO_X + 1.1
		while dx < RECINTO_X - 0.9:
			dots.append(Transform3D(Basis(), Vector3(dx, TECHO - 0.02, dz)))
			dx += 2.2
		dz += 2.2
	_multi(punto, dots)




func _estrado() -> void:
	var largo: float = RECINTO_Z1 - ESTRADO_Z
	var tarima: StandardMaterial3D = _mat(Color("3b2416"), 0.6, Color(0.04, 0.022, 0.014))
	tarima.albedo_texture = _tex_tablas()
	tarima.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	tarima.uv1_triplanar = true
	tarima.uv1_scale = Vector3(0.5, 0.5, 0.5)
	var oro: StandardMaterial3D = _mat(Color("b8892c"), 0.4, Color("4a3410"), 0.35)
	_caja(Vector3(2.0 * RECINTO_X, ESTRADO_H, largo),
		Vector3(0.0, ESTRADO_H * 0.5, ESTRADO_Z + largo * 0.5), tarima)
	_caja(Vector3(2.0 * RECINTO_X, 0.05, 0.05), Vector3(0.0, ESTRADO_H - 0.03, ESTRADO_Z), oro)


	var tela: StandardMaterial3D = _mat(Color.WHITE, 1.0, Color(0.06, 0.012, 0.018))
	tela.albedo_texture = _tex_telon()
	tela.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	tela.uv1_scale = Vector3(8.0, 1.0, 1.0)
	var telon_h: float = TECHO - ESTRADO_H - 0.35
	var q: QuadMesh = QuadMesh.new()
	q.size = Vector2(2.0 * TELON_X, telon_h)
	q.material = tela
	var telon: MeshInstance3D = MeshInstance3D.new()
	telon.mesh = q
	telon.rotation.y = PI
	telon.position = Vector3(0.0, ESTRADO_H + telon_h * 0.5, RECINTO_Z1 - 0.18)
	_vp.add_child(telon)
	_caja(Vector3(2.0 * TELON_X + 0.2, 0.42, 0.14),
		Vector3(0.0, TECHO - 0.38, RECINTO_Z1 - 0.25), _mat(Color("6b1824"), 0.9, Color(0.07, 0.015, 0.02)))
	_caja(Vector3(2.0 * TELON_X + 0.2, 0.04, 0.04), Vector3(0.0, TECHO - 0.6, RECINTO_Z1 - 0.32), oro)
	var pil: StandardMaterial3D = _mat(Color("3e2719"), 0.6, Color(0.05, 0.03, 0.02))
	for sx in [-1.0, 1.0]:
		_caja(Vector3(0.32, TECHO - ESTRADO_H, 0.36),
			Vector3(float(sx) *(TELON_X + 0.16), ESTRADO_H +(TECHO - ESTRADO_H) * 0.5, RECINTO_Z1 - 0.3), pil)

	var atril_m: StandardMaterial3D = _mat(Color("2b1a12"), 0.55, Color(0.03, 0.018, 0.012))
	_caja(Vector3(0.62, 1.05, 0.42), ATRIL + Vector3(0.0, 0.525, 0.0), atril_m)
	_caja(Vector3(0.7, 0.05, 0.5), ATRIL + Vector3(0.0, 1.07, 0.0), atril_m)
	_caja(Vector3(0.36, 0.2, 0.02), ATRIL + Vector3(0.0, 0.7, -0.22), oro)
	_caja(Vector3(0.18, 0.05, 0.18), ATRIL + Vector3(0.12, 1.12, -0.05),
		_mat(Color("5a3a22"), 0.5))
	_mazo = Node3D.new()
	_mazo.position = ATRIL + Vector3(-0.05, 1.13, -0.05)
	_vp.add_child(_mazo)
	var madera_mazo: StandardMaterial3D = _mat(Color("6b4426"), 0.45, Color(0.06, 0.035, 0.02))
	var cab: MeshInstance3D = MeshInstance3D.new()
	var cil: CylinderMesh = CylinderMesh.new()
	cil.top_radius = 0.045
	cil.bottom_radius = 0.045
	cil.height = 0.16
	cil.radial_segments = 10
	cil.material = madera_mazo
	cab.mesh = cil
	cab.rotation.z = PI * 0.5
	cab.position = Vector3(0.17, 0.05, 0.0)
	_mazo.add_child(cab)
	var mango: MeshInstance3D = MeshInstance3D.new()
	var mm: CylinderMesh = CylinderMesh.new()
	mm.top_radius = 0.014
	mm.bottom_radius = 0.016
	mm.height = 0.26
	mm.radial_segments = 8
	mm.material = madera_mazo
	mango.mesh = mm
	mango.rotation.z = PI * 0.5
	mango.position = Vector3(0.0, 0.05, 0.0)
	_mazo.add_child(mango)



func _butacas() -> void:
	var velvet: StandardMaterial3D = _mat(Color("6a1626"), 1.0, Color(0.04, 0.008, 0.012))
	var respaldo: BoxMesh = BoxMesh.new()
	respaldo.size = Vector3(0.74, 0.78, 0.13)
	respaldo.material = velvet
	var asiento: BoxMesh = BoxMesh.new()
	asiento.size = Vector3(0.7, 0.42, 0.44)
	asiento.material = velvet
	var canto: BoxMesh = BoxMesh.new()
	canto.size = Vector3(0.76, 0.04, 0.15)
	canto.material = _mat(Color("c9a33a"), 0.4, Color("6b4d12"), 0.35)
	var r: Array[Transform3D] = []
	var a: Array[Transform3D] = []
	var c: Array[Transform3D] = []
	for f in FILAS:
		for i in int(f[2]):
			var x: float = _x_asiento(f, i)
			var z: float = float(f[0])
			r.append(Transform3D(Basis(), Vector3(x, 0.55, z - 0.26)))
			a.append(Transform3D(Basis(), Vector3(x, 0.21, z - 0.02)))
			c.append(Transform3D(Basis(), Vector3(x, 0.96, z - 0.26)))
	_multi(respaldo, r)
	_multi(asiento, a)
	_multi(canto, c)



func _x_asiento(f: Array, i: int) -> float:
	var n: int = int(f[2])
	return (float(i) - float(n - 1) * 0.5) * SEAT_W




func _x_sitio(fila: int, k: int) -> float:
	var f: Array = FILAS[fila]
	return (float(k) + float(f[1])) * SEAT_W




func _gente() -> void:
	var px_pies: float = Ceremony.feet_offset_px(SENTADO + "01.png") * PX


	var relleno: Array = []
	for k in 6:
		relleno.append(_frames(_vestido("sala|%d|%d" % [_semilla, k]), false))
	var ocupados: Dictionary = {}
	for i in mini(_nums.size(), SITIOS.size()):
		var s: Array = SITIOS[i]
		ocupados["%d|%s" % [int(s[0]), str(snappedf(_x_sitio(int(s[0]), int(s[1])), 0.01))]] = i
	var n: int = 0
	for fi in FILAS.size():
		var f: Array = FILAS[fi]
		for i in int(f[2]):
			var x: float = _x_asiento(f, i)
			var z: float = float(f[0])
			var clave: String = "%d|%s" % [fi, str(snappedf(x, 0.01))]
			var spr: AnimatedSprite3D = _sentado(Vector3(x, px_pies, z + COJIN_FRENTE))
			if ocupados.has(clave):
				var pi: int = int(ocupados[clave])
				spr.sprite_frames = _frames(_vestido("postor|%d|%d" % [_semilla, pi]), true)
				spr.play("sentado")
				_postores.append({"spr": spr, "base": spr.position, "i": pi})
			else:
				spr.sprite_frames = relleno[(n * 5 + fi) % relleno.size()]
				spr.flip_h =(n + fi) % 2 == 1

				var d: float = 1.0 - 0.1 * float(fi)
				spr.modulate = Color(d, d, d)
				spr.play("sentado")
				spr.frame = n % 5
			n += 1
	_postores.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return int(a["i"]) < int(b["i"]))
	for p in _postores:
		_paletas(p)
	_foco = OmniLight3D.new()
	_foco.light_color = ORO
	_foco.light_energy = 0.0
	_foco.omni_range = 1.7
	_vp.add_child(_foco)


func _vestido(semilla: String) -> Dictionary:
	return KitRecolor.GALA_WEAR.preview_cfg(KitRecolor.appearance_for(semilla, {}))




func _frames(gala: Dictionary, con_poses: bool) -> SpriteFrames:
	var fr: SpriteFrames = SpriteFrames.new()
	fr.add_animation("sentado")
	fr.set_animation_loop("sentado", true)
	fr.set_animation_speed("sentado", 4.5)
	for i in range(1, 6):
		var path: String = "%s%02d.png" % [SENTADO, i]
		if ResourceLoader.exists(path):
			fr.add_frame("sentado", KitRecolor.apply(load(path), gala))
	if fr.get_frame_count("sentado") == 0:
		fr.add_frame("sentado", PlaceholderTexture2D.new())
	if con_poses:
		for pose in POSES:
			fr.add_animation(pose)
			fr.set_animation_loop(pose, false)
			var path: String = String(POSES[pose])
			fr.add_frame(pose, KitRecolor.apply(load(path), gala) if ResourceLoader.exists(path)
				else fr.get_frame_texture("sentado", 0))
	return fr


func _sentado(pos: Vector3) -> AnimatedSprite3D:
	var spr: AnimatedSprite3D = AnimatedSprite3D.new()
	spr.pixel_size = PX
	spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	spr.position = pos
	_vp.add_child(spr)
	return spr





func _paletas(p: Dictionary) -> void:
	var spr: AnimatedSprite3D = p["spr"]
	var num: int = int(_nums[int(p["i"])])
	var mano: Vector3 = Vector3((MANO_PX.x - LIENZO_PX * 0.5) * PX,
		(LIENZO_PX * 0.5 - MANO_PX.y) * PX, 0.0)
	p["alta"] = _paleta(spr, mano + Vector3(0.0, 0.16, 0.03), num, 1.0)
	p["regazo"] = _paleta(spr, Vector3(0.08, -0.28, 0.06), num, 0.8)
	(p["alta"] as Node3D).visible = false


func _paleta(padre: Node3D, pos: Vector3, num: int, escala: float) -> Node3D:
	var raiz: Node3D = Node3D.new()
	raiz.position = pos
	padre.add_child(raiz)
	var s: Sprite3D = Sprite3D.new()
	if _paleta_tex == null:
		_paleta_tex = _tex_paleta()
	s.texture = _paleta_tex
	s.pixel_size = 0.0115 * escala
	s.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	s.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	s.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	raiz.add_child(s)
	var l: Label3D = Label3D.new()
	l.text = "%02d" % num
	l.font = FUENTE
	l.font_size = 24
	l.pixel_size = 0.0034 * escala
	l.modulate = Color("1a1410")
	l.outline_size = 0
	l.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	l.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST


	l.position = Vector3(0.0, 6.5 * 0.0115 * escala, 0.01)
	raiz.add_child(l)
	return raiz





func pose(i: int, nombre: String) -> void:
	if i < 0 or i >= _postores.size():
		return
	var p: Dictionary = _postores[i]
	var spr: AnimatedSprite3D = p["spr"]
	if not is_instance_valid(spr):
		return
	if spr.sprite_frames.has_animation(nombre):
		spr.play(nombre)
	(p["alta"] as Node3D).visible = nombre == "puja"
	(p["regazo"] as Node3D).visible = nombre in ["sentado", "piensa", "lamenta"]


	if nombre == "puja":
		var y0: float =(p["base"] as Vector3).y
		spr.position.y = y0 - 0.05
		spr.create_tween().tween_property(spr, "position:y", y0, 0.18) \
				.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)



func foco(i: int) -> void:
	if _foco == null:
		return
	if i < 0 or i >= _postores.size():
		_foco.create_tween().tween_property(_foco, "light_energy", 0.0, 0.2)
		return
	var b: Vector3 = _postores[i]["base"]
	_foco.position = b + Vector3(0.0, 0.75, 0.55)
	_foco.light_energy = 0.0
	_foco.create_tween().tween_property(_foco, "light_energy", 2.6, 0.18)


func plano_sala() -> void:
	_cam_pos = CAM_SALA
	_cam_aim = AIM_SALA
	_aplica_cam()


func plano_estrado() -> void:
	_cam_pos = CAM_ESTRADO
	_cam_aim = AIM_ESTRADO
	_aplica_cam()



func martillazo() -> void:
	if _mazo == null:
		return
	var tw: Tween = _mazo.create_tween()
	tw.tween_property(_mazo, "rotation:z", 0.9, 0.16).set_ease(Tween.EASE_OUT)
	tw.tween_property(_mazo, "rotation:z", -0.08, 0.07).set_ease(Tween.EASE_IN)
	tw.tween_property(_mazo, "rotation:z", 0.0, 0.12)
	var luz: OmniLight3D = OmniLight3D.new()
	luz.light_color = ORO
	luz.omni_range = 2.2
	luz.position = ATRIL + Vector3(0.0, 1.5, -0.6)
	_vp.add_child(luz)
	var tl: Tween = luz.create_tween()
	tl.tween_interval(0.22)
	tl.tween_property(luz, "light_energy", 4.0, 0.05)
	tl.tween_property(luz, "light_energy", 0.0, 0.6)
	tl.tween_callback(luz.queue_free)


func set_live(on: bool) -> void:
	if _vp == null or not is_instance_valid(_vp):
		return
	_vp.render_target_update_mode = SubViewport.UPDATE_ALWAYS if on \
			else SubViewport.UPDATE_DISABLED




func _process(delta: float) -> void:
	_t += delta
	_aplica_cam()


func _aplica_cam() -> void:
	if _cam == null:
		return
	_cam.position = _cam_pos + Vector3(sin(_t * 0.35) * 0.05, sin(_t * 0.27) * 0.02, 0.0)
	_cam.look_at(_cam_aim, Vector3.UP)






func _utileria(tex: Texture2D) -> void:
	var madera: StandardMaterial3D = _mat(Color("4a2f1c"), 0.6, Color(0.04, 0.025, 0.015))
	var laton: StandardMaterial3D = _mat(Color("c9a33a"), 0.35, Color("5a4012"), 0.5)

	for sx in [-1.0, 1.0]:
		var pata: MeshInstance3D = _caja(Vector3(0.05, 1.7, 0.05),
			CABALLETE + Vector3(float(sx) * 0.26, 0.82, 0.0), madera)
		pata.rotation.z = float(sx) * -0.12
	var trasera: MeshInstance3D = _caja(Vector3(0.05, 1.7, 0.05),
		CABALLETE + Vector3(0.0, 0.8, 0.3), madera)
	trasera.rotation.x = -0.25
	_caja(Vector3(0.72, 0.05, 0.1), CABALLETE + Vector3(0.0, 0.78, -0.04), madera)

	var cy: float = CABALLETE.y + 0.8 + PLAYERA_H * 0.5 + 0.05
	var cw: float = PLAYERA_H * 1.05
	var ch: float = PLAYERA_H * 1.08
	var fz: float = CABALLETE.z - 0.07
	_caja(Vector3(cw + 0.08, ch + 0.08, 0.02), Vector3(CABALLETE.x, cy, fz + 0.01),
		_mat(Color("1a1210"), 0.9))
	for sy in [-1.0, 1.0]:
		_caja(Vector3(cw + 0.1, 0.045, 0.04), Vector3(CABALLETE.x, cy + float(sy) *(ch * 0.5 + 0.03), fz), laton)
	for sx in [-1.0, 1.0]:
		_caja(Vector3(0.045, ch + 0.1, 0.04), Vector3(CABALLETE.x + float(sx) *(cw * 0.5 + 0.03), cy, fz), laton)
	if tex != null:
		_playera = Sprite3D.new()
		_playera.texture = tex
		_playera.pixel_size = PLAYERA_H / float(maxi(tex.get_height(), 1))
		_playera.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		_playera.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
		_playera.rotation.y = PI
		_playera.position = Vector3(CABALLETE.x, cy, fz - 0.03)
		_vp.add_child(_playera)

	var spot: SpotLight3D = SpotLight3D.new()
	spot.light_color = Color("ffe4aa")
	spot.light_energy = 5.0
	spot.spot_range = 4.5
	spot.spot_angle = 17.0
	spot.position = Vector3(CABALLETE.x, TECHO - 0.3, CABALLETE.z - 1.9)
	_vp.add_child(spot)
	spot.look_at(Vector3(CABALLETE.x, cy, CABALLETE.z), Vector3.UP)

	var charco_m: StandardMaterial3D = _mat_luz(Color(1.0, 0.86, 0.6, 0.3))
	charco_m.albedo_texture = _halo_tex
	charco_m.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	charco_m.blend_mode = BaseMaterial3D.BLEND_MODE_ADD
	var cq: QuadMesh = QuadMesh.new()
	cq.size = Vector2(1.5, 0.9)
	cq.material = charco_m
	var charco: MeshInstance3D = MeshInstance3D.new()
	charco.mesh = cq
	charco.rotation.x = - PI * 0.5
	charco.position = Vector3(CABALLETE.x, ESTRADO_H + 0.01, CABALLETE.z - 0.2)
	_vp.add_child(charco)


	var path: String = HOJA + "coach_south_00.png"
	if ResourceLoader.exists(path):
		var n: Sprite3D = Sprite3D.new()
		n.texture = KitRecolor.apply(load(path), KitRecolor.traits_for(NURIA))
		n.pixel_size = PX
		n.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
		n.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		n.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
		n.position = Vector3(ATRIL.x + 0.05,
			ESTRADO_H + Ceremony.feet_offset_px(path) * PX, NURIA_Z)
		_vp.add_child(n)




func _luces() -> void:
	var a: OmniLight3D = OmniLight3D.new()
	a.light_color = Color("ffd2a0")
	a.light_energy = 1.1
	a.omni_range = 8.5
	a.position = Vector3(0.0, 2.9, 2.4)
	_vp.add_child(a)
	var b: OmniLight3D = OmniLight3D.new()
	b.light_color = Color("ffd2a0")
	b.light_energy = 0.8
	b.omni_range = 5.0
	b.position = Vector3(0.3, 2.2, 1.3)
	_vp.add_child(b)
	var c: OmniLight3D = OmniLight3D.new()
	c.light_color = Color("ffcf9a")
	c.light_energy = 0.55
	c.omni_range = 6.0
	c.position = Vector3(0.0, 2.6, -3.6)
	_vp.add_child(c)


func _tex_paneles() -> ImageTexture:
	var img: Image = Image.create(32, 32, false, Image.FORMAT_RGB8)
	var base: Color = Color("3a2016")
	for y in 32:
		for x in 32:
			var c: Color = base
			if x % 16 == 0:
				c = base.darkened(0.45)
			elif x % 16 == 1:
				c = base.lightened(0.12)
			elif y == 0:
				c = base.darkened(0.35)
			elif (x * 7 + y * 3) % 11 == 0:
				c = base.darkened(0.12)
			img.set_pixel(x, y, c)
	return ImageTexture.create_from_image(img)


func _tex_tablas() -> ImageTexture:
	var img: Image = Image.create(32, 32, false, Image.FORMAT_RGB8)
	var base: Color = Color("3b2416")
	for y in 32:
		for x in 32:
			var c: Color = base
			if y % 8 == 0:
				c = base.darkened(0.35)
			elif (x * 5 + y * 11) % 13 == 0:
				c = base.darkened(0.14)
			img.set_pixel(x, y, c)
	return ImageTexture.create_from_image(img)



func _tex_moqueta() -> ImageTexture:
	var img: Image = Image.create(32, 32, false, Image.FORMAT_RGB8)
	var base: Color = Color("5a161c")
	for y in 32:
		for x in 32:
			var c: Color = base
			if (x + y) % 16 == 0 or (x - y + 32) % 16 == 0:
				c = base.lightened(0.1)
			elif (x * 3 + y * 7) % 9 == 0:
				c = base.darkened(0.1)
			img.set_pixel(x, y, c)
	return ImageTexture.create_from_image(img)



func _tex_telon() -> ImageTexture:
	var img: Image = Image.create(36, 8, false, Image.FORMAT_RGB8)
	var tonos: Array = [Color("4a0f16"), Color("5e1520"), Color("3a0b11")]
	for y in 8:
		for x in 36:
			img.set_pixel(x, y, tonos[0] if x < 14 else (tonos[1] if x < 28 else tonos[2]))
	return ImageTexture.create_from_image(img)



func _tex_paleta() -> ImageTexture:
	var img: Image = Image.create(24, 36, false, Image.FORMAT_RGBA8)
	img.fill(Color(0, 0, 0, 0))
	var c: Vector2 = Vector2(11.5, 11.5)
	for y in 24:
		for x in 24:
			var d: float = Vector2(float(x) - c.x,(float(y) - c.y) * 1.1).length()
			if d <= 11.0:
				img.set_pixel(x, y, ORO if d > 8.6 else Color("f4f1ec"))
	for y in range(23, 36):
		for x in range(10, 14):
			img.set_pixel(x, y, Color("3a2416") if x != 10 else Color("5a3a22"))
	return ImageTexture.create_from_image(img)


func _tex_halo() -> ImageTexture:
	var img: Image = Image.create(32, 32, false, Image.FORMAT_RGBA8)
	for y in 32:
		for x in 32:
			var d: float = Vector2(float(x) - 15.5, float(y) - 15.5).length() / 15.5
			var a: float = clampf(1.0 - d, 0.0, 1.0)
			img.set_pixel(x, y, Color(1, 1, 1, a * a))
	return ImageTexture.create_from_image(img)
