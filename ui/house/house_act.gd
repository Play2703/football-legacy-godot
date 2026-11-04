class_name HouseAct
extends Node




















const DURA: float = 1.7


static var duracion_test: float = 0.0








const RITMO: float = 1.75









const V_BANDA: float =(0.4 /(8.0 / 7.0)) * RITMO


const MARCAS: int = 5



const RisingLib := preload("res://ui/house/rising_sprite.gd")


const FUENTE: Font = preload("res://assets/fonts/PressStart2P-Regular.ttf")

var _casa: Node = null
var _prop: Dictionary = {}
var _kind: String = ""
var _t: float = 0.0
var _fin: bool = false
var _marcas: Array[MeshInstance3D] = []



var _extras: Array[Node] = []
var _jug_visible0: bool = true


var _velo_col: Color = Color(0, 0, 0)
var _velo_max: float = 0.35

var _zzz: Array[Label3D] = []
var _cam_tr: Transform3D = Transform3D()
var _cam_fov: float = 40.0
var _jug_pos: Vector3 = Vector3.ZERO
var _jug_proc: int = Node.PROCESS_MODE_INHERIT
var _jug_mod0: Color = Color.WHITE
var _velo: ColorRect = null
var _ficha: Control = null
var _texto: String = ""




func setup(casa: Node, prop: Dictionary, texto: String) -> void:
	_casa = casa
	_prop = prop
	_texto = texto


func _ready() -> void:
	if _casa == null or _prop.is_empty():
		queue_free()
		return





	var cam: Camera3D = _casa.get("cam")
	var jug: AnimatedSprite3D = _casa.get("player")
	if cam == null or jug == null:
		queue_free()
		return


	process_mode = Node.PROCESS_MODE_ALWAYS



	add_to_group(Settings.ANIM_HOLD_GROUP)
	get_tree().paused = true
	_cam_tr = cam.global_transform
	_cam_fov = cam.fov
	_jug_pos = jug.position




	_hud(false)
	_kind = String(_prop.get("kind", ""))
	_jug_visible0 = jug.visible
	_jug_proc = jug.process_mode
	_jug_mod0 = jug.modulate
	match _kind:
		"gimnasio":
			_montar_pesas(cam, jug)
		"piscina":
			_montar_nadar(cam, jug)
		"cama":
			_montar_cama(cam, jug)
		"cocina":
			_montar_cocina(cam, jug)
		"bici_estatica", "tina_hielo", "rincon_lectura":
			_montar_sentado(cam, jug)
		"tele":
			_montar_tele(cam, jug)
		_:
			_montar(cam, jug)
	_velo_y_ficha()


func _hud(on: bool) -> void:
	for campo in ["_hud_top", "_hud_bottom", "_grid_btn"]:
		var n: Control = _casa.get(campo)
		if n != null and is_instance_valid(n):
			n.visible = on











func _montar(cam: Camera3D, jug: AnimatedSprite3D) -> void:
	var r: Rect2 = _prop["rect"]
	var c: Vector2 = r.get_center()


	var banda: float = 0.26
	var pies: float = float(_casa.call("feet_offset", jug.pixel_size))
	jug.position = Vector3(c.x, banda + pies - 0.02, c.y - r.size.y * 0.12)



	_casa.call("walk_play", jug, Vector3(0.0, 0.0, 1.0))
	jug.speed_scale = RITMO






	jug.process_mode = Node.PROCESS_MODE_ALWAYS













	cam.fov = 42.0
	var ojo: Vector3 = Vector3(c.x, 3.2, c.y - 3.1)
	cam.global_transform = Transform3D(Basis(), ojo).looking_at(
		Vector3(c.x, 0.9, c.y + 0.3), Vector3.UP)




	for i in MARCAS:
		var m: MeshInstance3D = MeshInstance3D.new()
		var bm: BoxMesh = BoxMesh.new()
		bm.size = Vector3(r.size.x * 0.5, 0.012, 0.05)
		var mt: StandardMaterial3D = StandardMaterial3D.new()
		mt.albedo_color = Color("3a3f47")
		mt.roughness = 1.0
		bm.material = mt
		m.mesh = bm
		m.position = Vector3(c.x, banda + 0.01,
			r.position.y + r.size.y * float(i) / float(MARCAS))
		_marcas.append(m)
		(_casa.get("viewport") as Node).add_child(m)








const PESAS_FPS: float = 7.0

