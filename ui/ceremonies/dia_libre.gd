extends Ceremony

























const DRIFT: float = -0.12
const T_CHYRON: float = 1.0


const T_PITIDO: float = 0.8
const T_FINAL: float = 4.4
const T_CARD: float = 5.4
const YO_ART: String = "res://assets/sprites/anim/casual_idle_north_"






const TU: Vector2 = Vector2(1.45, -1.45)





const SENTADO: float = 0.12







const CAM_H: float = 2.3
const FOCO: Vector2 = Vector2(2.3, -0.95)
const YAW: float = 128.0


const TV_Y: float = 1.3
const CESPED: Vector2 = Vector2(1.9, 1.0)





const BARRA: Vector2 = Vector2(1.5, 0.36)
const BARRA_V: float = 0.29
const PESTANA: Vector2 = Vector2(0.56, 0.15)
const PESTANA_V: float = 0.03
const PLACA_COLOR: Color = Color(0.05, 0.08, 0.16)
const ESCUDO_M: float = 0.28
const ESCUDO_U: float = 0.55
const CIFRA_ANCHO: float = 0.7
const CIFRA_PX: float = 0.0024

const JUEGO_U: float = 0.82
const JUEGO_V: Vector2 = Vector2(-0.44, -0.1)
const PUNTOS_POR_EQUIPO: int = 5

const FRANJAS: int = 5

var _centro: Vector3
var _hacia: Vector3
var _derecha: Vector3
var _cifra: Label3D
var _reloj: Label3D
var _gol: Label3D
var _balon: MeshInstance3D

var _puntos: Array = []

var _goles: Array = []
var _vistos: int = 0
var _pitado: bool = false
var _final: bool = false



func _accent_for() -> Color:
	return CareerTheme.accent_of(team())


func _build() -> void:
	focus = Vector3.ZERO
	var sala: DecisionRoom = DecisionRoom.new()
	sala.kind = DecisionRoom.CASA
	sala.div = div()
	sala.club_color = accent
	sala.crest = crest_texture(team())
	viewport.add_child(sala)
	_goles = goles_de(data)
	var foco: Vector3 = sala.cone(FOCO.x, FOCO.y)

	make_camera([
		{"t": 0.0, "dist": 5.3, "h": CAM_H, "yaw": YAW, "aim_y": 1.04, "fov": 44.0,
			"focus_x": foco.x, "focus_z": foco.z},
		{"t": T_CARD, "dist": 4.95, "h": CAM_H - 0.05, "yaw": YAW + 1.5, "aim_y": 1.06,
			"fov": 44.0, "focus_x": foco.x, "focus_z": foco.z},
	])
	orbit_speed = DRIFT
	make_player(KitRecolor.casual_of(GameState.team_custom), "north", YO_ART)
	var at: Vector3 = sala.cone(TU.x, TU.y)
	player.position.x = at.x
	player.position.z = at.z
	player.position.y -= SENTADO
	_bufanda(sala)
	_luz_de_atras(sala)
	_build_tele(sala)
	make_audio(0.0, false)

	var tg: int = int(data.get("team_goals", 0))
	var rg: int = int(data.get("rival_goals", 0))
	make_chyron(I18n.t("DÍA LIBRE"), team_name("?").to_upper(), team(), T_CHYRON)
	make_card(T_CARD)
	card_title(CareerTheme.caps(Career.player_name), 40)
	card_sub(I18n.t("LO VES DESDE CASA"), text_accent())
	card_stats([
		{"v": "%d - %d" % [tg, rg], "k": I18n.t("FINAL")},
		{"v": str(int(Career.energy)), "k": I18n.t("ENERGÍA")},
	])
	card_note(I18n.t(nota(signi(tg - rg))))
	card_cta()




static func nota(resultado: int) -> String:
	if resultado > 0:
		return "Ganaron sin ti. Llegas entero a lo que viene."
	if resultado == 0:
		return "Empate sin ti. La prensa pregunta dónde estabas."
	return "Perdieron sin ti. La prensa pregunta dónde estabas."







