extends "res://ui/ceremonies/firmas_grada.gd"





















const PASO_JUNTOS: float = 0.72

const TU_LEJOS: float = 5.4

const MANOS_Y: float = 2.05


const TIRON_PANTALLA: float = 0.26
const ALCANCE_MIN: float = 2.0
const ALCANCE_MAX: float = 10.0

const COSTADO: float = 2.6
const TIRON_MIN: float = 0.1


const COGE_Y: float = 2.75
const FONDO: float = 1.5

const BRAZO: float = 0.42

const ROBO: float = 0.3
const VUELO: float = 0.95
const FIESTA_LANZA: float = 2.4
const TRAS_CORTA: float = 1.4
const T_LISTO: float = 1.6
const PUNTOS: int = 16

var _prenda: Dictionary = {}
var _nino: int = 1
var _tirando: bool = false
var _tiro_desde: Vector2 = Vector2.ZERO
var _tiro: Vector2 = Vector2.ZERO
var _capa: Control = null
var _pista: Label = null
var _estado_tiro: String = "espera"
var _vuelo_t: float = 0.0
var _vuelo_de: Vector3 = Vector3.ZERO
var _vuelo_a: Vector3 = Vector3.ZERO
var _vuelo_alto: float = 0.0
var _caida: Dictionary = {}
var _intentos: int = 0
var _nota_tiro: Label = null
var _auto: Dictionary = {}
var _robo_dado: float = 1.0


func _cues_del_acto() -> PackedStringArray:
	return PackedStringArray(["lone_shout", "ui_whoosh"])


func _z_fan(i: int) -> float:
	return Z_PRIMERO - PASO_JUNTOS * float(i)


func _build() -> void:
	_kit_club = GameState.kit_variant(team(), 0)
	make_stadium({
		"div": div(),
		"attendance": ATT,
		"party": false,
		"home_club": String(team().get("id", "")),
		"home_only": true,
		"weather": String(data.get("weather", "day")),
		"kit": _kit_club,
	})
	var dado: RandomNumberGenerator = RandomNumberGenerator.new()
	dado.seed = hash("camiseta_lanzada|%d|%s" % [int(data.get("n", 1)),
		String(data.get("club", ""))])
	_robo_dado = dado.randf()
	focus = Vector3(FRENTE_X, 0.0, _z_fan(_nino))
	_pon_jugador()
	player.position = Vector3(FRENTE_X - TU_LEJOS, player.position.y, _z_fan(_nino) + 0.35)
	_pon_tres()
	_pon_gente()
	make_camera([_plano(0.0, 1.2), _plano(T_LISTO, 0.0)], 40.0)
	orbit_speed = 0.0
	scrim_dim(0.35)
	make_audio(ATT, false)
	applause(true, -13.0)
	if stadium != null:
		stadium.crowd_excite(0.7)
	for p in stand_flash_pool(_z_fan(1), 7.0):
		if p.x > 0.0:
			flash_pool.append(p)
	flash_rate = 2.0
	_voces("voz_pide", 3, 0.3, 2.0, -13.0)
	_rotulo()
	_ficha_tiro()
	_auto = data.get("tiro_auto", {})














const SIN_REPOSO: String = "res://assets/sprites/anim/sincam_north_%02d.png"
const SIN_BRAZOS: String = "sincam_brazos"
const PIEL_R: float = 1.086
const PIEL_G: float = 1.04
const PIEL_B: float = 1.38


static func look_sin_camiseta(look: Dictionary) -> Dictionary:
	var out: Dictionary = look.duplicate()

	if not out.has("sock") and out.get("kit") is Color:
		out["sock"] = out["kit"]



	var piel: Color = Color(out.get("skin", Color("e0ac69")))
	out["kit"] = Color(minf(piel.r * PIEL_R, 1.0), minf(piel.g * PIEL_G, 1.0),
		minf(piel.b * PIEL_B, 1.0))
	for k in ["pattern", "kit_b", "kit_sleeves", "long_sleeves", "tattoo", "tattoo_style",
			"comp_parche", "parche_vigente", "captain", "peto", "local_trim", "trim_col"]:
		out.erase(k)
	out["number"] = 0
	return out






static func look_espalda_sin(look: Dictionary) -> Dictionary:
	var out: Dictionary = look.duplicate()
	out["number"] = 0
	return out


