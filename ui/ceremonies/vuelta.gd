extends Ceremony











































const SUELO: Color = Color("2f3239")
const MURO: Color = Color("c9c1b1")
const ZOCALO: Color = Color("23262c")
const MADERA: Color = Color("15171b")
const LATON: Color = Color("8a6f3a")
const TERCIOPELO: Color = Color("6b2c2c")
const FONDO: Color = Color("14120f")





const CASE_W: float = 2.6
const CASE_H: float = 2.3
const CASE_D: float = 0.55
const CASE_Z: float = -2.55
const WALL_Z: float = -3.0





const MURO_X: float = 3.2















const DESENFOQUE: bool = true







const FOCO_R: float = 0.3
const FOCO_SUAVE: float = 0.3


const FOCO_FUERZA: float = 2.6



const FOCO_APAGA: float = 0.38






const BALDA_BAJA: float = 0.62
const BALDA_ALTA: float = 1.44
const BALDA_UNICA: float = 0.86


const POR_BALDA: int = 5
const TROFEOS_MAX: int = 10




const TROFEO_MIN: float = 0.4
const TROFEO_MAX: float = 0.86

const BALDA_UTIL: float = CASE_W - 0.44




const COPA_PAD: float = 0.06







const YO: Vector3 = Vector3(0.55, 0.0, 0.35)

const YO_ART: String = "res://assets/sprites/anim/casual_idle_north_"


















































const KEYS: Array = [
	{"t": 0.0, "dist": 6.6, "h": 1.7, "yaw": 180.0, "aim_y": 1.34, "fov": 36.0,
		"focus_x": 0.18, "focus_z": -1.7},
	{"t": 3.6, "dist": 6.9, "h": 1.95, "yaw": 182.0, "aim_y": 1.38, "fov": 38.0,
		"focus_x": 0.1, "focus_z": -1.95},
	{"t": 8.0, "dist": 7.1, "h": 2.16, "yaw": 185.0, "aim_y": 1.4, "fov": 40.0,
		"focus_x": 0.04, "focus_z": -2.1},
]









const DRIFT: float = 0.1

const T_CHYRON: float = 1.4
const T_CARD: float = 8.6





func _accent_for() -> Color:
	return CareerTheme.accent_of(team())





var _copas_tipos: Array = []


func _build() -> void:
	_copas_tipos = _tipos()
	_sala()
	_vitrina()




	focus = Vector3(0.0, 0.0, -1.9)
	make_camera(KEYS, 32.0)
	orbit_speed = DRIFT
	_monta_foco()




	make_player(KitRecolor.casual_of(GameState.team_custom), "north", YO_ART)
	_planta(player, YO)



	_ficha()





var _foco_mat: ShaderMaterial = null













const FOCO_SHADER: String = "\nshader_type canvas_item;\nuniform sampler2D pantalla : hint_screen_texture, filter_linear_mipmap;\nuniform vec2 foco = vec2(0.5, 0.45);\nuniform float radio = 0.26;\nuniform float suave = 0.34;\nuniform float fuerza = 2.6;\nuniform float apaga = 0.38;\nuniform float aspecto = 0.5625;\n\nvoid fragment() {\n\tvec2 d = SCREEN_UV - foco;\n\td.x /= max(aspecto, 0.01);\n\tfloat k = smoothstep(radio, radio + suave, length(d));\n\tvec3 c = textureLod(pantalla, SCREEN_UV, k * fuerza).rgb;\n\tCOLOR = vec4(c * (1.0 - k * apaga), 1.0);\n}\n"























func _monta_foco() -> void:
	if not DESENFOQUE:
		return
	var sh: Shader = Shader.new()
	sh.code = FOCO_SHADER
	_foco_mat = ShaderMaterial.new()
	_foco_mat.shader = sh
	_foco_mat.set_shader_parameter("radio", FOCO_R)
	_foco_mat.set_shader_parameter("suave", FOCO_SUAVE)
	_foco_mat.set_shader_parameter("fuerza", FOCO_FUERZA)
	_foco_mat.set_shader_parameter("apaga", FOCO_APAGA)
	var velo: ColorRect = ColorRect.new()
	velo.set_anchors_preset(Control.PRESET_FULL_RECT)
	velo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	velo.material = _foco_mat
	add_child(velo)





