extends "res://ui/ceremonies/portada.gd"





















const FirmaCola := preload("res://ui/ceremonies/firma_cola.gd")



const PORTADA_PX: Vector2i = Vector2i(200, 290)


const FS_MESA: Vector3 = Vector3(-0.3, 0.0, 5.3)
const FS_MESA_TAM: Vector3 = Vector3(1.4, 0.74, 0.6)


const FS_TU: Vector3 = Vector3(-0.3, 0.0, FS_MESA.z - FS_MESA_TAM.z * 0.5 - 0.12)
const FS_PUESTO: Vector3 = Vector3(-1.0, 0.0, 6.05)



const FS_COLA_0: Vector3 = Vector3(-1.65, 0.0, 6.35)
const FS_COLA_PASO: Vector3 = Vector3(-0.56, 0.0, 0.02)
const FS_EXTRA: int = 2

const FS_SALIDA: Array = [Vector3(-1.4, 0.0, 5.75)]



const FS_HECHOS: Array = [
	Vector3(-4.0, 0.0, 4.35), Vector3(-3.5, 0.0, 4.35), Vector3(-3.0, 0.0, 4.35),
	Vector3(-2.5, 0.0, 4.35),
	Vector3(-3.75, 0.0, 4.85), Vector3(-3.25, 0.0, 4.85), Vector3(-2.75, 0.0, 4.85),
	Vector3(-4.0, 0.0, 5.35), Vector3(-3.5, 0.0, 5.35), Vector3(-3.0, 0.0, 5.35),
]


const FS_CAJA_M: float = 0.26
const FS_EMPIEZA: float = 1.6


const FS_CRISTAL: Vector3 = Vector3(-0.3, ACERA_Y + 1.95, 3.58)
const FS_CRISTAL_TAM: Vector2 = Vector2(0.86, 1.25)



const FS_APERTURA: Dictionary = {"t": 0.0, "dist": 10.5, "h": 2.4, "yaw": 168.0,
	"aim_y": 1.6, "fov": 50.0, "focus_x": -2.6, "focus_z": 5.9}

var _fila: FirmaCola = FirmaCola.new()

var _vp_firma: SubViewport = null
var _vp_cuadro: int = 0


func _cues_del_acto() -> PackedStringArray:
	return PackedStringArray(["lone_shout", "ui_whoosh", "rotulador_loop"])


func _build() -> void:
	_r.seed = hash("portada_" + _marca())
	focus = Vector3(-0.6, 0.0, 5.6)
	_mundo()
	_calle()
	_manzana()
	_tienda()
	_build_neon()
	_build_cartel()


	_detalle()

	_neon_on = true
	_pon_neon(1.0)
	_vp_firma = _portada_vp_nueva(2)
	_vp_cuadro = Engine.get_process_frames()
	_portada_cristal()
	make_camera([FS_APERTURA, _fs_cerca(FS_EMPIEZA + 0.9, 0.0)], 50.0)
	orbit_speed = 0.0
	make_audio(0.0, false)
	var ropa: Dictionary = KitRecolor.casual_of(GameState.team_custom)
	make_player(ropa, "south")
	_fila.arma(self, {
		"mesa": {"centro": FS_MESA, "tam": FS_MESA_TAM, "color": Sponsors.color_of(_marca()),
			"franja": Color(0.97, 0.96, 0.93)},
		"tu": FS_TU, "puesto": FS_PUESTO, "cola_0": FS_COLA_0, "cola_paso": FS_COLA_PASO,
		"hechos": FS_HECHOS, "salida": FS_SALIDA,
		"pieza": _vp_firma.get_texture(), "pieza_m": FS_CAJA_M,
		"base": _imagen_portada, "fondo": Sponsors.color_of(_marca()),

		"zona": Rect2(0.04, 0.17, 0.92, 0.7),
		"titulo": I18n.t("FIRMA LA PORTADA"),
		"cerca": _fs_cerca, "final": _fs_final,
		"t_empieza": FS_EMPIEZA, "suelo": ACERA_Y,
		"semilla": "%s|%s" % [_marca(), str(data.get("seed", ""))],
		"kit": GameState.kit_variant(team(), 0), "extra": FS_EXTRA,
	})

	make_chyron(I18n.t("FIRMA DE AUTÓGRAFOS"), _nombre_marca(), {}, 0.5)

	make_card(60.0)
	if _card_tw != null and _card_tw.is_valid():
		_card_tw.kill()
	card_title(I18n.t("FIRMAS EN LA TIENDA"), 40)
	card_sub(_nombre_marca(), Sponsors.color_of(_marca()))
	card_count(FirmaCola.N_FIRMAS, I18n.t("AUTÓGRAFOS FIRMADOS"))
	card_note(I18n.t("Diez portadas firmadas. Ésas no se revenden."))
	card_cta(I18n.t("SEGUIR"))




func _postes_cola() -> void:
	pass




