extends "res://ui/ceremonies/ruta.gd"






















const FirmaCola := preload("res://ui/ceremonies/firma_cola.gd")



const CARTEL_PX: Vector2i = Vector2i(200, 290)



const FS_MESA: Vector3 = Vector3(0.0, 0.0, 5.7)
const FS_MESA_TAM: Vector3 = Vector3(1.4, 0.74, 0.6)
const FS_TU: Vector3 = Vector3(0.0, 0.0, FS_MESA.z - FS_MESA_TAM.z * 0.5 - 0.12)



const FS_GUARDIAS: Array = [Vector3(-0.62, 0.0, 4.92), Vector3(0.62, 0.0, 4.92)]
const FS_PUESTO: Vector3 = Vector3(-0.6, 0.0, 6.45)

const FS_COLA_0: Vector3 = Vector3(-1.3, 0.0, 6.75)
const FS_COLA_PASO: Vector3 = Vector3(-0.56, 0.0, 0.02)
const FS_EXTRA: int = 2


const FS_SALIDA: Array = [Vector3(-1.0, 0.0, 6.2)]



const FS_HECHOS: Array = [
	Vector3(-4.4, 0.0, 4.3), Vector3(-3.9, 0.0, 4.3), Vector3(-3.4, 0.0, 4.3),
	Vector3(-2.9, 0.0, 4.3),
	Vector3(-4.15, 0.0, 4.85), Vector3(-3.65, 0.0, 4.85), Vector3(-3.15, 0.0, 4.85),
	Vector3(-4.4, 0.0, 5.4), Vector3(-3.9, 0.0, 5.4), Vector3(-3.4, 0.0, 5.4),
]

const FS_CARTEL_M: float = 0.3
const FS_EMPIEZA: float = 1.6

const FS_CRISTAL: Vector3 = Vector3(-0.95, ACERA_Y + 1.5, 4.37)
const FS_CRISTAL_TAM: Vector2 = Vector2(0.8, 1.16)



const FS_APERTURA: Dictionary = {"t": 0.0, "dist": 10.5, "h": 2.4, "yaw": 168.0,
	"aim_y": 1.3, "fov": 50.0, "focus_x": -2.6, "focus_z": 5.9}

var _cola: FirmaCola = FirmaCola.new()

var _vp_firma: SubViewport = null
var _vp_cuadro: int = 0


func _cues_del_acto() -> PackedStringArray:
	return PackedStringArray(["lone_shout", "ui_whoosh", "rotulador_loop"])


func _build() -> void:
	_r.seed = hash("ruta_" + _marca())
	focus = Vector3(-0.5, 0.0, 5.6)
	_mundo()
	_calle()
	_manzana()
	_marquesina()


	_detalle()
	_vp_firma = _cartel_vp_nuevo(2)
	_vp_cuadro = Engine.get_process_frames()
	_cartel_cristal()
	make_camera([FS_APERTURA, _fs_cerca(FS_EMPIEZA + 0.9, 0.0)], 50.0)
	orbit_speed = 0.0
	make_audio(0.0, false)
	var ropa: Dictionary = KitRecolor.casual_of(GameState.team_custom)
	make_player(ropa, "south")
	_cola.arma(self, {
		"mesa": {"centro": FS_MESA, "tam": FS_MESA_TAM, "color": Sponsors.color_of(_marca()),
			"franja": Color(0.97, 0.96, 0.93)},
		"tu": FS_TU, "puesto": FS_PUESTO, "guardias": FS_GUARDIAS,
		"cola_0": FS_COLA_0, "cola_paso": FS_COLA_PASO,
		"hechos": FS_HECHOS, "salida": FS_SALIDA,
		"pieza": _vp_firma.get_texture(), "pieza_m": FS_CARTEL_M,
		"base": _imagen_cartel, "fondo": Sponsors.color_of(_marca()),

		"zona": Rect2(0.04, 0.17, 0.92, 0.7),
		"titulo": I18n.t("FIRMA EL CARTEL"),
		"cerca": _fs_cerca, "final": _fs_final,
		"t_empieza": FS_EMPIEZA, "suelo": ACERA_Y,
		"semilla": "%s|%s" % [_marca(), str(data.get("seed", ""))],
		"kit": GameState.kit_variant(team(), 0), "extra": FS_EXTRA,
	})

	make_chyron(I18n.t("FIRMA DE AUTÓGRAFOS"), _nombre_marca(), {}, 0.5)

	make_card(60.0)
	if _card_tw != null and _card_tw.is_valid():
		_card_tw.kill()
	card_title(I18n.t("FIRMAS EN LA PARADA"), 40)
	card_sub(_nombre_marca(), Sponsors.color_of(_marca()))
	card_count(FirmaCola.N_FIRMAS, I18n.t("AUTÓGRAFOS FIRMADOS"))
	card_note(I18n.t("Diez carteles firmados. Ésos no los arranca nadie."))
	card_cta(I18n.t("SEGUIR"))



func _bus_detalle() -> void:
	pass




func _papelera(at: Vector3) -> void:
	super._papelera(Vector3(4.4, at.y, at.z))




func _cartel_cristal() -> void:
	var col: Color = Sponsors.color_of(_marca())
	_caja(FS_CRISTAL - Vector3(0.0, 0.0, 0.015),
		Vector3(FS_CRISTAL_TAM.x + 0.08, FS_CRISTAL_TAM.y + 0.08, 0.02), col.darkened(0.4))
	var qm: QuadMesh = QuadMesh.new()
	qm.size = FS_CRISTAL_TAM
	var q: MeshInstance3D = _quad_forro(qm, _vp_firma)
	q.position = FS_CRISTAL
	viewport.add_child(q)






