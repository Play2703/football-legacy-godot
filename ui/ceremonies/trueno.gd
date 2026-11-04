extends Ceremony






























const STAND_X: float = -(Stadium.SIDE_STAND_X + 4.5)
const STAND_Y: float = 5.7





const FILA_X: float = -31.0
const FILA_Z: float = Stadium.HALF_LINE
const FILA_N: int = 7


const MIO: int = 3


const PASO: float = 1.15


const HACIA_GRADA: Vector3 = Vector3(-1.0, 0.0, 0.0)













const KEYS: Array = [
	{"t": 0.0, "dist": 44.0, "h": 15.0, "yaw": 114.0, "aim_y": 3.0, "fov": 40.0,
		"focus_x": STAND_X, "focus_z": FILA_Z - 6.0},
	{"t": 2.2, "dist": 29.0, "h": 2.5, "yaw": 100.0, "aim_y": 2.7, "fov": 44.0,
		"focus_x": STAND_X, "focus_z": FILA_Z - 2.6},
	{"t": 20.0, "dist": 26.0, "h": 2.4, "yaw": 99.0, "aim_y": 2.6, "fov": 42.0,
		"focus_x": STAND_X, "focus_z": FILA_Z - 2.3},
]


const DRIFT: float = -0.2


const ATT: float = 0.97
const T_CHYRON: float = 0.5

const T_FICHA: float = 2.2

const FIN_AUTO: float = 7.0

const APLAUSO_S: float = 3.2




const BOMBO_DB: float = -3.0
const HUH_DB: float = -2.0
const SUELTO_DB: float = -6.0

var auto: bool = false


var _auto_falla: Dictionary = {}
var _auto_err: Array[float] = []
var _azar: RandomNumberGenerator = RandomNumberGenerator.new()

var _mates: Array[AnimatedSprite3D] = []

var _palma_en: Array[float] = []

var _ts: Array[float] = []
var _estados: Array = []
var _reloj: float = 0.0

var _tick_us: int = 0
var _bombo_i: int = 0
var _jugando: bool = false

var _fin: int = 0
var _fin_t: float = 0.0

var _vidas: Array[Panel] = []
var _estado: Label
var _carril: Carril
var _toca_b: Button
var _seguir_b: Button


func _accent_for() -> Color:
	return CareerTheme.accent_of(team())


func _cues_del_acto() -> PackedStringArray:
	return PackedStringArray(["trueno_bombo", "trueno_huh", "trueno_suelto"])




func _build_skip() -> void:
	pass




func _armar_auto_seguir() -> void:
	pass


func _build() -> void:
	auto = bool(data.get("auto", false))
	for i in (data.get("auto_falla", []) as Array):
		_auto_falla[int(i)] = true
	_azar.seed = hash("trueno|%s|%s|%s|%s" % [String(data.get("club", "")),
		str(data.get("season", 0)), str(data.get("gf", 0)), str(data.get("ga", 0))])



	var semilla: int = int(data.get("semilla", Trueno.semilla_de(String(data.get("club", "")),
		int(data.get("season", 0)), String(data.get("opp", "")), int(data.get("gf", 0)),
		int(data.get("ga", 0)))))
	_ts = Trueno.tiempos(Trueno.compas(semilla))
	_estados.resize(_ts.size())
	_estados.fill(Trueno.PEND)
	for i in _ts.size():

		_auto_err.append(clampf(_azar.randfn(0.0, 0.03), -0.08, 0.08))
	var kit: Dictionary = GameState.kit_variant(team(), 0)
	make_stadium({
		"div": div(),
		"attendance": ATT,

		"party": false,
		"home_club": String(team().get("id", "")),
		"home_only": true,
		"weather": String(data.get("weather", "day")),
		"kit": kit,
	})
	focus = Vector3(STAND_X, STAND_Y, FILA_Z)
	make_camera(KEYS, 42.0)
	orbit_speed = DRIFT
	_monta_fila(kit)
	make_audio(ATT, false)
	stadium.crowd_excite(0.7)
	make_chyron(I18n.t("GOLEADA"), "%d-%d" % [int(data.get("gf", 0)), int(data.get("ga", 0))],
		team(), T_CHYRON)
	_monta_ficha()






func _monta_fila(kit: Dictionary) -> void:
	make_player(GameState.player_look(), "north")
	var y: float = player.position.y
	player.position = Vector3(FILA_X, y, _z_de(MIO))
	add_gesto(player, "clap", 4, 10.0)
	var gente: Array = squad_people(String(team().get("id", "")), FILA_N - 1, true, "", true)
	var base: Dictionary = KitRecolor.team_only(kit)
	var k: int = 0
	for i in FILA_N:
		if i == MIO:
			continue
		var cfg: Dictionary = person_look(gente[k] if k < gente.size() else {}, base)
		k += 1
		var s: AnimatedSprite3D = AnimatedSprite3D.new()
		s.sprite_frames = player_frames(cfg, "north")
		s.pixel_size = player.pixel_size
		s.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
		s.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		s.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD


		s.position = Vector3(FILA_X + _azar.randf_range(-0.3, 0.3), y, _z_de(i))
		viewport.add_child(s)
		s.play("idle")
		s.speed_scale = _azar.randf_range(0.8, 1.15)
		espalda_registra(s, "idle", player_prefix("north"), 0)
		espalda_vestir(s, cfg)
		add_gesto(s, "clap", 4, 10.0, cfg)
		_mates.append(s)
		_palma_en.append(-1.0)