func _pon_jugador() -> void:
	var look: Dictionary = GameState.team_custom.duplicate()
	look.merge(_kit_club, true)
	var tenido: Dictionary = look_sin_camiseta(look)
	var sin: Dictionary = look_espalda_sin(look)
	make_player(tenido, "south")
	if player.sprite_frames.has_meta("pecho_cfg"):
		player.sprite_frames.remove_meta("pecho_cfg")
	add_walk(player, tenido)
	_monta_espalda_sin(sin)
	add_idle_views(player, tenido)
	add_gesto(player, SIN_BRAZOS, 1, 2.0, sin)
	add_gesto(player, "clap", 1, 2.0, tenido)
	player.position = Vector3(TU_X, feet_offset(player.pixel_size) - PLAYER_SINK,
		_z_fan(0) + TU_DESDE)
	PixelNitido.aplica(player)
	_nitido_laminas()




func _monta_espalda_sin(cfg: Dictionary) -> void:
	var sf: SpriteFrames = player.sprite_frames
	if sf.has_animation("idle_north") or not ResourceLoader.exists(SIN_REPOSO % 0):
		return
	sf.add_animation("idle_north")
	sf.set_animation_loop("idle_north", true)
	sf.set_animation_speed("idle_north", 4.5)
	for i in 4:
		var ruta: String = SIN_REPOSO % i
		if ResourceLoader.exists(ruta):
			sf.add_frame("idle_north", KitRecolor.apply(load(ruta), cfg))





func _plano(tk: float, atras: float) -> Dictionary:
	return {"t": tk, "dist": 17.0 + atras, "h": 3.4, "yaw": 240.0, "aim_y": 2.1,
		"fov": 29.0, "focus_x": FRENTE_X - TU_LEJOS * 0.5,
		"focus_z": _z_fan(_nino) + 0.2}



func _plano_coge(tk: float, z: float, x: float) -> Dictionary:
	return {"t": tk, "dist": 7.5, "h": 3.0, "yaw": 250.0, "aim_y": 2.75, "fov": 38.0,
		"focus_x": x, "focus_z": z}




func _pon_tres() -> void:
	var qs: Array[Dictionary] = con_nino_al_final(quienes(int(data.get("n", 1)),
		String(data.get("club", ""))))
	var orden: Array[Dictionary] = [qs[0], qs[2], qs[1]]
	_prepara_camiseta(_prenda, 0)
	for i in orden.size():
		var q: Dictionary = orden[i]
		var z: float = _z_fan(i)
		var f: Dictionary = {}
		match String(q["tipo"]):
			"ella":
				f = _elegida_ella(q, z)
			"nino":
				f = _elegido_nino(q, z)
		if f.is_empty():
			f = _elegido_el(q, z)
		f["z"] = z
		f["estado"] = "espera"
		f["desde"] = 0.0
		if i == _nino:
			f["pide"] = true
			f["base"] = _prenda.get("base")
			_prepara_cartel(f)
		_elegidos.append(f)


func _ficha_tiro() -> void:
	make_card(40.0)
	if _card_tw != null and _card_tw.is_valid():
		_card_tw.kill()
	card_at = 9999.0
	card_title(I18n.t("TU CAMISETA A LA GRADA"), 40)
	_nota_tiro = card_note(I18n.t("El niño del cartel se lleva tu camiseta."))
	card_cta(I18n.t("AL VESTUARIO"))










static func destino(tiro: Vector2, desde: Vector3, zs: Array, fila_x: float) -> Dictionary:
	var fuerza: float = clampf(tiro.y, 0.0, 1.0)
	var alcance: float = lerpf(ALCANCE_MIN, ALCANCE_MAX, fuerza)
	var z: float = desde.z + clampf(tiro.x, -1.0, 1.0) * COSTADO
	var x: float = desde.x + alcance
	if x < FRENTE_X + 0.15:
		return {"que": "corta", "punto": Vector3(FRENTE_X - 0.05, 1.3, z)}
	if x > fila_x + FONDO:
		return {"que": "arriba", "punto": Vector3(x, COGE_Y + 2.0, z)}
	var quien: int = -1
	var mejor: float = BRAZO
	for i in zs.size():
		var d: float = absf(float(zs[i]) - z)
		if d <= mejor:
			mejor = d
			quien = i
	return {"que": "coge", "quien": quien, "punto": Vector3(minf(x, fila_x), COGE_Y, z)}





func _tiron(arrastre: Vector2) -> Vector2:
	var alto: float = maxf(get_viewport_rect().size.y * TIRON_PANTALLA, 1.0)
	return Vector2(- arrastre.x / alto, arrastre.y / alto)