func _foco_mundo() -> Vector3:
	return Vector3(0.0, 1.36, CASE_Z)








func _tick(_delta: float) -> void:
	if _foco_mat == null or cam == null or not is_instance_valid(cam):
		return
	var vs: Vector2 = Vector2(viewport.size)
	if vs.x <= 0.0 or vs.y <= 0.0:
		return
	var caja: Rect2 = viewport_box.get_global_rect()
	var pant: Vector2 = get_viewport_rect().size
	if pant.x <= 0.0 or pant.y <= 0.0:
		return
	var p: Vector2 = cam.unproject_position(_foco_mundo())
	var en_pantalla: Vector2 = caja.position +(p / vs) * caja.size
	_foco_mat.set_shader_parameter("foco", en_pantalla / pant)
	_foco_mat.set_shader_parameter("aspecto", pant.x / pant.y)





func _sala() -> void:
	var env: WorldEnvironment = WorldEnvironment.new()
	var e: Environment = Environment.new()
	e.background_mode = Environment.BG_COLOR
	e.background_color = FONDO
	e.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR


	e.ambient_light_color = Color("e4ddcb")




	e.ambient_light_energy = 0.95
	viewport.add_child(env)
	env.environment = e

	var luz: DirectionalLight3D = DirectionalLight3D.new()
	luz.light_color = Color("fff3dc")
	luz.light_energy = 0.8
	luz.rotation_degrees = Vector3(-62.0, 8.0, 0.0)
	viewport.add_child(luz)
	_caja(Vector3(0.0, -0.5, 0.0), Vector3(16.0, 1.0, 16.0), SUELO)
	_caja(Vector3(0.0, 2.1, WALL_Z - 0.1), Vector3(16.0, 4.2, 0.2), MURO)


	_caja(Vector3(0.0, 0.42, WALL_Z + 0.02), Vector3(16.0, 0.84, 0.06), ZOCALO)
	_caja(Vector3(0.0, 0.86, WALL_Z + 0.03), Vector3(16.0, 0.04, 0.08), LATON, 0.6)


	_caja(Vector3(0.0, 0.012, -1.05), Vector3(4.2, 0.02, 2.6), TERCIOPELO)
	_cierra_sala()














func _cierra_sala() -> void:
	for lado: float in [-1.0, 1.0]:
		_caja(Vector3(lado * MURO_X, 2.1, -0.4), Vector3(0.2, 4.2, 6.0),
			MURO.darkened(0.18))


		_caja(Vector3(lado *(MURO_X - 0.12), 0.42, -0.4),
			Vector3(0.06, 0.84, 6.0), ZOCALO)



	_caja(Vector3(0.0, 4.24, -0.4), Vector3(MURO_X * 2.0, 0.2, 6.0),
		FONDO.lightened(0.1))