static func goles_de(d: Dictionary) -> Array:
	var tg: int = maxi(0, int(d.get("team_goals", 0)))
	var rg: int = maxi(0, int(d.get("rival_goals", 0)))
	var out: Array = []
	var mios: int = 0
	for g in (d.get("goles", []) as Array):
		if not (g is Array) or (g as Array).size() < 2:
			continue
		var mio: bool = bool(g[1])
		mios += 1 if mio else 0
		out.append([clampi(int(g[0]), 1, 90), mio])
	if mios == tg and out.size() - mios == rg:
		out.sort_custom(func(a: Array, b: Array) -> bool: return int(a[0]) < int(b[0]))
		return out
	out = []
	var n: int = tg + rg
	var puestos: int = 0
	for i in n:

		var mio: bool = rg == 0 or (puestos < tg and
			float(puestos) / float(tg) <= float(i - puestos) / float(rg))
		puestos += 1 if mio else 0
		out.append([clampi(int(round(90.0 * float(i + 1) / float(n + 1))), 1, 90), mio])
	return out




func _en_tele(u: float, v: float, capa: float) -> Vector3:
	return _centro + _derecha * u + Vector3.UP * v + _hacia * capa







func _build_tele(sala: DecisionRoom) -> void:
	_centro = sala.cone(DecisionRoom.CASA_TV_F, DecisionRoom.CASA_TV_R)
	_centro.y = TV_Y

	_hacia = - sala.cone(1.0, 0.0).normalized()
	_derecha = sala.cone(0.0, 1.0).normalized()
	var giro: float = sala.face()
	_quad(CESPED, _en_tele(0.0, 0.0, 0.085), giro, Color.WHITE, _textura_cesped())
	var rival: Dictionary = Teams.by_id(String(data.get("rival", "")))
	var mio: Color = CareerTheme.accent_of(team())
	var suyo: Color = CareerTheme.accent_of(rival) if not rival.is_empty() else Color.WHITE
	for i in PUNTOS_POR_EQUIPO * 2:
		var es_mio: bool = i < PUNTOS_POR_EQUIPO
		var k: int = i % PUNTOS_POR_EQUIPO

		var u: float =(-0.62 + 0.13 * float(k)) *(1.0 if es_mio else -1.0)
		var v: float = lerpf(JUEGO_V.x, JUEGO_V.y, float(k % 3) / 2.0)
		var p: MeshInstance3D = _quad(Vector2(0.07, 0.07), _en_tele(u, v, 0.095), giro,
			mio if es_mio else suyo)
		_puntos.append([p, u, v, rng.randf() * TAU, es_mio])
	_balon = _quad(Vector2(0.045, 0.045), _en_tele(0.0, -0.27, 0.1), giro, Color.WHITE)
	_quad(BARRA, _en_tele(0.0, BARRA_V, 0.105), giro, PLACA_COLOR)
	_quad(PESTANA, _en_tele(0.0, PESTANA_V, 0.105), giro, PLACA_COLOR)
	_escudo_tele(team(), _en_tele(- ESCUDO_U, BARRA_V, 0.12), giro)
	_escudo_tele(rival, _en_tele(ESCUDO_U, BARRA_V, 0.12), giro)
	_cifra = _rotulo("0-0", 96, CIFRA_PX, _en_tele(0.0, BARRA_V, 0.12), giro)
	_reloj = _rotulo("0'", 48, 0.0019, _en_tele(0.0, PESTANA_V, 0.12), giro)
	_gol = _rotulo(I18n.t("GOL"), 96, 0.0019, _en_tele(0.0, -0.22, 0.13), giro)
	_gol.visible = false
	_pinta_cifra(0, 0)


func _quad(size: Vector2, at: Vector3, giro: float, col: Color,
		tex: Texture2D = null) -> MeshInstance3D:
	var mi: MeshInstance3D = MeshInstance3D.new()
	var q: QuadMesh = QuadMesh.new()
	q.size = size
	mi.mesh = q
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.albedo_color = col
	if tex != null:
		mat.albedo_texture = tex
		mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	mi.material_override = mat
	mi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	mi.position = at
	mi.rotation_degrees.y = giro
	viewport.add_child(mi)
	return mi


