extends Node



























































const MATCH_SCENE: String = "res://features/match/match.tscn"
const LOGROS_SCENE: String = "res://ui/logros.tscn"





const PRACTICE_KIND: String = "frontal"




const INTENTOS: int = 6






const ESPERA_INTRO: float = 0.9
const ESPERA_GOL: float = 1.2
const ESPERA_REINTENTO: float = 0.5
const MIN_VISTA: float = 4.0
const TOPE_VISTA: float = 16.0
const COLA: float = 3.5
const PASO: float = 0.25



const GRABA_SECS: float = 12.0
const PREFIJO_VIDEO: String = "festejo"
const ACUSE_SECS: float = 2.5


const BTN_MIN: Vector2 = Vector2(280, 92)





@export var match_scene: PackedScene



signal terminado

signal grabacion_terminada(ok: bool, msg: String)
var auto_salir: bool = true


var prendio: bool = false

var grabaciones: int = 0

var _id: String = ""
var _m: Node = null
var _timer: Timer
var _antes: Dictionary = {}
var _saliendo: bool = false
var _restaurado: bool = false
var _btn_atras: Button = null
var _btn_guardar: Button = null
var _rec: ScreenRec = null


var _placa: PanelContainer = null

var _grabando: bool = false


var _gen: int = 0
var _primera: bool = true


func _ready() -> void:



	add_to_group(Settings.AHORRO_HOLD_GROUP)



	_timer = Timer.new()
	_timer.one_shot = true
	add_child(_timer)
	_id = Celebs.replay_pendiente
	Celebs.replay_pendiente = ""
	var ficha: Dictionary = Celebs.by_id(_id)
	if ficha.is_empty() or not Practice.is_kind(PRACTICE_KIND):
		_salir.call_deferred()
		return
	_prepara_estado(_id)
	_build_overlay(ficha)
	_monta()


func _exit_tree() -> void:
	_restaura()







static func forzado_de(id: String) -> Dictionary:
	var c: Dictionary = Celebs.by_id(id)
	if c.is_empty():
		return {}
	var es_gesto: bool = String(c.get("kind", "")) == Celebs.GESTO
	var clave: String = String(c.get("clave", ""))
	return {
		"spot": "corner" if es_gesto else clave,
		"gesto": clave if es_gesto else "",
		"lluvia": clave == "charco",
	}




func _prepara_estado(id: String) -> void:
	var f: Dictionary = forzado_de(id)
	var lluvia: bool = bool(f.get("lluvia", false))
	_antes = {
		"practice_kind": GameState.practice_kind,
		"practice_venue": GameState.practice_venue,
		"next_weather": GameState.next_weather,
		"next_rain": GameState.next_rain,
		"next_wind_seed": GameState.next_wind_seed,
		"readonly_save": GameState.readonly_save,
		"nat_match_active": GameState.nat_match_active,
	}
	GameState.practice_kind = PRACTICE_KIND
	GameState.practice_venue = GameState.VENUE_STADIUM



	GameState.next_weather = "rain" if lluvia else ""
	GameState.next_rain = 2 if lluvia else -1
	GameState.readonly_save = true


	GameState.nat_match_active = false







func _restaura() -> void:
	if _restaurado or _antes.is_empty():
		return
	_restaurado = true
	GameState.practice_kind = String(_antes["practice_kind"])
	GameState.practice_venue = String(_antes["practice_venue"])
	GameState.next_weather = String(_antes["next_weather"])
	GameState.next_rain = int(_antes["next_rain"])
	GameState.next_wind_seed = int(_antes["next_wind_seed"])
	GameState.readonly_save = bool(_antes["readonly_save"])
	GameState.nat_match_active = bool(_antes["nat_match_active"])





