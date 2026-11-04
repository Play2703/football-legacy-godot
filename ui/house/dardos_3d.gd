class_name DardosRoom3D
extends Control
































const RinconLib := preload("res://ui/house/rincon.gd")






const ANCHO: float = 4.2
const FONDO: float = 5.2



const DIANA_Y: float = 1.73

const DIANA_R: float = 0.225



const TIRADA: float = 2.37












const SALA_OJO: Vector3 = Vector3(-1.42, 1.92, -3.35)
const SALA_MIRA: Vector3 = Vector3(0.22, 1.6, 1.4)
const SALA_FOV: float = 47.0



const TIRO_X: float = -0.98








const TIRO_DIST: float = 1.45
const TIRO_OJO: Vector3 = Vector3(0.0, DIANA_Y + 0.02,
	FONDO * 0.5 - 0.02 - 0.15 - TIRO_DIST)
const TIRO_MIRA: Vector3 = Vector3(0.0, DIANA_Y, FONDO * 0.5)
const TIRO_FOV: float = 42.0




const VIAJE_SEG: float = 0.55



const APERTURA_SEG: float = 1.5






const D_CREMA: Color = Color("e8dcc0")
const D_NEGRO: Color = Color("17171a")
const D_ROJO: Color = Color("b8352f")
const D_VERDE: Color = Color("2f7d46")
const D_ALAMBRE: Color = Color("8d8d92")
const D_MADERA: Color = Color("4a3324")



const ARO_BASE_R: float = 0.038


const VUELO_SEG: float = 0.3

const ROTULO_SEG: float = 1.2

enum Fase{APERTURA, TIRANDO, VOLANDO, FIN}

var _rng: RandomNumberGenerator = RandomNumberGenerator.new()
var _fase_mira: float = 0.0
var _pulsando: bool = false
var _t_pulso: float = 0.0
var _dedo: int = -1

var _fase: int = Fase.APERTURA
var _mios: Array[Vector2] = []
var _mi_total: int = 0
var _acc: float = 0.0
var _rotulo_t: float = 0.0

var _vp: SubViewport = null
var _mundo: Node3D = null
var _cam: Camera3D = null
var _tw_cam: Tween = null

var _mira: Node3D = null

var _clavados: Node3D = null
var _volando: Node3D = null
var _vuelo_t: float = 0.0
var _vuelo_de: Vector3 = Vector3.ZERO
var _vuelo_a: Vector3 = Vector3.ZERO

var _hud: Label
var _marcador: Label
var _msg: Label
var _pie: Label
var _yo: AnimatedSprite3D = null











func _ready() -> void:
	set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	mouse_filter = Control.MOUSE_FILTER_STOP
	process_mode = Node.PROCESS_MODE_ALWAYS
	get_tree().paused = true


	add_to_group(Settings.AHORRO_HOLD_GROUP)



	Entrada.juego(self, true)
	_rng.randomize()
	_montar_mundo()
	_montar_hud()
	_refresca_hud()


	_pie.text = ""




func _montar_mundo() -> void:
	var caja: SubViewportContainer = SubViewportContainer.new()
	caja.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	caja.stretch = true


	caja.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(caja)
	_vp = SubViewport.new()
	_vp.own_world_3d = true
	_vp.transparent_bg = false
	_vp.msaa_3d = Viewport.MSAA_DISABLED
	_vp.render_target_update_mode = SubViewport.UPDATE_ALWAYS
	caja.add_child(_vp)
	_mundo = Node3D.new()
	_vp.add_child(_mundo)

	var cuarto: Dictionary = RinconLib.montar(_mundo, ANCHO, FONDO)
	var pal: Dictionary = cuarto["pal"]
	var z_fondo: float = float(cuarto["z_fondo"])


	RinconLib.alfombra(_mundo, Vector2(0.0, z_fondo - TIRADA - 0.25),
		Vector2(2.8, 1.8), pal)
	RinconLib.lampara(_mundo, Vector2(ANCHO * 0.5 - 0.55, z_fondo - 0.75), pal)

	_montar_diana(z_fondo, pal)




	_yo = RinconLib.jugador("north")
	_yo.position = Vector3(TIRO_X, RinconLib.altura_pies(_yo.pixel_size),
		z_fondo - TIRADA)
	_mundo.add_child(_yo)

	_clavados = Node3D.new()
	_mundo.add_child(_clavados)
	_montar_mira()
	_montar_camara()