func _vitrina() -> void:





	_caja(Vector3(0.0, 0.22, CASE_Z), Vector3(CASE_W + 0.2, 0.44, CASE_D + 0.07),
		MADERA.lightened(0.06))
	_caja(Vector3(0.0, CASE_H * 0.5 + 0.44, CASE_Z - CASE_D * 0.5 + 0.03),
		Vector3(CASE_W, CASE_H, 0.06), MADERA)
	for lado: float in [-1.0, 1.0]:
		_caja(Vector3(lado *(CASE_W * 0.5 - 0.04), CASE_H * 0.5 + 0.44, CASE_Z),
			Vector3(0.08, CASE_H, CASE_D), MADERA)
	_caja(Vector3(0.0, CASE_H + 0.4, CASE_Z), Vector3(CASE_W, 0.08, CASE_D),
		MADERA)


	_caja(Vector3(0.0, 1.42, CASE_Z - CASE_D * 0.5 + 0.08),
		Vector3(CASE_W - 0.2, 1.86, 0.03), TERCIOPELO.darkened(0.58))



	for y: float in _alturas():
		_caja(Vector3(0.0, y - 0.02, CASE_Z), Vector3(CASE_W - 0.16, 0.04, 0.46),
			MADERA.lightened(0.16))
		_caja(Vector3(0.0, y - 0.045, CASE_Z + 0.21),
			Vector3(CASE_W - 0.16, 0.015, 0.03), LATON, 1.1)


	_caja(Vector3(0.0, CASE_H + 0.4, CASE_Z),
		Vector3(CASE_W + 0.12, 0.1, CASE_D + 0.07), LATON, 0.8)
	_caja(Vector3(0.0, CASE_H + 0.32, CASE_Z + 0.18),
		Vector3(CASE_W - 0.2, 0.03, 0.05), Color("ffe9b0"), 3.2)


	var l: OmniLight3D = OmniLight3D.new()
	l.light_color = Color("ffdfa6")
	l.light_energy = 3.4
	l.omni_range = 3.6
	l.position = Vector3(0.0, CASE_H + 0.18, CASE_Z + 0.1)
	viewport.add_child(l)
	_copas()




	_caja(Vector3(0.0, 1.36, CASE_Z + CASE_D * 0.5 - 0.02),
		Vector3(CASE_W - 0.1, 1.94, 0.02), Color(0.62, 0.72, 0.82, 0.1), 0.0, true)


	_caja(Vector3(0.0, 1.94, CASE_Z + CASE_D * 0.5 + 0.005),
		Vector3(CASE_W - 0.3, 0.55, 0.005), Color(0.86, 0.92, 1.0, 0.1), 0.0, true)

















func _copas() -> void:
	var filas: Array = _reparto()
	var ys: Array = _alturas()
	for i in filas.size():
		if i < ys.size():
			_fila_copas(filas[i] as Array, float(ys[i]))






func _reparto() -> Array:
	var n: int = _copas_tipos.size()
	if n <= 0:
		return []
	if n <= POR_BALDA:
		return [_copas_tipos]
	var arriba: int = int(ceil(float(n) * 0.5))
	return [_copas_tipos.slice(0, arriba), _copas_tipos.slice(arriba)]





func _alturas() -> Array:
	var n: int = _copas_tipos.size()
	if n <= 0:
		return [BALDA_BAJA, BALDA_ALTA]
	if n <= POR_BALDA:
		return [BALDA_UNICA]
	return [BALDA_ALTA, BALDA_BAJA]






func _fila_copas(tipos: Array, balda: float) -> void:
	if tipos.is_empty():
		return
	var paso: float = BALDA_UTIL / float(tipos.size())
	var alto: float = clampf(paso * 0.98, TROFEO_MIN, TROFEO_MAX)
	for i in tipos.size():
		var x: float = - BALDA_UTIL * 0.5 + paso *(float(i) + 0.5)
		_pon_copa(String(tipos[i]), Vector3(x, balda + alto * 0.5 - 0.03, CASE_Z), alto)





func _pon_copa(tipo: String, pos: Vector3, alto: float) -> Sprite3D:
	return make_trophy(tipo, pos, alto, 256, null, false, COPA_PAD)






















func _tipos() -> Array:
	var out: Array = []
	for key in Trophies.ORDER:
		if not _awards().has(key):
			continue
		var tipo: String = String((Trophies.CATALOG[key] as Dictionary).get("type", ""))
		if tipo.is_empty() or out.has(tipo):
			continue
		out.append(tipo)
		if out.size() >= TROFEOS_MAX:
			break
	return out






func _awards() -> Array:
	var awards: Array = data.get("awards", []) as Array
	return awards if not awards.is_empty() else Career.awards


func _ficha() -> void:
	var club: Dictionary = team()



	make_chyron(I18n.t("EL ÚLTIMO VISTAZO"),
		CareerTheme.caps(Career.player_name), club, T_CHYRON)
	make_card(T_CARD)
	card_title(I18n.t("¿SALIR DEL RETIRO?"), 40)















	var precio: Label = card_sub(I18n.t("YA PAGASTE EL AÑO"
		if Career.comeback_mirado else "CUESTA UN AÑO · 10 MENOS EN TODO"),
		CareerTheme.MONEY)
	precio.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	card_stats(_stats())
	card_note(I18n.t(_note_line()))
	_botones()








