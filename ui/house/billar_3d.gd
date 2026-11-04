class_name BillarRoom3D
extends Control




































const RinconLib := preload("res://ui/house/rincon.gd")






const ANCHO: float = 4.4
const FONDO: float = 5.6




const PANO_Y: float = 0.78

const BANDA_W: float = 0.1
const BANDA_H: float = 0.075
const PATA: float = 0.11



const MESA_Z: float = 0.55








































const PICADO: float = 16.0









const FOV: float = 45.0


const MARGEN: float = 0.9






const MECIDA: float = 0.025





const M_PANO: Color = Color("1f6b40")
const M_MADERA: Color = Color("46281a")
const M_TRONERA: Color = Color("0b0b0d")
const M_BLANCA: Color = Color("f2efe6")
const M_NEGRA: Color = Color("17171a")




const M_COLORES: Array = [
	Color("e8c24a"), Color("2f5fc0"), Color("c0392b"), Color("7d3c98"),
	Color("d4762a"), Color("2f7d46"), Color("8e3b2f"),
]



const M_GUIA: Color = Color("f4f1ec")



const RIVAL_PIENSA: float = 0.65
const ROTULO_SEG: float = 1.8




const TACO_LARGO: float = 1.15
const TACO_PICO_MIN: float = 0.122
const TACO_PICO_MAX: float = 1.012




const TIRON_MAX: float = 0.85
const TIRON_MIN: float = 0.06










const DEDO_MANDO: int = -2
const MANDO_ZM: float = 0.35
const MANDO_CARGA_S: float = 1.0


const MANDO_GIRO_FINO: float = 0.1

enum Fase{TU_TIRO, APUNTANDO, RODANDO, RIVAL, FIN}

var _rival: Dictionary = {}
var _por_premio: bool = false

var _rng: RandomNumberGenerator = RandomNumberGenerator.new()
var _bolas: Array = []
var _tiro: Dictionary = {}
var _fase: int = Fase.TU_TIRO
var _mi_grupo: int = Billar.GRUPO_NINGUNO
var _su_grupo: int = Billar.GRUPO_NINGUNO
var _me_toca: bool = true
var _acc: float = 0.0
var _rotulo_t: float = 0.0
var _gane: bool = false
var _t: float = 0.0

var _dedo: int = -1
var _arr_de: Vector2 = Vector2.ZERO
var _arr_a: Vector2 = Vector2.ZERO


var _mando_dir: Vector2 = Vector2.ZERO
var _carga: float = -1.0


var _mando_listo: bool = false

var _vp: SubViewport = null
var _mundo: Node3D = null
var _cam: Camera3D = null



var _cuarto: Dictionary = {}


var _ojo_now: Vector3 = Vector3.ZERO
var _mira_now: Vector3 = Vector3.ZERO



var _arriba_now: Vector3 = Vector3.BACK


var _nodos: Array = []
var _guia: Node3D = null

var _hud: Label
var _marcador: Label
var _msg: Label
var _pie: Label


func abrir(rival: Dictionary, por_premio: bool) -> void:
	_rival = rival
	_por_premio = por_premio and not rival.is_empty()


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
	_nueva_partida()




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

	_cuarto = RinconLib.montar(_mundo, ANCHO, FONDO)
	var pal: Dictionary = _cuarto["pal"]








	RinconLib.lampara(_mundo, Vector2(1.45, MESA_Z + 1.6), pal)
	_montar_mesa()





	_guia = Node3D.new()
	_mundo.add_child(_guia)
	_cam = Camera3D.new()



	_cam.near = 0.05
	_pon_camara()
	_cam.look_at_from_position(_ojo_now, _mira_now, _arriba_now)
	_vp.add_child(_cam)



