func _montar_diana(z_fondo: float, pal: Dictionary) -> void:
	var z: float = z_fondo - 0.02
	var raiz: Node3D = Node3D.new()
	_mundo.add_child(raiz)


	var madera: Color = pal.get("trim", D_MADERA)

	var fondo_mueble: float = 0.15
	var z_cara: float = z - fondo_mueble
	RinconLib.caja(raiz, Vector3(0.0, DIANA_Y, z - fondo_mueble * 0.5),
		Vector3(DIANA_R * 2.2, DIANA_R * 2.5, fondo_mueble), madera)







	var hoja_w: float = DIANA_R * 1.1
	var hoja_h: float = DIANA_R * 2.35
	for s in [-1.0, 1.0]:
		var hx: float = s * DIANA_R * 1.65
		RinconLib.caja(raiz, Vector3(hx, DIANA_Y, z - 0.045),
			Vector3(hoja_w, hoja_h, 0.09), madera.lightened(0.1))

		var pz: float = z - 0.092
		RinconLib.caja(raiz, Vector3(hx, DIANA_Y, pz),
			Vector3(hoja_w * 0.82, hoja_h * 0.88, 0.006), Color("232a26"))



		RinconLib.caja(raiz, Vector3(hx, DIANA_Y, pz - 0.004),
			Vector3(0.0035, hoja_h * 0.74, 0.002), Color("cfd6cf"))
		var largos: Array = [0.62, 0.48, 0.7, 0.4, 0.55]
		for i in largos.size():
			var yy: float = DIANA_Y + hoja_h *(0.32 - 0.115 * float(i))
			for lado in [-1.0, 1.0]:
				var ancho: float = hoja_w * 0.33 * float(largos[i])
				RinconLib.caja(raiz,
					Vector3(hx + lado * hoja_w * 0.19, yy, pz - 0.004),
					Vector3(ancho, 0.0025, 0.002), Color("cfd6cf", 0.75))


	var n: int = Dardos.SECTORES.size()
	var paso: float = TAU / float(n)


	_disco(raiz, z_cara - 0.002, DIANA_R * 1.06, D_NEGRO)
	for i in n:
		var a0: float = float(i) * paso - paso * 0.5



		var par: bool = i % 2 == 0
		var liso: Color = D_NEGRO if par else D_CREMA
		var aro: Color = D_ROJO if par else D_VERDE
		_cuna(raiz, z_cara - 0.006, a0, paso,
			Dardos.BULL_FUERA, Dardos.TRIPLE_DE, liso)
		_cuna(raiz, z_cara - 0.006, a0, paso,
			Dardos.TRIPLE_DE, Dardos.TRIPLE_A, aro)
		_cuna(raiz, z_cara - 0.006, a0, paso,
			Dardos.TRIPLE_A, Dardos.DOBLE_DE, liso)
		_cuna(raiz, z_cara - 0.006, a0, paso, Dardos.DOBLE_DE, 1.0, aro)
	_disco(raiz, z_cara - 0.01, DIANA_R * Dardos.BULL_FUERA, D_VERDE)
	_disco(raiz, z_cara - 0.013, DIANA_R * Dardos.BULL_DENTRO, D_ROJO)


	for i2 in n:
		var a: float =(float(i2) - 0.5) * paso
		var u: Vector2 = Vector2(ESPEJO_X * sin(a), cos(a))
		var r0: float = DIANA_R * Dardos.BULL_FUERA
		var largo: float = DIANA_R - r0
		var med: float = r0 + largo * 0.5
		var alambre: MeshInstance3D = RinconLib.caja(raiz,
			Vector3(u.x * med, DIANA_Y + u.y * med, z_cara - 0.011),
			Vector3(0.004, largo, 0.004), D_ALAMBRE)




		alambre.rotation.z = a




	for rr in [Dardos.BULL_FUERA, Dardos.TRIPLE_DE, Dardos.TRIPLE_A,
			Dardos.DOBLE_DE, 1.0]:
		var aro_m: MeshInstance3D = MeshInstance3D.new()
		var tm2: TorusMesh = TorusMesh.new()
		tm2.inner_radius = DIANA_R * float(rr) - 0.0022
		tm2.outer_radius = DIANA_R * float(rr) + 0.0022
		tm2.rings = 40
		tm2.ring_segments = 5
		tm2.material = RinconLib.mat(D_ALAMBRE, 0.45)
		aro_m.mesh = tm2
		aro_m.position = Vector3(0.0, DIANA_Y, z_cara - 0.011)
		aro_m.rotate_x(deg_to_rad(90.0))
		raiz.add_child(aro_m)



	var corona: MeshInstance3D = MeshInstance3D.new()
	var cm2: TorusMesh = TorusMesh.new()
	cm2.inner_radius = DIANA_R * 1.005
	cm2.outer_radius = DIANA_R * 1.235
	cm2.rings = 48
	cm2.ring_segments = 6
	cm2.material = RinconLib.mat(D_NEGRO.lightened(0.06))
	corona.mesh = cm2
	corona.position = Vector3(0.0, DIANA_Y, z_cara - 0.007)
	corona.rotate_x(deg_to_rad(90.0))
	raiz.add_child(corona)


	for i3 in n:
		var a2: float = float(i3) * paso
		var u2: Vector2 = Vector2(ESPEJO_X * sin(a2), cos(a2))
		var lbl: Label3D = Label3D.new()
		lbl.text = str(Dardos.SECTORES[i3])
		lbl.font_size = 48




		lbl.pixel_size = 0.00045
		lbl.modulate = D_CREMA
		lbl.outline_size = 10
		lbl.outline_modulate = Color(0, 0, 0, 0.9)




		lbl.position = Vector3(u2.x * DIANA_R * 1.12,
			DIANA_Y + u2.y * DIANA_R * 1.12, z_cara - 0.04)



		lbl.rotation.y = PI
		raiz.add_child(lbl)



