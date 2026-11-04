extends "res://ui/ceremonies/toma7.gd"
















const FirmaCola := preload("res://ui/ceremonies/firma_cola.gd")



const FT_MESA: Vector3 = Vector3(-0.1, 0.0, 0.6)
const FT_MESA_TAM: Vector3 = Vector3(1.4, 0.74, 0.6)
const FT_TU: Vector3 = Vector3(-0.1, 0.0, FT_MESA.z - FT_MESA_TAM.z * 0.5 - 0.12)
const FT_PUESTO: Vector3 = Vector3(-0.8, 0.0, FT_MESA.z + 0.75)

const FT_COLA_0: Vector3 = Vector3(-1.35, 0.0, FT_MESA.z + 0.85)
const FT_COLA_PASO: Vector3 = Vector3(-0.56, 0.0, 0.02)
const FT_EXTRA: int = 2
const FT_SALIDA: Array = [Vector3(-1.0, 0.0, FT_MESA.z + 0.2)]


const FT_HECHOS: Array = [
	Vector3(-3.4, 0.0, FT_MESA.z - 0.65), Vector3(-2.9, 0.0, FT_MESA.z - 0.65),
	Vector3(-2.4, 0.0, FT_MESA.z - 0.65), Vector3(-1.9, 0.0, FT_MESA.z - 0.65),
	Vector3(-3.15, 0.0, FT_MESA.z - 0.15), Vector3(-2.65, 0.0, FT_MESA.z - 0.15),
	Vector3(-2.15, 0.0, FT_MESA.z - 0.15),
	Vector3(-3.4, 0.0, FT_MESA.z + 0.35), Vector3(-2.9, 0.0, FT_MESA.z + 0.35),
	Vector3(-2.4, 0.0, FT_MESA.z + 0.35),
]

const FT_CAMARA: Vector3 = Vector3(1.55, 0.0, 0.9)

const FT_CLAQUETA_PX: Vector2i = Vector2i(320, 240)
const FT_CLAQUETA_M: float = 0.34
const FT_EMPIEZA: float = 1.6




const FT_APERTURA: Dictionary = {"t": 0.0, "dist": 9.0, "h": 2.2, "yaw": 184.0,
	"aim_y": 1.6, "fov": 52.0, "focus_x": -1.4, "focus_z": FT_MESA.z + 0.2}

var _cola: FirmaCola = FirmaCola.new()

var _claqueta: Texture2D = null
var _vp_cuadro: int = 0


func _cues_del_acto() -> PackedStringArray:
	return PackedStringArray(["lone_shout", "ui_whoosh", "rotulador_loop"])