func _montar_pesas(cam: Camera3D, jug: AnimatedSprite3D) -> void:
	var r: Rect2 = _prop["rect"]
	var c: Vector2 = r.get_center()
	var pies: float = float(_casa.call("feet_offset", jug.pixel_size))



	var z_p: float = r.position.y - 0.55
	jug.position = Vector3(c.x, pies - 0.02, z_p)


	if not jug.sprite_frames.has_animation("pesas"):
		var cfg: Dictionary = KitRecolor.casual_of(GameState.team_custom)
		var added: int = 0
		for i in range(1, 13):
			var path: String = "res://assets/sprites/anim/pesas_south_%02d.png" % i
			if not ResourceLoader.exists(path):
				continue
			if added == 0:
				jug.sprite_frames.add_animation("pesas")
				jug.sprite_frames.set_animation_loop("pesas", true)
				jug.sprite_frames.set_animation_speed("pesas", PESAS_FPS)
			jug.sprite_frames.add_frame("pesas", KitRecolor.apply(load(path), cfg))
			added += 1


	if jug.sprite_frames.has_animation("pesas"):
		jug.play("pesas")
	jug.process_mode = Node.PROCESS_MODE_ALWAYS



	cam.fov = 42.0
	var ojo: Vector3 = Vector3(c.x, 3.4, z_p - 3.6)
	cam.global_transform = Transform3D(Basis(), ojo).looking_at(
		Vector3(c.x, 0.95, z_p + 0.3), Vector3.UP)




func _caja(at: Vector3, size: Vector3, col: Color) -> MeshInstance3D:
	var m: MeshInstance3D = MeshInstance3D.new()
	var bm: BoxMesh = BoxMesh.new()
	bm.size = size
	var mt: StandardMaterial3D = StandardMaterial3D.new()
	mt.albedo_color = col
	mt.roughness = 1.0
	bm.material = mt
	m.mesh = bm
	m.position = at
	(_casa.get("viewport") as Node).add_child(m)
	_extras.append(m)
	return m








func _cam_sur(cam: Camera3D, x: float, z: float, atras: float = 3.1,
		alto: float = 3.2, lado: float = -1.0) -> void:
	cam.fov = 42.0
	var ojo: Vector3 = Vector3(x, alto, z + lado * atras)
	cam.global_transform = Transform3D(Basis(), ojo).looking_at(
		Vector3(x, 0.9, z - lado * 0.3), Vector3.UP)









const NADAR_FPS: float = 6.0
const V_NADO: float = 0.4
var _nado_min: float = 0.0
var _nado_max: float = 0.0
var _nado_dir: float = -1.0

func _montar_nadar(cam: Camera3D, jug: AnimatedSprite3D) -> void:
	var r: Rect2 = _prop["rect"]
	var c: Vector2 = r.get_center()
	var pies: float = float(_casa.call("feet_offset", jug.pixel_size))
	if not jug.sprite_frames.has_animation("nadar"):
		var cfg: Dictionary = KitRecolor.casual_of(GameState.team_custom)
		var added: int = 0
		for i in range(1, 9):
			var path: String = "res://assets/sprites/anim/nadar_west_%02d.png" % i
			if not ResourceLoader.exists(path):
				continue
			if added == 0:
				jug.sprite_frames.add_animation("nadar")
				jug.sprite_frames.set_animation_loop("nadar", true)
				jug.sprite_frames.set_animation_speed("nadar", NADAR_FPS)
			jug.sprite_frames.add_frame("nadar", KitRecolor.apply(load(path), cfg))
			added += 1

	_nado_min = r.position.x + 0.75
	_nado_max = r.end.x - 0.75
	_nado_dir = -1.0



	jug.position = Vector3(c.x, pies + 0.1, c.y)
	if jug.sprite_frames.has_animation("nadar"):
		jug.play("nadar")
	jug.process_mode = Node.PROCESS_MODE_ALWAYS

	var bub: ImageTexture = RisingLib.make_texture("burbuja", Color("d4eef6"))
	for i in 2:
		var b = RisingLib.new()
		jug.add_child(b)
		b.setup(bub, 0.25 + 0.15 * float(i), 0.0, -0.05, 0.22,
			0.8 + 0.3 * float(i), 0.015, float(i) * 0.5, 0.006)
		_extras.append(b)
	_cam_sur(cam, c.x, c.y, 3.8, 3.8)







