extends "res://ui/ceremonies/vuelta.gd"




















const T_ALARMA: Vector2 = Vector2(2.7, 5.2)
const ALARMA_HZ: float = 4.0




const T_GUARDIA: Vector2 = Vector2(3.0, 4.6)
const GUARDIA_DESDE: Vector3 = Vector3(-3.2, 0.0, 0.35)
const GUARDIA_HASTA: Vector3 = Vector3(-0.3, 0.0, 0.35)
const T_BOCADILLO: float = 5.3
const T_CARD_EGO: float = 7.4

var _guardia: AnimatedSprite3D = null
var _alarma: OmniLight3D = null


var _velo_rojo: ColorRect = null
var _bocadillo: PanelContainer = null
var _pito: bool = false


func _build() -> void:
	_copas_tipos = _tipos()
	_sala()
	_vitrina()
	focus = Vector3(0.0, 0.0, -1.9)
	make_camera(KEYS, 32.0)
	orbit_speed = DRIFT
	_monta_foco()
	make_player(KitRecolor.casual_of(GameState.team_custom), "north", YO_ART)
	_planta(player, YO)
	_monta_guardia()
	_monta_alarma()
	_monta_bocadillo()
	make_chyron(I18n.t("¡ALARMA!"), CareerTheme.caps(I18n.t("MUSEO DE {0}").format(
		[Career.player_name])), {}, T_ALARMA.x + 0.1)
	make_card(T_CARD_EGO)
	card_title(I18n.t("EL MUSEO DE TU EGO"), 40)
	card_sub(I18n.t("TODOS LOS LOGROS"), CareerTheme.MONEY)
	card_note(I18n.t("Lo tienes todo. Hasta el guardia de noche es fan tuyo."))
	card_cta(I18n.t("SEGUIR"))






func _monta_guardia() -> void:
	var sf: SpriteFrames = SpriteFrames.new()
	sf.remove_animation("default")
	var base: String = "res://assets/sprites/anim/seguridad_"
	var cara: Dictionary = Coach.look_de("seguridad_museo")
	sf.add_animation("run_east")
	sf.set_animation_speed("run_east", 12.0)
	for i in range(1, 9):
		var p: String = "%srun_east_%02d.png" % [base, i]
		if ResourceLoader.exists(p):
			sf.add_frame("run_east", KitRecolor.apply(load(p), cara))
	for v in ["idle_east", "idle_south"]:
		sf.add_animation(v)
		var p: String = "%s%s.png" % [base, v]
		if ResourceLoader.exists(p):
			sf.add_frame(v, KitRecolor.apply(load(p), cara))
	_guardia = AnimatedSprite3D.new()
	_guardia.sprite_frames = sf


	_guardia.pixel_size = player.pixel_size * 0.87
	_guardia.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	_guardia.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	_guardia.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	_guardia.position = Vector3(GUARDIA_DESDE.x, feet_offset(player.pixel_size * 0.87,
		base + "idle_south.png") - PLAYER_SINK, GUARDIA_DESDE.z)
	_guardia.play("run_east")
	_guardia.visible = false
	viewport.add_child(_guardia)


func _monta_alarma() -> void:
	_alarma = OmniLight3D.new()
	_alarma.light_color = CareerTheme.DANGER
	_alarma.light_energy = 0.0
	_alarma.omni_range = 9.0
	_alarma.position = Vector3(0.0, 3.6, -0.6)
	viewport.add_child(_alarma)
	_velo_rojo = ColorRect.new()
	_velo_rojo.set_anchors_preset(Control.PRESET_FULL_RECT)
	_velo_rojo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_velo_rojo.color = Color(CareerTheme.DANGER, 0.0)
	add_child(_velo_rojo)




func _monta_bocadillo() -> void:
	_bocadillo = PanelContainer.new()
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CareerTheme.TEXT
	sb.set_corner_radius_all(18)
	sb.set_content_margin_all(18)
	_bocadillo.add_theme_stylebox_override("panel", sb)
	var l: Label = CareerUi.plain(30, CareerTheme.BG_DEEP)
	l.text = I18n.t("¿ME FIRMA LA GORRA?")
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_bocadillo.add_child(l)
	_bocadillo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_bocadillo.modulate.a = 0.0
	add_child(_bocadillo)


func _tick(delta: float) -> void:
	super._tick(delta)
	if _alarma != null:
		var on: bool = t >= T_ALARMA.x and t < T_ALARMA.y
		var late: bool = fmod(t * ALARMA_HZ, 1.0) < 0.5
		_alarma.light_energy =(6.0 if late else 0.6) if on else 0.0
		_velo_rojo.color.a =(0.26 if late else 0.08) if on else 0.0
	if not _pito and t >= T_ALARMA.x + 0.4:
		_pito = true
		sting("whistle")
	_tick_guardia()
	_tick_bocadillo()


func _tick_guardia() -> void:
	if _guardia == null:
		return
	_guardia.visible = t >= T_GUARDIA.x
	var k: float = clampf((t - T_GUARDIA.x) /(T_GUARDIA.y - T_GUARDIA.x), 0.0, 1.0)
	_guardia.position.x = lerpf(GUARDIA_DESDE.x, GUARDIA_HASTA.x, k)
	var anim: String = "run_east" if k < 1.0 else "idle_east"
	if _guardia.animation != anim:
		_guardia.play(anim)


func _tick_bocadillo() -> void:
	if _bocadillo == null or cam == null or not is_instance_valid(cam):
		return
	_bocadillo.modulate.a = clampf((t - T_BOCADILLO) / 0.25, 0.0, 1.0)
	if _bocadillo.modulate.a <= 0.0:
		return
	var vs: Vector2 = Vector2(viewport.size)
	if vs.x <= 0.0 or vs.y <= 0.0:
		return
	var caja: Rect2 = viewport_box.get_global_rect()
	var cabeza: Vector3 = _guardia.position + Vector3(0.0, 0.95, 0.0)
	var p: Vector2 = caja.position +(cam.unproject_position(cabeza) / vs) * caja.size
	_bocadillo.position = p - Vector2(_bocadillo.size.x * 0.35, _bocadillo.size.y + 12.0)




func _skipped() -> void:
	_pito = true




func _armar_auto_seguir() -> void:
	if _auto_tw != null and _auto_tw.is_valid():
		_auto_tw.kill()
	_auto_tw = create_tween()
	_auto_tw.tween_interval(AUTO_SEGUIR)
	_auto_tw.tween_callback(_leave)


func _on_skip() -> void:
	if t >= card_at and not grabando():
		_leave()
		return
	super._on_skip()




func _recuerdo() -> Dictionary:
	var out: Dictionary = data.duplicate(true)
	out["awards"] = _awards().duplicate(true)
	return out
