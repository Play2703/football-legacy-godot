class_name PortadaIntro
extends Control









































































































signal retirada










const T_NOCHE: float = 0.0
const D_NOCHE: float = 0.6
const T_FUGAZ: float = 0.75
const D_FUGAZ: float = 0.57
const T_BALL: float = 1.0
const D_BALL: float = 0.78
const T_WORD: float = 1.55
const D_WORD: float = 0.57
const T_FIRMA: float = 2.2
const D_FIRMA: float = 0.57






const SUELO_TOTAL: float = 3.0





const TOPE_TOTAL: float = 6.0










const ALBA_MAX: float = 0.42
const ALBA_FIN: float = 0.62








const ESTRELLAS_FIN: float = 0.5
const CIELO_FUERA: float = 0.58



const REGLA_FUERA: float = 0.12








const FIRMA_PRE_DEST: int = CareerTheme.T_CAPTION
const FIRMA_WHO_DEST: int = CareerTheme.T_HEAD
const FIRMA_HUECO: float = 30.0
const FIRMA_HUECO_DEST: float = 10.0


const VUELO_DESDE: float = 0.52
const PORTADA_DESDE: float = 0.6










const D_SALIDA: float = 2.4






const D_SALIDA_CORTA: float = 1.5


const TARDE: float = 4.0



const SUBIDA_CIELO: float = 420.0





const HOP_PERIOD: float = 0.8
const HOP_HEIGHT: float = 26.0

























const AMB_DB: float = -15.0
const AMB_ENTRA: float = 1.2


const BOTE_X: Array = [0.3636, 0.7273, 0.9091, 1.0]
const BOTE_DB: Array = [-3.0, -9.0, -14.0, -18.0]
const HOP_DB: float = -22.0



const SALTO: float = 0.3
const MUSICA_ENTRA: float = 1.0



const COL_SEP: int = 12
const COL_SEP_DEST: int = 16

const CAIDA: float = 620.0




const BALL_BIG: float = 196.0
const BALL_DEST: float = 108.0
const TITLE_BIG: int = 72
const TITLE_DEST: int = 64



const PESO_ESTRELLAS: Dictionary = {"night": 1.0, "sunset": 0.34, "day": 0.0}

const VELO_DIA: float = 0.34









const FLARE_MAX: float = 0.85
const FLARE_ARRASTRE: float = 0.55




const RULE_W: float = 380.0










const SPLASH: String = "res://assets/branding/splash_cielo.png"











const SPLASH_ARRANQUE: String = "res://assets/branding/splash_arranque.png"







static func splash_rect(arranque: bool = false) -> TextureRect:
	var r: TextureRect = TextureRect.new()
	r.texture = load(SPLASH_ARRANQUE if arranque and con_logo() else SPLASH)
	r.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	r.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_COVERED


	r.texture_filter = CanvasItem.TEXTURE_FILTER_LINEAR
	r.set_anchors_preset(Control.PRESET_FULL_RECT)
	r.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return r







static func con_logo() -> bool:
	return String(ProjectSettings.get_setting_with_override(
		"application/boot_splash/image")) == SPLASH_ARRANQUE











static var ensayo: bool = false





var _cielo: Control
var _bandas: Noche
var _estrellas: Estrellas
var _alba: Alba
var _titilan: Array[ColorRect] = []
var _fugaz: ColorRect

var _velo: ColorRect

var _flare: Destello


var _splash: TextureRect

var _franja: String = "night"

var _peso_estrellas: float = 1.0

var _dia: bool = false


var _bg: CanvasItem

var _dur_salida: float = D_SALIDA
var _col: VBoxContainer
var _ball_row: Control
var _ball: PixelBall
var _title: Label
var _rule: ColorRect
var _firma: VBoxContainer
var _firma_pre: Label
var _firma_who: Label
var _firma_hueco: Control
var _firma_k: float = -1.0





var _dest_ball: Control
var _dest_title: Label
var _dest_firma: Control

var _ui: CanvasItem
var _scrim: CanvasItem

var _reloj: float = 0.0
var _salida: float = -1.0
var _col_y0: float = 0.0
var _col_dy: float = 0.0
var _saliendo: bool = false


var _muerta: bool = false

