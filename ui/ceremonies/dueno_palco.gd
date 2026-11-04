extends Ceremony


































const LADO_X: float = -1.0






const BALCON_FONDO: float = 1.15
const BALCON_ANCHO: float = 3.2
const LOSA: float = 0.22
const ANTEPECHO_H: float = 0.95
const ANTEPECHO_E: float = 0.12


const DUENO_DX: float = 0.8


const CABINA_H: float = 2.7
const FALDON: float = 0.9



const TARIMA_X: float = -40.6
const TARIMA_Y: float = 2.2




const BUFANDA: Vector2 = Vector2(2.4, 0.42)
const BUFANDA_ASOMA: float = 0.03
const LIENZO: Vector2i = Vector2i(800, 140)
const FLECO_PX: int = 34



const T_BUFANDA: float = 5.0
const BUFANDA_DUR: float = 0.55
const T_CHYRON: float = 5.5
const T_FIN: float = 8.6
const DRIFT: float = -0.6

var _palco: Vector3 = Vector3.ZERO
var _frente_x: float = 0.0
var _hay_cinta: bool = false
var _bufanda: MeshInstance3D = null
var _dueno: AnimatedSprite3D = null
var _dueno_y: float = 0.0
var _soltada: bool = false


func _build() -> void:
	make_stadium({
		"div": div(),


		"attendance": 0.0,
		"venue_empty": true,
		"party": false,
		"weather": "day",


		"kickoff": 0.0,
		"kit": GameState.kit_variant(team(), 0),
		"board": team_name().to_upper(),
	})
	_mide_palco()
	_build_palco()
	_build_dueno()
	_build_bufanda()
	focus = Vector3(_palco.x, 0.0, _palco.z)
	make_camera(_keys())
	orbit_speed = DRIFT
	make_audio(0.0, false)


	flash_pool = _prensa()
	make_chyron(I18n.t("DUEÑO NUEVO"), team_name().to_upper(), team(), T_CHYRON)

	card_at = 0.0
	_pon_bufanda(0.0)





func _mide_palco() -> void:
	for v in stadium._box_vols:
		var xf: Transform3D =(v["inv"] as Transform3D).affine_inverse()
		var nrm: Vector3 = xf.basis.z.normalized()
		if nrm.x * - LADO_X < 0.9:
			continue
		var half: Vector3 = v["half"]
		var cristal_x: float = xf.origin.x + nrm.x * half.z
		_hay_cinta = true
		_frente_x = cristal_x - LADO_X * BALCON_FONDO
		_palco = Vector3(cristal_x - LADO_X * DUENO_DX, xf.origin.y - half.y, CENTER_Z)
		return
	_hay_cinta = false
	_frente_x = TARIMA_X - LADO_X *(BALCON_FONDO - DUENO_DX)
	_palco = Vector3(TARIMA_X, TARIMA_Y, CENTER_Z)





func _build_palco() -> void:
	var claro: Color = Color(0.58, 0.59, 0.61)
	var gris: Color = Color(0.3, 0.31, 0.33)
	var oscuro: Color = Color(0.11, 0.12, 0.13)
	var fondo_x: float = _palco.x + LADO_X * DUENO_DX
	var cx: float =(_frente_x + fondo_x) * 0.5
	var fondo: float = absf(_frente_x - fondo_x)
	if not _hay_cinta:

		_caja(Vector3(fondo + 0.6, _palco.y, BALCON_ANCHO + 0.4),
			Vector3(cx + LADO_X * 0.3, _palco.y * 0.5, CENTER_Z), gris)
	else:

		_caja(Vector3(fondo, FALDON, BALCON_ANCHO),
			Vector3(cx, _palco.y - LOSA - FALDON * 0.5, CENTER_Z), gris)

		var cristal: MeshInstance3D = _caja(Vector3(0.1, CABINA_H, BALCON_ANCHO),
			Vector3(fondo_x + LADO_X * 0.05, _palco.y + CABINA_H * 0.5, CENTER_Z),
			Color(0.1, 0.13, 0.17))
		(cristal.material_override as StandardMaterial3D).roughness = 0.15
		(cristal.material_override as StandardMaterial3D).metallic = 0.4
		for dz in [- BALCON_ANCHO / 6.0, BALCON_ANCHO / 6.0]:
			_caja(Vector3(0.14, CABINA_H, 0.12),
				Vector3(fondo_x - LADO_X * 0.02, _palco.y + CABINA_H * 0.5, CENTER_Z + dz),
				oscuro)
		_caja(Vector3(fondo + 0.25, 0.18, BALCON_ANCHO + 0.2),
			Vector3(cx - LADO_X * 0.125, _palco.y + CABINA_H + 0.09, CENTER_Z), claro)

		for sgn in [-1.0, 1.0]:
			_caja(Vector3(fondo, CABINA_H, ANTEPECHO_E),
				Vector3(cx, _palco.y + CABINA_H * 0.5,
					CENTER_Z + sgn *(BALCON_ANCHO - ANTEPECHO_E) * 0.5), gris)


		var luz: OmniLight3D = OmniLight3D.new()
		luz.light_color = Color(1.0, 0.86, 0.66)
		luz.light_energy = 1.4
		luz.omni_range = 4.2
		luz.position = Vector3(cx, _palco.y + CABINA_H - 0.35, CENTER_Z)
		viewport.add_child(luz)

	_caja(Vector3(fondo, LOSA, BALCON_ANCHO),
		Vector3(cx, _palco.y - LOSA * 0.5, CENTER_Z), gris)

	_caja(Vector3(ANTEPECHO_E, ANTEPECHO_H, BALCON_ANCHO),
		Vector3(_frente_x + LADO_X * ANTEPECHO_E * 0.5, _palco.y + ANTEPECHO_H * 0.5,
			CENTER_Z), claro)
	if not _hay_cinta:
		for sgn in [-1.0, 1.0]:
			_caja(Vector3(fondo, ANTEPECHO_H, ANTEPECHO_E),
				Vector3(cx, _palco.y + ANTEPECHO_H * 0.5,
					CENTER_Z + sgn *(BALCON_ANCHO - ANTEPECHO_E) * 0.5), claro)

	_caja(Vector3(ANTEPECHO_E + 0.06, 0.05, BALCON_ANCHO + 0.04),
		Vector3(_frente_x + LADO_X * ANTEPECHO_E * 0.5, _palco.y + ANTEPECHO_H + 0.025,
			CENTER_Z), oscuro)