func _build() -> void:
	focus = Vector3(-0.5, 0.0, FT_MESA.z + 0.5)
	_mundo_de_plato()


	_omni(Vector3(-3.6, 3.0, 1.3), Color("fff2d8"), 4.0, 6.0)
	_build_set()
	_build_cartel()
	_build_pizarra()
	_pon_toma(7)

	if _palo != null:
		_palo.rotation.z = 0.0
	_build_operador()
	if _operador != null:
		_operador.position = Vector3(FT_CAMARA.x, _operador.position.y, FT_CAMARA.z)

		if _operador.sprite_frames.has_animation("celular"):
			_operador.play("celular")
	_claqueta = _claqueta_tex()
	_plato_de_firmas()
	_vp_cuadro = Engine.get_process_frames()
	make_camera([FT_APERTURA, _ft_cerca(FT_EMPIEZA + 0.9, 0.0)], 52.0)
	orbit_speed = 0.0
	make_audio(0.0, false)
	var ropa: Dictionary = KitRecolor.casual_of(GameState.team_custom)
	make_player(ropa, "south")
	_cola.arma(self, {
		"mesa": {"centro": FT_MESA, "tam": FT_MESA_TAM, "color": Sponsors.color_of(_marca()),
			"franja": Color(0.97, 0.96, 0.93)},
		"tu": FT_TU, "puesto": FT_PUESTO, "cola_0": FT_COLA_0, "cola_paso": FT_COLA_PASO,
		"hechos": FT_HECHOS, "salida": FT_SALIDA,
		"pieza": _claqueta, "pieza_m": FT_CLAQUETA_M,
		"base": _imagen_claqueta, "fondo": Color("121418"),

		"zona": Rect2(0.04, 0.33, 0.92, 0.63),
		"titulo": I18n.t("FIRMA LA CLAQUETA"),
		"cerca": _ft_cerca, "final": _ft_final,
		"t_empieza": FT_EMPIEZA, "suelo": 0.0,
		"semilla": "%s|%s" % [_marca(), str(data.get("seed", ""))],
		"kit": GameState.kit_variant(team(), 0), "extra": FT_EXTRA,


		"montaje": {"marca": _marca(), "nombre": _nombre_marca(),
			"photocall": {"x": -0.45, "ancho": 2.2}, "rollup": false, "focos": false},
	})

	make_chyron(I18n.t("FIRMA DE AUTÓGRAFOS"), _nombre_marca(), {}, 0.5)

	make_card(60.0)
	if _card_tw != null and _card_tw.is_valid():
		_card_tw.kill()
	card_title(I18n.t("FIRMAS EN EL PLATÓ"), 40)
	card_sub(_nombre_marca(), Sponsors.color_of(_marca()))
	card_count(FirmaCola.N_FIRMAS, I18n.t("AUTÓGRAFOS FIRMADOS"))
	card_note(I18n.t("Diez claquetas firmadas. Esta vez sí lo grabó alguien."))
	card_cta(I18n.t("SEGUIR"))





func _claqueta_tex() -> Texture2D:
	var w: int = FT_CLAQUETA_PX.x
	var h: int = FT_CLAQUETA_PX.y
	var vp: SubViewport = SubViewport.new()
	vp.size = FT_CLAQUETA_PX
	vp.disable_3d = true
	vp.transparent_bg = false
	vp.render_target_update_mode = SubViewport.UPDATE_ONCE
	add_child(vp)
	var root: Control = Control.new()
	root.size = Vector2(FT_CLAQUETA_PX)
	vp.add_child(root)
	var tabla: ColorRect = ColorRect.new()
	tabla.color = Color("121418")
	tabla.size = Vector2(FT_CLAQUETA_PX)
	root.add_child(tabla)
	_rayas(root, Rect2(0, 0, w, 34), 22.0)
	_rayas(root, Rect2(0, 40, w, 34), -22.0)
	var blanco: Color = Color("f4f1ec")
	for y: int in [80, 158]:
		var filete: ColorRect = ColorRect.new()
		filete.color = blanco
		filete.position = Vector2(8, y)
		filete.size = Vector2(w - 16, 2)
		root.add_child(filete)
	var logo: SponsorLogo = SponsorLogo.new()
	logo.position = Vector2(12, 88)
	logo.size = Vector2(62, 62)
	root.add_child(logo)
	logo.setup(_marca(), blanco)
	_rotulo_claqueta(root, _nombre_marca(), Rect2(80, 86, w - 86, 34), 30, blanco)
	_rotulo_claqueta(root, CareerTheme.caps(Career.nombre_espalda()), Rect2(84, 120, w - 96, 34),
		26, Sponsors.color_of(_marca()).lightened(0.45))
	_rotulo_claqueta(root, I18n.tf("TOMA {0}", ["7"]), Rect2(10, 164, w - 20, 70), 58, blanco)
	return vp.get_texture()




func _rayas(root: Control, r: Rect2, sesgo: float) -> void:
	var caja: Control = Control.new()
	caja.position = r.position
	caja.size = r.size
	caja.clip_contents = true
	root.add_child(caja)
	var paso: float = 40.0
	var i: int = 0
	var x: float = - absf(sesgo) - paso
	while x < r.size.x + absf(sesgo) + paso:
		var p: Polygon2D = Polygon2D.new()
		p.polygon = PackedVector2Array([Vector2(x, 0), Vector2(x + paso, 0),
			Vector2(x + paso - sesgo, r.size.y), Vector2(x - sesgo, r.size.y)])
		p.color = Color("f0f0f0") if i % 2 == 0 else Color("16181c")
		caja.add_child(p)
		x += paso
		i += 1