static func encuadre(asp: float) -> Dictionary:
	var hx: float = Billar.ANCHO * 0.5 + BANDA_W
	var hz: float = Billar.LARGO * 0.5 + BANDA_W
	var y_pano: float = PANO_Y + BANDA_H
	var pic: float = deg_to_rad(PICADO)
	var tv: float = tan(deg_to_rad(FOV) * 0.5)
	var th: float = tv * maxf(asp, 0.05)





	var f: Vector3 = Vector3(0.0, - cos(pic), sin(pic))
	var u: Vector3 = Vector3(0.0, sin(pic), cos(pic))
	var centro: Vector3 = Vector3(0.0, y_pano, MESA_Z)

	var dist: float = maxf(hz /(MARGEN * tv), hx /(MARGEN * th))
	for _i in 5:
		var ojo_i: Vector3 = centro - f * dist
		var peor: float = 0.0
		for sx in [-1.0, 1.0]:
			for sz in [-1.0, 1.0]:
				var d: Vector3 = Vector3(sx * hx, y_pano,
					MESA_Z + sz * hz) - ojo_i
				var prof: float = maxf(d.dot(f), 0.1)
				peor = maxf(peor, absf(d.x) / prof / th)
				peor = maxf(peor, absf(d.dot(u)) / prof / tv)



		dist *= maxf(peor / MARGEN, 0.5)
	return {"ojo": centro - f * dist, "mira": centro, "fov": FOV, "up": u}











func _pon_camara() -> void:
	if _cam == null:
		return
	var asp: float = UiKit.lienzo().x / UiKit.lienzo().y
	if _vp != null and _vp.size.y > 0:
		asp = float(_vp.size.x) / float(_vp.size.y)
	var e: Dictionary = encuadre(asp)
	_ojo_now = e["ojo"]
	_mira_now = e["mira"]
	_arriba_now = e["up"]
	_cam.fov = float(e["fov"])



















func _montar_mesa() -> void:
	var l: float = Billar.LARGO
	var w: float = Billar.ANCHO
	var raiz: Node3D = Node3D.new()
	raiz.position = Vector3(0.0, 0.0, MESA_Z)
	_mundo.add_child(raiz)
	_patas(raiz, l, w)



	RinconLib.caja(raiz, Vector3(0.0, PANO_Y - 0.08, 0.0),
		Vector3(w + BANDA_W * 2.0, 0.14, l + BANDA_W * 2.0), M_MADERA)
	RinconLib.caja(raiz, Vector3(0.0, PANO_Y - 0.185, 0.0),
		Vector3(w + BANDA_W * 1.5, 0.075, l + BANDA_W * 1.5),
		M_MADERA.darkened(0.22))





	RinconLib.caja(raiz, Vector3(0.0, PANO_Y + 0.002, 0.0),
		Vector3(w, 0.012, l), M_PANO)
	_marcas_pano(raiz, l, w)
	_bandas(raiz, l, w)
	_bocas(raiz)





func _patas(raiz: Node3D, l: float, w: float) -> void:
	var alto: float = PANO_Y - 0.22
	for sx in [-1.0, 1.0]:
		for sz in [-1.0, 1.0]:
			var x: float = sx *(w * 0.5 - 0.1)
			var z: float = sz *(l * 0.5 - 0.16)
			RinconLib.caja(raiz, Vector3(x, 0.025, z),
				Vector3(PATA * 1.45, 0.05, PATA * 1.45), M_MADERA.darkened(0.32))
			RinconLib.caja(raiz, Vector3(x, 0.05 + alto * 0.5, z),
				Vector3(PATA, alto, PATA), M_MADERA.darkened(0.2))
			RinconLib.caja(raiz, Vector3(x, 0.05 + alto + 0.035, z),
				Vector3(PATA * 1.3, 0.07, PATA * 1.3), M_MADERA.darkened(0.1))







func _marcas_pano(raiz: Node3D, l: float, _w: float) -> void:
	var y: float = PANO_Y + 0.009
	var tenue: Color = M_PANO.lightened(0.16)
	RinconLib.caja(raiz, Vector3(0.0, y, - l * 0.25),
		Vector3(Billar.ANCHO, 0.002, 0.006), tenue)
	for z in [- l * 0.25, l * 0.25]:
		var punto: MeshInstance3D = MeshInstance3D.new()
		var cm: CylinderMesh = CylinderMesh.new()
		cm.top_radius = 0.011
		cm.bottom_radius = 0.011
		cm.height = 0.002
		cm.radial_segments = 10
		cm.rings = 0
		cm.material = RinconLib.mat(M_BLANCA.darkened(0.15))
		punto.mesh = cm
		punto.position = Vector3(0.0, y + 0.001, z)
		raiz.add_child(punto)









