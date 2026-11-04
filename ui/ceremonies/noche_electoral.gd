extends "res://ui/ceremonies/dueno_palco.gd"




















const GALA_SHEET: String = "res://assets/sprites/anim/gala_south_"


const AFORO: float = 0.35





const PRESI_DZ: float = 0.55
const CAND_DZ: float = -0.55
const TU_DZ: float = 1.12



const TABLERO: Vector2 = Vector2(2.5, 0.76)
const TABLERO_Y: float = 2.29
const LIENZO_T: Vector2i = Vector2i(1000, 304)



const T_CUENTA: float = 4.2
const T_REPARTO: float = 6.8
const HAZ_DUR: float = 0.6
const T_FIN_NOCHE: float = 10.6





const HAZ_ALTO: float = 2.55
const HAZ_R_ARRIBA: float = 0.1
const HAZ_R_ABAJO: float = 0.62
const HAZ_ALFA: float = 0.13

var _presi: AnimatedSprite3D = null
var _cand: AnimatedSprite3D = null
var _gente_y: float = 0.0
var _gana: bool = true
var _pct: int = 54
var _apoyo: String = ""
var _contado: bool = false
var _haz: MeshInstance3D = null


var _barra_p: ColorRect = null
var _barra_c: ColorRect = null
var _cifra_p: Label = null
var _cifra_c: Label = null
var _escrutado: ColorRect = null


func _build() -> void:
	_gana = bool(data.get("gana", true))
	_apoyo = String(data.get("apoyo", ""))
	_pct = int(data.get("pct", 0))

	if _pct <= 0:
		_pct = 56 if _gana else 44
	make_stadium({
		"div": div(),
		"attendance": AFORO,

		"venue_empty": true,
		"party": false,
		"flare_odds": 0.0,


		"weather": "night",
		"kickoff": 1.0,
		"kit": GameState.kit_variant(team(), 0),
		"board": team_name().to_upper(),
	})
	_mide_palco()
	_despeja_bajo_palco()
	_build_palco()
	_build_fondo()
	_build_gente()
	_build_tablero()
	focus = Vector3(_palco.x, 0.0, _palco.z)
	make_camera(_keys())
	orbit_speed = DRIFT
	make_audio(AFORO, false)
	flash_pool = _prensa()

	flash_rate = 0.5
	var sub: String = ""
	var sub_col: Color = Color(0, 0, 0, 0)
	if _con_bando():
		sub = I18n.t("LA GRADA TE APLAUDE") if _acerto() else I18n.t("LA GRADA TE PITA")
		if not _acerto():
			sub_col = CareerTheme.DANGER
	make_chyron(I18n.t("GANA EL CANDIDATO") if _gana else I18n.t("SIGUE EL PRESIDENTE"),
		team_name().to_upper(), team(), T_REPARTO + 0.35, "", sub, sub_col)
	card_at = 0.0
	_pon_cuenta(0.0)



func _con_bando() -> bool:
	return _apoyo == Elecciones.PRESIDENTE or _apoyo == Elecciones.CANDIDATO



func _acerto() -> bool:
	return (_apoyo == Elecciones.CANDIDATO) == _gana






const PRENSA_FONDO: float = 9.0


const PRENSA_ANCHO: float = 8.0


func _despeja_bajo_palco() -> void:
	for f in stadium._fans_home + stadium._fans_away:
		if _bajo_palco(f.global_position):
			f.visible = false




	for b in stadium._fan_buckets:
		var mmi: MultiMeshInstance3D = b.get("mmi")
		if mmi == null or mmi.multimesh == null:
			continue
		var mm: MultiMesh = mmi.multimesh
		var g: Transform3D = mmi.global_transform
		for j in mm.instance_count:
			var p: Vector3 = g * mm.get_instance_transform(j).origin
			if _bajo_palco(p):
				mm.set_instance_transform(j, Transform3D(Basis.from_scale(Vector3.ZERO),
					Vector3(0.0, -500.0, 0.0)))



func _bajo_palco(p: Vector3) -> bool:
	var fondo: float =(p.x - _palco.x) * - LADO_X
	return p.y < _palco.y + 0.3 and absf(p.z - _palco.z) < PRENSA_ANCHO \
			and fondo > -1.0 and fondo < PRENSA_FONDO







func _build_fondo() -> void:
	var fondo_x: float = _palco.x + LADO_X * DUENO_DX
	if not _hay_cinta:
		_caja(Vector3(0.12, CABINA_H, BALCON_ANCHO),
			Vector3(fondo_x + LADO_X * 0.06, _palco.y + CABINA_H * 0.5, CENTER_Z),
			Color(0.16, 0.17, 0.19))
		var luz: OmniLight3D = OmniLight3D.new()
		luz.light_color = Color(1.0, 0.86, 0.66)
		luz.light_energy = 1.4
		luz.omni_range = 4.2
		luz.position = Vector3(_palco.x - LADO_X * 0.6, _palco.y + CABINA_H - 0.35, CENTER_Z)
		viewport.add_child(luz)