var _amb: AudioStreamPlayer
var _hilo: int = -1
var _horno: Dictionary = {}
var _sonido_listo: bool = false
var _t_sonido: float = 0.0
var _musica_guiada: bool = false



var sella_tope: bool = false
var _col_h0: float = 0.0


func _ready() -> void:



	add_to_group(Settings.ANIM_HOLD_GROUP)



	mouse_filter = Control.MOUSE_FILTER_STOP





	_fit_viewport()
	get_viewport().size_changed.connect(_fit_viewport)

	_build_cielo()
	_build_ui()
	_pintar()



	if GameState.readonly_save and not ensayo:
		_plantar_final()
		_apagarse()
	else:
		_arrancar_sonido()





func _build_cielo() -> void:


	_franja = Weather.franja_por_hora()
	_peso_estrellas = PESO_ESTRELLAS.get(_franja, 1.0)




	if sella_tope:
		_splash = splash_rect(true)
		add_child(_splash)



	_cielo = Control.new()
	_cielo.set_anchors_preset(Control.PRESET_FULL_RECT)
	_cielo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(_cielo)

	_bandas = Noche.new()
	_bandas.franja = _franja
	_bandas.set_anchors_preset(Control.PRESET_FULL_RECT)
	_bandas.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_cielo.add_child(_bandas)

	_estrellas = Estrellas.new()


	_estrellas.franja = _franja
	_estrellas.set_anchors_preset(Control.PRESET_FULL_RECT)
	_estrellas.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_cielo.add_child(_estrellas)

	var alto: float = get_viewport_rect().size.y
	var ancho: float = get_viewport_rect().size.x


	for i in (0 if _peso_estrellas <= 0.0 else 10):
		var t: ColorRect = ColorRect.new()
		t.color = CareerTheme.TEXT


		t.position = Vector2(randf_range(40.0, ancho - 40.0), randf_range(60.0, alto * 0.34))
		t.size = Vector2(3, 3)
		t.mouse_filter = Control.MOUSE_FILTER_IGNORE
		_estrellas.add_child(t)
		_titilan.append(t)





	_fugaz = ColorRect.new()
	_fugaz.color = CareerTheme.TEXT
	_fugaz.size = Vector2(54, 2)
	_fugaz.rotation = deg_to_rad(24.0)
	_fugaz.modulate.a = 0.0
	_fugaz.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_fugaz.visible = _peso_estrellas > 0.0
	_estrellas.add_child(_fugaz)





	_alba = Alba.new()
	_alba.set_anchors_preset(Control.PRESET_FULL_RECT)
	_alba.modulate.a = 0.0
	_alba.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_cielo.add_child(_alba)








	if _peso_estrellas < 1.0:
		_flare = Destello.new()
		_flare.franja = _franja
		_flare.set_anchors_preset(Control.PRESET_FULL_RECT)
		_flare.mouse_filter = Control.MOUSE_FILTER_IGNORE
		_cielo.add_child(_flare)

	if _franja != "night":
		_velo = ColorRect.new()
		_velo.color = Color(CareerTheme.BG_DEEP.r, CareerTheme.BG_DEEP.g,
			CareerTheme.BG_DEEP.b, VELO_DIA)
		_velo.set_anchors_preset(Control.PRESET_FULL_RECT)
		_velo.mouse_filter = Control.MOUSE_FILTER_IGNORE
		_cielo.add_child(_velo)

		if _flare != null:
			_cielo.move_child(_flare, _cielo.get_child_count() - 1)





func amanece_hacia(clima: String, bg: CanvasItem = null) -> void:
	_dia = clima != "night"
	if _alba != null:
		_alba.tinte = Weather.tint(clima)
		_alba.queue_redraw()
	_bg = bg



	if _bg != null:
		_bg.set("mirada", 0.0)