func _bandas(raiz: Node3D, l: float, w: float) -> void:
	var goma_h: float = BANDA_H * 0.62
	var goma_y: float = PANO_Y + goma_h * 0.5
	var tapa_y: float = PANO_Y + goma_h + 0.018




	var goma: Color = M_PANO.darkened(0.34)
	var tapa: Color = M_MADERA.lightened(0.12)

	for sx in [-1.0, 1.0]:
		RinconLib.caja(raiz, Vector3(sx *(w * 0.5 + BANDA_W * 0.28), goma_y, 0.0),
			Vector3(BANDA_W * 0.56, goma_h, l - Billar.TRONERA_R * 2.0), goma)
	for sz in [-1.0, 1.0]:
		RinconLib.caja(raiz, Vector3(0.0, goma_y, sz *(l * 0.5 + BANDA_W * 0.28)),
			Vector3(w - Billar.TRONERA_R * 2.0, goma_h, BANDA_W * 0.56), goma)

	for sx2 in [-1.0, 1.0]:
		RinconLib.caja(raiz,
			Vector3(sx2 *(w * 0.5 + BANDA_W * 0.5), tapa_y, 0.0),
			Vector3(BANDA_W * 1.05, 0.036, l + BANDA_W * 2.0), tapa)
	for sz2 in [-1.0, 1.0]:
		RinconLib.caja(raiz,
			Vector3(0.0, tapa_y, sz2 *(l * 0.5 + BANDA_W * 0.5)),
			Vector3(w + BANDA_W * 2.0, 0.036, BANDA_W * 1.05), tapa)




	var dy: float = tapa_y + 0.019
	for i in range(1, 4):
		var z: float = l * 0.5 *(float(i) / 4.0)
		for sz3 in [-1.0, 1.0]:
			for sx3 in [-1.0, 1.0]:
				_diamante(raiz, Vector3(sx3 *(w * 0.5 + BANDA_W * 0.52), dy,
					sz3 * z))
	for j in range(1, 4):
		var x: float = w * 0.5 *(float(j) / 2.0) - w * 0.5
		if is_zero_approx(x):
			x = 0.0
		for sz4 in [-1.0, 1.0]:
			_diamante(raiz, Vector3(x, dy, sz4 *(l * 0.5 + BANDA_W * 0.52)))




func _diamante(raiz: Node3D, at: Vector3) -> void:
	var d: MeshInstance3D = RinconLib.caja(raiz, at, Vector3(0.019, 0.003, 0.019),
		Color("e8e2d2"))
	d.rotation.y = PI * 0.25







func _bocas(raiz: Node3D) -> void:
	for t in Billar.troneras():
		var at: Vector3 = Vector3(t.y, PANO_Y + 0.012, t.x)


		var aro: MeshInstance3D = MeshInstance3D.new()
		var am: CylinderMesh = CylinderMesh.new()
		am.top_radius = Billar.TRONERA_R * 1.32
		am.bottom_radius = Billar.TRONERA_R * 1.32
		am.height = 0.006
		am.radial_segments = 16
		am.rings = 0
		am.material = RinconLib.mat(Color("9a7b46"), 0.55)
		aro.mesh = am


		aro.position = at + Vector3(0.0, -0.003, 0.0)
		raiz.add_child(aro)
		var m: MeshInstance3D = MeshInstance3D.new()
		var cm: CylinderMesh = CylinderMesh.new()
		cm.top_radius = Billar.TRONERA_R
		cm.bottom_radius = Billar.TRONERA_R * 0.7
		cm.height = 0.05
		cm.radial_segments = 14
		cm.rings = 0
		cm.material = RinconLib.mat(M_TRONERA)
		m.mesh = cm



		m.position = at + Vector3(0.0, -0.022, 0.0)
		raiz.add_child(m)


		var red: MeshInstance3D = MeshInstance3D.new()
		var rm: CylinderMesh = CylinderMesh.new()
		rm.top_radius = Billar.TRONERA_R * 0.95
		rm.bottom_radius = Billar.TRONERA_R * 0.55
		rm.height = 0.1
		rm.radial_segments = 12
		rm.rings = 0
		rm.material = RinconLib.mat(Color("3a2a1c"), 0.9)
		red.mesh = rm
		red.position = at + Vector3(0.0, -0.075, 0.0)
		raiz.add_child(red)