func _portada_cristal() -> void:
	var col: Color = Sponsors.color_of(_marca())
	_caja(FS_CRISTAL - Vector3(0.0, 0.0, 0.02),
		Vector3(FS_CRISTAL_TAM.x + 0.08, FS_CRISTAL_TAM.y + 0.08, 0.02), col.darkened(0.4))
	var q: MeshInstance3D = MeshInstance3D.new()
	var qm: QuadMesh = QuadMesh.new()
	qm.size = FS_CRISTAL_TAM
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = _vp_firma.get_texture()
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_LINEAR
	q.mesh = qm
	q.material_override = mat
	q.position = FS_CRISTAL
	q.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	viewport.add_child(q)








func _portada_vp_nueva(escala: int = 1) -> SubViewport:
	var vp: SubViewport = SubViewport.new()
	vp.size = PORTADA_PX * escala
	if escala > 1:
		vp.size_2d_override = PORTADA_PX
		vp.size_2d_override_stretch = true
	vp.disable_3d = true
	vp.transparent_bg = false
	vp.render_target_update_mode = SubViewport.UPDATE_ONCE
	add_child(vp)
	var root: Control = Control.new()
	root.size = Vector2(PORTADA_PX)
	vp.add_child(root)
	var col: Color = Sponsors.color_of(_marca())
	var crema: Color = Color("f4f1ec")
	var negro: Color = Color("15181f")
	var w: float = float(PORTADA_PX.x)
	var h: float = float(PORTADA_PX.y)

	_rect(root, Rect2(Vector2.ZERO, Vector2(PORTADA_PX)), Color("dfe3ea"))
	_rect(root, Rect2(Vector2(5, 5), Vector2(w - 10, h - 10)), negro)

	_rect(root, Rect2(Vector2(5, 5), Vector2(w - 10, 40)), col)
	var logo: SponsorLogo = SponsorLogo.new()
	logo.custom_minimum_size = Vector2(32, 32)
	logo.position = Vector2(9, 9)
	logo.size = Vector2(32, 32)
	root.add_child(logo)
	logo.setup(_marca(), crema)
	var marca: String = _nombre_marca()
	_texto(root, marca, Rect2(Vector2(44, 8), Vector2(148, 34)), _cuerpo_que_cabe(marca, 148, 20),
		crema)
	_rect(root, Rect2(Vector2(5, 45), Vector2(w - 10, 2)), col.lightened(0.4))

	var panel: Control = Control.new()
	panel.position = Vector2(5, 47)
	panel.size = Vector2(w - 10, 176)
	panel.clip_contents = true
	root.add_child(panel)
	var pw: float = panel.size.x
	var ph: float = panel.size.y
	_rect(panel, Rect2(Vector2.ZERO, panel.size), col.darkened(0.62))

	var centro: Vector2 = Vector2(pw * 0.5, ph * 0.46)
	for i in 12:
		if i % 2 == 1:
			continue
		var a0: float = TAU * float(i) / 12.0
		var a1: float = TAU * float(i + 1) / 12.0
		_poli(panel, PackedVector2Array([centro, centro + Vector2.from_angle(a0) * 260.0,
			centro + Vector2.from_angle(a1) * 260.0]), col.darkened(0.42))

	_rect(panel, Rect2(Vector2(0, 108), Vector2(pw, 26)), negro.lightened(0.08))
	_rect(panel, Rect2(Vector2(0, 122), Vector2(pw, 12)), negro.lightened(0.16))
	for i in 24:
		var lx: float = 4.0 + float(i) * 8.0
		_rect(panel, Rect2(Vector2(lx, 112 +(i % 2) * 3), Vector2(2, 2)), col.lightened(0.3))
	_rect(panel, Rect2(Vector2(0, 134), Vector2(pw, ph - 134)), col.darkened(0.5))
	for i in 4:
		_rect(panel, Rect2(Vector2(0, 140 + i * 10), Vector2(pw, 4)), col.darkened(0.42))

	for tx: float in [16.0, pw - 16.0]:
		_circulo(panel, Vector2(tx, 22), 22.0, Color(crema, 0.16))
		_rect(panel, Rect2(Vector2(tx - 2, 28), Vector2(4, 84)), negro)
		_rect(panel, Rect2(Vector2(tx - 12, 12), Vector2(24, 16)), negro)
		for fy in 2:
			for fx in 3:
				_rect(panel, Rect2(Vector2(tx - 10 + fx * 7, 14 + fy * 7), Vector2(5, 5)), crema)


	_elipse(panel, Vector2(pw * 0.5, 162), Vector2(34, 7), Color(negro, 0.55))
	var look: Dictionary = GameState.team_custom.duplicate()
	look.merge(GameState.kit_variant(team(), 0), true)
	look["number"] = int(data.get("number", shirt()))
	var frames: SpriteFrames = player_frames(look, "south")
	if frames != null and frames.get_frame_count("idle") > 0:
		var tex: Texture2D = frames.get_frame_texture("idle", 0)
		var esc: float = 2.5

		var cuerpo: Rect2i = Rect2i(33, 21, 26, 63)
		var im: Image = tex.get_image()
		if im != null and im.get_used_rect().has_area():
			cuerpo = im.get_used_rect()
		var tr: TextureRect = TextureRect.new()
		tr.texture = tex
		tr.stretch_mode = TextureRect.STRETCH_SCALE
		tr.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
		tr.size = Vector2(tex.get_size()) * esc
		var pie: Vector2 = Vector2(float(cuerpo.position.x) + float(cuerpo.size.x) * 0.5,
			float(cuerpo.end.y))
		tr.position =(Vector2(pw * 0.5, 163) - pie * esc).round()
		panel.add_child(tr)

	_circulo(panel, Vector2(pw * 0.5 + 40, 156), 9.0, negro)
	_circulo(panel, Vector2(pw * 0.5 + 40, 156), 7.5, crema)
	_circulo(panel, Vector2(pw * 0.5 + 40, 156), 2.6, negro)
	for d: Vector3 in [Vector3(30, 44, 7), Vector3(pw - 34, 58, 9), Vector3(44, 92, 5),
			Vector3(pw - 46, 98, 6)]:
		_destello(panel, Vector2(d.x, d.y), d.z, crema)

	_rect(root, Rect2(Vector2(5, 223), Vector2(w - 10, 2)), col.lightened(0.4))
	var apellido: String = Career.nombre_espalda()
	_texto(root, apellido, Rect2(Vector2(10, 228), Vector2(132, 30)),
		_cuerpo_que_cabe(apellido, 132, 26), crema)
	for i in 5:
		_destello(root, Vector2(18 + i * 15, 270), 6.0, col.lightened(0.35))
	_rect(root, Rect2(Vector2(148, 230), Vector2(44, 52)), col)
	_rect(root, Rect2(Vector2(151, 233), Vector2(38, 46)), col.darkened(0.35))
	_texto(root, str(int(data.get("number", shirt()))), Rect2(Vector2(148, 236), Vector2(44, 40)),
		28, crema)
	return vp