func _build_overlay(ficha: Dictionary) -> void:
	var capa: CanvasLayer = CanvasLayer.new()
	capa.layer = 90
	add_child(capa)
	var root: MarginContainer = MarginContainer.new()
	root.set_anchors_preset(Control.PRESET_FULL_RECT)
	root.mouse_filter = Control.MOUSE_FILTER_IGNORE
	root.add_theme_constant_override("margin_left", 32)
	root.add_theme_constant_override("margin_right", 32)

	root.add_theme_constant_override("margin_top", 96)
	root.add_theme_constant_override("margin_bottom", 64)








	if UiKit.es_horizontal():
		var lado: int = 32 + int(UiKit.side_safe_inset(get_viewport()))
		root.add_theme_constant_override("margin_left", lado)
		root.add_theme_constant_override("margin_right", lado)
		root.add_theme_constant_override("margin_bottom",
			maxi(64, int(UiKit.bottom_safe_inset(get_viewport()))))
	capa.add_child(root)
	var col: VBoxContainer = VBoxContainer.new()
	col.mouse_filter = Control.MOUSE_FILTER_IGNORE
	root.add_child(col)
	var rare: int = int(ficha.get("rare", Achievements.RARE_COMMON))
	var rc: Color = Achievements.rarity_color(rare)
	var placa: PanelContainer = PanelContainer.new()
	placa.add_theme_stylebox_override("panel", CareerTheme.plate())










	if UiKit.es_horizontal():
		var rc_vid: Rect2 = ScreenRec.recorte(SceneFade.rect_visible(self))
		placa.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
		placa.custom_minimum_size.x = maxf(0.0, rc_vid.size.x - 64.0)
	_placa = placa
	col.add_child(placa)
	var pc: VBoxContainer = VBoxContainer.new()
	pc.add_theme_constant_override("separation", 2)
	placa.add_child(pc)
	var chip: Label = CareerUi.plain(16, CareerTheme.MONEY)
	chip.text = CareerTheme.caps(I18n.t("REVIVIR"))
	pc.add_child(chip)


	var name_l: Label = CareerUi.plain(28, CareerTheme.TEXT)
	name_l.text = CareerTheme.caps(I18n.t(String(ficha.get("name", ""))))
	name_l.clip_text = true
	pc.add_child(name_l)
	var rare_l: Label = CareerUi.plain(14, rc)
	rare_l.text = I18n.t(Achievements.rarity_name(rare))
	pc.add_child(rare_l)
	var hueco: Control = Control.new()
	hueco.size_flags_vertical = Control.SIZE_EXPAND_FILL
	hueco.mouse_filter = Control.MOUSE_FILTER_IGNORE
	col.add_child(hueco)


	_btn_atras = CareerUi.back_button(col, _salir)
	_build_guardar()





func _build_guardar() -> void:
	if not ScreenRec.available() or _btn_atras == null:
		return
	var row: Node = _btn_atras.get_parent()
	if not (row is Container):
		return
	_btn_guardar = Button.new()
	_btn_guardar.text = I18n.t("GUARDAR")
	_btn_guardar.custom_minimum_size = BTN_MIN


	_btn_guardar.clip_text = true
	CareerTheme.apply_button(_btn_guardar, CareerTheme.Kind.PRIMARY, 26)
	UiKit.set_cue(_btn_guardar, "ui_confirm")
	_btn_guardar.pressed.connect(_on_guardar)
	row.add_child(_btn_guardar)



func _monta() -> void:
	var packed: PackedScene = match_scene
	if packed == null:
		packed = load(MATCH_SCENE) as PackedScene
	if packed == null:
		_salir.call_deferred()
		return
	_m = packed.instantiate()



	_m.set("_practice_intro_done", true)


	_m.set("_festejo_revivido", true)
	add_child(_m)



	_m.set_process_unhandled_input(false)

	_oculta_hud()
	_corre()


func _oculta_hud() -> void:
	if _m == null:
		return
	var hud: Node = _m.get_node_or_null("HUD")
	if hud is CanvasLayer:
		(hud as CanvasLayer).visible = false