func _build_ui() -> void:
	_col = VBoxContainer.new()
	_col.set_anchors_preset(Control.PRESET_FULL_RECT)
	_col.offset_left = 66.0
	_col.offset_right = -66.0
	_col.alignment = BoxContainer.ALIGNMENT_CENTER
	_col.add_theme_constant_override("separation", COL_SEP)
	_col.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(_col)




	_ball_row = Control.new()
	_ball_row.custom_minimum_size = Vector2(0, BALL_BIG + HOP_HEIGHT)
	_ball_row.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_col.add_child(_ball_row)

	_ball = PixelBall.new()
	_ball.size = Vector2(BALL_BIG, BALL_BIG)

	_ball.pivot_offset = Vector2(BALL_BIG, BALL_BIG) * 0.5




	_ball.shadow = false
	_ball.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_ball_row.add_child(_ball)



	_title = Label.new()
	CareerTheme.title(_title, TITLE_BIG)
	_title.text = "FOOTBALL\nLEGACY"
	_title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_title.add_theme_constant_override("line_spacing", 6)
	_col.add_child(_title)



	var carril: Control = Control.new()
	carril.custom_minimum_size = Vector2(0, 3)
	carril.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_col.add_child(carril)
	_rule = ColorRect.new()
	_rule.color = CareerTheme.accent()
	_rule.size = Vector2(0, 3)
	_rule.mouse_filter = Control.MOUSE_FILTER_IGNORE
	carril.add_child(_rule)

	_firma = _build_firma()
	_col.add_child(_firma)



	_firma.visible = false







func _build_firma() -> VBoxContainer:
	var box: VBoxContainer = VBoxContainer.new()
	box.add_theme_constant_override("separation", 6)
	box.mouse_filter = Control.MOUSE_FILTER_IGNORE

	var hueco: Control = Control.new()
	hueco.custom_minimum_size = Vector2(0, FIRMA_HUECO)
	hueco.mouse_filter = Control.MOUSE_FILTER_IGNORE
	box.add_child(hueco)
	_firma_hueco = hueco

	var pre: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
	pre.text = I18n.t("UN JUEGO DE")
	pre.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	box.add_child(pre)
	_firma_pre = pre

	var who: Label = CareerUi.plain(CareerTheme.T_TITLE_MODAL, CareerTheme.MONEY)
	who.text = "CESAR ALVAREZ"
	who.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	box.add_child(who)
	_firma_who = who



	CareerUi.normalize_caps(box)
	return box




func apunta_a(ball: Control, title: Label, ui: CanvasItem = null,
		scrim: CanvasItem = null, firma: Control = null) -> void:
	_dest_ball = ball
	_dest_title = title
	_dest_firma = firma
	_ui = ui
	_scrim = scrim
	if _saliendo or _muerta:


		return
	_dest_ball.modulate.a = 0.0
	_dest_title.modulate.a = 0.0
	if _dest_firma != null:
		_dest_firma.modulate.a = 0.0




	if _ui != null:
		_ui.modulate.a = 0.0
	if _scrim != null:
		_scrim.modulate.a = 0.0





func _fit_viewport() -> void:
	set_anchors_preset(Control.PRESET_TOP_LEFT)
	position = Vector2.ZERO
	size = get_viewport_rect().size







func _process(delta: float) -> void:



	_reloj += minf(delta, 1.0 / 30.0) if _splash != null else delta
	if _salida >= 0.0:
		_salida += delta
	elif _reloj >= TOPE_TOTAL:




		if sella_tope and not _saliendo and not _muerta:
			Telemetry.fase_arranque("tp")
		dismiss()
	_pintar()
	_recoger_sonido()
	_sonar()