func _montar_cama(cam: Camera3D, jug: AnimatedSprite3D) -> void:
	var r: Rect2 = _prop["rect"]
	var c: Vector2 = r.get_center()
	jug.visible = false
	var head_n: bool = not House.plan_in_floor(_casa.call("_plano"),
		Vector2(c.x, r.end.y + 0.3))
	var hs: float = 1.0 if head_n else -1.0



	_caja(Vector3(c.x, 0.72, c.y - hs * r.size.y * 0.08),
		Vector3(minf(r.size.x - 0.3, 0.7), 0.16, r.size.y * 0.55),
		Color("9a88ad"))


	for i in 3:
		var z: Label3D = Label3D.new()
		z.text = "z"
		z.font = FUENTE
		z.font_size = 40 - i * 8
		z.pixel_size = 0.004
		z.billboard = BaseMaterial3D.BILLBOARD_ENABLED
		z.modulate = Color("f2e9c8")
		z.position = Vector3(c.x + 0.12 * float(i),
			0.9, c.y + hs *(r.size.y * 0.5 - 0.35))
		(_casa.get("viewport") as Node).add_child(z)
		_extras.append(z)
		_zzz.append(z)
	_velo_col = Color(0.02, 0.03, 0.1)
	_velo_max = 0.55





	_cam_sur(cam, c.x, c.y, 2.4, 4.6, - hs)






func _montar_cocina(cam: Camera3D, jug: AnimatedSprite3D) -> void:
	var r: Rect2 = _prop["rect"]
	var c: Vector2 = r.get_center()
	var pies: float = float(_casa.call("feet_offset", jug.pixel_size))


	jug.position = Vector3(c.x + 0.55, pies - 0.02, r.position.y - 0.42)
	_casa.call("walk_play", jug, Vector3(0.0, 0.0, 1.0))
	jug.pause()
	jug.frame = 0
	jug.process_mode = Node.PROCESS_MODE_ALWAYS

	_caja(Vector3(c.x + 0.05, 0.96, c.y),
		Vector3(0.26, 0.12, 0.26), Color("60666c"))
	var vap: ImageTexture = RisingLib.make_texture("vapor", Color("aeb6bc"))
	for i in 3:
		var v = RisingLib.new()


		v.process_mode = Node.PROCESS_MODE_ALWAYS
		(_casa.get("viewport") as Node).add_child(v)
		v.setup(vap, c.x + 0.05 + 0.05 * float(i - 1), c.y,
			1.06, 0.5, 0.45 + 0.12 * float(i), 0.025, float(i) / 3.0, 0.016)
		_extras.append(v)
	_cam_sur(cam, c.x + 0.3, r.position.y - 0.42, 3.6, 3.5)

























const SENTADOS: Dictionary = {
	"bici_estatica": {"lamina": "bici", "cuadros": 8, "fps": 9.0, "alto": 0.96,
		"delante": -0.12},
	"tina_hielo": {"lamina": "hielo", "cuadros": 8, "fps": 7.0, "alto": 0.12,
		"delante": 0.0, "lateral": -0.22},
	"rincon_lectura": {"lamina": "leer", "cuadros": 7, "fps": 3.0, "alto": 0.47,
		"delante": 0.2, "lateral": -0.42},
}













const TELE_DELANTE: float = 2.4
const TELE_OJO_ALTO: float = 2.5

func _montar_tele(cam: Camera3D, jug: AnimatedSprite3D) -> void:
	var r: Rect2 = _prop["rect"]
	var c: Vector2 = r.get_center()
	var pies: float = float(_casa.call("feet_offset", jug.pixel_size))
	var face: int = int(_prop.get("face", House.base_face(_prop)))&3
	var frente: Vector2 = House.FACE_DIR[face]
	var plano = _casa.call("_plano")
	var delante: float = TELE_DELANTE
	while delante > 1.2 and not House.plan_in_floor(plano, c + frente * delante):
		delante -= 0.2
	var sitio: Vector2 = c + frente * delante
	jug.position = Vector3(sitio.x, pies - 0.02, sitio.y)

	_casa.call("walk_play", jug, Vector3.ZERO)
	jug.speed_scale = 1.0
	jug.process_mode = Node.PROCESS_MODE_ALWAYS
	var ojo: Vector2 = c + frente * 0.15
	cam.fov = 42.0
	cam.global_transform = Transform3D(Basis(), Vector3(ojo.x, TELE_OJO_ALTO, ojo.y)).looking_at(
		Vector3(sitio.x, 0.95, sitio.y), Vector3.UP)





const ASIENTO_PX: float = 15.0

const TELE_TONOS: Array[Color] = [Color(0.86, 0.92, 1.0), Color(1.0, 1.0, 1.0),
	Color(0.8, 0.86, 1.0), Color(0.94, 0.97, 1.0), Color(0.84, 0.9, 0.98)]