func _rotulo(txt: String, px: int, pixel: float, at: Vector3, giro: float) -> Label3D:
	var l: Label3D = Label3D.new()
	l.text = txt
	l.font_size = px
	l.pixel_size = pixel
	l.outline_size = 8
	l.modulate = Color.WHITE
	l.outline_modulate = PLACA_COLOR
	l.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	l.position = at
	l.rotation_degrees.y = giro
	viewport.add_child(l)
	return l





func _textura_cesped() -> Texture2D:
	var w: int = 96
	var h: int = 50
	var cx: int = w>>1
	var cy: int = h>>1
	var img: Image = Image.create_empty(w, h, false, Image.FORMAT_RGBA8)
	var claro: Color = Color("3c9a48")
	var oscuro: Color = Color("2f8540")
	var cal: Color = Color("e9f5ea")
	for x in w:
		for y in h:
			img.set_pixel(x, y, claro if (x>>3)&1 == 0 else oscuro)
	for x in range(3, w - 3):
		img.set_pixel(x, 3, cal)
		img.set_pixel(x, h - 4, cal)
	for y in range(3, h - 3):
		img.set_pixel(3, y, cal)
		img.set_pixel(w - 4, y, cal)
		img.set_pixel(cx, y, cal)
	for a in 64:
		var ang: float = TAU * float(a) / 64.0
		img.set_pixel(cx + int(round(cos(ang) * 7.0)), cy + int(round(sin(ang) * 7.0)), cal)
	for lado in [3, w - 4]:
		var hacia_dentro: int = 1 if lado == 3 else -1
		for y in range(cy - 11, cy + 12):
			img.set_pixel(lado + hacia_dentro * 12, y, cal)
		for k in 13:
			img.set_pixel(lado + hacia_dentro * k, cy - 11, cal)
			img.set_pixel(lado + hacia_dentro * k, cy + 11, cal)
	return ImageTexture.create_from_image(img)


func _escudo_tele(equipo: Dictionary, at: Vector3, giro: float) -> void:
	var tex: Texture2D = crest_texture(equipo)
	if tex == null:
		return
	var s: Sprite3D = Sprite3D.new()
	s.texture = tex
	s.pixel_size = ESCUDO_M / float(maxi(tex.get_width(), 1))
	s.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	s.shaded = false
	s.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	s.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	s.position = at
	s.rotation_degrees.y = giro
	viewport.add_child(s)





func _bufanda(sala: DecisionRoom) -> void:
	var f: float = DecisionRoom.CASA_SOFA_F - 0.42


	var r: float = -0.15
	var giro: float = sala.face()
	var col: Color = accent


	var raya: Color = col.darkened(0.55) if col.get_luminance() > 0.55 else col.lightened(0.55)


	_caja(Vector3(0.95, 0.04, 0.26), sala.cone(f, r) + Vector3(0, 1.145, 0), giro, col)
	var cuelga: Vector3 = sala.cone(f - 0.13, r - 0.3)
	for i in FRANJAS:
		var alto: float = 0.56 / float(FRANJAS)
		_caja(Vector3(0.2, alto, 0.04), cuelga + Vector3(0, 1.12 - alto *(float(i) + 0.5), 0),
			giro, col if i % 2 == 0 else raya)
	for dr in [-0.18, 0.18]:
		_caja(Vector3(0.06, 0.045, 0.265), sala.cone(f, r + dr) + Vector3(0, 1.146, 0),
			giro, raya)







func _luz_de_atras(sala: DecisionRoom) -> void:
	var luz: OmniLight3D = OmniLight3D.new()
	luz.position = sala.cone(-1.4, 0.0) + Vector3(0, 2.2, 0)
	luz.omni_range = 6.0
	luz.light_energy = 3.0
	luz.light_color = Color("ffc98c")
	viewport.add_child(luz)