func _a_mundo(p: Vector2) -> Vector3:
	return Vector3(p.y, PANO_Y + Billar.BOLA_R, MESA_Z + p.x)















func _a_pano(pantalla: Vector2) -> Vector2:
	if _cam == null:
		return Vector2.ZERO


	var esc: Vector2 = Vector2(_vp.size) / size
	var en_vp: Vector2 = pantalla * esc
	var o: Vector3 = _cam.project_ray_origin(en_vp)
	var d: Vector3 = _cam.project_ray_normal(en_vp)
	var y: float = PANO_Y + Billar.BOLA_R
	var k: float = 25.0
	if d.y < -0.001:
		k = minf((y - o.y) / d.y, 25.0)
	var h: Vector3 = o + d * k
	return Vector2(h.z - MESA_Z, h.x)




func _nueva_partida() -> void:
	for n in _nodos:
		(n as Node3D).queue_free()
	_nodos = []
	_bolas = Billar.saque(_rng)
	_tiro = Billar.nuevo_tiro()
	_mi_grupo = Billar.GRUPO_NINGUNO
	_su_grupo = Billar.GRUPO_NINGUNO
	_me_toca = true
	_fase = Fase.TU_TIRO
	_gane = false
	_rotulo_t = 0.0
	_msg.text = ""
	_mando_dir = Vector2.ZERO
	_pie.text = _pie_tiro()
	for b in _bolas:
		_nodos.append(_nueva_bola(int((b as Dictionary)["n"])))
	_coloca()
	_refresca_hud()




const FUENTE: Font = preload("res://assets/fonts/PressStart2P-Regular.ttf")


















func _nueva_bola(n: int) -> Node3D:
	var raiz: Node3D = Node3D.new()
	var esf: MeshInstance3D = MeshInstance3D.new()
	esf.name = "Rueda"
	var sm: SphereMesh = SphereMesh.new()
	sm.radius = Billar.BOLA_R
	sm.height = Billar.BOLA_R * 2.0
	sm.radial_segments = 12
	sm.rings = 6
	var col: Color = M_BLANCA
	if n == Billar.NEGRA:
		col = M_NEGRA
	elif n != Billar.BLANCA:
		col = M_COLORES[(n - 1) % 7]
	if Billar.grupo_de(n) == Billar.GRUPO_RAYADAS:

		sm.material = RinconLib.mat(M_BLANCA, 0.35)
		var cint: MeshInstance3D = MeshInstance3D.new()
		var cm: CylinderMesh = CylinderMesh.new()
		cm.top_radius = Billar.BOLA_R * 1.005
		cm.bottom_radius = Billar.BOLA_R * 1.005
		cm.height = Billar.BOLA_R * 1.05
		cm.radial_segments = 12
		cm.rings = 0
		cm.material = RinconLib.mat(col, 0.35)
		cint.mesh = cm
		esf.add_child(cint)
	else:
		sm.material = RinconLib.mat(col, 0.35)
	esf.mesh = sm
	raiz.add_child(esf)


	if n != Billar.BLANCA:
		var num: Label3D = Label3D.new()
		num.text = str(n)
		num.font = FUENTE
		num.font_size = 64
		num.pixel_size = 0.00042
		num.billboard = BaseMaterial3D.BILLBOARD_ENABLED
		num.no_depth_test = false
		num.modulate = M_BLANCA if n == Billar.NEGRA else Color("17171a")
		num.outline_size = 14
		num.outline_modulate = Color(1, 1, 1, 0.85) if n != Billar.NEGRA \
				else Color(0, 0, 0, 0.85)
		num.position = Vector3(0.0, Billar.BOLA_R * 1.55, 0.0)
		raiz.add_child(num)


	var sombra: MeshInstance3D = MeshInstance3D.new()
	var smm: CylinderMesh = CylinderMesh.new()
	smm.top_radius = Billar.BOLA_R * 1.02
	smm.bottom_radius = Billar.BOLA_R * 1.02
	smm.height = 0.001
	smm.radial_segments = 12
	smm.rings = 0
	var mat_s: StandardMaterial3D = RinconLib.mat(Color(0.0, 0.0, 0.0, 0.32))
	mat_s.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	mat_s.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	smm.material = mat_s
	sombra.mesh = smm
	sombra.position = Vector3(0.0, - Billar.BOLA_R + 0.0015, - Billar.BOLA_R * 0.62)
	raiz.add_child(sombra)
	_mundo.add_child(raiz)
	return raiz