func _build_gente() -> void:
	_gente_y = _palco.y + feet_offset(PLAYER_HEIGHT_M / PLAYER_METRICS.x, GALA_SHEET + "00.png") \
			- PLAYER_SINK
	_presi = _traje(String(data.get("presi", "presidente_%s" % String(team().get("id", "")))),
		PRESI_DZ)
	_cand = _traje(String(data.get("cand", "candidato_%s" % String(team().get("id", "")))),
		CAND_DZ)
	if _con_bando():
		make_player({}, "south", GALA_SHEET, true)
		var lado: float = signf(PRESI_DZ) if _apoyo == Elecciones.PRESIDENTE else signf(CAND_DZ)
		player.position = Vector3(_palco.x, _gente_y, _palco.z + lado * TU_DZ)


func _traje(cara: String, dz: float) -> AnimatedSprite3D:
	var s: AnimatedSprite3D = AnimatedSprite3D.new()
	s.pixel_size = PLAYER_HEIGHT_M / PLAYER_METRICS.x
	s.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	s.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	s.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	s.sprite_frames = player_frames(KitRecolor.traits_for(cara), "south", GALA_SHEET, true)
	s.position = Vector3(_palco.x, _gente_y, _palco.z + dz)
	s.play("idle")
	viewport.add_child(s)
	return s





func _build_tablero() -> void:
	var vp: SubViewport = SubViewport.new()
	vp.size = LIENZO_T
	vp.disable_3d = true
	vp.transparent_bg = false
	vp.render_target_update_mode = SubViewport.UPDATE_ALWAYS
	add_child(vp)
	var hoja: Control = Control.new()
	hoja.size = Vector2(LIENZO_T)
	vp.add_child(hoja)
	var w: float = float(LIENZO_T.x)
	var h: float = float(LIENZO_T.y)
	_rect(hoja, Rect2(0, 0, w, h), Color(0.04, 0.05, 0.07))

	for r in [Rect2(0, 0, w, 6), Rect2(0, h - 6, w, 6), Rect2(0, 0, 6, h), Rect2(w - 6, 0, 6, h)]:
		_rect(hoja, r, accent)
	var m: float = 30.0
	_nombre(hoja, I18n.t("PRESIDENTE"), Rect2(m, 18, w * 0.5 - m, 52), HORIZONTAL_ALIGNMENT_LEFT)
	_nombre(hoja, I18n.t("CANDIDATO"), Rect2(w * 0.5, 18, w * 0.5 - m, 52),
		HORIZONTAL_ALIGNMENT_RIGHT)
	_cifra_p = _cifra(hoja, Rect2(m, 70, w * 0.5 - m, 120), HORIZONTAL_ALIGNMENT_LEFT)
	_cifra_c = _cifra(hoja, Rect2(w * 0.5, 70, w * 0.5 - m, 120), HORIZONTAL_ALIGNMENT_RIGHT)
	var barra: Rect2 = Rect2(m, 204, w - m * 2.0, 54)
	_barra_p = ColorRect.new()
	_barra_p.position = barra.position
	_barra_p.size = Vector2(barra.size.x * 0.5, barra.size.y)
	hoja.add_child(_barra_p)
	_barra_c = ColorRect.new()
	_barra_c.position = Vector2(barra.position.x + barra.size.x * 0.5, barra.position.y)
	_barra_c.size = Vector2(barra.size.x * 0.5, barra.size.y)
	hoja.add_child(_barra_c)

	_rect(hoja, Rect2(w * 0.5 - 2, barra.position.y - 10, 4, barra.size.y + 20),
		Color(1, 1, 1, 0.85))
	_escrutado = ColorRect.new()
	_escrutado.color = Color(1, 1, 1, 0.55)
	_escrutado.position = Vector2(m, h - 26)
	_escrutado.size = Vector2(0, 6)
	hoja.add_child(_escrutado)
	var q: QuadMesh = QuadMesh.new()
	q.size = TABLERO
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = vp.get_texture()
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_LINEAR
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	var tablero: MeshInstance3D = MeshInstance3D.new()
	tablero.mesh = q
	tablero.material_override = mat


	tablero.rotation.y = deg_to_rad(90.0 * - LADO_X)
	var fondo_x: float = _palco.x + LADO_X * DUENO_DX


	tablero.position = Vector3(fondo_x - LADO_X * 0.12, _palco.y + TABLERO_Y, CENTER_Z)
	viewport.add_child(tablero)