func _rotulo_claqueta(root: Control, txt: String, r: Rect2, techo: int, col: Color) -> void:
	var l: Label = Label.new()
	l.text = txt
	l.clip_text = true
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	l.add_theme_color_override("font_color", col)
	l.position = r.position
	l.size = r.size
	root.add_child(l)


	l.clip_text = false
	var cuerpo: int = techo
	l.add_theme_font_size_override("font_size", cuerpo)
	while cuerpo > 8 and l.get_minimum_size().x > r.size.x - 4.0:
		cuerpo -= 1
		l.add_theme_font_size_override("font_size", cuerpo)
	l.clip_text = true










func _plato_de_firmas() -> void:
	var hierro: Color = Color("2a303a")
	var cromo: Color = Color("8d9097")

	var mon: Node3D = Node3D.new()
	mon.position = Vector3(2.7, 0.0, 0.1)
	mon.rotation_degrees.y = -25.0
	viewport.add_child(mon)
	_caja_en(mon, Vector3(0.0, 0.03, 0.0), Vector3(0.55, 0.05, 0.55), Color("1c2129"))
	_caja_en(mon, Vector3(0.0, 0.66, 0.0), Vector3(0.04, 1.26, 0.04), hierro, 0.6)
	_caja_en(mon, Vector3(0.0, 1.5, -0.02), Vector3(0.66, 0.48, 0.06), Color("15181d"), 0.5)
	var pantalla: MeshInstance3D = MeshInstance3D.new()
	var qm: QuadMesh = QuadMesh.new()
	qm.size = Vector2(0.58, 0.435)
	pantalla.mesh = qm
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.albedo_texture = _claqueta
	mat.albedo_color = Color(0.82, 0.84, 0.9)
	pantalla.material_override = mat
	pantalla.position = Vector3(0.0, 1.5, 0.015)
	mon.add_child(pantalla)

	_caja_en(mon, Vector3(0.0, 1.76, 0.08), Vector3(0.7, 0.02, 0.18), Color("101215"))
	for lado: float in [-1.0, 1.0]:
		_caja_en(mon, Vector3(lado * 0.34, 1.5, 0.08), Vector3(0.02, 0.48, 0.18),
			Color("101215"))

	var lona: Color = Sponsors.color_of(_marca())
	var silla: Node3D = Node3D.new()
	silla.position = Vector3(2.35, 0.0, -0.85)
	silla.rotation_degrees.y = -150.0
	viewport.add_child(silla)
	var madera: Color = Color("6a4a2e")
	for x: float in [-0.27, 0.27]:
		for z: float in [-0.2, 0.2]:
			_caja_en(silla, Vector3(x, 0.32, z), Vector3(0.04, 0.64, 0.04), madera)
		_caja_en(silla, Vector3(x, 0.66, 0.0), Vector3(0.05, 0.04, 0.46), madera)
		_caja_en(silla, Vector3(x, 0.98, -0.2), Vector3(0.04, 0.64, 0.04), madera)
	_caja_en(silla, Vector3(0.0, 0.47, 0.0), Vector3(0.52, 0.03, 0.4), lona, 0.9)
	_caja_en(silla, Vector3(0.0, 1.06, -0.21), Vector3(0.54, 0.24, 0.02), lona, 0.9)

	var pino: Color = Color("9a7448")
	_caja(Vector3(3.1, 0.1, 1.25), Vector3(0.5, 0.2, 0.3), pino)
	_caja(Vector3(3.12, 0.25, 1.24), Vector3(0.5, 0.1, 0.3), pino.darkened(0.12))
	for y: float in [0.1, 0.25]:
		_caja(Vector3(3.1, y, 1.405), Vector3(0.14, 0.04, 0.01), Color("2b1f14"))

	var cs: Vector3 = Vector3(-4.4, 0.0, -1.3)
	for k in 3:
		var a: float = TAU * float(k) / 3.0
		var pata: MeshInstance3D = _caja(cs + Vector3(cos(a) * 0.28, 0.04, sin(a) * 0.28),
			Vector3(0.6, 0.03, 0.03), cromo, 0.4)
		pata.rotation.y = - a
	_caja(cs + Vector3(0.0, 1.1, 0.0), Vector3(0.035, 2.2, 0.035), cromo, 0.4)
	_caja(cs + Vector3(0.45, 2.12, 0.0), Vector3(0.9, 0.025, 0.025), cromo, 0.4)
	_caja(cs + Vector3(0.95, 1.85, 0.0), Vector3(0.6, 0.48, 0.015), Color("0e0f12"), 0.95)


	var goma: Color = Color("2b2f38")
	for tramo: Array in [[Vector3(2.7, 0.0, 0.1), Vector3(FT_CAMARA.x, 0.0, FT_CAMARA.z)],
			[Vector3(2.7, 0.0, 0.1), Vector3(5.4, 0.0, 0.6)],
			[cs, Vector3(-1.9, 0.0, -1.45)]]:
		var a3: Vector3 = tramo[0]
		var b3: Vector3 = tramo[1]
		var d: Vector3 = b3 - a3
		var cable: MeshInstance3D = _caja((a3 + b3) * 0.5 + Vector3(0.0, 0.012, 0.0),
			Vector3(d.length(), 0.012, 0.035), goma, 0.8)
		cable.rotation.y = - atan2(d.z, d.x)

	var cinta: Color = Color("e0b43a")
	for m: Vector3 in [Vector3(2.2, 0.0, 2.15), Vector3(-2.7, 0.0, 2.75), Vector3(4.1, 0.0, -0.4)]:
		_caja(m + Vector3(0.0, 0.004, 0.0), Vector3(0.32, 0.004, 0.05), cinta, 0.8)
		_caja(m + Vector3(0.0, 0.004, 0.12), Vector3(0.05, 0.004, 0.22), cinta, 0.8)