func _rueda(delta: float) -> void:
	for i in _bolas.size():
		var d: Dictionary = _bolas[i]
		if not bool(d["viva"]):
			continue
		var v: Vector2 = d["v"]
		if v == Vector2.ZERO:
			continue


		var vm: Vector3 = Vector3(v.y, 0.0, v.x)
		var eje: Vector3 = Vector3(vm.z, 0.0, - vm.x).normalized()
		var esf: Node3D =(_nodos[i] as Node3D).get_node("Rueda")
		esf.rotate(eje, vm.length() * delta / Billar.BOLA_R)





func _coloca() -> void:
	for i in _bolas.size():
		var d: Dictionary = _bolas[i]
		var n: Node3D = _nodos[i]
		n.visible = bool(d["viva"])
		if n.visible:
			n.position = _a_mundo(d["p"])




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
	_hud.clip_text = true
	RinconLib.rotula(_hud)
	col.add_child(_hud)
	_marcador = CareerUi.plain(CareerTheme.T_HEAD, CareerTheme.TEXT)
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
	_pie.add_to_group(Entrada.VIVO_GROUP)
	RinconLib.rotula(_pie)
	bcol.add_child(_pie)


func _refresca_hud() -> void:


	if _mi_grupo == Billar.GRUPO_NINGUNO:
		_hud.text = I18n.t("MESA ABIERTA")
	else:
		var mias: int = Billar.vivas_de(_bolas, _mi_grupo).size()
		var como: String = I18n.t("LISAS") if _mi_grupo == Billar.GRUPO_LISAS \
				else I18n.t("RAYADAS")
		_hud.text = I18n.tf("{0} · TE QUEDAN {1}",
			[como, mias if mias > 0 else I18n.t("LA NEGRA")])
	if _fase == Fase.FIN:
		_marcador.text = ""
	elif _me_toca:
		_marcador.text = I18n.t("TU TURNO")
	else:
		_marcador.text = I18n.tf("TIRA {0}",
			[I18n.t(String(_rival.get("name", "")))])




func _process(delta: float) -> void:
	_t += delta



	if _cam != null:
		_pon_camara()



		var d: Vector3 = Vector3.RIGHT *(sin(_t * 0.45) * MECIDA) \
				+ _arriba_now *(sin(_t * 0.31) * MECIDA * 0.6)
		_cam.look_at_from_position(_ojo_now + d, _mira_now, _arriba_now)
	if _rotulo_t > 0.0:
		_rotulo_t -= delta
		if _rotulo_t <= 0.0 and _fase != Fase.FIN:
			_msg.text = ""
	match _fase:
		Fase.RODANDO:


			var quieta: bool = Billar.avanza(_bolas, _tiro, delta)
			_rueda(delta)
			_coloca()
			if quieta:
				_resuelve()
		Fase.RIVAL:
			_acc += delta
			if _acc >= RIVAL_PIENSA:
				_tira_el_rival()
	if Entrada.hay_mando():
		_sondea_mando(delta)
	elif _dedo == DEDO_MANDO:

		_cancela_mando()


func _tira_el_rival() -> void:
	var plan: Dictionary = Billar.apunta_ia(_bolas, _su_grupo,
		float(_rival.get("hab", 0.5)), _rng)
	_tiro = Billar.nuevo_tiro()
	Billar.golpe(_bolas, plan["dir"], float(plan["fuerza"]))
	_fase = Fase.RODANDO
	UiAudio.click(0.85)




func _gui_input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		var t: InputEventScreenTouch = event
		if t.pressed:
			_aprieta(t.index, t.position)
		elif t.index == _dedo:
			_suelta()
	elif event is InputEventScreenDrag and event.index == _dedo:
		_arr_a = _a_pano((event as InputEventScreenDrag).position)
		_pinta_guia()
	elif event is InputEventMouseButton:
		var mb: InputEventMouseButton = event
		if mb.button_index != MOUSE_BUTTON_LEFT:
			return
		if mb.pressed:
			_aprieta(0, mb.position)
		else:
			_suelta()
	elif event is InputEventMouseMotion and _dedo == 0:
		_arr_a = _a_pano((event as InputEventMouseMotion).position)
		_pinta_guia()