func _disco(padre: Node3D, z: float, radio: float, col: Color) -> MeshInstance3D:
	var m: MeshInstance3D = MeshInstance3D.new()
	var cm: CylinderMesh = CylinderMesh.new()
	cm.top_radius = radio
	cm.bottom_radius = radio
	cm.height = 0.006
	cm.radial_segments = 28
	cm.rings = 0
	cm.material = RinconLib.mat(col)
	m.mesh = cm
	m.position = Vector3(0.0, DIANA_Y, z)
	m.rotate_x(deg_to_rad(90.0))
	padre.add_child(m)
	return m






func _cuna(padre: Node3D, z: float, a0: float, paso: float,
		r0: float, r1: float, col: Color) -> void:
	var pasos: int = 3
	var pts: PackedVector3Array = PackedVector3Array()
	var idx: PackedInt32Array = PackedInt32Array()
	for i in pasos + 1:
		var a: float = a0 + paso * float(i) / float(pasos)
		var u: Vector2 = Vector2(ESPEJO_X * sin(a), cos(a))
		pts.append(Vector3(u.x * DIANA_R * r0, DIANA_Y + u.y * DIANA_R * r0, z))
		pts.append(Vector3(u.x * DIANA_R * r1, DIANA_Y + u.y * DIANA_R * r1, z))
	for i2 in pasos:
		var b: int = i2 * 2

		idx.append_array([b, b + 1, b + 3, b, b + 3, b + 2])
	var arr: Array = []
	arr.resize(Mesh.ARRAY_MAX)
	arr[Mesh.ARRAY_VERTEX] = pts
	arr[Mesh.ARRAY_INDEX] = idx
	var malla: ArrayMesh = ArrayMesh.new()
	malla.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arr)
	var m: MeshInstance3D = MeshInstance3D.new()
	m.mesh = malla
	var mat: StandardMaterial3D = RinconLib.mat(col)


	mat.cull_mode = BaseMaterial3D.CULL_DISABLED
	m.material_override = mat
	padre.add_child(m)