func _botones() -> void:
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 14)
	card_box.add_child(fila)
	var si: Button = Button.new()
	si.text = I18n.t("SÍ, VUELVO")
	si.custom_minimum_size = Vector2(0, CareerTheme.BTN_CTA_H)
	si.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	si.clip_text = true
	CareerTheme.apply_button_accent(si, CareerTheme.MONEY, CareerTheme.T_BODY)
	si.pressed.connect(_si)
	fila.add_child(si)
	var no: Button = Button.new()
	no.text = I18n.t("MEJOR NO")
	no.custom_minimum_size = Vector2(0, CareerTheme.BTN_CTA_H)
	no.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	no.clip_text = true
	CareerTheme.apply_button(no, CareerTheme.Kind.GHOST, CareerTheme.T_BODY)
	no.pressed.connect(_no)




	no.set_meta(Entrada.PRIMERO_META, true)
	fila.add_child(no)










func _si() -> void:

	if replay:
		_leave()
		return
	Career.mirar_ofertas_regreso()
	Career.queue_ceremony(Ceremonies.REGRESO)
	_leave()





func _no() -> void:

	if replay:
		_leave()
		return
	SceneFade.to_scene("res://ui/house/museo.tscn")






func _recuerdo() -> Dictionary:
	var out: Dictionary = data.duplicate(true)
	out["awards"] = _awards().duplicate(true)
	var falta_pagar: bool = not Career.comeback_mirado
	out["age"] = int(data.get("age", Career.age +(1 if falta_pagar else 0)))
	out["ovr"] = int(data.get("ovr", maxi(Career.ovr_shown()
		-(Career.COMEBACK_DROP if falta_pagar else 0), 20)))
	return out










func _armar_auto_seguir() -> void:
	pass


func _on_skip() -> void:
	if t >= card_at:
		return
	super._on_skip()














func _stats() -> Array:
	var falta_pagar: bool = not Career.comeback_mirado
	var edad: int = int(data.get("age", Career.age +(1 if falta_pagar else 0)))
	var ovr: int = int(data.get("ovr", maxi(Career.ovr_shown()
		-(Career.COMEBACK_DROP if falta_pagar else 0), 20)))
	return [
		{"v": str(_tipos_totales()), "k": I18n.t("títulos")},
		{"v": str(edad), "k": I18n.t("años")},
		{"v": str(ovr), "k": I18n.t("tu OVR")},
	]






func _tipos_totales() -> int:
	var cab: Dictionary = Trophies.cabinet(_awards())
	var n: int = 0
	for fam in ["team", "individual"]:
		for row in (cab.get(fam, []) as Array):
			n += int((row as Dictionary).get("count", 0))
	return n





func _note_line() -> String:
	var n: int = _tipos_totales()
	if n <= 0:
		return "Ni una copa detrás del cristal. Por eso vuelves."
	if n >= 8:
		return "Todo eso ya lo ganaste. Y aun así te vas a poner las botas otra vez."
	return "Se está bien aquí dentro. Pero aquí dentro ya no pasa nada."





func _skipped() -> void:
	pass












func _caja(at: Vector3, size: Vector3, col: Color, emis: float = 0.0,
		translucido: bool = false) -> void:
	var m: MeshInstance3D = MeshInstance3D.new()
	var box: BoxMesh = BoxMesh.new()
	box.size = size
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = col
	if translucido:
		mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA


		mat.depth_draw_mode = BaseMaterial3D.DEPTH_DRAW_DISABLED
	if emis > 0.0:
		mat.emission_enabled = true
		mat.emission = col
		mat.emission_energy_multiplier = emis
	box.material = mat
	m.mesh = box
	m.position = at
	viewport.add_child(m)





func _planta(spr: AnimatedSprite3D, at: Vector3) -> void:
	if spr == null:
		return
	spr.position = Vector3(at.x,
		feet_offset(spr.pixel_size, YO_ART + "00.png") - PLAYER_SINK, at.z)