func _aprieta(id: int, at: Vector2) -> void:


	if _dedo == DEDO_MANDO:
		_cancela_mando()
	if _fase == Fase.FIN:
		_nueva_partida()
		return
	if _fase != Fase.TU_TIRO:
		return
	_dedo = id
	_arr_de = _a_pano(at)
	_arr_a = _arr_de
	_fase = Fase.APUNTANDO
	_pinta_guia()


func _suelta() -> void:
	if _fase != Fase.APUNTANDO:
		return
	_dedo = -1
	_limpia_guia()
	var tiron: Vector2 = _arr_de - _arr_a
	if tiron.length() < TIRON_MIN:


		_fase = Fase.TU_TIRO
		return
	_tiro = Billar.nuevo_tiro()
	Billar.golpe(_bolas, tiron, clampf(tiron.length() / TIRON_MAX, 0.0, 1.0))
	_fase = Fase.RODANDO
	_msg.text = ""
	UiAudio.click()






func _sondea_mando(delta: float) -> void:
	if _fase == Fase.FIN:
		if _mando_listo and Input.is_action_just_pressed("fl_avanza"):
			_nueva_partida()
	elif _fase == Fase.TU_TIRO or (_fase == Fase.APUNTANDO and _dedo == DEDO_MANDO):

		_pie.text = _pie_tiro()
		_apunta_mando(delta)
	_mando_listo = true


func _apunta_mando(delta: float) -> void:
	var b: Dictionary = Billar.bola(_bolas, Billar.BLANCA)
	if b.is_empty() or not bool(b["viva"]):
		return
	var cue: Vector2 = b["p"]
	if _mando_dir == Vector2.ZERO:
		_mando_dir = _dir_inicial(cue)



	var e: Vector2 = Entrada.eje(true)
	if e.length() <= MANDO_ZM:
		e = Entrada.eje(false)
	if e.length() > MANDO_ZM:
		var centro: Vector2 = size * 0.5
		var d: Vector2 = _a_pano(centro + e.normalized() * 200.0) - _a_pano(centro)
		if d.length() > 0.0001:
			_mando_dir = d.normalized()
	else:



		var giro: float = Input.get_axis("ui_left", "ui_right")
		if absf(giro) > 0.0:
			var p0: Vector2 = _a_pantalla(cue)
			var p1: Vector2 = _a_pantalla(cue + _mando_dir * 0.2)
			var s: Vector2 =(p1 - p0).rotated(giro * MANDO_GIRO_FINO * delta)
			var d2: Vector2 = _a_pano(p0 + s) - _a_pano(p0)
			if d2.length() > 0.0001:
				_mando_dir = d2.normalized()

	if _carga < 0.0:
		if _mando_listo and Input.is_action_just_pressed("fl_avanza"):
			_carga = 0.0
	elif Input.is_action_pressed("fl_avanza"):
		_carga = minf(1.0, _carga + delta / MANDO_CARGA_S)
	else:
		_golpe_mando()
		return
	_guia_mando(cue)




func _guia_mando(cue: Vector2) -> void:
	var k: float = maxf(_carga, TIRON_MIN / TIRON_MAX + 0.001)
	var a: Vector2 = cue - _mando_dir * k * TIRON_MAX


	if _fase == Fase.APUNTANDO and _dedo == DEDO_MANDO and _arr_de == cue \
			and _arr_a.is_equal_approx(a):
		return
	_fase = Fase.APUNTANDO
	_dedo = DEDO_MANDO
	_arr_de = cue
	_arr_a = a
	_pinta_guia()





func _golpe_mando() -> void:
	var cue: Vector2 = _arr_de
	_arr_a = cue - _mando_dir * maxf(_carga, 0.0) * TIRON_MAX
	_carga = -1.0
	_fase = Fase.APUNTANDO
	_suelta()


	if _fase == Fase.RODANDO:
		_mando_dir = Vector2.ZERO


func _cancela_mando() -> void:
	_carga = -1.0
	if _dedo == DEDO_MANDO:
		_dedo = -1
		if _fase == Fase.APUNTANDO:
			_fase = Fase.TU_TIRO
		_limpia_guia()

		if _fase == Fase.TU_TIRO:
			_pie.text = _pie_tiro()