func _pintar() -> void:
	var t: float = _reloj




	var salida: float = 0.0 if _salida < 0.0 else minf(_salida / _dur_salida, 1.0)



	if _bg != null and is_instance_valid(_bg):
		_bg.set("mirada", _suaviza(salida))



	var velo: float = _suaviza(minf(salida / CIELO_FUERA, 1.0))
	var entra: float = _paso(t, T_NOCHE, D_NOCHE)


	if _splash != null and entra >= 1.0:
		_splash.queue_free()
		_splash = null
	_cielo.position.y = - SUBIDA_CIELO * velo
	_bandas.modulate.a = entra *(1.0 - velo)







	if _velo != null:
		_velo.modulate.a = entra *(1.0 - velo)
	_estrellas.modulate.a = entra * _peso_estrellas * maxf(0.0, 1.0 - salida / ESTRELLAS_FIN)
	_alba.modulate.a =(ALBA_MAX * sin(minf(salida / ALBA_FIN, 1.0) * PI)) if _dia else 0.0




	if _flare != null:
		_flare.modulate.a = entra *(1.0 - velo) * FLARE_MAX
		_flare.arrastre = 1.0 + FLARE_ARRASTRE * salida
		_flare.queue_redraw()


	var suave: float = _suaviza(clampf((salida - VUELO_DESDE) /(1.0 - VUELO_DESDE),
		0.0, 1.0))


	if _salida >= 0.0:
		_pon_portada(_suaviza(clampf((salida - PORTADA_DESDE)
			/(1.0 - PORTADA_DESDE), 0.0, 1.0)))



	for i in _titilan.size():
		var e: ColorRect = _titilan[i]
		e.modulate.a = 0.35 + 0.45 * sin(t *(1.1 + 0.17 * float(i)) + e.position.x)


	var f: float = _tramo(t, T_FUGAZ, D_FUGAZ)
	if f > 0.0 and f < 1.0:
		_fugaz.position = Vector2(size.x *(-0.15 + 1.25 * f), size.y *(0.06 + 0.16 * f))

		_fugaz.modulate.a = sin(f * PI)
	else:
		_fugaz.modulate.a = 0.0


	var lado: float = lerpf(BALL_BIG, BALL_DEST, suave)
	if not is_equal_approx(lado, _ball.size.x):
		_ball.size = Vector2(lado, lado)
		_ball.pivot_offset = Vector2(lado, lado) * 0.5
	var caida: float = _tramo(t, T_BALL, D_BALL)
	if caida <= 0.0:
		_coloca_balon(- CAIDA)
		_ball.modulate.a = 0.0
	elif caida < 1.0:
		_ball.modulate.a = 1.0
		_coloca_balon(- CAIDA *(1.0 - _bote(caida)))
	else:
		_ball.modulate.a = 1.0







		var ciclo: float = fmod(t -(T_BALL + D_BALL), HOP_PERIOD) / HOP_PERIOD


		var alto: float = 4.0 * HOP_HEIGHT * ciclo *(1.0 - ciclo) *(1.0 - velo)
		_coloca_balon(- alto)







	_title.modulate.a = _paso(t, T_WORD, D_WORD)
	_set_title_size(lerpf(float(TITLE_BIG), float(TITLE_DEST), suave))
	var pronto: float = minf(salida / REGLA_FUERA, 1.0)
	_rule.modulate.a = 1.0 - pronto
	_firma.modulate.a = _paso(t, T_FIRMA, D_FIRMA)
	_set_firma_size(suave)
	_abrir_regla(RULE_W * _paso(t, T_WORD, D_WORD * 1.2))





	if _salida >= 0.0:
		_col.position.y = _col_y0 + _col_dy * suave \
				-(_col_h0 - _col.get_combined_minimum_size().y) * 0.5
		if salida >= 1.0:
			_desaparecer()




func _paso(t: float, desde: float, dura: float) -> float:
	var x: float = clampf((t - desde) / maxf(dura, 0.001), 0.0, 1.0)
	return x * x *(3.0 - 2.0 * x)



func _suaviza(x: float) -> float:
	var v: float = clampf(x, 0.0, 1.0)
	return v * v *(3.0 - 2.0 * v)




func _tramo(t: float, desde: float, dura: float) -> float:
	if t < desde:
		return 0.0
	return clampf((t - desde) / maxf(dura, 0.001), 0.0, 1.0)




func _bote(x: float) -> float:
	const N: float = 7.5625
	const D: float = 2.75
	if x < 1.0 / D:
		return N * x * x
	if x < 2.0 / D:
		x -= 1.5 / D
		return N * x * x + 0.75
	if x < 2.5 / D:
		x -= 2.25 / D
		return N * x * x + 0.9375
	x -= 2.625 / D
	return N * x * x + 0.984375





func _coloca_balon(alto: float) -> void:
	var lado: float = _ball.size.x
	_ball.position = Vector2((_ball_row.size.x - lado) * 0.5,
		(_ball_row.size.y - lado) + alto)


func _abrir_regla(ancho: float) -> void:
	var carril: Control = _rule.get_parent() as Control
	_rule.size = Vector2(ancho, 3)
	_rule.position = Vector2((carril.size.x - ancho) * 0.5, 0.0)


func _set_title_size(px: float) -> void:
	_title.add_theme_font_size_override("font_size", int(roundf(px)))