func _manos() -> Vector3:
	return Vector3(player.position.x + 0.1, MANOS_Y, player.position.z)


func _abre_tiro() -> void:
	_estado_tiro = "apunta"
	_capa = Control.new()
	_capa.set_anchors_preset(Control.PRESET_FULL_RECT)
	_capa.mouse_filter = Control.MOUSE_FILTER_STOP
	_capa.gui_input.connect(_on_capa)
	_capa.draw.connect(_pinta_capa)
	add_child(_capa)
	_pista = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT)
	_pista.text = I18n.t("Arrastra hacia atrás y suelta")
	_pista.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_pista.clip_text = true
	_pista.set_anchors_preset(Control.PRESET_CENTER_BOTTOM)
	_pista.offset_left = -360.0
	_pista.offset_right = 360.0
	_pista.offset_top = -260.0
	_pista.offset_bottom = -210.0
	_pista.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_capa.add_child(_pista)
	CareerUi.normalize_caps(_capa)


func _on_capa(ev: InputEvent) -> void:
	if _estado_tiro != "apunta":
		return
	if (ev is InputEventMouseButton and (ev as InputEventMouseButton).button_index == MOUSE_BUTTON_LEFT) \
			or ev is InputEventScreenTouch:
		var pulsa: bool = ev.pressed
		var donde: Vector2 = ev.position
		if pulsa:
			_tirando = true
			_tiro_desde = donde
			_tiro = Vector2.ZERO
		elif _tirando:
			_tirando = false
			if _tiro.y >= TIRON_MIN:
				_lanza(_tiro)
			else:
				_tiro = Vector2.ZERO
		_capa.queue_redraw()
	elif (ev is InputEventMouseMotion or ev is InputEventScreenDrag) and _tirando:
		_tiro = _tiron(ev.position - _tiro_desde)
		_capa.queue_redraw()




func _pinta_capa() -> void:
	if cam == null or _estado_tiro != "apunta" or _tiro.y < 0.02:
		return
	var d: Dictionary = destino(_tiro, _manos(), _zs(), FILAS[0].x)
	var a: Vector3 = d["punto"]
	var alto: float = _alto_vuelo(_manos(), a)
	var caja: Vector2 = viewport_box.get_global_rect().position - get_global_rect().position
	var escala: Vector2 = viewport_box.get_global_rect().size / Vector2(viewport.size)
	var col: Color = CareerTheme.TEXT if String(d["que"]) == "coge" else CareerTheme.DANGER
	for i in range(1, PUNTOS + 1):
		var k: float = float(i) / float(PUNTOS)
		var p: Vector3 = _parabola(_manos(), a, alto, k)
		if cam.is_position_behind(p):
			continue
		var s: Vector2 = caja + cam.unproject_position(p) * escala

		var r: float = lerpf(24.0, 14.0, k)
		_capa.draw_circle(s, r + 4.0, Color(0.0, 0.0, 0.0, 0.55))
		_capa.draw_circle(s, r, Color(col, lerpf(1.0, 0.7, k)))


func _zs() -> Array:
	var out: Array = []
	for f in _elegidos:
		out.append(float(f["z"]))
	return out


func _alto_vuelo(a: Vector3, b: Vector3) -> float:
	return maxf(a.y, b.y) + 1.2 + a.distance_to(b) * 0.22


static func _parabola(a: Vector3, b: Vector3, alto: float, k: float) -> Vector3:
	var p: Vector3 = a.lerp(b, k)

	var base: float = lerpf(a.y, b.y, k)
	var cima: float = alto - lerpf(a.y, b.y, 0.5)
	p.y = base + 4.0 * cima * k *(1.0 - k)
	return p


func _lanza(tiro: Vector2) -> void:
	_intentos += 1
	_caida = destino(tiro, _manos(), _zs(), FILAS[0].x)
	if String(_caida["que"]) == "coge" and int(_caida["quien"]) == _nino and _robo_dado < ROBO:
		_caida["quien"] = 0 if (_caida["punto"] as Vector3).z > _z_fan(_nino) else 2
		_caida["robo"] = true
	_vuelo_de = _manos()
	_vuelo_a = _caida["punto"]
	if String(_caida["que"]) == "coge" and int(_caida["quien"]) >= 0:
		var f: Dictionary = _elegidos[int(_caida["quien"])]
		_vuelo_a = Vector3(_vuelo_a.x, COGE_Y, float(f["z"]))
	elif String(_caida["que"]) == "coge":
		var fan: Dictionary = _fan_cerca(_vuelo_a.z)
		_caida["fan"] = fan
		if not fan.is_empty():
			var s: AnimatedSprite3D = fan["spr"]
			_vuelo_a = Vector3(s.position.x - 0.15, COGE_Y + 0.15, s.position.z)
	_vuelo_alto = _alto_vuelo(_vuelo_de, _vuelo_a)
	_vuelo_t = t
	_estado_tiro = "vuela"
	_tiro = Vector2.ZERO
	if _capa != null:
		_capa.queue_redraw()
		_pista.visible = false
	sting("ui_whoosh", -10.0)
	_voces("voz_pide", 2, 0.0, 0.4, -10.0)