func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventJoypadButton and event.is_action_pressed("fl_atras") \
			and _carga >= 0.0 and _dedo == DEDO_MANDO:
		_carga = -1.0
		get_viewport().set_input_as_handled()





func _dir_inicial(cue: Vector2) -> Vector2:
	var cand: Array = []
	if _mi_grupo != Billar.GRUPO_NINGUNO:
		cand = Billar.vivas_de(_bolas, _mi_grupo)
	else:
		cand = Billar.vivas_de(_bolas, Billar.GRUPO_LISAS) \
				+ Billar.vivas_de(_bolas, Billar.GRUPO_RAYADAS)
	if cand.is_empty():
		var negra: Dictionary = Billar.bola(_bolas, Billar.NEGRA)
		if not negra.is_empty() and bool(negra["viva"]):
			cand = [negra]
	var mejor: Vector2 = Vector2.RIGHT
	var dist: float = INF
	for c in cand:
		var p: Vector2 =(c as Dictionary)["p"]
		var dd: float = p.distance_to(cue)
		if dd > 0.0001 and dd < dist:
			dist = dd
			mejor =(p - cue).normalized()
	return mejor



func _a_pantalla(p: Vector2) -> Vector2:
	if _cam == null or _vp == null:
		return Vector2.ZERO
	return _cam.unproject_position(_a_mundo(p)) * size / Vector2(_vp.size)




func _pie_tiro() -> String:
	return Entrada.texto_f("ARRASTRA Y SUELTA", "MANTÉN {0} Y SUELTA", [],
		[Entrada.boton("fl_avanza")])





func _pinta_guia() -> void:
	_limpia_guia()
	if _fase != Fase.APUNTANDO:
		return
	var b: Dictionary = Billar.bola(_bolas, Billar.BLANCA)
	if b.is_empty() or not bool(b["viva"]):
		return
	var tiron: Vector2 = _arr_de - _arr_a
	var largo: float = tiron.length()
	if largo < TIRON_MIN:
		return
	var k: float = clampf(largo / TIRON_MAX, 0.0, 1.0)
	var dir: Vector2 = tiron.normalized()
	var cue: Vector2 = b["p"]


	var atras: float = 0.12 + k * 0.35
	_pinta_taco(cue, dir, atras)






	var alcance: float = minf(lerpf(0.25, 1.5, k), _hasta_el_canto(cue, dir))
	var paso: float = 0.075
	var n: int = int(alcance / paso)
	for i in n:
		var p: Vector2 = cue + dir *(Billar.BOLA_R + float(i) * paso)
		RinconLib.caja(_guia, _a_mundo(p) + Vector3(0.0, - Billar.BOLA_R + 0.012, 0.0),
			Vector3(0.012, 0.004, 0.038), M_GUIA)





func _hasta_el_canto(p: Vector2, d: Vector2) -> float:
	var t: float = 1000000000.0
	if absf(d.x) > 1e-05:
		var bx: float = Billar.LARGO * 0.5 if d.x > 0.0 else - Billar.LARGO * 0.5
		t = minf(t,(bx - p.x) / d.x)
	if absf(d.y) > 1e-05:
		var by: float = Billar.ANCHO * 0.5 if d.y > 0.0 else - Billar.ANCHO * 0.5
		t = minf(t,(by - p.y) / d.y)
	return maxf(t, 0.0)














func _pinta_taco(cue: Vector2, dir: Vector2, atras: float) -> void:


	var d_canto: float = _hasta_el_canto(cue, - dir)


	var salvar: float = BANDA_H - Billar.BOLA_R + 0.022
	var pico: float = TACO_PICO_MIN
	if d_canto > 0.001:
		pico = clampf(atan2(salvar, d_canto), TACO_PICO_MIN, TACO_PICO_MAX)




	var pivote: Node3D = Node3D.new()
	pivote.position = _a_mundo(cue - dir * atras)


	pivote.rotation.y = atan2(dir.y, dir.x)
	_guia.add_child(pivote)
	var alza: Node3D = Node3D.new()

	alza.rotation.x = pico
	pivote.add_child(alza)
	RinconLib.caja(alza, Vector3(0.0, 0.0, - TACO_LARGO * 0.5),
		Vector3(0.028, 0.028, TACO_LARGO), Color("c9a06a"))


	RinconLib.caja(alza, Vector3(0.0, 0.0, - TACO_LARGO * 0.86),
		Vector3(0.038, 0.038, TACO_LARGO * 0.28), Color("4a3324"))