func _set_firma_size(k: float) -> void:
	if _firma_pre == null or is_equal_approx(k, _firma_k):
		return
	_firma_k = k
	_firma_pre.add_theme_font_size_override("font_size",
		int(roundf(lerpf(float(CareerTheme.T_DIM), float(FIRMA_PRE_DEST), k))))
	_firma_who.add_theme_font_size_override("font_size",
		int(roundf(lerpf(float(CareerTheme.T_TITLE_MODAL), float(FIRMA_WHO_DEST), k))))
	_firma_hueco.custom_minimum_size.y = lerpf(FIRMA_HUECO, FIRMA_HUECO_DEST, k)
	_col.add_theme_constant_override("separation",
		int(roundf(lerpf(float(COL_SEP), float(COL_SEP_DEST), k))))












func _plantar_final() -> void:
	_reloj = maxf(_reloj, T_FIRMA + D_FIRMA)
	_pintar()





func dismiss() -> void:
	if _saliendo or _muerta:
		return
	_saliendo = true
	var falta: float = SUELO_TOTAL - _reloj
	if falta <= 0.0:
		_bajar_la_mirada()
		return




	SceneFade.timer(falta).timeout.connect(_bajar_la_mirada)





func set_progress(_done: float) -> void:
	pass




func set_message(_txt: String) -> void:
	pass






func _bajar_la_mirada() -> void:
	if _muerta:
		return
	_plantar_final()
	mouse_filter = Control.MOUSE_FILTER_IGNORE







	_dur_salida = D_SALIDA_CORTA if _reloj > TARDE else D_SALIDA
	_col_y0 = _col.position.y
	_col_dy = 0.0
	if _dest_ball != null and is_instance_valid(_dest_ball):
		var mio: float = _ball_row.global_position.y +(_ball_row.size.y - BALL_DEST)
		_col_dy = _dest_ball.global_position.y - mio
	_col_h0 = _col.get_combined_minimum_size().y
	_salida = 0.0


	UiAudio.whoosh()





func _desaparecer() -> void:
	_encender_destino()
	_apagarse()


	retirada.emit()
	queue_free()




func _apagarse() -> void:
	_muerta = true
	set_process(false)
	if is_in_group(Settings.ANIM_HOLD_GROUP):
		remove_from_group(Settings.ANIM_HOLD_GROUP)
	visible = false
	mouse_filter = Control.MOUSE_FILTER_IGNORE


	_suelta_musica()
	if _amb != null:
		_amb.stop()




func _exit_tree() -> void:
	if _hilo >= 0:
		WorkerThreadPool.wait_for_task_completion(_hilo)
		_hilo = -1
	_suelta_musica()



func _arrancar_sonido() -> void:



	var ids: PackedStringArray = [_amb_id(), "intro_bote", "ui_whoosh"]
	if _franja != "day":
		ids.append("intro_fugaz")
	_hilo = WorkerThreadPool.add_task(_hornear.bind(ids), false, "intro_sonido")



func _hornear(ids: PackedStringArray) -> void:
	for id in ids:
		_horno[id] = AudioSynth.hornea(id)


func _amb_id() -> String:
	return "intro_grillos" if _franja == "night" else "intro_pajaros"




func _recoger_sonido() -> void:
	if _hilo < 0 or not WorkerThreadPool.is_task_completed(_hilo):
		return
	WorkerThreadPool.wait_for_task_completion(_hilo)
	_hilo = -1
	for id in _horno:
		AudioSynth.adopta(String(id), _horno[id])
	var bucle: AudioStreamWAV = _horno.get(_amb_id(), null)
	_horno.clear()
	if bucle != null:
		_amb = AudioStreamPlayer.new()
		_amb.stream = bucle
		_amb.bus = UiAudio.SFX_BUS
		_amb.volume_db = -80.0
		add_child(_amb)
		_amb.play()
	_sonido_listo = true