func _caja(size: Vector3, at: Vector3, giro: float, col: Color) -> void:
	var mi: MeshInstance3D = MeshInstance3D.new()
	var b: BoxMesh = BoxMesh.new()
	b.size = size
	mi.mesh = b
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = col
	mat.roughness = 0.95


	mat.emission_enabled = true
	mat.emission = col
	mat.emission_energy_multiplier = 0.25
	mi.material_override = mat
	mi.position = at
	mi.rotation_degrees.y = giro
	viewport.add_child(mi)


func _pinta_cifra(tg: int, rg: int) -> void:
	_cifra.text = "%d-%d" % [tg, rg]
	_cifra.pixel_size = minf(CIFRA_PX, CIFRA_ANCHO /(96.0 * float(_cifra.text.length())))



func _minuto(s: float) -> int:
	return clampi(int(90.0 *(s - T_PITIDO) /(T_FINAL - T_PITIDO)), 0, 90)





func _tick(delta: float) -> void:
	if orbit_speed != 0.0 and t >= T_CARD:
		orbit_speed = 0.0
	if _cifra == null:
		return
	var vivo: bool = delta > 0.0
	if t >= T_PITIDO and not _pitado:
		_pitado = true
		if vivo and t < T_PITIDO + 0.3:
			sting("whistle", -16.0)
	var min_ahora: int = _minuto(t)
	var tg: int = 0
	var rg: int = 0
	var nuevos: int = 0
	for g in _goles:
		if t >= T_PITIDO and int(g[0]) <= min_ahora:
			nuevos += 1
			if bool(g[1]):
				tg += 1
			else:
				rg += 1
	if nuevos > _vistos:
		var ultimo: Array = _goles[nuevos - 1]
		var en_vivo: bool = vivo and nuevos == _vistos + 1
		_vistos = nuevos
		_pinta_cifra(tg, rg)
		if en_vivo:
			_celebra(bool(ultimo[1]))
	if t >= T_FINAL:
		if not _final:
			_final = true
			_reloj.text = I18n.t("FINAL")
			_reloj.pixel_size = minf(0.0019,(PESTANA.x - 0.06) /(48.0 * float(_reloj.text.length())))
			_gol.visible = false
			if vivo and t < T_FINAL + 0.3:
				sting("whistle_long", -15.0)
	elif t >= T_PITIDO:
		_reloj.text = "%d'" % min_ahora
	_mueve_puntos()





func _celebra(mio: bool) -> void:
	_cifra.scale = Vector3.ONE * 1.35
	var tw: Tween = create_tween()
	tw.tween_property(_cifra, "scale", Vector3.ONE, 0.35) \
			.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	_gol.visible = true
	_gol.modulate = text_accent() if mio else CareerTheme.DANGER
	_gol.scale = Vector3.ONE * 1.5
	var tg: Tween = create_tween()
	tg.tween_property(_gol, "scale", Vector3.ONE, 0.25) \
			.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	tg.tween_interval(0.45)
	tg.tween_property(_gol, "modulate:a", 0.0, 0.2)
	tg.tween_callback(func() -> void: _gol.visible = false)
	sting("crowd_roar" if mio else "crowd_ooh", -15.0)




func _mueve_puntos() -> void:
	var bascula: float = sin(t * 0.7) * 0.22
	for d in _puntos:
		var p: MeshInstance3D = d[0]
		var fase: float = float(d[3])
		var u: float = clampf(float(d[1]) + bascula + sin(t * 1.3 + fase) * 0.1,
			- JUEGO_U, JUEGO_U)
		var v: float = clampf(float(d[2]) + cos(t * 1.1 + fase) * 0.06, JUEGO_V.x, JUEGO_V.y)
		p.position = _en_tele(u, v, 0.095)
	var bu: float = clampf(bascula * 1.6 + sin(t * 1.9) * 0.35, - JUEGO_U, JUEGO_U)
	var bv: float = clampf(-0.27 + sin(t * 2.6) * 0.13, JUEGO_V.x, JUEGO_V.y)
	_balon.position = _en_tele(bu, bv, 0.1)


func _skipped() -> void:
	_tick(0.0)