func _limpia_guia() -> void:
	if _guia == null:
		return
	for c in _guia.get_children():
		c.queue_free()






func _resuelve() -> void:
	var mio: int = _mi_grupo if _me_toca else _su_grupo
	var suyo: int = _su_grupo if _me_toca else _mi_grupo
	var v: Dictionary = Billar.veredicto(_bolas, _tiro, mio, suyo)
	if bool(v["gana"]) or bool(v["pierde"]):
		_gane = bool(v["gana"]) == _me_toca
		_termina()
		return



	var nuevo: int = int(v["grupo"])
	if nuevo != Billar.GRUPO_NINGUNO and mio == Billar.GRUPO_NINGUNO:
		var otro: int = Billar.GRUPO_RAYADAS if nuevo == Billar.GRUPO_LISAS \
				else Billar.GRUPO_LISAS
		if _me_toca:
			_mi_grupo = nuevo
			_su_grupo = otro
		else:
			_su_grupo = nuevo
			_mi_grupo = otro






		_dice(I18n.t("¡TE TOCAN LAS LISAS!") if _mi_grupo == Billar.GRUPO_LISAS
			else I18n.t("¡TE TOCAN LAS RAYADAS!"), CareerTheme.MONEY)
		_rotulo_t = ROTULO_SEG * 1.6
		UiAudio.confirm()
	if bool(v["falta"]):



		var b: Dictionary = Billar.bola(_bolas, Billar.BLANCA)
		if not b.is_empty():
			b["p"] = Billar.mano(_bolas, _rng)
			b["v"] = Vector2.ZERO
			b["viva"] = true
		_coloca()
		_dice(I18n.t("FALTA · BOLA EN MANO"), CareerTheme.DANGER)
	elif not (_tiro["metidas"] as Array).is_empty():
		UiAudio.pop()
	if not bool(v["sigo"]):
		_me_toca = not _me_toca
	_refresca_hud()
	if _me_toca:
		_fase = Fase.TU_TIRO
		_pie.text = _pie_tiro()
	else:
		_fase = Fase.RIVAL
		_acc = 0.0
		_pie.text = ""


func _dice(txt: String, col: Color) -> void:
	_msg.text = txt
	_msg.add_theme_color_override("font_color", col)
	_rotulo_t = ROTULO_SEG


func _termina() -> void:
	_fase = Fase.FIN
	_rotulo_t = 99.0
	_limpia_guia()
	var suyas: int = Billar.vivas_de(_bolas, _su_grupo).size() \
			if _su_grupo != Billar.GRUPO_NINGUNO else 7
	if _gane:


		Settings.set_billar_best(suyas)

		Achievements.ingest_billar_win()
		var subio: int = 0
		if _por_premio:
			subio = Career.settle_reto_casa("billar",
				Billar.reto_quimica(true, suyas))
		_msg.text = I18n.t("GANAS LA PARTIDA")
		if subio > 0:
			_msg.text += "\n" + I18n.tf("QUIMICA +{0}", [subio])
		_msg.add_theme_color_override("font_color", CareerTheme.MONEY)
		UiAudio.fanfare(0)
	else:

		_msg.text = I18n.t("OTRO DIA SERA")
		_msg.add_theme_color_override("font_color", CareerTheme.TEXT_DIM)
	_msg.text += "\n" + Entrada.texto_f("TOCA PARA OTRA", "PULSA {0} PARA OTRA", [],
		[Entrada.boton("fl_avanza")])
	_refresca_hud()


func _unhandled_key_input(event: InputEvent) -> void:
	if not (event is InputEventKey) or not (event as InputEventKey).pressed:
		return
	if (event as InputEventKey).keycode == KEY_ESCAPE:
		_close()


func _close() -> void:
	get_tree().paused = false
	queue_free()










func _exit_tree() -> void:
	var arbol: SceneTree = get_tree()
	if arbol != null:
		arbol.paused = false