func _sonar() -> void:
	if _muerta or is_queued_for_deletion():
		return
	var t: float = _reloj
	var salida: float = 0.0 if _salida < 0.0 else minf(_salida / _dur_salida, 1.0)
	if _amb != null:
		var g: float = minf(t / AMB_ENTRA, 1.0) *(1.0 - _suaviza(salida))
		_amb.volume_db = AMB_DB + linear_to_db(maxf(g, 0.001))
	var desde: float = _t_sonido
	_t_sonido = t
	_guia_musica(t)
	if not _sonido_listo or t - desde > SALTO:
		return
	if _franja != "day" and _cruza(desde, t, T_FUGAZ + D_FUGAZ * 0.15):
		UiAudio.play("intro_fugaz", 1.0, -10.0)
	for k in BOTE_X.size():
		if _cruza(desde, t, T_BALL + D_BALL * float(BOTE_X[k])):
			UiAudio.play("intro_bote", 1.0 + 0.04 * float(k), float(BOTE_DB[k]))


	var suelo: float = T_BALL + D_BALL
	if _salida < 0.0 and t > suelo:
		var n0: int = floori((desde - suelo) / HOP_PERIOD)
		var n1: int = floori((t - suelo) / HOP_PERIOD)
		if n1 > n0 and n1 >= 1:
			UiAudio.play("intro_bote", 1.1, HOP_DB)


func _cruza(desde: float, hasta: float, instante: float) -> bool:
	return desde < instante and instante <= hasta










func silencia_musica() -> void:
	if _muerta or _saliendo:
		return
	_musica_guiada = true
	_bus_musica(0.0)


func _guia_musica(t: float) -> void:
	if not _musica_guiada:
		return
	var g: float = clampf((t - T_WORD) / MUSICA_ENTRA, 0.0, 1.0)
	_bus_musica(g)
	if g >= 1.0:
		_musica_guiada = false




func _suelta_musica() -> void:
	if _musica_guiada:
		_musica_guiada = false
		_bus_musica(1.0)


func _bus_musica(g: float) -> void:
	var idx: int = AudioServer.get_bus_index(Music.SRC_BUS)
	if idx >= 0:
		AudioServer.set_bus_volume_db(idx, linear_to_db(maxf(g, 0.001)))


func _encender_destino() -> void:
	if _dest_ball != null and is_instance_valid(_dest_ball):
		_dest_ball.modulate.a = 1.0
	if _dest_title != null and is_instance_valid(_dest_title):
		_dest_title.modulate.a = 1.0
	if _dest_firma != null and is_instance_valid(_dest_firma):
		_dest_firma.modulate.a = 1.0
	_pon_portada(1.0)




func _pon_portada(a: float) -> void:
	if _ui != null and is_instance_valid(_ui):
		_ui.modulate.a = a
	if _scrim != null and is_instance_valid(_scrim):
		_scrim.modulate.a = a


















class Noche extends Control:

	const BANDAS: int = 26



	const ASTRO_X: float = 0.78
	const ASTRO_Y_NOCHE: float = 0.13
	const ASTRO_Y_DIA: float = 0.2
	const ASTRO_R: float = 34.0


	const AZUL: float = 0.16

	const INDIGO: float = 0.26


	const DIA_ARRIBA: float = 0.34
	const DIA_ABAJO: float = 0.3

	var franja: String = "night"



	static func luz_de(f: String) -> Color:
		if f == "sunset":
			return CareerTheme.FLASH.lerp(Weather.tint("sunset"), 0.45)
		return CareerTheme.FLASH

	static func arriba_de(f: String) -> Color:
		if f == "day":
			return Weather.tint("day").lerp(CareerTheme.BG_DEEP, DIA_ARRIBA)
		if f == "sunset":
			return CareerTheme.BG_DEEP.lerp(CareerTheme.NAV_MUNDO, INDIGO)
		return CareerTheme.BG_DEEP.lerp(CareerTheme.NAV_CASA, AZUL)

	static func abajo_de(f: String) -> Color:
		if f == "day":
			return Weather.tint("day").lerp(CareerTheme.TEXT, DIA_ABAJO)
		if f == "sunset":
			return Weather.tint("sunset")
		return CareerTheme.BG_DEEP

	func _ready() -> void:


		resized.connect(queue_redraw)

	func _draw() -> void:
		var w: float = size.x
		var h: float = size.y
		if w <= 0.0 or h <= 0.0:
			return
		var arriba: Color = arriba_de(franja)
		var abajo: Color = abajo_de(franja)
		var banda: float = ceilf(h / float(BANDAS))
		for i in BANDAS:
			var f: float = float(i) / float(BANDAS - 1)
			draw_rect(Rect2(0.0, float(i) * banda, w, banda), arriba.lerp(abajo, f))








		var alto_rel: float = ASTRO_Y_NOCHE if franja == "night" else ASTRO_Y_DIA
		var centro: Vector2 = Vector2(w * ASTRO_X, h * alto_rel)
		var r: float = ASTRO_R
		var detras: Color = arriba.lerp(abajo, alto_rel)
		if franja == "night":
			draw_circle(centro, r, CareerTheme.TEXT)
			draw_circle(centro + Vector2(r * 0.42, - r * 0.24), r * 0.92, detras)
			return







		var luz: Color = luz_de(franja)
		var halo: Color = luz
		halo.a = 0.22
		draw_circle(centro, r * 1.7, halo)
		draw_circle(centro, r, luz)