func _z_de(i: int) -> float:
	return FILA_Z +(float(i) - float(MIO)) * PASO







func _monta_ficha() -> void:
	make_card(T_FICHA)
	card_title(I18n.t("EL TRUENO"), 34)
	var fila: HBoxContainer = HBoxContainer.new()
	fila.alignment = BoxContainer.ALIGNMENT_CENTER
	fila.add_theme_constant_override("separation", 14)
	card_box.add_child(fila)
	var ic: MenuIcon = MenuIcon.new()
	ic.custom_minimum_size = Vector2(38, 38)
	ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	ic.mouse_filter = Control.MOUSE_FILTER_IGNORE
	fila.add_child(ic)
	ic.setup("aficion", CareerTheme.NAV_GENTE)
	for i in Trueno.VIDAS:
		var p: Panel = Panel.new()
		p.custom_minimum_size = Vector2(30, 30)
		p.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		p.mouse_filter = Control.MOUSE_FILTER_IGNORE
		fila.add_child(p)
		_vidas.append(p)
	_pinta_vidas()
	_estado = CareerUi.plain(CareerTheme.T_TITLE_MODAL, CareerTheme.TEXT)
	_estado.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_estado.clip_text = true
	card_box.add_child(_estado)
	_carril = Carril.new()
	_carril.ts = _ts
	_carril.estados = _estados
	_carril.custom_minimum_size = Vector2(0, 92)
	_carril.mouse_filter = Control.MOUSE_FILTER_IGNORE
	card_box.add_child(_carril)
	_toca_b = CareerUi.primary_cta(I18n.t("¡HUH!"))
	_toca_b.custom_minimum_size.y = 128
	_toca_b.focus_mode = Control.FOCUS_NONE



	UiKit.set_cue(_toca_b, "")
	_toca_b.button_down.connect(_toca)


	_toca_b.set_meta(Entrada.PRIMERO_META, true)
	card_box.add_child(_toca_b)


	_seguir_b = CareerUi.primary_cta(I18n.t("SEGUIR"), _leave)
	CareerTheme.apply_button(_seguir_b, CareerTheme.Kind.GHOST, 20)
	_seguir_b.custom_minimum_size.y = 62
	card_box.add_child(_seguir_b)


func _pinta_vidas() -> void:
	var quedan: int = Trueno.VIDAS - Trueno.fallos(_estados)
	for i in _vidas.size():
		var sb: StyleBoxFlat = StyleBoxFlat.new()
		sb.set_corner_radius_all(15)
		sb.bg_color = CareerTheme.NAV_YO if i < quedan else CareerTheme.DANGER
		_vidas[i].add_theme_stylebox_override("panel", sb)



func _di(texto: String, col: Color = CareerTheme.TEXT) -> void:
	if _estado == null:
		return
	_estado.text = I18n.gritado_seguro(texto)
	_estado.add_theme_color_override("font_color", col)
	UiKit.punch(_estado)





func _foco_al_toque() -> void:
	if Entrada.modo != Entrada.Modo.MANDO or not is_instance_valid(_toca_b) \
			or not _toca_b.is_visible_in_tree():
		return


	if SceneFade.foco(self) == _toca_b:
		return
	if _toca_b.focus_mode == Control.FOCUS_NONE:
		Entrada.foco_para(_toca_b)
	_toca_b.grab_focus()





func salta_con_atras() -> bool:
	if _leaving:
		return true
	if not ficha_puesta:
		return false
	_leave()
	return true




func _tick(delta: float) -> void:
	if not ficha_puesta:
		return
	if _fin != 0:
		_tick_final(delta)
		return
	if not _jugando:
		_arranca()


	_reloj += minf(delta, 0.1) if auto else delta
	_tick_us = Time.get_ticks_usec()
	while _bombo_i < _ts.size() and _reloj >= _ts[_bombo_i]:
		_golpe_de_bombo(_bombo_i)
		_bombo_i += 1
	if auto:
		_auto_toca()
	for i in Trueno.vencidos(_reloj, _estados, _ts):
		_marca(i, Trueno.MAL)
	_tick_palmas()
	_carril.reloj = _reloj
	_carril.latido = maxf(_carril.latido - delta * 5.0, 0.0)
	_carril.queue_redraw()
	_mira_final()


func _arranca() -> void:
	_jugando = true
	_tick_us = Time.get_ticks_usec()

	if audio != null:
		audio.hush()
	stadium.crowd_excite(0.15)
	_di(I18n.t("¡CON EL BOMBO!"))
	_foco_al_toque()