func _poli(root: Node, pts: PackedVector2Array, col: Color) -> void:
	var p: Polygon2D = Polygon2D.new()
	p.polygon = pts
	p.color = col
	root.add_child(p)


func _circulo(root: Node, c: Vector2, r: float, col: Color) -> void:
	_elipse(root, c, Vector2(r, r), col)


func _elipse(root: Node, c: Vector2, r: Vector2, col: Color) -> void:
	var pts: PackedVector2Array = PackedVector2Array()
	for i in 24:
		pts.append(c + Vector2.from_angle(TAU * float(i) / 24.0) * r)
	_poli(root, pts, col)



func _destello(root: Node, c: Vector2, r: float, col: Color) -> void:
	var f: float = r * 0.3
	_poli(root, PackedVector2Array([c + Vector2(0, - r), c + Vector2(f, 0), c + Vector2(0, r),
		c + Vector2(- f, 0)]), col)
	_poli(root, PackedVector2Array([c + Vector2(- r, 0), c + Vector2(0, - f), c + Vector2(r, 0),
		c + Vector2(0, f)]), col)





func _fs_cerca(tk: float, empuje: float) -> Dictionary:
	return {"t": tk, "dist": lerpf(5.4, 4.9, empuje), "h": lerpf(1.9, 1.8, empuje),
		"yaw": lerpf(172.0, 179.0, empuje), "aim_y": 1.05, "fov": 46.0,
		"focus_x": -0.6, "focus_z": 5.7}









func _fs_final(tk: float) -> Dictionary:
	return {"t": tk, "dist": 12.5, "h": 2.6, "yaw": 178.0,
		"aim_y": 2.4 if UiKit.es_horizontal() else 1.5, "fov": 50.0,
		"focus_x": -0.95, "focus_z": 5.5}





func _imagen_portada() -> Image:
	if DisplayServer.get_name() == "headless" or _vp_firma == null \
			or Engine.get_process_frames() - _vp_cuadro < 3:
		return null
	return _vp_firma.get_texture().get_image()


func _tick(delta: float) -> void:
	_fila.tick(delta)


func _on_skip() -> void:
	if _fila.salta():
		return
	super._on_skip()


func _skipped() -> void:
	_fila.al_saltar()


func _vigia_ficha() -> void:
	if _leaving or ficha_puesta:
		return
	if _fila.retiene_ficha():
		SceneFade.timer(5.0, true, false, true).timeout.connect(_vigia_ficha)
		return
	super._vigia_ficha()


func zonas_sello() -> Array[Rect2]:
	var out: Array[Rect2] = super()
	var vp: Viewport = get_viewport()
	if vp != null:
		out.append_array(FirmaCola.zonas_lienzo(vp, Vector2(PORTADA_PX * 2),
			I18n.t("FIRMA LA PORTADA")))
	return out