func _fan_cerca(z: float) -> Dictionary:
	var mejor: Dictionary = {}
	var d: float = INF
	for f in _gente_fans:
		var s: AnimatedSprite3D = f["spr"]
		if s.position.x > FILAS[0].x + 0.1:
			continue
		var dz: float = absf(s.position.z - z)
		if dz < d:
			d = dz
			mejor = f
	return mejor


func _tick_tiro() -> void:
	var prenda: Sprite3D = _prenda.get("camiseta")
	if prenda == null:
		return
	match _estado_tiro:
		"espera", "apunta":

			prenda.visible = true
			prenda.rotation.z = 0.0
			var atras: float = clampf(_tiro.y, 0.0, 1.0) * 0.35
			prenda.position = _manos() + Vector3(- atras, - atras * 0.4, - _tiro.x * 0.15)
			_brazos(true)
		"vuela":
			var k: float = clampf((t - _vuelo_t) / VUELO, 0.0, 1.0)
			prenda.position = _parabola(_vuelo_de, _vuelo_a, _vuelo_alto, k)

			prenda.rotation.z = - k * TAU * 1.5
			_brazos(k < 0.25)
			if k >= 1.0:
				_llega()
		"corta":
			var k2: float = clampf((t - _vuelo_t) / 0.5, 0.0, 1.0)
			prenda.position = _vuelo_a.lerp(Vector3(_vuelo_a.x - 0.2, 0.15, _vuelo_a.z), k2 * k2)
			prenda.rotation.z = lerpf(prenda.rotation.z, - PI * 0.5, k2)
			if t >= _vuelo_t + TRAS_CORTA:
				_otra_vez()
		"arriba":
			var k3: float = clampf((t - _vuelo_t) / 0.6, 0.0, 1.0)
			prenda.position = _vuelo_a + Vector3(1.5, 0.8, 0.0) * k3
			prenda.visible = k3 < 1.0
		"fan":
			var fan: Dictionary = _caida.get("fan", {})
			if not fan.is_empty():
				var s: AnimatedSprite3D = fan["spr"]
				prenda.rotation.z = 0.0
				prenda.position = s.position + Vector3(-0.15, 0.75 + absf(sin(t * 9.0)) * 0.08, 0.0)
		_:
			pass



func _brazos(arriba: bool) -> void:
	var alzado: bool = String(player.animation).begins_with("clap_") \
			or String(player.animation).begins_with(SIN_BRAZOS + "_")
	if arriba and (alzado or gesto_play(player, SIN_BRAZOS, Vector3.RIGHT)
			or gesto_play(player, "clap", Vector3.RIGHT)):
		return
	if alzado:
		player.stop()
	idle_play(player, Vector3.RIGHT)


func _llega() -> void:
	var que: String = String(_caida["que"])
	_vuelo_t = t
	if que == "corta":
		_estado_tiro = "corta"
		_voces("voz_protesta", 2, 0.0, 0.5, -12.0)
		_nota_tiro.text = I18n.t("Se quedó corta.")
		return
	if que == "arriba":
		_estado_tiro = "arriba"
		_nota_tiro.text = I18n.t("Se la llevó la grada de arriba.")
		_celebra(_vuelo_a.z, FILAS[1].x)
		return
	var quien: int = int(_caida["quien"])
	if quien < 0:
		_estado_tiro = "fan"
		_nota_tiro.text = I18n.t("La atrapó uno del muro.")
		_celebra(_vuelo_a.z, FILAS[0].x)
		return
	_estado_tiro = "cogida"
	var f: Dictionary = _elegidos[quien]
	f["camiseta"] = _prenda["camiseta"]
	f["medio"] = _prenda.get("medio", float(LADO) * 0.5 * CAMISETA_PX)
	(_prenda["camiseta"] as Sprite3D).rotation.z = 0.0
	f["estado"] = "fiesta"
	f["desde"] = t
	var nino: Dictionary = _elegidos[_nino]
	if quien == _nino:
		_nota_tiro.text = I18n.t("El niño del cartel se lleva tu camiseta.")
	elif bool(_caida.get("robo", false)):
		_nota_tiro.text = I18n.t("Iba para el niño, pero se la quedó el de al lado.")
	else:
		_nota_tiro.text = I18n.t("La atrapó el de al lado del niño.")

	var carton: Sprite3D = nino.get("cartel")
	if carton != null and not nino.has("solto"):
		nino["solto"] = t
		nino["solto_p"] = carton.position
	nino["estado"] = "fiesta" if quien == _nino else "triste"
	nino["desde"] = t
	_celebra(float(f["z"]), float(f["x0"]))