class Estrellas extends Control:

	const CUANTAS: int = 130
	var franja: String = "night"






	var _campo: Array = []

	func _ready() -> void:

		if franja != "day":
			for i in CUANTAS:



				_campo.append([Vector2(randf(), randf() * randf() * 0.78),
					3.0 if randf() < 0.22 else 2.0, randf_range(0.28, 0.9)])
		resized.connect(queue_redraw)

	func _draw() -> void:
		var w: float = size.x
		var h: float = size.y
		if w <= 0.0 or h <= 0.0:
			return
		for e in _campo:
			var p: Vector2 = e[0]
			var lado: float = e[1]
			var col: Color = CareerTheme.TEXT
			col.a = e[2]
			draw_rect(Rect2(p.x * w, p.y * h, lado, lado), col)












class Alba extends Control:

	const BANDAS: int = 18

	const HASTA: float = 0.52

	var tinte: Color = Color(1, 1, 1)

	func _ready() -> void:
		resized.connect(queue_redraw)

	func _draw() -> void:
		var w: float = size.x
		var h: float = size.y * HASTA
		if w <= 0.0 or h <= 0.0:
			return
		var banda: float = ceilf(h / float(BANDAS))
		for i in BANDAS:
			var f: float = float(i) / float(BANDAS - 1)
			var col: Color = tinte


			col.a =(1.0 - f) *(1.0 - f)
			draw_rect(Rect2(0.0, float(i) * banda, w, banda), col)



















class Destello extends Control:


	const ANILLOS: int = 7
	const HALO_R: float = 5.2

	const RAYA_LARGO: float = 0.62
	const RAYA_TIRAS: int = 7
	const RAYA_ALTO: float = 3.0



	const FANTASMAS: Array = [
		[0.58, 15.0, 0.1],
		[1.16, 26.0, 0.07],
		[1.78, 10.0, 0.13],
	]

	var franja: String = "day"

	var arrastre: float = 1.0

	func _ready() -> void:
		resized.connect(queue_redraw)

	func _draw() -> void:
		var w: float = size.x
		var h: float = size.y
		if w <= 0.0 or h <= 0.0:
			return
		var luz: Color = Noche.luz_de(franja)
		var sol: Vector2 = Vector2(w * Noche.ASTRO_X, h * Noche.ASTRO_Y_DIA)
		var r: float = Noche.ASTRO_R



		for i in ANILLOS:
			var f: float = float(i) / float(ANILLOS - 1)
			var col: Color = luz
			col.a = 0.16 * f * f
			draw_circle(sol, r * lerpf(HALO_R, 1.0, f), col)



		var largo: float = w * RAYA_LARGO
		for i in RAYA_TIRAS:
			var f: float = float(i) / float(RAYA_TIRAS - 1)
			var col: Color = luz
			col.a = 0.07 + 0.13 * f * f
			var media: float = largo * lerpf(1.0, 0.18, f)
			draw_rect(Rect2(sol.x - media, sol.y - RAYA_ALTO * 0.5,
				media * 2.0, RAYA_ALTO), col)


		var centro: Vector2 = Vector2(w * 0.5, h * 0.5)
		for f in FANTASMAS:
			var col: Color = luz
			col.a = f[2]
			draw_circle(sol +(centro - sol) *(float(f[0]) * arrastre),
				float(f[1]), col)