func _cartel_vp_nuevo(escala: int = 1) -> SubViewport:
	var vp: SubViewport = SubViewport.new()
	vp.size = CARTEL_PX * escala
	if escala > 1:
		vp.size_2d_override = CARTEL_PX
		vp.size_2d_override_stretch = true
	vp.disable_3d = true
	vp.transparent_bg = false
	vp.render_target_update_mode = SubViewport.UPDATE_ONCE
	add_child(vp)
	var root: Control = Control.new()
	root.size = Vector2(CARTEL_PX)
	vp.add_child(root)
	var col: Color = Sponsors.color_of(_marca())
	var oscuro: Color = col.darkened(0.42)
	var crema: Color = Color("f4f1ec")
	var w: float = float(CARTEL_PX.x)
	_rect(root, Rect2(Vector2.ZERO, Vector2(CARTEL_PX)), col)

	_rect(root, Rect2(Vector2.ZERO, Vector2(w, 46)), oscuro)
	var logo: SponsorLogo = SponsorLogo.new()
	logo.custom_minimum_size = Vector2(38, 38)
	logo.position = Vector2(5, 4)
	logo.size = Vector2(38, 38)
	root.add_child(logo)
	logo.setup(_marca(), crema)
	var marca: String = _nombre_marca()
	_texto(root, marca, Rect2(Vector2(46, 6), Vector2(150, 34)), _cuerpo_que_cabe(marca, 150, 20),
		crema)

	var panel: Control = Control.new()
	panel.position = Vector2(10, 52)
	panel.size = Vector2(180, 160)
	panel.clip_contents = true
	root.add_child(panel)
	_rect(panel, Rect2(Vector2.ZERO, panel.size), col.darkened(0.2))
	for i in 5:
		var x0: float = -90.0 + float(i) * 66.0
		_poli(panel, PackedVector2Array([Vector2(x0, 160), Vector2(x0 + 26, 160),
			Vector2(x0 + 146, 0), Vector2(x0 + 120, 0)]), col.lightened(0.1))
	var look: Dictionary = GameState.team_custom.duplicate()
	look.merge(GameState.kit_variant(team(), 0), true)
	var cara: Image = retrato_image(180, 160, look, 0.5)
	if cara != null:
		var tr: TextureRect = TextureRect.new()
		tr.texture = ImageTexture.create_from_image(cara)
		tr.stretch_mode = TextureRect.STRETCH_SCALE
		tr.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
		tr.size = panel.size
		panel.add_child(tr)

	_rect(root, Rect2(Vector2(0, 214), Vector2(w, 34)), crema)
	var apellido: String = Career.nombre_espalda()
	_texto(root, apellido, Rect2(Vector2(6, 214), Vector2(w - 12, 34)),
		_cuerpo_que_cabe(apellido, int(w) - 12, 28), oscuro)

	var sello: Vector2 = Vector2(172, 194)
	_circulo(root, sello, 22.0, oscuro)
	_circulo(root, sello, 18.0, crema)
	_texto(root, str(int(data.get("number", shirt()))),
		Rect2(sello - Vector2(18, 16), Vector2(36, 32)), 20, oscuro)

	_rect(root, Rect2(Vector2(0, 250), Vector2(w, 40)), oscuro)
	_rect(root, Rect2(Vector2(12, 257), Vector2(90, 22)), crema)
	for i in 5:
		_rect(root, Rect2(Vector2(17 + i * 17, 261), Vector2(12, 8)), oscuro)
	_rect(root, Rect2(Vector2(12, 273), Vector2(90, 2)), col)
	for x: float in [30.0, 84.0]:
		_circulo(root, Vector2(x, 280), 6.0, Color("22242a"))
		_circulo(root, Vector2(x, 280), 2.5, Color("9aa0a8"))
	_rect(root, Rect2(Vector2(116, 268), Vector2(72, 4)), crema)
	for x: float in [120.0, 152.0, 184.0]:
		_circulo(root, Vector2(x, 270), 6.0, crema)
	_circulo(root, Vector2(152, 270), 3.0, col)
	return vp


func _poli(root: Node, pts: PackedVector2Array, col: Color) -> void:
	var p: Polygon2D = Polygon2D.new()
	p.polygon = pts
	p.color = col
	root.add_child(p)


func _circulo(root: Node, c: Vector2, r: float, col: Color) -> void:
	var pts: PackedVector2Array = PackedVector2Array()
	for i in 24:
		pts.append(c + Vector2.from_angle(TAU * float(i) / 24.0) * r)
	_poli(root, pts, col)





func _fs_cerca(tk: float, empuje: float) -> Dictionary:
	return {"t": tk, "dist": lerpf(5.4, 4.9, empuje), "h": lerpf(1.9, 1.8, empuje),
		"yaw": lerpf(172.0, 179.0, empuje), "aim_y": 1.0, "fov": 46.0,
		"focus_x": -0.4, "focus_z": 6.05}




func _fs_final(tk: float) -> Dictionary:
	return {"t": tk, "dist": 9.2, "h": 2.5, "yaw": 178.0, "aim_y": 1.1, "fov": 50.0,
		"focus_x": -2.1, "focus_z": 5.6}





func _imagen_cartel() -> Image:
	if DisplayServer.get_name() == "headless" or _vp_firma == null \
			or Engine.get_process_frames() - _vp_cuadro < 3:
		return null
	return _vp_firma.get_texture().get_image()


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
		out.append_array(FirmaCola.zonas_lienzo(vp, Vector2(CARTEL_PX * 2),
			I18n.t("FIRMA EL CARTEL")))
	return out