func _corre(graba: bool = false) -> void:
	_gen += 1
	var gen: int = _gen
	var f: Dictionary = forzado_de(_id)
	if _primera:
		_primera = false


		_m.call("_end_intro")
	else:


		_m.call("_next_chance")
	await _espera(ESPERA_INTRO)
	if _vieja(gen):
		return
	_oculta_hud()
	var focus: Node3D = null
	for _i in INTENTOS:
		_m.set("_force_celeb_spot", String(f.get("spot", "")))
		_m.set("_force_celeb_gesture", String(f.get("gesto", "")))

		_m.set("_cross", Vector3(1.0, 1.0, 0.0))
		_m.call("_resolve_chance", "goal")
		await _espera(ESPERA_GOL)
		if _vieja(gen):
			return
		var fv: Variant = _m.get("_celeb_focus")
		if fv is Node3D and is_instance_valid(fv):
			focus = fv
			break
		_m.call("_next_chance")
		await _espera(ESPERA_REINTENTO)
		if _vieja(gen):
			return
	prendio = focus != null
	if prendio:
		if graba:
			_graba_inicio()


		var t: float = 0.0
		while t < TOPE_VISTA:
			await _espera(PASO)
			if _vieja(gen):
				return
			t += PASO
			if t < MIN_VISTA:
				continue
			if focus == null or not is_instance_valid(focus):
				break
			var rt: Variant = _m.get("_run_target")
			if not (rt is Dictionary) or not (rt as Dictionary).has(focus):
				break
		await _espera(COLA)
		if _vieja(gen):
			return
	if graba:
		_graba_fin()
	terminado.emit()

	if auto_salir and not _grabando:
		_salir()



func _vieja(gen: int) -> bool:
	return _saliendo or gen != _gen


func _espera(seg: float) -> void:
	_timer.start(seg)
	await _timer.timeout



func _on_guardar() -> void:
	if _grabando or _saliendo or _m == null:
		return
	_grabando = true
	_botones(false)
	_corre(true)


func _graba_inicio() -> void:
	if _rec != null:
		return
	_rec = ScreenRec.new()
	add_child(_rec)
	_rec.finished.connect(_on_video)
	_rec.start(get_viewport(), GRABA_SECS, PREFIJO_VIDEO, GRABA_SECS, zonas_sello())







func zonas_sello() -> Array[Rect2]:
	var out: Array[Rect2] = []
	if UiKit.es_horizontal() and is_instance_valid(_placa) and _placa.is_visible_in_tree():
		out.append(_placa.get_global_rect())
	return out




func _graba_fin() -> void:
	if _rec != null and is_instance_valid(_rec):
		_rec.stop()
	elif _grabando:
		_on_video(false, I18n.t("No hay nada grabado"))


func _on_video(ok: bool, msg: String) -> void:
	if _rec != null and is_instance_valid(_rec):
		_rec.queue_free()
	_rec = null
	_grabando = false
	grabaciones += 1
	_botones(true)


	_acuse(I18n.t("GUARDADO") if ok
		else (msg if not msg.is_empty() else I18n.t("NO SE PUDO GUARDAR")))
	grabacion_terminada.emit(ok, msg)
	if auto_salir:


		var tw: Tween = create_tween()
		tw.tween_interval(ACUSE_SECS)
		tw.tween_callback(_salir)


func _botones(on: bool) -> void:
	if _btn_atras != null and is_instance_valid(_btn_atras):
		_btn_atras.visible = on
	if _btn_guardar != null and is_instance_valid(_btn_guardar):
		_btn_guardar.visible = on




func _acuse(texto: String) -> void:
	if _btn_guardar == null or not is_instance_valid(_btn_guardar):
		return
	_btn_guardar.text = texto
	var tw: Tween = create_tween()
	tw.tween_interval(2.0)
	tw.tween_callback(func() -> void:
		if is_instance_valid(_btn_guardar):
			_btn_guardar.text = I18n.t("GUARDAR"))




func _salir() -> void:
	if _saliendo:
		return
	_saliendo = true
	if _rec != null and is_instance_valid(_rec):
		_rec.abort()
	_restaura()
	Celebs.replay_hecho = true
	SceneFade.to_scene(LOGROS_SCENE)