func _montar_mira() -> void:
	_mira = Node3D.new()
	var aro: MeshInstance3D = MeshInstance3D.new()
	var tm: TorusMesh = TorusMesh.new()
	tm.inner_radius = ARO_BASE_R * 0.74
	tm.outer_radius = ARO_BASE_R
	tm.rings = 20
	tm.ring_segments = 8
	var mat: StandardMaterial3D = RinconLib.mat(CareerTheme.TEXT)


	mat.emission_enabled = true
	mat.emission = CareerTheme.TEXT
	mat.emission_energy_multiplier = 0.85
	tm.material = mat
	aro.mesh = tm
	aro.rotate_x(deg_to_rad(90.0))
	_mira.add_child(aro)



	_mira.visible = false
	_mundo.add_child(_mira)


func _montar_camara() -> void:
	_cam = Camera3D.new()



	_cam.fov = SALA_FOV
	_cam.near = 0.05
	_cam.position = SALA_OJO
	_cam.look_at_from_position(SALA_OJO, SALA_MIRA, Vector3.UP)
	_vp.add_child(_cam)





func _viaje_camara(a_tiro: bool) -> void:
	if _tw_cam != null and _tw_cam.is_valid():
		_tw_cam.kill()
	var ojo: Vector3 = TIRO_OJO if a_tiro else SALA_OJO
	var mira: Vector3 = TIRO_MIRA if a_tiro else SALA_MIRA
	var fov: float = TIRO_FOV if a_tiro else SALA_FOV
	var de_ojo: Vector3 = _cam.position
	var de_fov: float = _cam.fov
	_tw_cam = create_tween()
	_tw_cam.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
	_tw_cam.tween_method(
		func(t: float) -> void:
			var p: Vector3 = de_ojo.lerp(ojo, t)
			_cam.fov = lerpf(de_fov, fov, t)
			_cam.look_at_from_position(p, mira, Vector3.UP),
		0.0, 1.0, VIAJE_SEG)




func _montar_hud() -> void:
	var top: MarginContainer = MarginContainer.new()
	top.mouse_filter = Control.MOUSE_FILTER_IGNORE
	top.set_anchors_preset(Control.PRESET_TOP_WIDE)
	for side in ["left", "right", "top"]:
		top.add_theme_constant_override("margin_" + side, 30)
	add_child(top)
	CareerUi.apply_safe_area(top, get_viewport())
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 6)
	col.mouse_filter = Control.MOUSE_FILTER_IGNORE
	top.add_child(col)
	CareerUi.back_button(col, _close)
	_hud = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
	RinconLib.rotula(_hud)
	col.add_child(_hud)
	_marcador = CareerUi.plain(CareerTheme.T_MONEY, CareerTheme.TEXT)

	_marcador.clip_text = true
	RinconLib.rotula(_marcador)
	col.add_child(_marcador)



	var bot: MarginContainer = MarginContainer.new()
	bot.mouse_filter = Control.MOUSE_FILTER_IGNORE
	bot.set_anchors_preset(Control.PRESET_BOTTOM_WIDE)



	bot.grow_vertical = Control.GROW_DIRECTION_BEGIN
	for side2 in ["left", "right", "bottom"]:
		bot.add_theme_constant_override("margin_" + side2, 30)
	add_child(bot)
	CareerUi.apply_safe_area(bot, get_viewport())
	var bcol: VBoxContainer = VBoxContainer.new()
	bcol.add_theme_constant_override("separation", 10)
	bcol.mouse_filter = Control.MOUSE_FILTER_IGNORE
	bot.add_child(bcol)
	_msg = CareerUi.plain(CareerTheme.T_HEAD, CareerTheme.MONEY)
	_msg.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_msg.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_msg.custom_minimum_size = Vector2(0, 88)
	_msg.vertical_alignment = VERTICAL_ALIGNMENT_BOTTOM
	RinconLib.rotula(_msg)


	_msg.add_to_group(Entrada.VIVO_GROUP)
	bcol.add_child(_msg)
	_pie = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT_DIM)
	_pie.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_pie.clip_text = true
	RinconLib.rotula(_pie)
	bcol.add_child(_pie)


func _refresca_hud() -> void:
	var visita: int = mini(_mios.size() / Dardos.DARDOS_VISITA + 1, Dardos.VISITAS)
	_hud.text = I18n.tf("VISITA {0} DE {1}", [visita, Dardos.VISITAS])
	_marcador.text = I18n.tf("PUNTOS {0}   ·   RECORD {1}",
		[_mi_total, maxi(Settings.dardos_best, _mi_total)])
	if _fase == Fase.TIRANDO and not _pulsando:
		_pie.text = I18n.t("MANTEN PULSADO")