func _manillar() -> Vector2:
	var fab: int = int(_prop.get("face_fab", House.base_face(_prop)))&3
	var giro: int =(int(_prop.get("face", fab)) - fab)&3
	var s_fab: Vector2 =(_prop["rect"] as Rect2).size
	if giro == 1 or giro == 3:
		s_fab = Vector2(s_fab.y, s_fab.x)
	var v: Vector3 = Vector3.RIGHT
	if s_fab.x < s_fab.y:
		v = Basis(Vector3.UP, PI * 0.5) * v
	v = Basis(Vector3.UP, PI * 0.5 * float(giro)) * v
	return Vector2(v.x, v.z).normalized()


func _montar_sentado(cam: Camera3D, jug: AnimatedSprite3D) -> void:
	var cfg_acto: Dictionary = SENTADOS[_kind]
	var r: Rect2 = _prop["rect"]
	var c: Vector2 = r.get_center()
	var pies: float = float(_casa.call("feet_offset", jug.pixel_size))
	var lamina: String = String(cfg_acto["lamina"])
	if not jug.sprite_frames.has_animation(lamina):
		var cfg: Dictionary = KitRecolor.casual_of(GameState.team_custom)
		var added: int = 0
		for i in range(1, int(cfg_acto["cuadros"]) + 1):
			var path: String = "res://assets/sprites/anim/%s_south_%02d.png" % [lamina, i]
			if not ResourceLoader.exists(path):
				continue
			if added == 0:
				jug.sprite_frames.add_animation(lamina)
				jug.sprite_frames.set_animation_loop(lamina, true)
				jug.sprite_frames.set_animation_speed(lamina, float(cfg_acto["fps"]))
			jug.sprite_frames.add_frame(lamina, KitRecolor.apply(load(path), cfg))
			added += 1


	var face: int = int(_prop.get("face", House.base_face(_prop)))&3
	var frente: Vector2 = House.FACE_DIR[face]
	if _kind == "bici_estatica":
		frente = _manillar()
	var derecha: Vector2 = Vector2(- frente.y, frente.x)
	var sitio: Vector2 = c + frente * float(cfg_acto["delante"]) \
			+ derecha * float(cfg_acto.get("lateral", 0.0))
	var y_pies: float = float(cfg_acto["alto"]) - ASIENTO_PX * jug.pixel_size
	jug.position = Vector3(sitio.x, y_pies + pies - 0.02, sitio.y)
	if jug.sprite_frames.has_animation(lamina):
		jug.play(lamina)
	jug.speed_scale = 1.0
	jug.process_mode = Node.PROCESS_MODE_ALWAYS








	cam.fov = 42.0
	var plano = _casa.call("_plano")
	var atras: float = 3.0
	while atras > 1.2 and not House.plan_in_floor(plano, sitio + frente * atras):
		atras -= 0.2
	var ojo: Vector2 = sitio + frente * atras
	var mira: Vector2 = sitio - frente * 0.3
	cam.global_transform = Transform3D(Basis(), Vector3(ojo.x, 3.2 +(3.0 - atras),
		ojo.y)).looking_at(
		Vector3(mira.x, 0.9, mira.y), Vector3.UP)
	if _kind == "tina_hielo":

		var vaho: ImageTexture = RisingLib.make_texture("vapor", Color("e2f1f6"))
		for i in 2:
			var v = RisingLib.new()
			v.process_mode = Node.PROCESS_MODE_ALWAYS
			(_casa.get("viewport") as Node).add_child(v)
			v.setup(vaho, sitio.x - 0.25 + 0.5 * float(i), sitio.y - 0.35,
				0.72, 0.35, 0.9 + 0.3 * float(i), 0.02, float(i) * 0.5, 0.012)
			_extras.append(v)