func _nombre(padre: Control, texto: String, r: Rect2, al: int) -> void:
	var l: Label = Label.new()
	l.text = texto
	l.clip_text = true
	l.horizontal_alignment = al
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	l.add_theme_font_size_override("font_size", 40)
	l.add_theme_color_override("font_color", Color(1, 1, 1, 0.8))
	l.position = r.position
	l.size = r.size
	padre.add_child(l)


func _cifra(padre: Control, r: Rect2, al: int) -> Label:
	var l: Label = Label.new()
	l.clip_text = true
	l.horizontal_alignment = al
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	l.add_theme_font_size_override("font_size", 104)
	l.add_theme_color_override("font_color", Color.WHITE)
	l.position = r.position
	l.size = r.size
	padre.add_child(l)
	return l






func _pon_cuenta(k: float) -> void:
	if _barra_p == null:
		return
	var cand: float = 50.0
	if k > 0.0:
		var e: float = 1.0 - pow(1.0 - k, 2.0)
		cand = 50.0 +(float(_pct) - 50.0) * e + sin(k * 17.0) * 4.0 *(1.0 - k)
	if k >= 1.0:
		cand = float(_pct)
	var total: float = _barra_p.size.x + _barra_c.size.x
	var x0: float = _barra_p.position.x
	_barra_p.size.x = total *(100.0 - cand) / 100.0
	_barra_c.position.x = x0 + _barra_p.size.x
	_barra_c.size.x = total - _barra_p.size.x
	_cifra_p.text = "" if k <= 0.0 else "%d%%" %(100 - roundi(cand))
	_cifra_c.text = "" if k <= 0.0 else "%d%%" % roundi(cand)
	_escrutado.size.x =(float(LIENZO_T.x) - 60.0) * clampf(k, 0.0, 1.0)


	if k < 1.0:
		_barra_p.color = Color(0.86, 0.86, 0.88)
		_barra_c.color = Color(0.52, 0.53, 0.57)
	else:
		_barra_c.color = accent if _gana else Color(0.22, 0.23, 0.26)
		_barra_p.color = Color(0.22, 0.23, 0.26) if _gana else accent





func _keys() -> Array:
	var y: float = _palco.y
	var lejos: float = 44.0 if _hay_cinta else 30.0
	return [
		{"t": 0.0, "dist": lejos, "h": 1.7, "yaw": 102.0, "aim_y": maxf(y * 0.55, 3.0),
			"fov": 58.0, "focus_x": _palco.x, "focus_z": _palco.z},
		{"t": 2.4, "dist": lejos * 0.48, "h": y * 0.8 + 1.2, "yaw": 97.0,
			"aim_y": y + 1.1, "fov": 38.0, "focus_x": _palco.x, "focus_z": _palco.z},
		{"t": 4.0, "dist": 10.5, "h": y + 2.0, "yaw": 93.0, "aim_y": y + 1.45,
			"fov": 30.0, "focus_x": _palco.x, "focus_z": _palco.z},
	]


func _tick(_delta: float) -> void:


	if _presi != null:
		_presi.position.y = _gente_y + sin(t * 1.7) * 0.008
	if _cand != null:
		_cand.position.y = _gente_y + sin(t * 1.7 + 2.1) * 0.008
	if t < T_REPARTO:
		_pon_cuenta(clampf((t - T_CUENTA) /(T_REPARTO - T_CUENTA), 0.0, 1.0))
	elif not _contado:
		_reparto()
	if _contado:
		_pon_haz(clampf((t - T_REPARTO) / HAZ_DUR, 0.0, 1.0))
	if t >= T_FIN_NOCHE:
		_leave()




func _reparto() -> void:
	_contado = true
	var gana: AnimatedSprite3D = _cand if _gana else _presi
	if gana != null:
		var arriba: Vector3 = Vector3(gana.position.x, _palco.y + HAZ_ALTO, gana.position.z)


		_haz = make_beam(arriba,
			Vector3(gana.position.x, _palco.y + ANTEPECHO_H, gana.position.z),
			HAZ_R_ARRIBA, HAZ_R_ABAJO, Color(1.0, 0.92, 0.76), 0.0)
	_pon_cuenta(1.0)
	sting("ui_pop", -8.0)
	flash_rate = 3.5
	flash_burst_at = t
	flash_burst_dur = 1.3
	flash_burst_mult = 6.0
	screen_flash(0.08)
	if audio != null:
		if _con_bando() and not _acerto():
			audio.boo(3.2)
		else:
			audio.ovation()
	if player != null:
		var cv: CaraViva = CaraViva.de(player)
		if cv != null:
			cv.anima("alegria" if _acerto() else "tristeza")



func _pon_haz(k: float) -> void:
	if _haz == null:
		return
	var mat: StandardMaterial3D = _haz.material_override as StandardMaterial3D
	mat.albedo_color.a = HAZ_ALFA * k


func _skipped() -> void:
	if not _contado:
		_reparto()
	_pon_haz(1.0)