func _golpe_de_bombo(_i: int) -> void:
	sting("trueno_bombo", BOMBO_DB)
	_carril.latido = 1.0
	var f: int = Trueno.fallos(_estados)
	var tope: float = 0.025 if f == 0 else 0.05 + 0.07 * float(f)
	for k in _mates.size():
		_palma_en[k] = _reloj + _azar.randf_range(0.0, tope)


func _tick_palmas() -> void:
	for k in _mates.size():
		if _palma_en[k] >= 0.0 and _reloj >= _palma_en[k]:
			_palma_en[k] = -1.0
			_palmada(_mates[k])





func _palmada(s: AnimatedSprite3D) -> void:
	s.stop()
	s.speed_scale = 1.0
	gesto_play(s, "clap", HACIA_GRADA)




func _toca() -> void:
	if not _jugando or _fin != 0:
		return
	var ahora: float = _reloj
	if not auto:
		ahora += float(Time.get_ticks_usec() - _tick_us) / 1000000.0
	_palmada(player)
	var j: Dictionary = Trueno.juzga(ahora, _estados, _ts)
	if int(j["golpe"]) < 0:
		return
	_marca(int(j["golpe"]), int(j["res"]))
	_mira_final()


func _marca(i: int, res: int) -> void:
	_estados[i] = res
	if res == Trueno.BIEN:


		sting("trueno_huh", HUH_DB)
		stadium.crowd_react("home", "close")
		punch_fov(0.8, 0.22)
		UiAudio.haptic(10)
	else:
		sting("trueno_suelto", SUELTO_DB)
		shake(0.03, 0.2)
		UiAudio.haptic(25)
		_di(I18n.t("¡DESCUADRE!"), CareerTheme.DANGER)
	_pinta_vidas()




func _auto_toca() -> void:
	for i in _ts.size():
		if int(_estados[i]) != Trueno.PEND:
			continue
		if not _auto_falla.has(i) and _reloj >= _ts[i] + _auto_err[i]:
			_toca()
		return


func _mira_final() -> void:
	var f: int = Trueno.final(_estados)
	if f != 0 and _fin == 0:
		_termina(f)







func _termina(f: int) -> void:
	_fin = f
	_fin_t = 0.0
	if audio != null:
		audio.unhush()
	_toca_b.visible = false
	_seguir_b.visible = false
	_carril.visible = false
	var bien: int = 0
	for e in _estados:
		if int(e) == Trueno.BIEN:
			bien += 1
	if f > 0:


		sting("trueno_bombo", 0.0)
		sting("trueno_huh", 0.0)
		ovation(3.0)
		stadium.crowd_react("home", "goal")
		shake(0.12, 0.6)
		punch_fov(3.0, 0.6)
		UiAudio.haptic(40)
		_di(I18n.t("¡TRUENO!"), CareerTheme.NAV_YO)


		if not replay:
			Achievements.ingest_trueno()
	else:

		if audio != null:
			audio.ooh()
		stadium.crowd_react("away", "close")
		for s: AnimatedSprite3D in _mates + [player]:
			s.stop()
			s.play("idle")
		_di(I18n.t("SE DESCUADRO"), CareerTheme.DANGER)
	card_stats([
		{"v": "%d-%d" % [int(data.get("gf", 0)), int(data.get("ga", 0))], "k": I18n.t("goleada")},
		{"v": "%d/%d" % [bien, _ts.size()], "k": I18n.t("palmas")},
	])
	card_note(I18n.t("La grada entera, a tu compás.") if f > 0 \
			else I18n.t("Las palmas se fueron cada una por su lado."))
	card_cta(I18n.t("SEGUIR"))
	var tw: Tween = create_tween()
	tw.tween_interval(FIN_AUTO)
	tw.tween_callback(_leave)




func _tick_final(delta: float) -> void:
	_fin_t += delta
	if _fin < 0:
		return
	for s: AnimatedSprite3D in _mates + [player]:
		if s.is_playing():
			continue
		if _fin_t < APLAUSO_S:
			if _azar.randf() < 0.25:
				_palmada(s)
		elif s.animation != "idle":
			s.play("idle")


func _skipped() -> void:
	pass






class Carril extends Control:




	const VEL: float = 300.0
	const MARCA_X: float = 70.0

	var ts: Array[float] = []
	var estados: Array = []
	var reloj: float = 0.0
	var latido: float = 0.0

	func _draw() -> void:
		var cy: float = size.y * 0.5
		draw_rect(Rect2(0.0, cy - 3.0, size.x, 6.0), CareerTheme.SURFACE_HI)
		draw_arc(Vector2(MARCA_X, cy), 30.0 + 9.0 * latido, 0.0, TAU, 40,
			CareerTheme.NAV_YO, 5.0, true)
		for i in ts.size():
			var x: float = MARCA_X +(ts[i] - reloj) * VEL
			if x < -30.0 or x > size.x + 30.0:
				continue
			var e: int = int(estados[i]) if i < estados.size() else Trueno.PEND
			var col: Color = CareerTheme.TEXT if e == Trueno.PEND else (
				CareerTheme.NAV_YO if e == Trueno.BIEN else CareerTheme.DANGER)
			draw_circle(Vector2(x, cy), 24.0 if i == ts.size() - 1 else 17.0, col)