func _ft_cerca(tk: float, empuje: float) -> Dictionary:
	return {"t": tk, "dist": lerpf(5.2, 4.7, empuje), "h": lerpf(1.9, 1.8, empuje),
		"yaw": lerpf(172.0, 179.0, empuje), "aim_y": 1.0, "fov": 46.0,
		"focus_x": -0.45, "focus_z": FT_MESA.z + 0.25}




func _ft_final(tk: float) -> Dictionary:
	return {"t": tk, "dist": 8.6, "h": 2.0, "yaw": 182.0, "aim_y": 1.5, "fov": 52.0,
		"focus_x": -1.1, "focus_z": FT_MESA.z}





func _imagen_claqueta() -> Image:
	if DisplayServer.get_name() == "headless" or _claqueta == null \
			or Engine.get_process_frames() - _vp_cuadro < 3:
		return null
	return _claqueta.get_image()


func _tick(delta: float) -> void:
	_cola.tick(delta)


func _on_skip() -> void:
	if _cola.salta():
		return
	super._on_skip()


func _skipped() -> void:
	_cola.al_saltar()


func _vigia_ficha() -> void:
	if _leaving or ficha_puesta:
		return
	if _cola.retiene_ficha():
		SceneFade.timer(5.0, true, false, true).timeout.connect(_vigia_ficha)
		return
	super._vigia_ficha()


func zonas_sello() -> Array[Rect2]:
	var out: Array[Rect2] = super()
	var vp: Viewport = get_viewport()
	if vp != null:
		out.append_array(FirmaCola.zonas_lienzo(vp, Vector2(FT_CLAQUETA_PX),
			I18n.t("FIRMA LA CLAQUETA")))
	return out