func _velo_y_ficha() -> void:
	_velo = ColorRect.new()
	_velo.color = Color(0, 0, 0, 0.0)
	_velo.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	_velo.mouse_filter = Control.MOUSE_FILTER_STOP
	_velo.gui_input.connect(_on_toque)











	_velo.process_mode = Node.PROCESS_MODE_ALWAYS
	_casa.add_child(_velo)

	var caja: MarginContainer = MarginContainer.new()
	caja.set_anchors_preset(Control.PRESET_BOTTOM_WIDE)
	caja.grow_vertical = Control.GROW_DIRECTION_BEGIN
	for side in ["left", "right", "bottom"]:
		caja.add_theme_constant_override("margin_" + side, 40)


	caja.process_mode = Node.PROCESS_MODE_ALWAYS
	_casa.add_child(caja)
	_ficha = caja
	var panel: PanelContainer = PanelContainer.new()
	panel.add_theme_stylebox_override("panel",
		CareerTheme.plate_tinted(CareerTheme.accent()))
	caja.add_child(panel)
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 6)
	panel.add_child(col)
	var t1: Label = CareerUi.plain(26, CareerTheme.TEXT)
	t1.text = I18n.t(House.kind_name(_prop))
	t1.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	col.add_child(t1)
	var t2: Label = CareerUi.plain(22, CareerTheme.MONEY)
	t2.text = _texto
	t2.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	t2.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	col.add_child(t2)
	_ficha.modulate.a = 0.0


func _process(delta: float) -> void:
	if _fin:
		return
	_t += delta


	var r: Rect2 = _prop["rect"]
	for m in _marcas:
		if not is_instance_valid(m):
			continue
		m.position.z -= V_BANDA * delta
		if m.position.z < r.position.y:
			m.position.z += r.size.y

	for i in _zzz.size():
		var z: Label3D = _zzz[i]
		if not is_instance_valid(z):
			continue
		var u: float = fmod(_t * 0.45 + float(i) / 3.0, 1.0)
		z.position.y = 0.9 + u * 0.5
		z.modulate.a = clampf(1.2 - absf(u - 0.45) * 2.6, 0.0, 1.0)



	if _kind == "tele":
		var jt: AnimatedSprite3D = _casa.get("player")
		if jt != null and is_instance_valid(jt):
			jt.modulate = _jug_mod0 * TELE_TONOS[int(_t / 0.55) % TELE_TONOS.size()]

	if _kind == "piscina" and _nado_max > _nado_min:
		var jug_n: AnimatedSprite3D = _casa.get("player")
		if jug_n != null and is_instance_valid(jug_n):
			jug_n.position.x += _nado_dir * V_NADO * delta
			if jug_n.position.x <= _nado_min:
				_nado_dir = 1.0
			elif jug_n.position.x >= _nado_max:
				_nado_dir = -1.0
			jug_n.flip_h = _nado_dir > 0.0


	if _velo != null and is_instance_valid(_velo):
		var a: float = minf(_t / _dura(), 1.0) * _velo_max
		_velo.color = Color(_velo_col.r, _velo_col.g, _velo_col.b, a)
	if _t >= _dura() and _ficha != null and is_instance_valid(_ficha):
		_ficha.modulate.a = minf((_t - DURA) / 0.22, 1.0)


func _dura() -> float:
	return duracion_test if duracion_test > 0.0 else DURA


func _on_toque(event: InputEvent) -> void:
	var toca: bool =(event is InputEventScreenTouch \
			and (event as InputEventScreenTouch).pressed) \
			or (event is InputEventMouseButton \
			and (event as InputEventMouseButton).pressed)
	if not toca:
		return
	if _t < _dura():

		_t = _dura()
		if _ficha != null and is_instance_valid(_ficha):
			_ficha.modulate.a = 1.0
		if _velo != null and is_instance_valid(_velo):
			_velo.color = Color(_velo_col.r, _velo_col.g, _velo_col.b, _velo_max)
		return
	_cerrar()





func _cerrar() -> void:
	_fin = true
	var cam: Camera3D = _casa.get("cam")
	var jug: AnimatedSprite3D = _casa.get("player")
	if cam != null and is_instance_valid(cam):
		cam.global_transform = _cam_tr
		cam.fov = _cam_fov
	if jug != null and is_instance_valid(jug):
		jug.position = _jug_pos
		jug.speed_scale = 1.0
		jug.visible = _jug_visible0
		jug.flip_h = false
		jug.modulate = _jug_mod0
		jug.process_mode = _jug_proc as Node.ProcessMode
		_casa.call("walk_play", jug, Vector3.ZERO)
	for m in _marcas:
		if is_instance_valid(m):
			m.queue_free()
	_marcas.clear()
	for e in _extras:
		if is_instance_valid(e):
			e.queue_free()
	_extras.clear()
	_zzz.clear()
	if _velo != null and is_instance_valid(_velo):
		_velo.queue_free()
	if _ficha != null and is_instance_valid(_ficha):
		_ficha.queue_free()
	_hud(true)
	get_tree().paused = false
	queue_free()










func _exit_tree() -> void:
	var arbol: SceneTree = get_tree()
	if arbol != null:
		arbol.paused = false