func _process(delta: float) -> void:
	if _rotulo_t > 0.0:
		_rotulo_t -= delta
		if _rotulo_t <= 0.0 and _fase == Fase.TIRANDO:
			_msg.text = ""
	match _fase:
		Fase.APERTURA:


			_acc += delta
			if _acc >= APERTURA_SEG:
				_arranca_tanda()
		Fase.TIRANDO:
			var f: float = 1.0
			if _pulsando:
				_t_pulso += delta
				f = Dardos.frenado(_t_pulso)
				if Dardos.temblando(_t_pulso):
					_msg.text = I18n.t("¡SE TE FUE LA MANO!")
					_msg.add_theme_color_override("font_color", CareerTheme.DANGER)
					_rotulo_t = ROTULO_SEG
			_fase_mira += Dardos.VEL_LIBRE * f * delta
			_pinta_mira()
		Fase.VOLANDO:
			_vuelo_t += delta / VUELO_SEG
			if _vuelo_t >= 1.0:
				_aterriza()
			elif _volando != null:



				var p: Vector3 = _vuelo_de.lerp(_vuelo_a, _vuelo_t)
				p.y += sin(_vuelo_t * PI) * 0.16
				_volando.position = p



func _arranca_tanda() -> void:
	_fase = Fase.TIRANDO
	_acc = 0.0
	_viaje_camara(true)
	_refresca_hud()








const Z_MUEBLE: float = 0.15










const ESPEJO_X: float = -1.0






const Z_CARA: float = FONDO * 0.5 - 0.02 - Z_MUEBLE


func _punto_diana(p: Vector2, hacia_camara: float) -> Vector3:
	return Vector3(ESPEJO_X * p.x * DIANA_R, DIANA_Y - p.y * DIANA_R,
		Z_CARA - hacia_camara)


func _pinta_mira() -> void:
	if _mira == null:
		return
	_mira.visible = true
	_mira.position = _punto_diana(Dardos.mira(_fase_mira), 0.05)
	var mal: bool = _pulsando and Dardos.temblando(_t_pulso)
	var aro: MeshInstance3D = _mira.get_child(0)
	var mat: StandardMaterial3D =(aro.mesh as TorusMesh).material
	var col: Color = CareerTheme.DANGER if mal else CareerTheme.TEXT
	mat.albedo_color = col
	mat.emission = col







	var disp: float = Dardos.dispersion(_t_pulso) if _pulsando \
			else Dardos.DISPERSION_BASE


	var radio: float = maxf(disp * DIANA_R, 0.03)
	var k: float = radio / ARO_BASE_R
	_mira.scale = Vector3(k, k, k)







func _gui_input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		var t: InputEventScreenTouch = event
		if t.pressed:
			_aprieta(t.index)
		elif t.index == _dedo:
			_suelta()
	elif event is InputEventMouseButton:
		var mb: InputEventMouseButton = event
		if mb.button_index != MOUSE_BUTTON_LEFT:
			return
		if mb.pressed:
			_aprieta(0)
		else:
			_suelta()


func _aprieta(id: int) -> void:
	if _fase == Fase.FIN:
		_reinicia()
		return
	if _fase == Fase.APERTURA:


		_arranca_tanda()
		return
	if _fase != Fase.TIRANDO or _pulsando:
		return
	_dedo = id
	_pulsando = true
	_t_pulso = 0.0
	_msg.text = ""
	_pie.text = I18n.t("SUELTA PARA TIRAR")


func _suelta() -> void:
	if not _pulsando or _fase != Fase.TIRANDO:
		return
	_pulsando = false
	_dedo = -1
	var centro: Vector2 = Dardos.mira(_fase_mira)
	var p: Vector2 = Dardos.tiro(centro, Dardos.dispersion(_t_pulso), _rng)
	_mios.append(p)



	_vuelo_de = _yo.position + Vector3(0.22, 0.32, 0.08)
	_vuelo_a = _punto_diana(p, 0.035)
	_volando = _nuevo_dardo(CareerTheme.accent())
	_volando.position = _vuelo_de
	_mundo.add_child(_volando)
	_vuelo_t = 0.0
	_fase = Fase.VOLANDO
	_mira.visible = false
	_pie.text = ""