func _caja(tam: Vector3, pos: Vector3, col: Color) -> MeshInstance3D:
	var m: MeshInstance3D = MeshInstance3D.new()
	var bm: BoxMesh = BoxMesh.new()
	bm.size = tam
	m.mesh = bm
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = col
	mat.roughness = 0.8
	m.material_override = mat
	m.position = pos
	viewport.add_child(m)
	return m





func _build_dueno() -> void:
	_dueno = AnimatedSprite3D.new()
	_dueno.pixel_size = PLAYER_HEIGHT_M / PLAYER_METRICS.x
	_dueno.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	_dueno.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	_dueno.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	_dueno.sprite_frames = player_frames(KitRecolor.traits_for(_cara()), "south",
		"res://assets/sprites/anim/gala_south_", true)
	_dueno_y = _palco.y + feet_offset(_dueno.pixel_size) - PLAYER_SINK
	_dueno.position = Vector3(_palco.x, _dueno_y, _palco.z)
	_dueno.play("idle")
	viewport.add_child(_dueno)




func _cara() -> String:
	var who: String = String(data.get("who", ""))
	if not who.is_empty():
		return who
	return "dueno_%s" % String(team().get("id", ""))





func _build_bufanda() -> void:
	var vp: SubViewport = SubViewport.new()
	vp.size = LIENZO
	vp.disable_3d = true
	vp.transparent_bg = true


	vp.render_target_update_mode = SubViewport.UPDATE_ALWAYS
	add_child(vp)
	_pinta_bufanda(vp)
	var q: QuadMesh = QuadMesh.new()
	q.size = BUFANDA
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = vp.get_texture()
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA_SCISSOR
	mat.alpha_scissor_threshold = 0.5
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_LINEAR


	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.albedo_color = Color(0.92, 0.92, 0.92)
	mat.cull_mode = BaseMaterial3D.CULL_DISABLED
	_bufanda = MeshInstance3D.new()
	_bufanda.mesh = q
	_bufanda.material_override = mat

	_bufanda.rotation.y = deg_to_rad(90.0 * - LADO_X)
	_bufanda.position = Vector3(_frente_x - LADO_X * 0.015,
		_palco.y + ANTEPECHO_H + BUFANDA_ASOMA - BUFANDA.y * 0.5, CENTER_Z)
	viewport.add_child(_bufanda)