func _celebra(z: float, x: float) -> void:
	_t_excita = t
	_terminado = true
	punch_fov(1.2, 0.3)
	applause(true, -9.0)
	ovation(-9.0)
	_voces("voz_cele", 3, 0.1, 1.4, -10.0)
	if stadium != null:
		stadium.crowd_excite(1.0)
	flash_burst_at = t
	flash_rate = 4.0
	cam_keys.assign([_plano(t, 0.0), _plano_coge(t + 1.1, z + 0.2, x - 0.3)])
	if (embedded or not standalone) and not replay:
		RelVivo.lanza(self, Career.firma_resuelve("camiseta", true, 0))
	_ms_f = Time.get_ticks_msec()
	card_at = t + FIESTA_LANZA
	_card_tw = create_tween()
	_card_tw.tween_interval(FIESTA_LANZA)
	_card_tw.tween_callback(_reveal_card)
	if _capa != null:
		_capa.queue_free()
		_capa = null




func _otra_vez() -> void:
	if _intentos >= 2:
		_caida = {"que": "coge", "quien": _nino, "punto": Vector3(FILAS[0].x, COGE_Y,
			_z_fan(_nino))}
		_vuelo_de = Vector3(FRENTE_X - 0.4, 1.0, _z_fan(_nino))
		_vuelo_a = _caida["punto"]
		_vuelo_alto = _alto_vuelo(_vuelo_de, _vuelo_a)
		_vuelo_t = t
		_estado_tiro = "vuela"
		return
	_estado_tiro = "apunta"
	if _pista != null:
		_pista.visible = true
		_pista.text = I18n.t("Más fuerte")
	if _auto.has("otra"):
		_auto = {"tiro": _auto["otra"], "en": t + 0.3}




func _tick_auto() -> void:
	if _auto.is_empty() or _estado_tiro != "apunta":
		return
	var en: float = float(_auto.get("en", T_LISTO + 0.6))
	if t < en:
		return
	var meta: Vector2 = _auto.get("tiro", Vector2(0.0, 0.62))
	var k: float = clampf((t - en) / 0.9, 0.0, 1.0)
	_tiro = meta * smoothstep(0.0, 1.0, k)
	if _capa != null:
		_capa.queue_redraw()
	if k >= 1.0:
		var otra: Variant = _auto.get("otra")
		_auto = {}
		if otra != null:
			_auto["otra"] = otra
		_lanza(meta)




func _tick(_delta: float) -> void:
	_nitido_laminas()
	_tick_gritos()
	_tick_gente()
	_tick_elegidos()
	var nino: Dictionary = _elegidos[_nino] if _elegidos.size() > _nino else {}
	if String(nino.get("estado", "")) == "triste":

		var s: AnimatedSprite3D = nino["spr"]
		if s.animation != &"idle":
			s.play("idle")
		s.position.y = float(nino["y"])
	if _estado_tiro == "espera" and t >= T_LISTO:
		_abre_tiro()
	_tick_auto()
	_tick_tiro()
	if _capa != null and _tiro.y > 0.0:
		_capa.queue_redraw()



func _on_skip() -> void:
	if _terminado:
		super._on_skip()
		return
	if _estado_tiro == "espera":
		t = T_LISTO
		_abre_tiro()
	if _estado_tiro == "apunta":
		_lanza(Vector2(0.0, 0.62))


func _skipped() -> void:
	pass


func _vigia_ficha() -> void:
	if _leaving or ficha_puesta:
		return
	var desde: float = float(Time.get_ticks_msec() - _ms_f) / 1000.0
	if not _terminado or desde < FIESTA_LANZA + VIGIA_MARGEN:
		SceneFade.timer(5.0, true, false, true).timeout.connect(_vigia_ficha)
		return
	super._vigia_ficha()