func _aterriza() -> void:
	var p: Vector2 = _mios[_mios.size() - 1]
	if _volando != null:
		_volando.position = _vuelo_a
		_volando.reparent(_clavados, true)
		_volando = null
	var et: Dictionary = Dardos.etiqueta(p)
	_mi_total += int(et["puntos"])


	var clave: String = String(et["clave"])
	if clave == "{0}":
		_msg.text = str(et["n"])
	elif clave.contains("{0}"):
		_msg.text = I18n.tf(clave, [et["n"]])
	else:
		_msg.text = I18n.t(clave)
	_msg.add_theme_color_override("font_color",
		CareerTheme.DANGER if int(et["puntos"]) == 0 else CareerTheme.MONEY)
	_rotulo_t = ROTULO_SEG
	if int(et["puntos"]) > 0:
		UiAudio.click()
	else:
		UiAudio.deny()




	if Dardos.es_diana(p):
		Achievements.ingest_bullseye()
	_t_pulso = 0.0
	_refresca_hud()
	if _mios.size() >= Dardos.TIROS:
		_termina()
		return
	_fase = Fase.TIRANDO
	_pinta_mira()








const DARDO_CAIDA: float = 20.0
const DARDO_GIRO: float = 14.0


func _nuevo_dardo(col: Color) -> Node3D:
	var d: Node3D = Node3D.new()
	d.rotation = Vector3(deg_to_rad(- DARDO_CAIDA), deg_to_rad(DARDO_GIRO), 0.0)
	RinconLib.caja(d, Vector3(0.0, 0.0, -0.035), Vector3(0.006, 0.006, 0.07),
		Color("c9ccd0"))
	RinconLib.caja(d, Vector3(0.0, 0.0, -0.1), Vector3(0.016, 0.016, 0.06), col)



	var claro: Color = col.lightened(0.3)
	RinconLib.caja(d, Vector3(0.0, 0.0, -0.16), Vector3(0.045, 0.004, 0.05), claro)
	RinconLib.caja(d, Vector3(0.0, 0.0, -0.16), Vector3(0.004, 0.045, 0.05), claro)
	return d




func _termina() -> void:
	_fase = Fase.FIN
	_pulsando = false
	_rotulo_t = 99.0
	_mira.visible = false
	_viaje_camara(false)
	var record: bool = Settings.set_dardos_best(_mi_total)
	_msg.text = I18n.tf("¡RECORD! · {0}", [_mi_total]) if record \
			else I18n.tf("SE ACABO · {0}", [_mi_total])
	_msg.add_theme_color_override("font_color", CareerTheme.MONEY)
	if record:
		UiAudio.fanfare(0)
	_msg.text += "\n" + Entrada.texto_f("TOCA PARA OTRA", "PULSA {0} PARA OTRA",
		[], [Entrada.boton("fl_avanza")])
	_refresca_hud()


func _reinicia() -> void:
	for d in _clavados.get_children():
		d.queue_free()
	_mios.clear()
	_mi_total = 0
	_rotulo_t = 0.0
	_t_pulso = 0.0
	_msg.text = ""
	_arranca_tanda()








func _unhandled_input(event: InputEvent) -> void:
	if not (event is InputEventJoypadButton):
		return
	if not (event.is_action("fl_avanza") or event.is_action("fl_toque")):
		return
	get_viewport().set_input_as_handled()
	if (event as InputEventJoypadButton).pressed:
		_aprieta(-2)
	else:
		_suelta()


func _unhandled_key_input(event: InputEvent) -> void:
	if not (event is InputEventKey):
		return
	var k: InputEventKey = event
	if k.keycode == KEY_ESCAPE and k.pressed:
		_close()
	elif k.keycode == KEY_SPACE:
		if k.pressed:
			_aprieta(0)
		else:
			_suelta()


func _close() -> void:
	get_tree().paused = false
	queue_free()










func _exit_tree() -> void:
	var arbol: SceneTree = get_tree()
	if arbol != null:
		arbol.paused = false