func _pinta_bufanda(vp: SubViewport) -> void:
	var club: Dictionary = team()
	var c1: Color = club.get("kit", CareerTheme.accent_of(club)) as Color
	var c2: Color = club.get("kit2", Color.WHITE) as Color
	if absf(c1.get_luminance() - c2.get_luminance()) < 0.18:
		c2 = Color.WHITE if c1.get_luminance() < 0.5 else Color(0.06, 0.06, 0.08)
	var hoja: Control = Control.new()
	hoja.size = Vector2(LIENZO)
	vp.add_child(hoja)
	var cuerpo: Rect2 = Rect2(FLECO_PX, 0, LIENZO.x - FLECO_PX * 2, LIENZO.y)
	_rect(hoja, cuerpo, c1)
	var filo: float = LIENZO.y * 0.11
	_rect(hoja, Rect2(cuerpo.position.x, filo * 0.6, cuerpo.size.x, filo), c2)
	_rect(hoja, Rect2(cuerpo.position.x, LIENZO.y - filo * 1.6, cuerpo.size.x, filo), c2)

	var tira: int = 6
	for lado in [0, LIENZO.x - FLECO_PX]:
		var x: int = 0
		while x < FLECO_PX:
			var col: Color = c1 if (x / tira) % 2 == 0 else c2
			_rect(hoja, Rect2(lado + x, LIENZO.y * 0.08, tira - 1, LIENZO.y * 0.84), col)
			x += tira
	var esc_px: int = int(LIENZO.y * 0.62)
	var esc: Texture2D = crest_texture(club, 128, true)
	for ex in [cuerpo.position.x + 18.0, cuerpo.end.x - 18.0 - esc_px]:
		var tr: TextureRect = TextureRect.new()
		tr.texture = esc
		tr.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
		tr.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		tr.position = Vector2(ex,(LIENZO.y - esc_px) * 0.5)
		tr.size = Vector2(esc_px, esc_px)
		hoja.add_child(tr)
	var lbl: Label = Label.new()
	lbl.text = team_name().to_upper()
	lbl.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	lbl.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	lbl.clip_text = true
	var margen: float = 18.0 + esc_px + 16.0


	var cabe: float = cuerpo.size.x - margen * 2.0 - 12.0
	var fuente: Font = lbl.get_theme_font("font")
	var tam: int = 58
	while tam > 22 and fuente.get_string_size(lbl.text, HORIZONTAL_ALIGNMENT_LEFT, -1,
			tam).x > cabe:
		tam -= 2
	lbl.add_theme_font_size_override("font_size", tam)
	lbl.add_theme_color_override("font_color", c2)
	lbl.position = Vector2(cuerpo.position.x + margen, 0.0)
	lbl.size = Vector2(cuerpo.size.x - margen * 2.0, LIENZO.y)
	hoja.add_child(lbl)


func _rect(padre: Control, r: Rect2, col: Color) -> void:
	var cr: ColorRect = ColorRect.new()
	cr.color = col
	cr.position = r.position
	cr.size = r.size
	padre.add_child(cr)









func _keys() -> Array:
	var y: float = _palco.y
	var lejos: float = 44.0 if _hay_cinta else 30.0
	return [
		{"t": 0.0, "dist": lejos, "h": 1.7, "yaw": 102.0, "aim_y": maxf(y * 0.55, 3.0),
			"fov": 58.0, "focus_x": _palco.x, "focus_z": _palco.z},
		{"t": 2.8, "dist": lejos * 0.46, "h": y * 0.8 + 1.2, "yaw": 97.0,
			"aim_y": y + 0.9, "fov": 38.0, "focus_x": _palco.x, "focus_z": _palco.z},
		{"t": 4.6, "dist": 8.2, "h": y + 2.1, "yaw": 93.0, "aim_y": y + 1.2,
			"fov": 30.0, "focus_x": _palco.x, "focus_z": _palco.z},
	]




func _prensa() -> Array[Vector3]:
	var out: Array[Vector3] = []
	for i in 22:




		var dz: float = rng.randf_range(0.2, 0.8) *(1.0 if rng.randf() < 0.5 else -1.0)
		out.append(Vector3(_frente_x - LADO_X * rng.randf_range(2.0, 3.5),
			_palco.y + rng.randf_range(1.0, 1.8), CENTER_Z + dz))
	return out


func _tick(_delta: float) -> void:


	if _dueno != null:
		_dueno.position.y = _dueno_y + sin(t * 1.7) * 0.008
	_pon_bufanda(clampf((t - T_BUFANDA) / BUFANDA_DUR, 0.0, 1.0))
	if not _soltada and t >= T_BUFANDA:
		_soltada = true
		sting("ui_pop", -10.0)

	if flash_rate <= 0.0 and t >= T_BUFANDA + BUFANDA_DUR * 0.6:
		flash_rate = 4.0
		flash_burst_at = t
		flash_burst_dur = 1.4
		flash_burst_mult = 6.0
		screen_flash(0.1)
	if t >= T_FIN:
		_leave()





func _pon_bufanda(k: float) -> void:
	if _bufanda == null:
		return
	var ancho: float = 1.0 - pow(1.0 - k, 3.0) + sin(k * PI) * 0.06
	var largo: float = clampf(k * 1.6, 0.0, 1.0)
	_bufanda.visible = k > 0.0
	_bufanda.scale = Vector3(maxf(ancho, 0.02), maxf(largo, 0.05), 1.0)
	_bufanda.position.y = _palco.y + ANTEPECHO_H + BUFANDA_ASOMA \
			- BUFANDA.y * 0.5 * _bufanda.scale.y


func _skipped() -> void:
	_pon_bufanda(1.0)
