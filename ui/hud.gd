class_name MatchHud
extends CanvasLayer

const TeamIdentityColors = preload("res://features/scoreboard/team_identity_colors.gd")



signal restart_requested
signal menu_requested
signal pause_requested


signal mode_toggle_requested



signal cam_focus_requested





signal strike_cancel_requested

var _message_tween: Tween
var _pause_button: Button
var _minute_label: Label
var _chance_chip: PanelContainer
var _wind_chip: PanelContainer
var _wind_icon: WindIcon
var _wind_label: Label
var _chance_label: Label
var _rating_chip: PanelContainer



var _rating_dial: StatDial


const RATING_DIAL_PX: float = 108.0
const RATING_DIAL_FONT: int = 21
const RATING_DIAL_OUTLINE: int = 5











const NOTA_DISCO_DIAL: float = 102.0

var _rating_shown: float = 6.0
var _rating_count_tw: Tween

var _rating_delta: Label
var _rating_delta_tw: Tween

var _peso_nota_lbl: Label


var _fly_label: Label


var _pts_label: Label = null
var _pts_tw: Tween = null

var _dianas_box: VBoxContainer = null
var _dianas_reloj: Label = null
var _dianas_estrellas: HBoxContainer = null



const DIANAS_ESTRELLA_PX: float = 78.0
var _dianas_pts: Label = null

var _dianas_on: bool = false










var _dianas_seg: int = -1
var _dianas_llenas: int = -1
var _dianas_rojo: int = -1
var _fly_tw: Tween
var _momentum_chip: PanelContainer
var _momentum_label: Label


var _mood_veil: TextureRect
var _mood_tw: Tween





var _penal_veil: TextureRect

var _heat_bar: HeatBar
var _heat_tw: Tween
var _msg_band: Panel


const MSG_MARGIN: float = 60.0


var _msg_mid: float = 630.0









const MSG_LADO_H: float = 360.0













var _player_chip: PanelContainer
var _player_chip_sb: StyleBoxFlat




var _player_patch: KitPatch




var _goal_patch: KitPatch
var _goal_pad: MarginContainer




var _player_pad: MarginContainer
var _player_num_sb: StyleBoxFlat
var _player_num: Label
var _player_face: PlayerAvatar



var _player_face_look: Dictionary = {}
var _player_flag: TextureRect
var _player_name: Label


var _player_socio: Label




var _kit_a: Color = Color("ffd952")
var _kit_b: Color = Color("12141a")
var _you_abbr: Label
var _rival_abbr: Label
var _you_crest: CrestView
var _rival_crest: CrestView
var _stage_chip: PanelContainer
var _stage_sb: StyleBoxFlat
var _stage_label: Label












var _mode_chip: PanelContainer
var _mode_icon_shot: AimModeIcon
var _mode_icon_cross: AimModeIcon
var _mode_label: Label
var _mode_tween: Tween
var _mode_pulse_tween: Tween



var _cam_chip: PanelContainer
var _cam_icon_goal: CamFocusIcon
var _cam_icon_pass: CamFocusIcon
var _cam_seg_goal: PanelContainer
var _cam_seg_pass: PanelContainer
var _cam_label: Label
var _cam_tween: Tween
var _cam_last: int = -1


var _cancel_chip: PanelContainer
var _cancel_label: Label



var _mode_cross_last: String = ""

var _mode_word_shot: Label
var _mode_word_cross: Label


var _comp_style: Dictionary = Competitions.COMP_STYLE["liga"]


var _comp_key: String = "league"
var _accent: Color = UiKit.GOLD




var _accent_text: Color = UiKit.GOLD


var _rating_is_neutral: bool = true






var _comp_logo: CompLogo
var _medallion: PanelContainer
var _medallion_sb: StyleBoxFlat




var _nota_disco: PanelContainer = null
var _nota_disco_sb: StyleBoxFlat
var _nota_hueco: Control
var _rival_panel: PanelContainer
var _you_tag_sb: StyleBoxFlat
var _rival_tag_sb: StyleBoxFlat
var _center_sb: StyleBoxFlat


var _score_box: PanelContainer
var _cola_holder: MarginContainer
var _cuelga_box: VBoxContainer


var _clock_box: ClockTab
var _clock_pulse: Tween
var _clock_breathing: bool = false




var _half_label: Label
var _tic: Timer
var _tic_on: bool = true


var _you_team_data: Dictionary = {}
var _rival_team_data: Dictionary = {}
var _you_goals: int = 0
var _rival_goals: int = 0
var _match_minute: int = 0




const PRACTICE_CHIP_DROP: float = 182.0





var _practice: bool = false



var nota_en_practica: bool = false






var _calladas: int = 0



var _wind_callado: bool = false











var _academia: bool = false




var _stoppage_base: int = 0
var _stoppage_added: int = 0











var _goal_card: PanelContainer
var _goal_card_sb: StyleBoxFlat
var _goal_crest_sb: StyleBoxFlat
var _goal_big_crest: CrestView
var _goal_flag: TextureRect







var _goal_first: Label
var _goal_name: Label



var _goal_credit: Label
var _goal_minute: Label



var _goal_num_sb: StyleBoxFlat
var _goal_num: Label
var _goal_face: PlayerAvatar
var _goal_stats: HBoxContainer
var _goal_stat_values: Array[Label] = []
var _goal_stat_chips: Array[PanelContainer] = []



var _goal_comp_line: ColorRect
var _goal_flash: ColorRect
var _goal_tween: Tween

@onready var _score_chip: PanelContainer = % ScoreChip
const USE_NEW_SCOREBOARD: bool = true
const INGAME_BOARD_SCALE: float = 1.0
const INGAME_LA_LIGA_SCALE: float = 1.0
const INGAME_BOARD_WIDTH_FRAC: float = 0.50
const INGAME_BOARD_HEIGHT_MAX_FRAC: float = 0.12
var custom_board_width_frac: float = 0.0
var _new_scoreboard: ScoreboardView = null
var _match_state: String = ""





var _score_bar: HBoxContainer










var _gol_bug: Panel
var _gol_bug_in: Control
var _gol_bug_bg: ColorRect
var _gol_bug_patch: KitPatch
var _gol_bug_label: Label





var _gol_bug_side: HBoxContainer
var _gol_bug_abbr: Label
var _gol_bug_crest: CrestView
var _gol_bug_wedge: ColorRect


var _bug_carton: ColorRect
var _bug_card_roja: bool = false
var _bug_card_quien: String = ""
var _bug_card_mia: bool = false


var _bug_tipo: String = "gol"
var _gol_bug_tw: Tween
@onready var _score_label: Label = % ScoreLabel
@onready var _message_label: Label = % MessageLabel
@onready var _hint_label: Label = % HintLabel
@onready var _end_panel: PanelContainer = % EndPanel
@onready var _end_title: Label = % EndTitle
@onready var _end_stats: Label = % EndStats
@onready var _restart_button: Button = % RestartButton
@onready var _menu_button: Button = % MenuButton






var _summary_box: MatchSummaryView

var _end_veil: Control = null


func _ready() -> void:
	_build_vignette()
	_build_pause_button()
	_build_chance_chip()
	_build_wind_chip()
	_build_rating_chip()
	_build_player_chip()
	_build_mode_chip()
	_build_cam_chip()
	_build_cancel_chip()
	_setup_theme()
	_build_message_band()
	_build_scorebug()
	_build_goal_card()
	_apply_safe_area()


	get_viewport().size_changed.connect(_apply_safe_area)
	_end_panel.visible = false
	_message_label.text = ""
	_hint_label.text = ""
	_restart_button.pressed.connect(func() -> void: restart_requested.emit())
	_menu_button.pressed.connect(func() -> void: menu_requested.emit())

	_end_panel.gui_input.connect(_on_end_panel_input)



	_end_panel.add_to_group(Entrada.CAPA_GROUP)
	_menu_button.set_meta(Entrada.PRIMERO_META, true)


	Settings.changed.connect(_fit_hint_box)


	_goal_card.visibility_changed.connect(_refit_hint_tumbado)
	_player_chip.visibility_changed.connect(_refit_hint_tumbado)
	_player_chip.minimum_size_changed.connect(_refit_hint_tumbado)



	Entrada.modo_cambiado.connect(_repinta_hint.unbind(1))
	Entrada.dispositivo_cambiado.connect(_repinta_hint.unbind(1))


	Entrada.botones_cambiados.connect(_repinta_hint)


func _exit_tree() -> void:
	if Settings.changed.is_connected(_fit_hint_box):
		Settings.changed.disconnect(_fit_hint_box)
	var vp = get_viewport()
	if vp != null:
		if vp.size_changed.is_connected(_apply_safe_area):
			vp.size_changed.disconnect(_apply_safe_area)
		if vp.size_changed.is_connected(_centra_marcador):
			vp.size_changed.disconnect(_centra_marcador)
	if _tic != null and is_instance_valid(_tic):
		_tic.stop()
	var tweens = [
		_clock_pulse, _rating_count_tw, _rating_delta_tw, _pts_tw,
		_fly_tw, _mood_tw, _heat_tw, _gol_bug_tw, _message_tween,
		_sub_swap_tw, _aim_dim_tw, _mode_pulse_tween, _goal_tween,
		_celeb_tween, _open_tw, _rec_tw, _rec_blink_tw, _rec_focus_tw
	]
	for tw in tweens:
		if tw != null and is_instance_valid(tw) and tw.is_valid():
			tw.kill()








const VEIL_EDGE: Color = Color(1.0, 1.0, 1.0, 0.5)

func _build_vignette() -> void:
	var rect: TextureRect = _vignette_rect(Color(0.0, 0.0, 0.0, 0.26))
	add_child(rect)
	move_child(rect, 0)





	_mood_veil = _vignette_rect(VEIL_EDGE, MOOD_VEIL_START)
	_mood_veil.modulate = Color(1.0, 1.0, 1.0, 0.0)
	add_child(_mood_veil)
	move_child(_mood_veil, 1)





	_danger_veil = _vignette_rect(VEIL_EDGE)
	_danger_veil.modulate = CareerTheme.DANGER
	_danger_veil.modulate.a = 0.0
	add_child(_danger_veil)
	move_child(_danger_veil, 2)




	_penal_veil = _vignette_rect(Color(0.0, 0.0, 0.0, PENAL_VEIL_EDGE))
	_penal_veil.modulate.a = 0.0
	add_child(_penal_veil)
	move_child(_penal_veil, 2)









func _vignette_rect(edge: Color, start: float = 0.55) -> TextureRect:
	var grad: Gradient = Gradient.new()
	grad.offsets = PackedFloat32Array([start, 1.0])
	grad.colors = PackedColorArray([Color(edge.r, edge.g, edge.b, 0.0), edge])
	var tex: GradientTexture2D = GradientTexture2D.new()
	tex.gradient = grad
	tex.width = 256
	tex.height = 256
	tex.fill = GradientTexture2D.FILL_RADIAL
	tex.fill_from = Vector2(0.5, 0.5)
	tex.fill_to = Vector2(0.5, 1.0)
	var rect: TextureRect = TextureRect.new()
	rect.texture = tex
	rect.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	rect.stretch_mode = TextureRect.STRETCH_SCALE
	rect.mouse_filter = Control.MOUSE_FILTER_IGNORE
	rect.set_anchors_preset(Control.PRESET_FULL_RECT)
	return rect








func _float_readout() -> StyleBoxEmpty:
	var sb: StyleBoxEmpty = StyleBoxEmpty.new()
	sb.content_margin_top = 14.0
	sb.content_margin_bottom = 14.0
	return sb




func _outline_readout(l: Label) -> void:
	l.add_theme_color_override("font_outline_color", UiKit.OUTLINE_HARD)
	l.add_theme_constant_override("outline_size", 8)










func _build_wind_chip() -> void:
	_wind_chip = PanelContainer.new()













	_wind_chip.add_theme_stylebox_override("panel", _float_readout())
	_wind_chip.set_anchors_preset(Control.PRESET_TOP_LEFT)
	_wind_chip.offset_left = 24.0
	_wind_chip.offset_top = 164.0
	_wind_chip.mouse_filter = Control.MOUSE_FILTER_IGNORE



	var row: VBoxContainer = VBoxContainer.new()
	row.add_theme_constant_override("separation", 0)
	row.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_wind_chip.add_child(row)
	_wind_icon = WindIcon.new()







	_wind_icon.custom_minimum_size = Vector2(72, 72)
	_wind_icon.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	row.add_child(_wind_icon)
	_wind_label = Label.new()

	_wind_label.add_theme_font_size_override("font_size", CareerTheme.T_DIM)
	_wind_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_wind_label.add_theme_color_override("font_color", UiKit.GOLD)
	_outline_readout(_wind_label)
	row.add_child(_wind_label)
	_wind_chip.visible = false
	add_child(_wind_chip)

























func set_wind(wind: Vector3, cam: Camera3D = null) -> void:
	if _wind_chip == null:
		return
	var speed: float = wind.length()
	if speed < Weather.WIND_CALM:
		_wind_chip.visible = false
		return







	_wind_chip.visible = not _open_mutes_hud and not _rec_mutes_hud \
			and not _dianas_on and _calladas == 0
	var right: Vector3 = Vector3.RIGHT
	var fwd: Vector3 = Vector3.FORWARD
	if cam != null and is_instance_valid(cam):
		var b: Basis = cam.global_transform.basis


		var rf: Vector3 = Vector3(b.x.x, 0.0, b.x.z)
		var ff: Vector3 = Vector3(- b.z.x, 0.0, - b.z.z)
		if rf.length() > 0.01 and ff.length() > 0.01:
			right = rf.normalized()
			fwd = ff.normalized()


	_wind_icon.setup(Vector2(wind.dot(right), - wind.dot(fwd)),
		clampf(speed / 7.0, 0.0, 1.0))


	_wind_label.text = "%d km/h" % roundi(speed * 3.6)



func _build_pause_button() -> void:
	_pause_button = Button.new()
	_pause_button.text = "II"
	UiKit.apply_button(_pause_button, UiKit.BTN_GRAY, 32)
	_pause_button.set_anchors_preset(Control.PRESET_TOP_RIGHT)
	_pause_button.offset_left = -144.0
	_pause_button.offset_top = 24.0
	_pause_button.offset_right = -24.0
	_pause_button.offset_bottom = 124.0
	_pause_button.pressed.connect(func() -> void: pause_requested.emit())


	Glifos.cuelga(_pause_button, "fl_pausa", CORNER_BOTTOM_LEFT)
	add_child(_pause_button)


func set_minute(minute: int) -> void:
	_match_minute = minute

	if _practice:
		return

	var en_extra: bool = _stoppage_base > 0 and minute >= _stoppage_base
	var ref: int = _stoppage_base if en_extra else minute

	if USE_NEW_SCOREBOARD and _new_scoreboard != null:
		_new_scoreboard.minute = minute
		if _match_state.is_empty() or _match_state == "1T" or _match_state == "2T" or _match_state == "PR":
			_match_state = "1T" if ref <= 45 else ("2T" if ref <= 90 else "PR")
		_new_scoreboard.match_state = _match_state
		if en_extra and _stoppage_added > 0:
			_new_scoreboard.stoppage = _stoppage_added
		else:
			_new_scoreboard.stoppage = 0
		_new_scoreboard.queue_redraw()
	else:
		_pinta_reloj()
		_breathe_clock(minute)

	var tenso: bool = minute >= RELOJ_TENSO
	var late: bool = tenso and _tic != null and not Settings.reduce_motion
	if late and _tic.is_stopped() and _tic.is_inside_tree():
		_tic_on = true
		_tic.start()
	elif not late:
		if _tic != null and not _tic.is_stopped():
			_tic.stop()
		_tic_on = true






const RELOJ_TENSO: int = 80














func _pinta_reloj() -> void:
	if _minute_label == null or _practice:
		return
	var minute: int = _match_minute
	var en_extra: bool = _stoppage_base > 0 and minute > _stoppage_base
	var tenso: bool = minute >= RELOJ_TENSO
	var late: bool = tenso and _tic != null and not Settings.reduce_motion
	if late and _tic.is_stopped() and _tic.is_inside_tree():
		_tic_on = true
		_tic.start()
	elif not late:
		if _tic != null and not _tic.is_stopped():
			_tic.stop()
		_tic_on = true
	var cifra: String = "%d+%d" % [_stoppage_base, minute - _stoppage_base] \
			if en_extra else "%d" % minute
	_minute_label.text = cifra +("'" if _tic_on else " ")
	_minute_label.add_theme_color_override("font_color", _color_minuto())
	if _half_label != null:


		var ref: int = _stoppage_base if en_extra else minute
		_half_label.text = I18n.t("1T") if ref <= 45 \
				else (I18n.t("2T") if ref <= 90 else I18n.t("PR"))




func _color_minuto() -> Color:
	if not _practice and _match_minute >= RELOJ_TENSO:
		return CareerTheme.text_on_dark(UiKit.DANGER)
	return CareerTheme.INK_LIGHT


func _on_tic() -> void:
	_tic_on = not _tic_on
	_pinta_reloj()




























const CLOCK_BREATH_FROM: int = 85

const CLOCK_BEAT: Vector2 = Vector2(1.15, 0.62)


const CLOCK_BEAT_SCALE: float = 1.055

const CLOCK_TINT_MAX: float = 0.3










const CLOCK_HOT: Color = CareerTheme.INK_LIGHT

func _breathe_clock(minute: int) -> void:
	if _clock_box == null:
		return



	var fin: int = _stoppage_base + _stoppage_added if _stoppage_base > 0 else 90
	if minute < fin -(90 - CLOCK_BREATH_FROM):
		_calm_clock()
		return

	var urg: float = clampf(float(minute -(fin -(90 - CLOCK_BREATH_FROM))) \
			/ maxf(float(90 - CLOCK_BREATH_FROM), 1.0), 0.0, 1.0)
	_clock_box.filo = _accent_text.lerp(CLOCK_HOT, CLOCK_TINT_MAX * urg)




	_clock_breathing = true
	if Settings.reduce_motion:
		return
	if _clock_pulse and _clock_pulse.is_valid():
		_clock_pulse.kill()
	var beat: float = lerpf(CLOCK_BEAT.x, CLOCK_BEAT.y, urg)
	_clock_pulse = create_tween().set_loops()


	_clock_pulse.tween_property(_clock_box, "scale",
		Vector2.ONE * CLOCK_BEAT_SCALE, beat * 0.35).set_trans(Tween.TRANS_SINE)
	_clock_pulse.tween_property(_clock_box, "scale", Vector2.ONE,
		beat * 0.65).set_trans(Tween.TRANS_SINE)






func _calm_clock() -> void:
	if not _clock_breathing:
		return
	_clock_breathing = false
	if _clock_pulse and _clock_pulse.is_valid():
		_clock_pulse.kill()
	_clock_box.scale = Vector2.ONE
	_clock_box.filo = _accent_text






func set_stoppage(base: int, added: int) -> void:
	if _practice:
		return
	_stoppage_base = maxi(base, 0)
	_stoppage_added = maxi(added, 0)
	if USE_NEW_SCOREBOARD and _new_scoreboard != null:
		var en_extra: bool = _stoppage_base > 0 and _new_scoreboard.minute >= _stoppage_base
		if en_extra and _stoppage_added > 0:
			_new_scoreboard.stoppage = _stoppage_added
		else:
			_new_scoreboard.stoppage = 0
		_new_scoreboard.queue_redraw()
	else:
		_pinta_reloj()

func set_match_state(p_state: String) -> void:
	_match_state = p_state
	if USE_NEW_SCOREBOARD and _new_scoreboard != null:
		_new_scoreboard.set_match_state(p_state)
		if p_state == "INT" or p_state == "FIM":
			_new_scoreboard.stoppage = 0
		_new_scoreboard.queue_redraw()






























func set_practice_clock(text: String) -> void:
	if not _practice:
		return
	if _minute_label != null:
		_minute_label.text = text


func set_practice(label: String, attempt: int, releva: bool = false) -> void:
	if not _practice:
		_practice = true









		_chance_chip.offset_top += PRACTICE_CHIP_DROP
		_chance_chip.offset_bottom += PRACTICE_CHIP_DROP
	_minute_label.text = "#%d" % maxi(attempt, 1)

	if _half_label != null:
		_half_label.visible = false
	if _tic != null:
		_tic.stop()




	_chance_label.text = CareerTheme.deaccent(label.to_upper())






	_chance_chip.visible = _calladas == 0 and not _chance_label.text.is_empty()
	_chance_label.add_theme_color_override("font_color", _accent_text)
	if _rating_chip != null and is_instance_valid(_rating_chip):
		_rating_chip.visible = false
	if _momentum_chip != null and is_instance_valid(_momentum_chip):
		_momentum_chip.visible = false


	if _heat_bar != null:
		_heat_bar.visible = false
	if _mood_veil != null:
		_mood_veil.modulate.a = 0.0









	if _player_chip != null:
		_player_chip.visible = releva











func _build_chance_chip() -> void:
	_chance_chip = PanelContainer.new()

	_chance_chip.add_theme_stylebox_override("panel", UiKit.make_readout())
	_chance_chip.set_anchors_preset(Control.PRESET_TOP_LEFT)
	_chance_chip.offset_left = 24.0
	_chance_chip.offset_top = 96.0
	_chance_chip.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_chance_label = Label.new()

	_chance_label.add_theme_font_size_override("font_size", CareerTheme.T_HEAD)
	_chance_label.add_theme_color_override("font_color", UiKit.GOLD)
	_chance_chip.add_child(_chance_label)
	_chance_chip.visible = false
	add_child(_chance_chip)








const RATING_BAD: float = 5.5
const RATING_OK: float = 7.0
const RATING_GREAT: float = 8.5









func _chip_rating_color(v: float) -> Color:
	if v < RATING_BAD:
		return UiKit.DANGER
	if v < RATING_OK:
		return UiKit.RATING_NEUTRAL




	return UiKit.GOLD


func _build_rating_chip() -> void:
	_rating_chip = PanelContainer.new()




	_rating_chip.add_theme_stylebox_override("panel", _float_readout())
	_rating_chip.set_anchors_preset(Control.PRESET_TOP_RIGHT)
	_rating_chip.offset_right = -24.0


	_rating_chip.offset_top = 140.0
	_rating_chip.grow_horizontal = Control.GROW_DIRECTION_BEGIN
	_rating_chip.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 2)
	col.alignment = BoxContainer.ALIGNMENT_CENTER
	_rating_chip.add_child(col)







	_rating_dial = StatDial.new()



	_rating_dial.custom_minimum_size = Vector2(RATING_DIAL_PX, RATING_DIAL_PX)
	_rating_dial.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	_rating_dial.mouse_filter = Control.MOUSE_FILTER_IGNORE
	col.add_child(_rating_dial)



	_rating_delta = Label.new()


	_rating_delta.add_theme_font_size_override("font_size", CareerTheme.T_DIM)
	_rating_delta.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_outline_readout(_rating_delta)
	_rating_delta.visible = false
	col.add_child(_rating_delta)
	_rating_chip.visible = false
	add_child(_rating_chip)
	_dial_show(_rating_shown)





func _dial_show(v: float) -> void:
	_rating_shown = v
	var qc: Color = _chip_rating_color(v)




	_rating_dial.setup(MatchRating.dial_text(v), v / 10.0,
		_accent_text if _rating_is_neutral else qc, qc, RATING_DIAL_FONT,
		RATING_DIAL_OUTLINE)

















func set_rating(value: float, delta: float = 0.0, reason: String = "",
		action: String = "") -> void:
	if _practice and not nota_en_practica:
		return
	_rating_chip.visible = true
	if _rating_count_tw != null and _rating_count_tw.is_valid():
		_rating_count_tw.kill()
	if absf(delta) < 0.05:
		_rating_is_neutral = true
		_rating_delta.visible = false
		_dial_show(value)
		return
	_rating_is_neutral = false


	_rating_count_tw = create_tween()
	_rating_count_tw.tween_method(_dial_show, _rating_shown, value, 0.5) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	var up: bool = MatchRating.is_good(action) if not action.is_empty() \
			else delta > 0.0
	var txt: String = "%+.1f %s" % [delta, reason] if not reason.is_empty() \
			else "%+.1f" % delta
	_fly_reason(txt, up)


















func set_peso_nota(peso: float) -> void:
	var txt: String = MatchRating.peso_text(peso)
	if txt.is_empty():
		if _peso_nota_lbl != null:
			_peso_nota_lbl.visible = false
		return
	if _peso_nota_lbl == null:
		_peso_nota_lbl = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.MONEY)
		_outline_readout(_peso_nota_lbl)
		_peso_nota_lbl.add_theme_constant_override("outline_size", 6)
		_peso_nota_lbl.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		_peso_nota_lbl.vertical_alignment = VERTICAL_ALIGNMENT_BOTTOM


		_peso_nota_lbl.clip_text = true
		_peso_nota_lbl.mouse_filter = Control.MOUSE_FILTER_IGNORE
		_peso_nota_lbl.set_anchors_preset(Control.PRESET_BOTTOM_WIDE)
		_peso_nota_lbl.offset_top = - float(CareerTheme.T_CAPTION) - 2.0
		_peso_nota_lbl.offset_bottom = 0.0
		_rating_dial.add_child(_peso_nota_lbl)
	_peso_nota_lbl.text = txt
	_peso_nota_lbl.visible = true



func peso_nota_text() -> String:
	if _peso_nota_lbl == null or not _peso_nota_lbl.visible:
		return ""
	return _peso_nota_lbl.text
















func _land_reason(txt: String, up: bool) -> void:
	if UiKit.es_horizontal():
		_rating_delta.visible = false
		UiKit.punch(_rating_chip)
		return
	_rating_delta.text = txt


	_rating_delta.add_theme_color_override("font_color",
		CareerTheme.GOOD if up else UiKit.DANGER)
	_rating_delta.visible = true
	_rating_delta.modulate.a = 1.0
	UiKit.punch(_rating_chip)
	if _rating_delta_tw != null and _rating_delta_tw.is_valid():
		_rating_delta_tw.kill()
	_rating_delta_tw = create_tween()
	_rating_delta_tw.tween_interval(4.0)
	_rating_delta_tw.tween_property(_rating_delta, "modulate:a", 0.0, 0.5)





const FLY_START_Y: float = 520.0










func set_dianas(segundos: int, puntos: int, llenas: int, total: int,
		siguiente: int = 0) -> void:
	if _dianas_box == null:
		_dianas_box = VBoxContainer.new()
		_dianas_box.add_theme_constant_override("separation", 2)
		_dianas_box.mouse_filter = Control.MOUSE_FILTER_IGNORE


		_dianas_box.set_anchors_preset(Control.PRESET_CENTER_TOP)


		_dianas_box.position = Vector2(0.0, 172.0)
		_dianas_box.grow_horizontal = Control.GROW_DIRECTION_BOTH
		add_child(_dianas_box)
		_dianas_reloj = CareerUi.plain(CareerTheme.T_TITLE, CareerTheme.TEXT)
		_dianas_reloj.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		_dianas_box.add_child(_dianas_reloj)









		_dianas_estrellas = HBoxContainer.new()
		_dianas_estrellas.add_theme_constant_override("separation", 6)
		_dianas_estrellas.alignment = BoxContainer.ALIGNMENT_CENTER
		_dianas_box.add_child(_dianas_estrellas)




		_dianas_pts = CareerUi.plain(CareerTheme.T_TITLE_MODAL, CareerTheme.TEXT)
		_outline_readout(_dianas_pts)
		_dianas_pts.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		_dianas_box.add_child(_dianas_pts)
	_dianas_box.visible = true




	_dianas_on = true
	if _wind_chip != null and is_instance_valid(_wind_chip):
		_wind_chip.visible = false
	if segundos != _dianas_seg:
		_dianas_seg = segundos
		_dianas_reloj.text = "%d:%02d" % [segundos / 60, segundos % 60]





	var rojo: int = 1 if segundos <= 10 else 0
	if rojo != _dianas_rojo:
		_dianas_rojo = rojo
		_dianas_reloj.add_theme_color_override("font_color",
			CareerTheme.DANGER if rojo == 1 else CareerTheme.TEXT)



	if _dianas_estrellas.get_child_count() != total:
		for c in _dianas_estrellas.get_children():
			c.queue_free()
		for i in total:
			var e: MenuIcon = MenuIcon.new()
			e.custom_minimum_size = Vector2(DIANAS_ESTRELLA_PX, DIANAS_ESTRELLA_PX)
			e.setup("media", CareerTheme.TEXT_DIM)
			_dianas_estrellas.add_child(e)


		_dianas_llenas = -1



	if llenas != _dianas_llenas:
		_dianas_llenas = llenas
		for i in _dianas_estrellas.get_child_count():
			var ic: MenuIcon = _dianas_estrellas.get_child(i) as MenuIcon
			if ic != null:

				ic.color = CareerTheme.MONEY if i < llenas else CareerTheme.TEXT_DIM




	var txt_pts: String = "%d / %d" % [puntos, siguiente] if siguiente > 0 else "%d" % puntos
	if _dianas_pts.text != txt_pts:
		_dianas_pts.text = txt_pts



func hide_dianas() -> void:
	if _dianas_box != null and is_instance_valid(_dianas_box):
		_dianas_box.visible = false

	_dianas_on = false




	_dianas_seg = -1
	_dianas_llenas = -1
	_dianas_rojo = -1
	if _wind_chip != null and is_instance_valid(_wind_chip):
		_wind_chip.visible = true


















func show_points(txt: String, color: Color, grande: bool = true,
		sitio: Vector2 = Vector2.INF) -> void:
	if _pts_tw != null and _pts_tw.is_valid():
		_pts_tw.kill()
	if _pts_label != null and is_instance_valid(_pts_label):
		_pts_label.queue_free()
	var lbl: Label = Label.new()
	lbl.text = txt
	lbl.add_theme_font_size_override("font_size",
		CareerTheme.T_TITLE if grande else CareerTheme.T_TITLE_MODAL)
	lbl.add_theme_color_override("font_color", color)
	_outline_readout(lbl)
	lbl.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(lbl)
	_pts_label = lbl


	var font: Font = lbl.get_theme_font("font")
	var px: int = CareerTheme.T_TITLE if grande else CareerTheme.T_TITLE_MODAL
	var fw: float = font.get_string_size(txt, HORIZONTAL_ALIGNMENT_LEFT, -1, px).x
	var ancho: float = UiKit.lienzo().x
	var x0: float = ancho * 0.5 - fw * 0.5
	var y0: float = 720.0
	if sitio.is_finite():


		x0 = clampf(sitio.x - fw * 0.5, 16.0, ancho - 16.0 - fw)
		y0 = clampf(sitio.y - float(px), 420.0, 1500.0)
	lbl.position = Vector2(x0, y0)
	lbl.pivot_offset = Vector2(fw * 0.5, float(px) * 0.5)
	lbl.scale = Vector2(0.5, 0.5)
	lbl.modulate.a = 0.0
	_pts_tw = create_tween()

	_pts_tw.tween_property(lbl, "modulate:a", 1.0, 0.1)
	_pts_tw.parallel().tween_property(lbl, "scale", Vector2.ONE, 0.18) \
			.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	_pts_tw.tween_interval(0.25)
	_pts_tw.tween_property(lbl, "position:y", y0 - 130.0, 0.45) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	_pts_tw.parallel().tween_property(lbl, "modulate:a", 0.0, 0.45)
	_pts_tw.tween_callback(func() -> void:
		if is_instance_valid(lbl):
			lbl.queue_free())






func _fly_reason(txt: String, up: bool) -> void:
	if _fly_tw != null and _fly_tw.is_valid():
		_fly_tw.kill()
	if _fly_label != null and is_instance_valid(_fly_label):
		_fly_label.queue_free()
	var lbl: Label = Label.new()
	lbl.text = txt
	lbl.add_theme_font_size_override("font_size", CareerTheme.T_MONEY)
	lbl.add_theme_color_override("font_color",
		CareerTheme.GOOD if up else UiKit.DANGER)
	lbl.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(lbl)
	_fly_label = lbl


	var font: Font = lbl.get_theme_font("font")
	var fw: float = font.get_string_size(txt, HORIZONTAL_ALIGNMENT_LEFT, -1, 30).x





	var mitad: float = UiKit.lienzo().x * 0.5
	lbl.position = Vector2(mitad - fw * 0.5, FLY_START_Y)
	lbl.pivot_offset = Vector2(fw * 0.5, 20.0)
	lbl.scale = Vector2(0.6, 0.6)
	lbl.modulate.a = 0.0





	var desde: Vector2 = lbl.position
	var vuela: Callable = func(t: float) -> void:
		if is_instance_valid(lbl):
			lbl.position = desde.lerp(_rating_chip.get_global_rect().get_center()
				- Vector2(fw * 0.5, 20.0), t)
	_fly_tw = create_tween()
	_fly_tw.tween_property(lbl, "modulate:a", 1.0, 0.12)
	_fly_tw.parallel().tween_property(lbl, "scale", Vector2.ONE, 0.12) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	_fly_tw.tween_interval(0.6)
	_fly_tw.tween_method(vuela, 0.0, 1.0, 0.35) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN)
	_fly_tw.parallel().tween_property(lbl, "scale", Vector2(0.45, 0.45), 0.35) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN)
	_fly_tw.parallel().tween_property(lbl, "modulate:a", 0.2, 0.35)
	_fly_tw.tween_callback(func() -> void:
		if is_instance_valid(lbl):
			lbl.queue_free()
		_land_reason(txt, up))






















const MOOD_VEIL_A: float = 0.26
const MOOD_VEIL_START: float = 0.72
const MOOD_HOT: Color = Momentum.HOT
const MOOD_COLD: Color = Color(0.3, 0.55, 1.0)





func _set_mood(level: int) -> void:
	if _mood_tw != null and _mood_tw.is_valid():
		_mood_tw.kill()
	_mood_tw = create_tween()
	if level == 0:
		_mood_tw.tween_property(_mood_veil, "modulate:a", 0.0, 0.18) \
				.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN)
		return
	var c: Color = MOOD_HOT if level > 0 else MOOD_COLD
	c.a = _mood_veil.modulate.a
	_mood_veil.modulate = c
	_mood_tw.tween_property(_mood_veil, "modulate:a", MOOD_VEIL_A, 0.5) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)





















var _danger_veil: TextureRect


var _danger_t: float = 0.0



const DANGER_A_MAX: float = 0.55


const DANGER_PULSE_FROM: float = 0.55
const DANGER_PULSE_HZ: float = 3.4





const DANGER_A_CAP: float = 0.78





func set_danger(t: float, boost: float = 1.0) -> void:
	if _danger_veil == null or not is_instance_valid(_danger_veil):
		return
	t = clampf(t, 0.0, 1.0)
	if t <= 0.001:
		_danger_veil.modulate.a = 0.0
		_danger_t = 0.0
		return



	var a: float = minf(DANGER_A_MAX * boost * pow(t, 1.5), DANGER_A_CAP)
	if t >= DANGER_PULSE_FROM:
		_danger_t += get_process_delta_time()



		var pulso: float = 0.5 + 0.5 * sin(_danger_t * TAU * DANGER_PULSE_HZ)
		a *= lerpf(0.62, 1.0, pulso)
	_danger_veil.modulate.a = a











const PENAL_VEIL_EDGE: float = 0.55
const PENAL_VEIL_A: float = 0.62

func set_penal_pulso(v: float) -> void:
	if _penal_veil == null or not is_instance_valid(_penal_veil):
		return
	_penal_veil.modulate.a = clampf(v, 0.0, 1.0) * PENAL_VEIL_A



func set_momentum(level: int, text: String) -> void:
	if _practice:
		return
	_set_mood(level)
	if _momentum_chip == null or not is_instance_valid(_momentum_chip):
		return
	if level == 0 or text.is_empty():
		_momentum_chip.visible = false
		return

	if _momentum_label == null or not is_instance_valid(_momentum_label):
		return

	var changed: bool = not _momentum_chip.visible or _momentum_label.text != text

	_momentum_label.text = text
	_momentum_label.add_theme_color_override("font_color",
		Momentum.HOT if level > 0 else Momentum.COLD)
	_momentum_chip.visible = true
	if changed:
		UiKit.punch(_momentum_chip)





func set_heat(norm: float) -> void:
	if _practice or _heat_bar == null:
		return
	_heat_bar.visible = true
	if _heat_tw != null and _heat_tw.is_valid():
		_heat_tw.kill()
	_heat_tw = create_tween()
	_heat_tw.tween_method(func(v: float) -> void:
		_heat_bar.frac = v
		_heat_bar.queue_redraw(), _heat_bar.frac, norm, 0.35) \
				.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)






class HeatBar:
	extends Control





	const EMBER: Color = Momentum.HOT



	const TRACK: Color = Color(0.05, 0.06, 0.1, 0.7)

	var frac: float = 0.5

	func _draw() -> void:
		var w: float = size.x
		var h: float = size.y
		draw_rect(Rect2(0.0, 0.0, w, h), TRACK)
		var d: float = frac - 0.5
		if absf(d) > 0.01:
			var ww: float = clampf(absf(d) * 2.0, 0.0, 1.0) * w
			draw_rect(Rect2((w - ww) * 0.5, 0.0, ww, h),
				EMBER if d > 0.0 else Momentum.COLD)


		draw_rect(Rect2(w * 0.5 - 1.0, 0.0, 2.0, h), Color(1, 1, 1, 0.25))





























const CHIP_LEFT: float = 24.0
const CHIP_TOP: float = -154.0
const CHIP_BOTTOM: float = -68.0

const PLACA_RADIO: int = 43

const TARJETA_RADIO: int = 72


func _build_player_chip() -> void:
	_player_chip = PanelContainer.new()
	_player_chip_sb = StyleBoxFlat.new()











	_player_chip_sb.bg_color = CareerTheme.HUD_SURFACE
	_player_chip_sb.set_corner_radius_all(PLACA_RADIO)
	_player_chip_sb.corner_detail = 16
	_player_chip_sb.border_width_bottom = 4
	_player_chip_sb.shadow_color = Color(CareerTheme.BG_DEEP.r, CareerTheme.BG_DEEP.g,
		CareerTheme.BG_DEEP.b, 0.45)
	_player_chip_sb.shadow_size = 12
	_player_chip_sb.shadow_offset = Vector2(0, 5)



	_player_chip_sb.content_margin_left = 0.0
	_player_chip_sb.content_margin_right = 0.0
	_player_chip_sb.content_margin_top = 0.0
	_player_chip_sb.content_margin_bottom = 0.0
	_player_chip.add_theme_stylebox_override("panel", _player_chip_sb)
	_player_chip.set_anchors_preset(Control.PRESET_BOTTOM_LEFT)
	_player_chip.offset_left = _chip_left()





	_player_chip.offset_top = _chip_top()
	_player_chip.offset_bottom = _chip_bottom()
	_player_chip.grow_vertical = Control.GROW_DIRECTION_BEGIN
	_player_chip.mouse_filter = Control.MOUSE_FILTER_IGNORE


	_player_patch = KitPatch.new()


	_player_patch.visible = false
	_player_chip.add_child(_player_patch)
	_player_pad = MarginContainer.new()
	_player_pad.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_player_chip.add_child(_player_pad)
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 14)
	row.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_player_pad.add_child(row)
	var num_holder: PanelContainer = PanelContainer.new()
	_player_num_sb = StyleBoxFlat.new()
	_player_num_sb.bg_color = _kit_a


	_player_num_sb.set_corner_radius_all(PLACA_RADIO)
	_player_num_sb.corner_detail = 16
	_player_num_sb.content_margin_left = 22.0
	_player_num_sb.content_margin_right = 22.0
	num_holder.add_theme_stylebox_override("panel", _player_num_sb)


	num_holder.size_flags_vertical = Control.SIZE_FILL
	_player_num = Label.new()
	_player_num.add_theme_font_size_override("font_size", CareerTheme.T_HUD_DORSAL)
	_player_num.add_theme_color_override("font_color", CareerTheme.BG_DEEP)
	_player_num.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_player_num.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	num_holder.add_child(_player_num)
	row.add_child(num_holder)














	_player_face = PlayerAvatar.new()
	_player_face.chrome = false
	_player_face.bust = PlayerAvatar.BUST_CLOSE






	_player_face.custom_minimum_size = Vector2(PlayerAvatar.BUST_CLOSE.size.x * 2.0, 0.0)
	_player_face.size_flags_vertical = Control.SIZE_FILL
	_player_face.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_player_face.visible = false
	row.add_child(_player_face)
	_player_flag = Flags.make_rect("", 29.0)
	_player_flag.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	row.add_child(_player_flag)
	_player_name = Label.new()
	_player_name.add_theme_font_size_override("font_size", PLACA_NOMBRE_ESCALA[0])
	_player_name.add_theme_color_override("font_color", CareerTheme.TEXT)


	_player_name.add_theme_constant_override("outline_size", 4)
	_player_name.add_theme_color_override("font_outline_color", UiKit.CHIP_BG)
	_player_name.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	row.add_child(_player_name)








	_player_socio = Label.new()
	_player_socio.text = I18n.t("SOCIO")
	_player_socio.add_theme_font_size_override("font_size", CareerTheme.T_DIM)
	_player_socio.add_theme_color_override("font_color", CareerTheme.MONEY)
	_player_socio.add_theme_constant_override("outline_size", 4)
	_player_socio.add_theme_color_override("font_outline_color", UiKit.CHIP_BG)
	_player_socio.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	_player_socio.visible = false
	row.add_child(_player_socio)
	_player_chip.visible = false
	add_child(_player_chip)
	_style_player_chip()











func _style_player_chip() -> void:
	if _player_chip_sb == null:
		return
	var a: Color = _kit_readable(_kit_a)
	var b: Color = _kit_readable(_kit_b)
	_player_num_sb.bg_color = a





	if _goal_num_sb != null:
		_goal_num_sb.bg_color = a

	for chip: PanelContainer in _goal_stat_chips:
		var sb: StyleBox = chip.get_theme_stylebox("panel")
		if sb is StyleBoxFlat:




			var f: StyleBoxFlat = sb as StyleBoxFlat
			f.bg_color = Color(CareerTheme.BG_DEEP.r, CareerTheme.BG_DEEP.g,
				CareerTheme.BG_DEEP.b, 0.66)
			f.set_border_width_all(2)
			f.border_color = Color(a.r, a.g, a.b, 0.85)
		var ic: Variant = chip.get_meta("icono", null)
		if ic is MenuIcon:
			(ic as MenuIcon).setup(String(chip.get_meta("tipo", "")), a)



	var hoy: Dictionary = _kit_hoy()
	if _player_patch != null:
		_player_patch.kit = hoy
	if _goal_patch != null:
		_goal_patch.kit = hoy













func _kit_hoy() -> Dictionary:
	if not _kit_you.is_empty():
		return _kit_you
	if _you_team_data.is_empty():
		return {}
	return GameState.player_kit()






















const PLATE_SHAPES: Dictionary = {














	"pill": {"chip": [16, 16], "card": [22, 22], "clock": [0, 0, 26]},
	"block": {"chip": [0, 0], "card": [0, 0], "clock": [0, 0, 6]},
	"wedge": {"chip": [0, 36], "card": [0, 66], "clock": [30, 30, 14]},






	"romboide": {"chip": [0, 0], "card": [0, 0], "skew": 0.3, "clock": [6, 40, 10]},
}


func _apply_plate_shape() -> void:
	var shape: String = String(_comp_style.get("plate", "pill"))
	var fam: Dictionary = PLATE_SHAPES.get(shape, PLATE_SHAPES["pill"])
	var c: Array = fam["chip"]
	var g: Array = fam["card"]
	var sk: Vector2 = Vector2(float(fam.get("skew", 0.0)), 0.0)




	if _player_pad != null:
		_player_pad.add_theme_constant_override("margin_right",
			int(PLACA_RADIO * 0.55))


	if _player_patch != null:
		_player_patch.esquinas = Vector4(float(c[0]), float(c[1]), float(c[1]), float(c[0]))
		_player_patch.sesgo = sk.x


	if _goal_pad != null:
		_goal_pad.add_theme_constant_override("margin_right",
			int(_goal_radio() * 0.55))
	if _goal_patch != null:
		_goal_patch.esquinas = Vector4(float(g[0]), float(g[1]), float(g[1]), float(g[0]))
		_goal_patch.sesgo = sk.x





















func _style_dorsal(look: Dictionary) -> void:
	if _player_num == null:
		return
	_fix_dorsal_width()
	var bg: Color = _kit_readable(_kit_a)
	var claro: Color = CareerTheme.TEXT
	var oscuro: Color = CareerTheme.BG_DEEP
	var ink: Color = oscuro if bg.get_luminance() > 0.5 else claro
	if look.has("num_ink") and look["num_ink"] is Color:
		ink = look["num_ink"]
	var estilo: String = String(look.get("num_style", "auto"))
	if estilo == "club" and not (look.get("kit_b") is Color):
		estilo = "auto"
	if estilo == "club":
		ink = look["kit_b"]
	if estilo == "sombra" and ink.get_luminance() < 0.5:
		estilo = "auto"



	var halo: Color = claro if bg.get_luminance() > 0.5 else oscuro
	if absf(ink.get_luminance() - bg.get_luminance()) < DORSAL_MIN_CONTRASTE:
		var v: float = clampf(bg.get_luminance() - 0.55, 0.05, 1.0) \
				if bg.get_luminance() > 0.5 \
				else clampf(bg.get_luminance() + 0.55, 0.0, 1.0)
		ink = Color.from_hsv(ink.h, ink.s, v, 1.0)







	if absf(ink.get_luminance() - bg.get_luminance()) < DORSAL_MIN_CONTRASTE:
		ink = oscuro if bg.get_luminance() > 0.5 else claro
		if estilo == "sombra" or estilo == "club":
			estilo = "auto"
	for pieza: Array in [[_player_num, 4, 3], [_goal_num, 6, 5]]:
		var lab: Label = pieza[0]
		if lab == null:
			continue
		var borde: int = int(pieza[1])
		var off: int = int(pieza[2])


		lab.add_theme_color_override("font_color", ink)
		lab.add_theme_constant_override("outline_size", 0)
		lab.add_theme_constant_override("shadow_offset_x", 0)
		lab.add_theme_constant_override("shadow_offset_y", 0)
		lab.add_theme_color_override("font_shadow_color", Color(0, 0, 0, 0))
		match estilo:
			"plano":
				pass
			"sombra":
				lab.add_theme_color_override("font_shadow_color", oscuro)
				lab.add_theme_constant_override("shadow_offset_x", off)
				lab.add_theme_constant_override("shadow_offset_y", off)
			"relieve":


				lab.add_theme_color_override("font_shadow_color", halo)
				lab.add_theme_constant_override("shadow_offset_x", - off)
				lab.add_theme_constant_override("shadow_offset_y", - off)
			_:




				lab.add_theme_color_override("font_outline_color", halo)
				lab.add_theme_constant_override("outline_size", borde)












func _fix_dorsal_width() -> void:
	for lab: Label in [_player_num, _goal_num]:
		if lab == null or lab.custom_minimum_size.x > 0.0:
			continue
		var f: Font = lab.get_theme_font("font")
		if f == null:
			continue
		var fs: int = lab.get_theme_font_size("font_size")


		lab.custom_minimum_size.x = ceilf(
			f.get_string_size("88", HORIZONTAL_ALIGNMENT_LEFT, -1.0, fs).x)





const DORSAL_MIN_CONTRASTE: float = 0.25


func _kit_readable(c: Color) -> Color:
	if c.get_luminance() < 0.18:
		return c.lightened(0.42)
	return c




















func set_controlled(pname: String, number: int, nation: String,
		look: Dictionary = {}, socio: bool = false) -> void:
	if _player_chip == null:
		return
	if _practice or pname.strip_edges().is_empty():
		_player_chip.visible = false
		return




	if _sub_swap_tw != null and _sub_swap_tw.is_valid():
		return
	var changed: bool = _fill_chip(pname, number, nation, look, socio)
	_player_chip.visible = true
	if changed:
		UiKit.punch(_player_chip)






func _fill_chip(pname: String, number: int, nation: String,
		look: Dictionary, socio: bool = false) -> bool:
	var parts: PackedStringArray = pname.strip_edges().split(" ", false)
	var short: String = String(parts[parts.size() - 1]) if parts.size() >= 2 else pname

	short = CareerTheme.deaccent(short.to_upper())
	var num_txt: String = str(maxi(number, 1))


	var changed: bool = not _player_chip.visible \
			or _player_name.text != short or _player_num.text != num_txt \
			or (_player_socio != null and _player_socio.visible != socio)
	_player_num.text = num_txt
	_player_name.text = short
	if _player_socio != null:
		_player_socio.visible = socio


	if changed:
		_player_name.add_theme_font_size_override("font_size", PLACA_NOMBRE_ESCALA[0])
		_ajusta_nombre_placa()
	_player_flag.texture = Flags.texture(nation)
	_player_flag.visible = not nation.strip_edges().is_empty()



	_style_dorsal(look)



	_player_face.visible = not look.is_empty()
	if _player_face.visible and changed:
		_player_face_look = look
		_player_face.set_look(look)
	return changed





func _build_message_band() -> void:
	_msg_band = Panel.new()


	var sb: StyleBoxFlat = UiKit.make_plate()
	sb.bg_color = Color(0.05, 0.06, 0.1, 0.62)
	_msg_band.add_theme_stylebox_override("panel", sb)


	_msg_band.anchor_left = 0.5
	_msg_band.anchor_right = 0.5
	_msg_band.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_msg_band.visible = false
	add_child(_msg_band)

	move_child(_msg_band, _message_label.get_index())








func attach_under_text(node: CanvasItem) -> void:
	add_child(node)
	move_child(node, _msg_band.get_index())











func _fit_message_band(text: String) -> void:
	if text.is_empty():
		_msg_band.visible = false
		_celeb_cede()
		return


	var tumbado: bool = UiKit.es_horizontal()
	_message_label.add_theme_font_size_override("font_size",
		CareerTheme.T_TITLE_MODAL if tumbado else CareerTheme.T_TITLE)
	var font: Font = _message_label.get_theme_font("font")
	var fs: int = _message_label.get_theme_font_size("font_size")




	var vp: Viewport = get_viewport()
	var vp_w: float = float(vp.get_visible_rect().size.x) if vp != null else UiKit.lienzo().x
	var max_w: float = vp_w - MSG_MARGIN * 2.0
	if tumbado:
		max_w = minf(max_w, vp_w - 2.0 *(MSG_LADO_H + UiKit.side_safe_inset(vp)))
	var caja: Vector2 = _msg_medida(text, font, fs, max_w)






	if tumbado:
		var chips: float = _msg_lado_chips(vp_w, _msg_techo_h() + caja.y)


		var tope: float = vp_w - 2.0 *(chips + 44.0)
		if chips > 0.0 and tope < max_w:
			max_w = tope
			caja = _msg_medida(text, font, fs, max_w)


	var lado: float =(vp_w - max_w) * 0.5
	_message_label.offset_left = lado
	_message_label.offset_right = - lado
	var w: float = caja.x
	var h: float = caja.y








	var mid: float =(_msg_techo_h() + h * 0.5) if tumbado \
			else maxf(_msg_mid, _msg_suelo() + h * 0.5)
	_message_label.offset_top = mid - h * 0.5
	_message_label.offset_bottom = mid + h * 0.5
	_msg_band.offset_left = - w * 0.5
	_msg_band.offset_right = w * 0.5
	_msg_band.offset_top = mid - h * 0.5
	_msg_band.offset_bottom = mid + h * 0.5
	_msg_band.visible = true
	if tumbado:
		_celeb_cede()




func _msg_medida(text: String, font: Font, fs: int, max_w: float) -> Vector2:
	var text_w: float = font.get_string_size(text, HORIZONTAL_ALIGNMENT_LEFT, -1, fs).x
	var line_h: float = maxf(1.0, font.get_height(fs))
	var wrapped: Vector2 = font.get_multiline_string_size(
		text, HORIZONTAL_ALIGNMENT_CENTER, max_w, fs)
	var lines: int = maxi(1, int(ceil(wrapped.y / line_h - 0.01)))
	return Vector2(minf(text_w, max_w) + 56.0,
		float(fs) *(1.35 * float(lines) +(0.0 if lines == 1 else 0.3)) + 22.0)







func _msg_lado_chips(vp_w: float, abajo: float) -> float:
	var ocupa: float = 0.0
	for chip: Control in [_cam_chip, _mode_chip, _cancel_chip]:
		if chip == null or not is_instance_valid(chip):
			continue
		if not chip.visible and chip != _cam_chip:
			continue
		if chip.position.y >= abajo:
			continue
		var ancho: float = maxf(chip.size.x, chip.get_combined_minimum_size().x)
		var izq: bool = chip.position.x + ancho * 0.5 < vp_w * 0.5
		ocupa = maxf(ocupa, chip.position.x + ancho if izq else vp_w - chip.position.x)
	return ocupa







func _msg_suelo() -> float:
	var suelo: float = 0.0
	for chip in [_cam_chip, _mode_chip, _cancel_chip]:
		if chip != null and is_instance_valid(chip):
			suelo = maxf(suelo, chip.offset_top + chip.get_combined_minimum_size().y)
	return suelo + 16.0









func _msg_techo_h() -> float:
	if _score_chip != null and is_instance_valid(_score_chip) \
			and not _score_chip.resized.is_connected(_refit_msg_tumbado):
		_score_chip.resized.connect(_refit_msg_tumbado)
	var techo: float = 0.0
	if _score_chip != null and is_instance_valid(_score_chip) and _score_chip.visible:
		if USE_NEW_SCOREBOARD and _new_scoreboard != null and is_instance_valid(_new_scoreboard):
			var vp_h = get_viewport().get_visible_rect().size.y if get_viewport() != null else 1080.0
			var scale_factor = INGAME_BOARD_SCALE * (vp_h / 1080.0)
			techo = _score_chip.offset_top + (_new_scoreboard.get_real_size().y * scale_factor)
		else:
			techo = _score_chip.offset_top + _score_chip.get_combined_minimum_size().y
	if _dianas_box != null and is_instance_valid(_dianas_box) and _dianas_box.visible:
		techo = maxf(techo, _dianas_box.position.y + _dianas_box.get_combined_minimum_size().y)
	return techo + 16.0




func _refit_msg_tumbado() -> void:
	if UiKit.es_horizontal() and _msg_band.visible and not _message_label.text.is_empty():
		_fit_message_band(_message_label.text)


















class ClockTab:
	extends MarginContainer





	const PAD_TOP: int = 5
	const PAD_BOTTOM: int = 13

	const PAD_SIDE: float = 26.0

	const FILO: float = 4.0



	const CORNER_STEPS: int = 6



	const SOMBRA: Array[float] = [3.0, 6.0]


	var color: Color = CareerTheme.HUD_SURFACE:
		set(v):
			color = v
			queue_redraw()


	var filo: Color = UiKit.GOLD:
		set(v):
			filo = v
			queue_redraw()




	var radio: float = 26.0:
		set(v):
			radio = v
			queue_redraw()





	var taper: Vector2 = Vector2.ZERO:
		set(v):
			taper = v
			_side_pad()
			queue_redraw()

	func _init() -> void:
		add_theme_constant_override("margin_top", PAD_TOP)
		add_theme_constant_override("margin_bottom", PAD_BOTTOM)
		_side_pad()

	func _draw() -> void:
		var w: float = size.x
		var h: float = size.y
		if w <= 1.0 or h <= FILO:
			return
		var sombra: Color = UiKit.OUTLINE
		sombra.a *= 0.5
		var silueta: PackedVector2Array = _silueta(w, h, h)
		for dy: float in SOMBRA:
			draw_colored_polygon(_corrida(silueta, dy), sombra)



		draw_colored_polygon(silueta, filo)
		draw_colored_polygon(_silueta(w, h - FILO, h), color)




	func _silueta(w: float, alto: float, total: float) -> PackedVector2Array:


		var k: float = alto / total
		var tl: float = minf(taper.x, w * 0.5) * k
		var tr: float = minf(taper.y, w * 0.5) * k
		var p0: Vector2 = Vector2(0.0, 0.0)
		var p1: Vector2 = Vector2(w, 0.0)
		var p2: Vector2 = Vector2(w - tr, alto)
		var p3: Vector2 = Vector2(tl, alto)
		var pts: PackedVector2Array = PackedVector2Array([p0, p1])
		pts.append_array(_round(p1, p2, p3))
		pts.append_array(_round(p2, p3, p0))
		return pts

	func _corrida(pts: PackedVector2Array, dy: float) -> PackedVector2Array:
		var out: PackedVector2Array = PackedVector2Array()
		for p: Vector2 in pts:
			out.append(p + Vector2(0.0, dy))
		return out








	func _round(ant: Vector2, v: Vector2, sig: Vector2) -> PackedVector2Array:
		var u: Vector2 =(ant - v)
		var z: Vector2 =(sig - v)
		var lu: float = u.length()
		var lz: float = z.length()
		if lu < 0.001 or lz < 0.001 or radio < 0.5:
			return PackedVector2Array([v])
		u /= lu
		z /= lz

		var half: float = acos(clampf(u.dot(z), -1.0, 1.0)) * 0.5
		if half < 0.05 or half > PI * 0.5 - 0.05:
			return PackedVector2Array([v])
		var d: float = minf(radio / tan(half), minf(lu, lz) * 0.5)
		var r: float = d * tan(half)
		var bis: Vector2 =(u + z).normalized()
		var c: Vector2 = v + bis *(r / sin(half))
		var a0: float =(v + u * d - c).angle()
		var a1: float =(v + z * d - c).angle()


		var span: float = wrapf(a1 - a0, - PI, PI)
		var arc: PackedVector2Array = PackedVector2Array()
		for i in CORNER_STEPS + 1:
			var a: float = a0 + span * float(i) / float(CORNER_STEPS)
			arc.append(c + Vector2(cos(a), sin(a)) * r)
		return arc




	func _side_pad() -> void:
		add_theme_constant_override("margin_left", int(PAD_SIDE + taper.x))
		add_theme_constant_override("margin_right", int(PAD_SIDE + taper.y))





















const BAR_H: float = 86.0



const MEDALLON: float = 112.0
const MORDIDA: float = 54.0




const MEDALLON_LOGO_ALTO: float = 46.0
const MEDALLON_LOGO_ANCHO: float = 80.0
const MEDALLON_EMBLEMA: float = 60.0

func _build_momentum_and_stage_chips(parent_container: Control) -> void:
	var mom_holder: CenterContainer = CenterContainer.new()
	mom_holder.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_momentum_chip = PanelContainer.new()
	var mom_sb: StyleBoxFlat = StyleBoxFlat.new()
	mom_sb.bg_color = HeatBar.TRACK
	mom_sb.set_corner_radius_all(4)
	mom_sb.content_margin_left = 12.0
	mom_sb.content_margin_right = 12.0
	mom_sb.content_margin_top = 2.0
	mom_sb.content_margin_bottom = 2.0
	_momentum_chip.add_theme_stylebox_override("panel", mom_sb)
	_momentum_chip.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_momentum_label = Label.new()
	_momentum_label.add_theme_font_size_override("font_size", CareerTheme.T_DIM)
	_momentum_chip.add_child(_momentum_label)
	_momentum_chip.visible = false
	mom_holder.add_child(_momentum_chip)
	parent_container.add_child(mom_holder)

	var stage_holder: CenterContainer = CenterContainer.new()
	stage_holder.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_stage_chip = PanelContainer.new()
	_stage_sb = StyleBoxFlat.new()
	_stage_sb.bg_color = _accent
	_stage_sb.content_margin_left = 14.0
	_stage_sb.content_margin_right = 14.0
	_stage_sb.content_margin_top = 2.0
	_stage_sb.content_margin_bottom = 2.0
	_stage_chip.add_theme_stylebox_override("panel", _stage_sb)
	_stage_chip.visible = false
	_stage_label = Label.new()
	_stage_label.add_theme_font_size_override("font_size", CareerTheme.T_DIM)
	_stage_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_stage_chip.add_child(_stage_label)
	stage_holder.add_child(_stage_chip)
	parent_container.add_child(stage_holder)


func _build_scorebug() -> void:
	if USE_NEW_SCOREBOARD:
		_score_chip.remove_child(_score_label)
		_score_chip.add_theme_stylebox_override("panel", _transparent_sb())
		_new_scoreboard = ScoreboardView.new()
		_new_scoreboard.name = "ScoreboardView"
		_new_scoreboard.la_liga_scale_override = INGAME_LA_LIGA_SCALE
		_score_chip.add_child(_new_scoreboard)
		_build_gol_bug(_score_chip)
		_cuelga_box = VBoxContainer.new()
		_cuelga_box.name = "CuelgaBox"
		_cuelga_box.add_theme_constant_override("separation", 6)
		_cuelga_box.mouse_filter = Control.MOUSE_FILTER_IGNORE
		_score_chip.add_child(_cuelga_box)
		_build_momentum_and_stage_chips(_cuelga_box)
		if _tic == null:
			_tic = Timer.new()
			_tic.wait_time = 0.5
			_tic.ignore_time_scale = true
			_tic.timeout.connect(_on_tic)
			add_child(_tic)
		_new_scoreboard.resized.connect(_centra_marcador)
		_score_chip.resized.connect(_centra_marcador)
		if not get_viewport().size_changed.is_connected(_centra_marcador):
			get_viewport().size_changed.connect(_centra_marcador)
		return

	_score_chip.remove_child(_score_label)


	_score_chip.add_theme_stylebox_override("panel", _transparent_sb())
	var col: VBoxContainer = VBoxContainer.new()
	col.alignment = BoxContainer.ALIGNMENT_CENTER
	col.add_theme_constant_override("separation", 0)
	_score_chip.add_child(col)


	var bar: HBoxContainer = HBoxContainer.new()
	_score_bar = bar
	bar.add_theme_constant_override("separation", 0)
	bar.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var hueco: Control = Control.new()
	hueco.custom_minimum_size = Vector2(MEDALLON - MORDIDA, BAR_H)
	hueco.mouse_filter = Control.MOUSE_FILTER_IGNORE
	bar.add_child(hueco)
	_you_abbr = _abbr_label()
	_you_crest = _bar_crest()
	_you_tag_sb = StyleBoxFlat.new()
	var you_panel: PanelContainer = PanelContainer.new()


	you_panel.add_theme_stylebox_override("panel", _side_sb(MORDIDA, 0.0))
	you_panel.mouse_filter = Control.MOUSE_FILTER_IGNORE


	you_panel.add_child(_side_box(_you_crest, _you_abbr, false, _club_tag(_you_tag_sb)))
	var center: PanelContainer = PanelContainer.new()
	_score_box = center
	_center_sb = _center_box_sb()
	center.add_theme_stylebox_override("panel", _center_sb)
	center.mouse_filter = Control.MOUSE_FILTER_IGNORE
	center.add_child(_score_label)
	_rival_abbr = _abbr_label()
	_rival_crest = _bar_crest()
	_rival_tag_sb = StyleBoxFlat.new()
	var rival_panel: PanelContainer = PanelContainer.new()
	_rival_panel = rival_panel
	rival_panel.add_theme_stylebox_override("panel", _side_sb(0.0, 0.0))
	rival_panel.mouse_filter = Control.MOUSE_FILTER_IGNORE
	rival_panel.add_child(_side_box(_rival_crest, _rival_abbr, true, _club_tag(_rival_tag_sb)))
	bar.add_child(you_panel)
	bar.add_child(center)
	bar.add_child(rival_panel)



	_nota_hueco = Control.new()
	_nota_hueco.custom_minimum_size = Vector2(MEDALLON - MORDIDA, BAR_H)
	_nota_hueco.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_nota_hueco.visible = false
	bar.add_child(_nota_hueco)



	var capsula: StyleBoxFlat = StyleBoxFlat.new()
	capsula.bg_color = CareerTheme.HUD_SURFACE
	capsula.set_corner_radius_all(int(BAR_H * 0.5))
	capsula.corner_detail = 16
	capsula.shadow_color = UiKit.OUTLINE
	capsula.shadow_size = 12
	capsula.shadow_offset = Vector2(0.0, 5.0)
	bar.draw.connect(func() -> void: bar.draw_style_box(capsula, _capsule_rect()))
	bar.resized.connect(bar.queue_redraw)








	var marco: Control = Control.new()
	marco.mouse_filter = Control.MOUSE_FILTER_IGNORE


	marco.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	marco.add_child(bar)
	bar.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	var sigue_barra: Callable = func() -> void:
		marco.custom_minimum_size = bar.get_combined_minimum_size()
	bar.minimum_size_changed.connect(sigue_barra)
	sigue_barra.call()
	col.add_child(marco)







	_cola_holder = MarginContainer.new()
	_cola_holder.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var cuelga: VBoxContainer = VBoxContainer.new()
	cuelga.add_theme_constant_override("separation", 6)
	cuelga.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_cola_holder.add_child(cuelga)
	col.add_child(_cola_holder)
	center.item_rect_changed.connect(_centra_marcador)
	marco.item_rect_changed.connect(_centra_marcador)
	_score_chip.resized.connect(_centra_marcador)





	var cola: VBoxContainer = VBoxContainer.new()
	cola.add_theme_constant_override("separation", 0)
	cola.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	cola.mouse_filter = Control.MOUSE_FILTER_IGNORE













	var heat_slot: Panel = Panel.new()
	heat_slot.custom_minimum_size = Vector2(0.0, 5.0)
	heat_slot.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var heat_sb: StyleBoxFlat = StyleBoxFlat.new()
	heat_sb.bg_color = HeatBar.TRACK
	heat_slot.add_theme_stylebox_override("panel", heat_sb)
	_heat_bar = HeatBar.new()
	_heat_bar.set_anchors_preset(Control.PRESET_FULL_RECT)
	_heat_bar.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_heat_bar.visible = false
	heat_slot.add_child(_heat_bar)
	cola.add_child(heat_slot)

	var clock: ClockTab = ClockTab.new()
	clock.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_minute_label = Label.new()
	_minute_label.text = "0'"
	_minute_label.add_theme_font_size_override("font_size", CareerTheme.T_HUD_ROTULO)
	_minute_label.add_theme_color_override("font_color", CareerTheme.INK_LIGHT)
	_minute_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER


	var clock_in: HBoxContainer = HBoxContainer.new()
	clock_in.mouse_filter = Control.MOUSE_FILTER_IGNORE
	clock_in.alignment = BoxContainer.ALIGNMENT_CENTER
	clock_in.add_theme_constant_override("separation", 10)
	_half_label = Label.new()
	_half_label.text = I18n.t("1T")
	_half_label.add_theme_font_size_override("font_size", CareerTheme.T_BODY)
	_half_label.add_theme_color_override("font_color", _accent_text)
	_half_label.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	clock_in.add_child(_half_label)
	clock_in.add_child(_minute_label)
	clock.add_child(clock_in)
	_clock_box = clock


	_tic = Timer.new()
	_tic.wait_time = 0.5
	_tic.ignore_time_scale = true
	_tic.timeout.connect(_on_tic)
	add_child(_tic)



	clock.resized.connect(func() -> void:
		clock.pivot_offset = clock.size * 0.5)
	cola.add_child(clock)
	cuelga.add_child(cola)












	_build_momentum_and_stage_chips(cuelga)




	_build_gol_bug(marco)
	_build_medallion(marco)
	if UiKit.es_horizontal():
		_build_nota_disco(marco)
	_style_scorebar()





func _capsule_rect() -> Rect2:
	var x: float = MEDALLON - MORDIDA
	var der: float = MEDALLON - MORDIDA if _nota_disco_on() else 0.0
	return Rect2(x, 0.0, maxf(_score_bar.size.x - x - der, 0.0), _score_bar.size.y)











func _centra_marcador() -> void:
	if USE_NEW_SCOREBOARD and _new_scoreboard != null and is_instance_valid(_new_scoreboard):
		var vp = get_viewport()
		var vp_rect = vp.get_visible_rect() if vp != null else Rect2(0, 0, 1920, 1080)
		var vp_w = vp_rect.size.x
		var vp_h = vp_rect.size.y
		var base_sz: Vector2 = _new_scoreboard.get_real_size()
		
		var is_portrait: bool = vp_w < vp_h or (vp_w / vp_h) < 1.25
		var is_la_liga: bool = _new_scoreboard.board_theme != null and (_new_scoreboard.board_theme.theme_id == "la_liga" or _new_scoreboard.board_theme.familia == "la_liga_horizontal")
		var scale_factor: float
		var max_h: float = vp_h * (0.13 if is_la_liga else INGAME_BOARD_HEIGHT_MAX_FRAC)
		
		if custom_board_width_frac > 0.0:
			var target_w = vp_w * custom_board_width_frac
			scale_factor = minf(target_w / maxf(base_sz.x, 1.0), max_h / maxf(base_sz.y, 1.0))
		elif is_portrait:
			var target_w = vp_w * (0.88 if is_la_liga else INGAME_BOARD_WIDTH_FRAC)
			scale_factor = minf(target_w / maxf(base_sz.x, 1.0), max_h / maxf(base_sz.y, 1.0))
		else:
			if is_la_liga:
				# Em transmissões de TV (La Liga oficial), o placar ocupa ~44% da largura horizontal
				var target_broadcast_w = vp_w * 0.44
				var s_w = target_broadcast_w / maxf(base_sz.x, 1.0)
				scale_factor = minf(s_w, max_h / maxf(base_sz.y, 1.0))
			else:
				var s_h = (vp_h / 1080.0) * INGAME_BOARD_SCALE
				scale_factor = minf(s_h, max_h / maxf(base_sz.y, 1.0))
			
		_new_scoreboard.scale = Vector2.ONE * scale_factor
		_new_scoreboard.custom_minimum_size = Vector2.ZERO
		var scaled_sz: Vector2 = Vector2(roundf(base_sz.x * scale_factor), roundf(base_sz.y * scale_factor))
		
		_score_chip.anchor_left = 0.5
		_score_chip.anchor_right = 0.5
		_score_chip.anchor_top = 0.0
		_score_chip.anchor_bottom = 0.0
		_score_chip.grow_horizontal = Control.GROW_DIRECTION_BOTH
		_score_chip.grow_vertical = Control.GROW_DIRECTION_END
		
		var half_w = scaled_sz.x * 0.5
		_score_chip.offset_left = -half_w
		_score_chip.offset_right = half_w
		var top_margin = roundf(24.0 * (vp_h / 1080.0))
		if is_portrait:
			top_margin = roundf(16.0 * (vp_h / 1920.0))
		_score_chip.offset_top = top_margin
		_score_chip.offset_bottom = top_margin + scaled_sz.y
		_score_chip.custom_minimum_size = scaled_sz
		_score_chip.size = scaled_sz
		_new_scoreboard.position = Vector2.ZERO
		if _cuelga_box != null and is_instance_valid(_cuelga_box):
			_cuelga_box.position = Vector2(0.0, scaled_sz.y + 6.0)
			_cuelga_box.size = Vector2(scaled_sz.x, 0.0)
		return

	if _cola_holder == null or _score_box == null or _score_bar == null:
		return
	var marco: Control = _score_bar.get_parent() as Control


	if marco.size.x < 1.0 or _score_box.size.x < 1.0:
		return
	var en_marco: float = _score_bar.position.x + _score_box.position.x \
			+ _score_box.size.x * 0.5











	var d: float = en_marco - marco.size.x * 0.5
	var izq: int = maxi(int(round(d * 2.0)), 0)
	var der: int = maxi(int(round(- d * 2.0)), 0)

	if _cola_holder.get_theme_constant("margin_left") != izq \
			or _cola_holder.get_theme_constant("margin_right") != der:
		_cola_holder.add_theme_constant_override("margin_left", izq)
		_cola_holder.add_theme_constant_override("margin_right", der)




	var min_w: float = _score_chip.get_combined_minimum_size().x
	if _score_chip.size.x > min_w + 0.5:
		_score_chip.size = Vector2(min_w, _score_chip.size.y)



	var en_chip: float =(marco.get_parent() as Control).position.x + marco.position.x + en_marco
	var x: float = roundf(_score_chip.get_parent_area_size().x * 0.5 - en_chip)
	if not is_equal_approx(_score_chip.position.x, x):
		_score_chip.position.x = x











func _build_medallion(marco: Control) -> void:
	_medallion = PanelContainer.new()
	_medallion.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_medallion_sb = _disco_sb()
	_medallion.add_theme_stylebox_override("panel", _medallion_sb)
	_medallion.custom_minimum_size = Vector2(MEDALLON, MEDALLON)
	_medallion.size = Vector2(MEDALLON, MEDALLON)

	_medallion.position = Vector2(0.0,(BAR_H - MEDALLON) * 0.5)
	var centro: CenterContainer = CenterContainer.new()
	centro.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_comp_logo = CompLogo.new()
	_comp_logo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_comp_logo.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	centro.add_child(_comp_logo)
	_medallion.add_child(centro)
	marco.add_child(_medallion)
	_fit_medallion_logo()





func _disco_sb() -> StyleBoxFlat:
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CareerTheme.HUD_DEEP
	sb.set_corner_radius_all(int(MEDALLON * 0.5))
	sb.corner_detail = 20
	sb.border_color = _accent_text
	sb.set_border_width_all(5)
	sb.shadow_color = UiKit.OUTLINE
	sb.shadow_size = 12
	sb.shadow_offset = Vector2(0.0, 5.0)
	return sb




















func _build_nota_disco(marco: Control) -> void:
	_nota_disco = PanelContainer.new()
	_nota_disco.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_nota_disco_sb = _disco_sb()



	_nota_disco_sb.set_content_margin_all((MEDALLON - NOTA_DISCO_DIAL) * 0.5)
	_nota_disco.add_theme_stylebox_override("panel", _nota_disco_sb)
	_nota_disco.custom_minimum_size = Vector2(MEDALLON, MEDALLON)
	_nota_disco.size = Vector2(MEDALLON, MEDALLON)
	_nota_disco.visible = false
	var centro: CenterContainer = CenterContainer.new()
	centro.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_nota_disco.add_child(centro)
	marco.add_child(_nota_disco)



	_rating_chip.get_parent().remove_child(_rating_chip)
	_rating_chip.set_anchors_and_offsets_preset(Control.PRESET_TOP_LEFT)
	_rating_chip.add_theme_stylebox_override("panel", StyleBoxEmpty.new())
	_rating_dial.custom_minimum_size = Vector2(NOTA_DISCO_DIAL, NOTA_DISCO_DIAL)
	centro.add_child(_rating_chip)
	_rating_chip.visibility_changed.connect(_sigue_nota)
	_score_bar.resized.connect(_coloca_nota_disco)
	_sigue_nota()
	_coloca_nota_disco()



func _nota_disco_on() -> bool:
	return _nota_disco != null and _nota_disco.visible





func _coloca_nota_disco() -> void:
	if _nota_disco == null or _score_bar == null:
		return
	_nota_disco.position = Vector2(_score_bar.size.x - MEDALLON,(BAR_H - MEDALLON) * 0.5)

	if _gol_bug != null and _gol_bug.visible:
		_bug_coloca()









func _sigue_nota() -> void:
	if _nota_disco == null:
		return
	var v: bool = _rating_chip.visible
	if _nota_disco.visible == v:
		return
	_nota_disco.visible = v
	_nota_hueco.visible = v
	_rival_panel.add_theme_stylebox_override("panel", _side_sb(0.0, MORDIDA if v else 0.0))
	_score_bar.queue_redraw()





func _fit_medallion_logo() -> void:
	if _comp_logo == null:
		return
	var caja: Vector2 = Vector2(MEDALLON_EMBLEMA, MEDALLON_EMBLEMA)
	if _comp_logo.is_logo():
		caja = Vector2(MEDALLON_LOGO_ALTO, MEDALLON_LOGO_ALTO)
		var tex: Texture2D = CompLogos.texture(_comp_logo._type)
		if tex != null and tex.get_height() > 0:
			caja.x = minf(MEDALLON_LOGO_ALTO * float(tex.get_width()) / float(tex.get_height()),
				MEDALLON_LOGO_ANCHO)
	_comp_logo.custom_minimum_size = caja
	_comp_logo.size = caja




const BUG_HOLD: float = 1.05
const BUG_OUT: float = 0.26

const BUG_CARTON: Vector2 = Vector2(44.0, 64.0)

const BUG_CARTON_AIRE: float = 56.0

const BUG_SIDE_X: float = 18.0





func _build_gol_bug(marco: Control) -> void:
	_gol_bug = Panel.new()
	_gol_bug.mouse_filter = Control.MOUSE_FILTER_IGNORE





	var mascara: StyleBoxFlat = StyleBoxFlat.new()
	mascara.set_corner_radius_all(int(BAR_H * 0.5))
	mascara.corner_detail = 16
	_gol_bug.add_theme_stylebox_override("panel", mascara)
	_gol_bug.clip_children = CanvasItem.CLIP_CHILDREN_ONLY
	_gol_bug.clip_contents = true
	_gol_bug.visible = false
	marco.add_child(_gol_bug)
	_gol_bug_in = Control.new()
	_gol_bug_in.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_gol_bug.add_child(_gol_bug_in)
	_gol_bug_bg = ColorRect.new()
	_gol_bug_bg.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_gol_bug_in.add_child(_gol_bug_bg)


	_gol_bug_patch = KitPatch.new()
	_gol_bug_patch.alfa_base = 0.0
	_gol_bug_patch.alfa_patron = 0.34
	_gol_bug_patch.esquinas = Vector4.ZERO
	_gol_bug_in.add_child(_gol_bug_patch)
	_gol_bug_label = Label.new()
	_gol_bug_label.add_theme_font_size_override("font_size", CareerTheme.T_SCORE)
	_gol_bug_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_gol_bug_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	_gol_bug_label.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_gol_bug_in.add_child(_gol_bug_label)



	_gol_bug_side = HBoxContainer.new()
	_gol_bug_side.add_theme_constant_override("separation", 8)
	_gol_bug_side.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_gol_bug_in.add_child(_gol_bug_side)
	_gol_bug_crest = CrestView.new()
	_gol_bug_crest.custom_minimum_size = Vector2(BAR_CREST, BAR_CREST)
	_gol_bug_crest.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	_gol_bug_crest.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_gol_bug_side.add_child(_gol_bug_crest)
	_gol_bug_abbr = Label.new()
	_gol_bug_abbr.add_theme_font_size_override("font_size", CareerTheme.T_HUD_ROTULO)
	_gol_bug_abbr.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	_gol_bug_abbr.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_gol_bug_side.add_child(_gol_bug_abbr)
	_bug_carton = ColorRect.new()
	_bug_carton.size = BUG_CARTON
	_bug_carton.rotation = deg_to_rad(9.0)
	_bug_carton.visible = false
	_bug_carton.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_gol_bug_in.add_child(_bug_carton)





	_gol_bug_wedge = ColorRect.new()
	_gol_bug_wedge.custom_minimum_size = Vector2(6.0, BAR_CREST * 1.7)
	_gol_bug_wedge.rotation = deg_to_rad(14.0)
	_gol_bug_wedge.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	_gol_bug_wedge.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_gol_bug_side.add_child(_gol_bug_wedge)




func _gol_bug_show() -> void:
	_bug_show("gol")














func show_card_bug(roja: bool, quien: String = "", mia: bool = false) -> void:
	_bug_card_roja = roja
	_bug_card_quien = quien
	_bug_card_mia = mia
	_bug_show("roja" if roja else "amarilla")




func _bug_show(tipo: String) -> void:
	if _gol_bug == null:
		return
	if not USE_NEW_SCOREBOARD:
		if _score_bar == null or not _score_bar.is_inside_tree() or not _score_bar.visible:
			return
		if _capsule_rect().size.x <= 1.0:
			return
	else:
		if _new_scoreboard == null or not _new_scoreboard.is_inside_tree() or not _new_scoreboard.visible:
			return
	_bug_tipo = tipo

	var base: Color = _kit_readable(_kit_a)
	var equipo: Dictionary = _you_team_data
	var abbr: String = _you_abbr.text if _you_abbr != null else String(_you_team_data.get("abbrev", "MI"))
	var grito: String = CareerTheme.caps(I18n.t("gol"))
	if tipo != "gol":
		base = RefCard.ROJA if tipo == "roja" else RefCard.AMARILLA
		equipo = _you_team_data if _bug_card_mia else _rival_team_data
		abbr = (_you_abbr.text if _you_abbr != null else String(_you_team_data.get("abbrev", "MI"))) if _bug_card_mia \
				else (_rival_abbr.text if _rival_abbr != null else String(_rival_team_data.get("abbrev", "RIV")))


		grito = CareerTheme.caps(_bug_card_quien)
	_gol_bug_bg.color = base


	_gol_bug_patch.kit = _kit_hoy() if tipo == "gol" else {}
	_gol_bug_label.text = grito
	var tinta: Color = CareerTheme.INK_DARK if base.get_luminance() > 0.55 else CareerTheme.TEXT
	_gol_bug_label.add_theme_color_override("font_color", tinta)

	_gol_bug_label.add_theme_font_size_override("font_size",
		CareerTheme.T_SCORE if tipo == "gol" else CareerTheme.T_TITLE)
	_gol_bug_label.clip_text = true

	_gol_bug_abbr.text = abbr
	_gol_bug_crest.visible = not equipo.is_empty()
	_gol_bug_abbr.add_theme_color_override("font_color", tinta)
	if not equipo.is_empty():
		_gol_bug_crest.set_team(equipo)



	_bug_carton.visible = tipo != "gol"
	_bug_carton.color = tinta

	_gol_bug_wedge.color = Color(tinta.r, tinta.g, tinta.b, 0.55)
	_bug_coloca()
	_gol_bug.visible = true


	var dur: float = 0.32
	var trans: int = Tween.TRANS_QUINT
	var hold: float = BUG_HOLD
	match String(_comp_style.get("goal_morph", "crece")):
		"slam":
			dur = 0.18
			trans = Tween.TRANS_EXPO
		"ceremonia":
			dur = 0.5
			trans = Tween.TRANS_QUART
			hold = 1.45
		"barre":
			dur = 0.28
			trans = Tween.TRANS_CUBIC
		"despliega":
			dur = 0.38
			trans = Tween.TRANS_QUART
	if _gol_bug_tw and _gol_bug_tw.is_valid():
		_gol_bug_tw.kill()
	_gol_bug_tw = create_tween()



	_gol_bug_tw.set_pause_mode(Tween.TWEEN_PAUSE_STOP)
	_gol_bug_tw.set_ignore_time_scale(true)




	_gol_bug_in.position = Vector2.ZERO
	_bug_desliza(-1.0)
	_gol_bug_tw.tween_method(_bug_desliza, -1.0, 0.0, dur) \
			.set_trans(trans).set_ease(Tween.EASE_OUT)
	_gol_bug_tw.tween_interval(hold)
	_gol_bug_tw.tween_method(_bug_desliza, 0.0, 1.0, BUG_OUT) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN)
	_gol_bug_tw.tween_callback(func() -> void: _gol_bug.visible = false)




func _bug_desliza(f: float) -> void:
	_gol_bug_in.position.x = f * _gol_bug.size.x









func _bug_coloca() -> void:
	if _gol_bug == null:
		return
	if USE_NEW_SCOREBOARD and _new_scoreboard != null:
		var vp_h = get_viewport().get_visible_rect().size.y if get_viewport() != null else 1080.0
		var scale_factor = INGAME_BOARD_SCALE * (vp_h / 1080.0)
		var b_sz: Vector2 = _new_scoreboard.get_real_size() * scale_factor
		_gol_bug.set_anchors_preset(Control.PRESET_TOP_LEFT)
		_gol_bug.position = Vector2.ZERO
		_gol_bug.size = b_sz
		_gol_bug_in.size = b_sz
		_gol_bug_bg.size = b_sz
		_gol_bug_patch.size = b_sz
		_gol_bug_label.position = Vector2.ZERO
		_gol_bug_label.size = b_sz
		_gol_bug_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		_gol_bug_side.position = Vector2(16.0 * scale_factor, 0.0)
		_gol_bug_side.size = Vector2(b_sz.x * 0.5, b_sz.y)
		var mascara: StyleBoxFlat = _gol_bug.get_theme_stylebox("panel") as StyleBoxFlat
		if mascara != null:
			mascara.set_corner_radius_all(int(minf(b_sz.x, b_sz.y) * 0.5))
		return

	if _score_bar == null:
		return



	var r: Rect2 = _capsule_rect()
	_gol_bug.set_anchors_preset(Control.PRESET_TOP_LEFT)
	_gol_bug.position = r.position
	_gol_bug.size = r.size
	_gol_bug_in.size = r.size
	_gol_bug_bg.size = r.size
	_gol_bug_patch.size = r.size





	var tras_sigla: float = MORDIDA + BUG_SIDE_X \
			+ _gol_bug_side.get_combined_minimum_size().x + 18.0


	var antes_carton: float = BUG_CARTON.x + BUG_CARTON_AIRE + 24.0



	var tapa_der: float = MORDIDA if _nota_disco_on() else 0.0







	if _bug_tipo == "gol":
		_gol_bug_label.position = Vector2(MORDIDA, 0.0)
		_gol_bug_label.size = Vector2(r.size.x - MORDIDA - tapa_der, r.size.y)
		_gol_bug_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	else:
		_gol_bug_label.position = Vector2(tras_sigla, 0.0)
		_gol_bug_label.size = Vector2(maxf(r.size.x - tras_sigla - antes_carton - tapa_der,
			40.0), r.size.y)
		_gol_bug_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_LEFT
	_gol_bug_side.position = Vector2(MORDIDA + BUG_SIDE_X, 0.0)
	_gol_bug_side.size = Vector2(r.size.x * 0.5, r.size.y)
	if _bug_carton.visible:
		_bug_carton.position = Vector2(r.size.x - tapa_der - BUG_CARTON.x - BUG_CARTON_AIRE,
			(r.size.y - BUG_CARTON.y) * 0.5)


const BAR_CREST: float = 52.0



func _bar_crest() -> CrestView:
	var c: CrestView = CrestView.new()



	c.set_halo(true)
	c.custom_minimum_size = Vector2(BAR_CREST, BAR_CREST)
	c.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	c.mouse_filter = Control.MOUSE_FILTER_IGNORE
	c.visible = false
	return c







func _side_box(crest: CrestView, abbr: Label, mirror: bool, tag: Control) -> HBoxContainer:
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 14)
	row.alignment = BoxContainer.ALIGNMENT_CENTER
	row.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var nombre: HBoxContainer = HBoxContainer.new()
	nombre.add_theme_constant_override("separation", 8)
	nombre.mouse_filter = Control.MOUSE_FILTER_IGNORE
	if mirror:
		nombre.add_child(abbr)
		nombre.add_child(tag)
		row.add_child(nombre)
		row.add_child(crest)
	else:
		nombre.add_child(tag)
		nombre.add_child(abbr)
		row.add_child(crest)
		row.add_child(nombre)
	return row







func _club_tag(sb: StyleBoxFlat) -> Panel:
	var tag: Panel = Panel.new()
	tag.custom_minimum_size = Vector2(8.0, 46.0)
	tag.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	tag.mouse_filter = Control.MOUSE_FILTER_IGNORE
	sb.bg_color = _accent
	sb.set_corner_radius_all(4)
	tag.add_theme_stylebox_override("panel", sb)
	return tag











func _tag_color(team: Dictionary) -> Color:
	var tid = String(team.get("id", ""))
	var pal = TeamIdentityColors.get_team_identity_colors(tid, team)
	return pal["primary_color"]




func _side_sb(extra_izq: float, extra_der: float) -> StyleBoxEmpty:
	var sb: StyleBoxEmpty = StyleBoxEmpty.new()
	sb.content_margin_left = 18.0 + extra_izq
	sb.content_margin_right = 18.0 + extra_der
	sb.content_margin_top = 12.0
	sb.content_margin_bottom = 12.0
	return sb











func _center_box_sb() -> StyleBoxFlat:
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CareerTheme.HUD_DEEP
	sb.content_margin_left = 18.0
	sb.content_margin_right = 18.0
	sb.content_margin_top = 0.0
	sb.content_margin_bottom = 0.0
	return sb


func _transparent_sb() -> StyleBoxFlat:
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = Color(0, 0, 0, 0)
	sb.set_content_margin_all(0.0)
	return sb


func _abbr_label(color: Color = CareerTheme.INK_LIGHT) -> Label:
	var l: Label = Label.new()



	l.add_theme_font_size_override("font_size", CareerTheme.T_HUD_ROTULO)
	l.add_theme_color_override("font_color", color)
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	return l




func _style_scorebar() -> void:
	if _medallion_sb == null:
		return
	var on_acc: Color = CareerTheme.INK_DARK if _accent.get_luminance() > 0.55 \
			else CareerTheme.INK_LIGHT





	_accent_text = CareerTheme.text_on_dark(_accent)



	_you_tag_sb.bg_color = _tag_color(_you_team_data)
	_rival_tag_sb.bg_color = _tag_color(_rival_team_data)
	_you_abbr.add_theme_color_override("font_color", TeamIdentityColors.calculate_contrast_text_color(_you_tag_sb.bg_color))
	_rival_abbr.add_theme_color_override("font_color", TeamIdentityColors.calculate_contrast_text_color(_rival_tag_sb.bg_color))
	_score_label.add_theme_color_override("font_color", CareerTheme.INK_LIGHT)






	if _goal_comp_line != null:
		_goal_comp_line.color = _accent



	if _player_chip_sb != null:
		_player_chip_sb.border_color = _accent_text
	if _goal_card_sb != null:
		_goal_card_sb.border_color = _accent_text
	if _player_patch != null:
		_player_patch.filo_torneo = _accent_text


		_player_patch.filo_alto = 5.0
	if _goal_crest_sb != null:
		_goal_crest_sb.border_color = _accent
	if _goal_credit != null:
		_goal_credit.add_theme_color_override("font_color", _accent_text)
	if _goal_minute != null:
		_goal_minute.add_theme_color_override("font_color", _accent_text)


	if _chance_label != null:
		_chance_label.add_theme_color_override("font_color", _accent_text)
	if _wind_label != null:
		_wind_label.add_theme_color_override("font_color", _accent_text)
	if _rating_dial != null and _rating_is_neutral:
		_dial_show(_rating_shown)











	var radius: int = int(_comp_style.get("radius", 0))
	_center_sb.set_corner_radius_all(radius)



	var aro: int = maxi(int(round(float(_comp_style.get("strip", 8.0)) * 0.6)), 3)
	_medallion_sb.set_border_width_all(aro)
	_medallion_sb.border_color = _accent_text

	if _nota_disco_sb != null:
		_nota_disco_sb.set_border_width_all(aro)
		_nota_disco_sb.border_color = _accent_text
	if _comp_logo != null:



		_comp_logo.color = _accent_text





	if _clock_box != null:
		var fam_clock: Dictionary = PLATE_SHAPES.get(
			String(_comp_style.get("plate", "pill")), PLATE_SHAPES["pill"])
		var forma: Array = fam_clock.get("clock", [0, 0, 26])
		_clock_box.taper = Vector2(float(forma[0]), float(forma[1]))
		_clock_box.radio = float(forma[2])
		_clock_box.color = CareerTheme.HUD_SURFACE
		if not _clock_breathing:
			_clock_box.filo = _accent_text
		_minute_label.add_theme_color_override("font_color", _color_minuto())
		if _half_label != null:
			_half_label.add_theme_color_override("font_color", _accent_text)
	if _stage_sb != null:
		_stage_sb.bg_color = _accent
		_stage_label.add_theme_color_override("font_color", on_acc)




func set_competition(fixture: Dictionary) -> void:
	_accent = Competitions.accent_of(fixture)
	_comp_key = String(fixture.get("comp", "league"))
	_comp_style = Competitions.style_of(fixture)

	var stage: String = Competitions.stage_of(fixture)
	if _stage_chip != null and is_instance_valid(_stage_chip):
		_stage_chip.visible = not stage.is_empty()
		if _stage_label != null and is_instance_valid(_stage_label):
			_stage_label.text = I18n.t(stage)

	if USE_NEW_SCOREBOARD and _new_scoreboard != null:
		var theme_id = Competitions.scoreboard_theme_of(fixture)
		var theme = ScoreboardLoader.load_theme(theme_id)
		if theme != null:
			_new_scoreboard.board_theme = theme
			if theme_id == "la_liga" or theme_id == "laliga":
				_new_scoreboard.la_liga_scale_override = INGAME_LA_LIGA_SCALE
			_new_scoreboard._recalculate_dimensions()
			_centra_marcador()
		return

	_apply_plate_shape()
	if _comp_logo != null:
		_comp_logo.set_type(Competitions.logo_type_of(fixture))
		_fit_medallion_logo()
	_style_scorebar()


func set_teams(you_team: Dictionary, rival_team: Dictionary) -> void:
	_you_team_data = you_team
	_rival_team_data = rival_team

	if not you_team.is_empty():
		var ka: Variant = you_team.get("kit", null)
		var kb: Variant = you_team.get("kit2", null)
		if ka is Color:
			_kit_a = ka
		if kb is Color:
			_kit_b = kb
		_style_player_chip()

	if USE_NEW_SCOREBOARD and _new_scoreboard != null:
		var is_home = GameState.current_fixture().get("home", true) if (GameState and GameState.has_method("current_fixture")) else true
		var home_t = you_team if is_home else rival_team
		var away_t = rival_team if is_home else you_team
		_new_scoreboard.home_team = home_t
		_new_scoreboard.away_team = away_t
		if _new_scoreboard._home_crest != null:
			_new_scoreboard._home_crest.set_team(home_t)
		if _new_scoreboard._away_crest != null:
			_new_scoreboard._away_crest.set_team(away_t)
		_new_scoreboard._recalculate_dimensions()
		_centra_marcador()
		return

	_you_abbr.text = String(you_team.get("abbrev", "MI"))
	_rival_abbr.text = String(rival_team.get("abbrev", "RIV"))

	if _you_crest != null:
		_you_crest.visible = not you_team.is_empty()
		if not you_team.is_empty():
			_you_crest.set_team(you_team)
	if _rival_crest != null:
		_rival_crest.visible = not rival_team.is_empty()
		if not rival_team.is_empty():
			_rival_crest.set_team(rival_team)

	_style_scorebar()


func set_score(you: int, rival: int) -> void:
	_you_goals = you
	_rival_goals = rival
	if USE_NEW_SCOREBOARD and _new_scoreboard != null:
		var is_home = GameState.current_fixture().get("home", true) if (GameState and GameState.has_method("current_fixture")) else true
		_new_scoreboard.home_score = you if is_home else rival
		_new_scoreboard.away_score = rival if is_home else you
		_new_scoreboard.queue_redraw()
		return

	_score_label.text = "%d-%d" % [you, rival]






func show_message(text: String, color: Color = Color.WHITE, fade_after: float = 0.0) -> void:
	if _message_tween and _message_tween.is_valid():
		_message_tween.kill()
	_message_label.modulate = Color.WHITE
	_message_label.add_theme_color_override("font_color", color)







	_message_label.text = CareerTheme.caps(text)



	_msg_band.modulate.a = 1.0
	_fit_message_band(_message_label.text)
	if fade_after > 0.0:
		_message_tween = create_tween()
		_message_tween.tween_interval(fade_after)



		_message_tween.tween_property(_message_label, "modulate:a", 0.0, 0.35)
		_message_tween.parallel().tween_property(_msg_band, "modulate:a", 0.0, 0.35)

		_message_tween.tween_callback(_celeb_cede)


func clear_message() -> void:
	if _message_tween and _message_tween.is_valid():
		_message_tween.kill()
	_message_label.text = ""
	_message_label.modulate = Color.WHITE
	_msg_band.visible = false
	_celeb_cede()




























const SWAP_SCALE: float = 1.22
const SWAP_RISE: float = 84.0
var _sub_swap_tw: Tween = null
var _sub_plate_out: PanelContainer = null
var _sub_plate_in: PanelContainer = null





func show_sub_swap(out_name: String, out_num: int, out_nation: String,
		out_look: Dictionary, in_name: String, in_num: int, in_nation: String,
		in_look: Dictionary, dur: float) -> void:
	if _player_chip == null:
		return
	clear_sub_swap()


	_player_chip.visible = false
	_sub_plate_out = _make_sub_plate(out_name, out_num, out_nation, out_look, false)
	_sub_plate_in = _make_sub_plate(in_name, in_num, in_nation, in_look, true)
	var bajo: float = _chip_top()
	var alto: float = _chip_top() - SWAP_RISE
	_place_plate(_sub_plate_out, bajo)
	_place_plate(_sub_plate_in, alto)
	_sub_plate_in.modulate.a = 0.0


	var espera: float = maxf((dur - 0.93) * 0.5, 0.3)
	_sub_swap_tw = create_tween()


	_sub_swap_tw.tween_property(_sub_plate_in, "modulate:a", 1.0, 0.3)
	for pl in [_sub_plate_out, _sub_plate_in]:
		_sub_swap_tw.parallel().tween_property(pl, "scale",
			Vector2.ONE * SWAP_SCALE, 0.3) \
					.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	_sub_swap_tw.chain().tween_interval(espera)


	_sub_swap_tw.chain().tween_method(_slide_plate.bind(_sub_plate_out),
		bajo, alto, 0.45).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
	_sub_swap_tw.parallel().tween_method(_slide_plate.bind(_sub_plate_in),
		alto, bajo, 0.45).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)




	_sub_swap_tw.parallel().tween_property(_sub_plate_out, "modulate:a", 0.0, 0.45) \
			.set_ease(Tween.EASE_IN)

	_sub_swap_tw.chain().tween_property(_sub_plate_in, "scale", Vector2.ONE, 0.18) \
			.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
	_sub_swap_tw.chain().tween_interval(espera)


	_sub_swap_tw.chain().tween_callback(func() -> void:
		_fill_chip(in_name, in_num, in_nation, in_look)
		_player_chip.visible = true
		_free_sub_plates())






func _make_sub_plate(pname: String, number: int, nation: String,
		look: Dictionary, entra: bool) -> PanelContainer:
	var plate: PanelContainer = PanelContainer.new()
	var sb: StyleBoxFlat = UiKit.make_plate()



	sb.bg_color = Color(CareerTheme.SURFACE_HI, 0.92)
	sb.corner_radius_top_left = 12
	sb.corner_radius_bottom_left = 12
	sb.corner_radius_top_right = 31
	sb.corner_radius_bottom_right = 31
	sb.border_width_bottom = 7
	sb.border_color = CareerTheme.GOOD if entra else CareerTheme.DANGER
	sb.content_margin_left = 14.0
	sb.content_margin_right = 22.0
	sb.content_margin_top = 6.0
	sb.content_margin_bottom = 6.0
	plate.add_theme_stylebox_override("panel", sb)
	plate.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 12)
	row.mouse_filter = Control.MOUSE_FILTER_IGNORE
	plate.add_child(row)


	var box: Control = Control.new()
	box.custom_minimum_size = Vector2(31, 31)
	box.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	box.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var tri: Polygon2D = Polygon2D.new()
	tri.polygon = PackedVector2Array([Vector2(16, 4), Vector2(29, 26),
		Vector2(2, 26)] if entra else [Vector2(2, 5), Vector2(29, 5),
		Vector2(16, 28)])
	tri.color = CareerTheme.GOOD if entra else CareerTheme.DANGER
	box.add_child(tri)
	row.add_child(box)
	var num_holder: PanelContainer = PanelContainer.new()
	var nsb: StyleBoxFlat = StyleBoxFlat.new()
	nsb.bg_color = CareerTheme.GOOD if entra else CareerTheme.DANGER
	nsb.corner_radius_top_left = 10
	nsb.corner_radius_bottom_left = 10
	nsb.content_margin_left = 14.0
	nsb.content_margin_right = 14.0
	num_holder.add_theme_stylebox_override("panel", nsb)
	num_holder.size_flags_vertical = Control.SIZE_FILL
	var num: Label = Label.new()
	num.text = str(maxi(number, 1))
	num.add_theme_font_size_override("font_size", CareerTheme.T_HUD_DORSAL)
	num.add_theme_color_override("font_color", CareerTheme.BG_DEEP)
	num.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	num.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	num_holder.add_child(num)
	row.add_child(num_holder)
	if not look.is_empty():
		var face: PlayerAvatar = PlayerAvatar.new()
		face.chrome = false
		face.bust = PlayerAvatar.BUST_CLOSE

		face.custom_minimum_size = Vector2(PlayerAvatar.BUST_CLOSE.size.x * 2.0, 0.0)
		face.size_flags_vertical = Control.SIZE_FILL
		face.mouse_filter = Control.MOUSE_FILTER_IGNORE
		row.add_child(face)
		face.set_look(look)
	if not nation.strip_edges().is_empty():
		var flag: TextureRect = Flags.make_rect(nation, 29.0)
		flag.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		row.add_child(flag)
	var label: Label = Label.new()
	var parts: PackedStringArray = pname.strip_edges().split(" ", false)
	var short: String = String(parts[parts.size() - 1]) if parts.size() >= 2 else pname

	label.text = CareerTheme.deaccent(short.to_upper())
	label.add_theme_font_size_override("font_size", CareerTheme.T_HUD_DORSAL)
	label.add_theme_color_override("font_color", CareerTheme.TEXT)
	label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	row.add_child(label)
	add_child(plate)
	return plate






func _place_plate(plate: PanelContainer, top: float) -> void:
	plate.set_anchors_preset(Control.PRESET_BOTTOM_LEFT)
	plate.offset_left = _chip_left()
	plate.grow_vertical = Control.GROW_DIRECTION_BEGIN
	_slide_plate(top, plate)
	plate.pivot_offset = Vector2(0.0,(CHIP_BOTTOM - CHIP_TOP) * 0.5)






func _slide_plate(top: float, plate: PanelContainer) -> void:
	if plate == null or not is_instance_valid(plate):
		return
	plate.offset_top = top



	plate.offset_bottom = CHIP_BOTTOM +(top - CHIP_TOP)


func _free_sub_plates() -> void:
	for pl in [_sub_plate_out, _sub_plate_in]:
		if pl != null and is_instance_valid(pl):
			pl.queue_free()
	_sub_plate_out = null
	_sub_plate_in = null






func clear_sub_swap() -> void:
	if _sub_swap_tw != null and _sub_swap_tw.is_valid():
		_sub_swap_tw.kill()
	_sub_swap_tw = null
	_free_sub_plates()
	if _player_chip != null:
		_player_chip.visible = true








const PEN_CARD_TOP: float = 148.0



const PEN_CARD_GAP: float = 10.0
var _pen_card: PanelContainer = null
var _pen_rows: Array = []


func show_shootout_tally(you_team: Dictionary, rival_team: Dictionary,
		accent: Color) -> void:
	clear_shootout_tally()
	_pen_card = PanelContainer.new()
	var sb: StyleBoxFlat = UiKit.make_plate()
	sb.bg_color = Color(0.05, 0.06, 0.1, 0.86)
	sb.border_color = accent
	sb.set_border_width_all(3)
	sb.set_content_margin_all(12.0)
	_pen_card.add_theme_stylebox_override("panel", sb)
	_pen_card.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 8)
	col.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_pen_card.add_child(col)
	_pen_rows = []
	for abbrev in [String(you_team.get("abbrev", "TÚ")),
			String(rival_team.get("abbrev", "RIV"))]:
		col.add_child(_pen_row(abbrev))
	_pen_card.anchor_left = 0.5
	_pen_card.anchor_right = 0.5
	_pen_card.grow_horizontal = Control.GROW_DIRECTION_BOTH
	add_child(_pen_card)
	_pen_bajo_reloj()




func _pen_bajo_reloj() -> void:
	_pen_card.offset_top = maxf(PEN_CARD_TOP + UiKit.top_safe_inset(get_viewport()),
			marcador_abajo() + PEN_CARD_GAP)


func _pen_row(abbrev: String) -> Control:
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 8)
	row.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var name_l: Label = Label.new()
	name_l.text = CareerTheme.caps(abbrev)
	name_l.custom_minimum_size = Vector2(84, 0)
	name_l.add_theme_font_size_override("font_size", CareerTheme.T_HEAD)
	name_l.add_theme_color_override("font_color", CareerTheme.TEXT)
	name_l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row.add_child(name_l)
	var pips: Array = []
	for _i in 5:
		var pip: ColorRect = ColorRect.new()
		pip.custom_minimum_size = Vector2(16, 16)
		pip.color = CareerTheme.SURFACE_LINE
		pip.mouse_filter = Control.MOUSE_FILTER_IGNORE
		row.add_child(pip)
		pips.append(pip)
	var count: Label = Label.new()
	count.text = "0"
	count.custom_minimum_size = Vector2(40, 0)
	count.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	count.add_theme_font_size_override("font_size", CareerTheme.T_MONEY)
	count.add_theme_color_override("font_color", UiKit.GOLD)
	count.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row.add_child(count)
	_pen_rows.append({"pips": pips, "count": count})
	return row





func update_shootout_tally(mine: Array, theirs: Array) -> void:
	if _pen_card == null or _pen_rows.size() < 2:
		return
	for side in 2:
		var results: Array = mine if side == 0 else theirs
		var row: Dictionary = _pen_rows[side]
		var goles: int = 0
		for r in results:
			if bool(r):
				goles += 1
		(row["count"] as Label).text = str(goles)
		for i in 5:
			var pip: ColorRect = row["pips"][i]
			if i < results.size():
				pip.color = CareerTheme.GOOD if bool(results[i]) \
						else CareerTheme.DANGER
			else:
				pip.color = CareerTheme.SURFACE_LINE


func clear_shootout_tally() -> void:
	if _pen_card != null:
		_pen_card.queue_free()
		_pen_card = null
	_pen_rows = []















signal coin_side_chosen(side: String)












signal choice_made(key: String)

var _coin_panel: PanelContainer = null




const COIN_BTN_H: float = CareerTheme.BTN_ROW_H

const COIN_BOTTOM: float = -260.0


func ask_coin_side(accent: Color, cara: String, sol: String,
		titulo: String) -> void:
	_ask_two(accent, [[Volado.CARA, cara], [Volado.SOL, sol]], titulo, true)





















const CHOICE_PALETAS: Array[Dictionary] = [UiKit.BTN_GREEN, UiKit.BTN_RED]


func ask_choice(accent: Color, a_key: String, a_txt: String,
		b_key: String, b_txt: String, titulo: String) -> void:
	_ask_two(accent, [[a_key, a_txt], [b_key, b_txt]], titulo, false,
		CHOICE_PALETAS)


func _ask_two(accent: Color, pares: Array, titulo: String,
		moneda: bool, paletas: Array[Dictionary] = []) -> void:
	clear_coin_panel()
	_coin_panel = PanelContainer.new()
	_coin_panel.add_to_group(Entrada.CAPA_GROUP)
	var sb: StyleBoxFlat = UiKit.make_plate()
	sb.bg_color = Color(0.05, 0.06, 0.1, 0.9)
	sb.border_color = accent
	sb.set_border_width_all(3)
	sb.set_content_margin_all(16.0)
	_coin_panel.add_theme_stylebox_override("panel", sb)
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 12)
	_coin_panel.add_child(col)
	var head: Label = Label.new()
	head.text = CareerTheme.caps(titulo)
	head.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	head.add_theme_font_size_override("font_size", CareerTheme.T_HEAD)
	head.add_theme_color_override("font_color", CareerTheme.TEXT)


	head.clip_text = true
	col.add_child(head)
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 16)
	col.add_child(row)
	var i: int = -1
	for pair in pares:
		i += 1
		var b: Button = Button.new()
		b.text = CareerTheme.caps(String(pair[1]))
		b.custom_minimum_size = Vector2(300, COIN_BTN_H)
		b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		UiKit.apply_button(b, UiKit.BTN_GRAY if i >= paletas.size()
			else paletas[i], CareerTheme.T_CARD)
		UiKit.set_cue(b, "ui_confirm")
		b.pressed.connect(_on_coin_pressed.bind(String(pair[0]), moneda))
		row.add_child(b)
	_coin_panel.anchor_left = 0.5
	_coin_panel.anchor_right = 0.5
	_coin_panel.anchor_top = 1.0
	_coin_panel.anchor_bottom = 1.0
	_coin_panel.grow_horizontal = Control.GROW_DIRECTION_BOTH
	_coin_panel.grow_vertical = Control.GROW_DIRECTION_BEGIN
	_coin_panel.offset_top = COIN_BOTTOM - UiKit.bottom_safe_inset(get_viewport())
	_coin_panel.offset_bottom = COIN_BOTTOM - UiKit.bottom_safe_inset(get_viewport()) \
			+ COIN_BTN_H + 90.0
	add_child(_coin_panel)


func _on_coin_pressed(side: String, moneda: bool = true) -> void:



	clear_coin_panel()
	if moneda:
		coin_side_chosen.emit(side)
		return
	choice_made.emit(side)











func hide_player_chip(oculta: bool) -> bool:
	if _player_chip == null or not is_instance_valid(_player_chip):
		return false
	var antes: bool = _player_chip.visible
	_player_chip.visible = not oculta
	return antes


func clear_coin_panel() -> void:
	if _coin_panel != null and is_instance_valid(_coin_panel):
		_coin_panel.queue_free()
	_coin_panel = null




func placa_abierta() -> bool:
	return _coin_panel != null and is_instance_valid(_coin_panel)





signal gesto_elegido(key: String)

const GESTO_PLACA: GDScript = preload("res://ui/gesto_placa.gd")

var _gesto_placa: PanelContainer = null


var _gesto_token: int = 0




var _gesto_vence_ms: int = 0


var _gesto_segundos: float = 0.0





func ask_gesto(fichas: Array[String], away: bool, reconcilia: bool, carga: String,
		segundos: float) -> void:
	clear_gesto()
	_gesto_token += 1
	var p: PanelContainer = GESTO_PLACA.new()
	_gesto_placa = p
	add_child(p)
	p.call("arma", fichas, away, reconcilia, carga, _kit_readable(_kit_a))
	p.connect("elegida", _on_gesto_elegida)
	p.connect("despierta", _on_gesto_despierta)

	_gesto_segundos = segundos
	p.call("cuenta", segundos)
	_gesto_vence_ms = Time.get_ticks_msec() + roundi(segundos * 1000.0)
	SceneFade.timer(segundos, true, false, true).timeout.connect(
		_gesto_vence.bind(_gesto_token))



func gesto_abierta() -> bool:
	return _gesto_placa != null and is_instance_valid(_gesto_placa)



func gesto_fichas() -> Array[Button]:
	if not gesto_abierta():
		return []
	return _gesto_placa.call("fichas")



func clear_gesto() -> void:
	_gesto_token += 1
	if _gesto_placa != null and is_instance_valid(_gesto_placa):
		_gesto_placa.queue_free()
	_gesto_placa = null




func _on_gesto_elegida(key: String) -> void:
	if not gesto_abierta():
		return
	clear_gesto()
	gesto_elegido.emit(key)






func _on_gesto_despierta() -> void:
	if not gesto_abierta():
		return
	_gesto_vence_ms = Time.get_ticks_msec() + roundi(_gesto_segundos * 1000.0)
	_gesto_placa.call("cuenta", _gesto_segundos)


func _gesto_vence(token: int) -> void:
	if token != _gesto_token or not gesto_abierta():
		return
	var falta: int = _gesto_vence_ms - Time.get_ticks_msec()
	if falta > 30:
		SceneFade.timer(float(falta) / 1000.0, true, false, true).timeout.connect(
			_gesto_vence.bind(token))
		return
	clear_gesto()
	gesto_elegido.emit("")















const HINT_TEXT: Color = Color(1.0, 1.0, 1.0, 0.85)






var _hint_crudo: String = ""
var _hint_vivo: bool = false


func show_hint(text: String, _gesto: String = "", _color: Color = HINT_TEXT) -> void:
	_hint_crudo = text
	_hint_vivo = Entrada.recien(text)



	_hint_label.text = CareerTheme.caps(text)
	_fit_hint_box()





func _repinta_hint() -> void:
	if not _hint_vivo or _hint_label == null:
		return
	if _hint_label.text != CareerTheme.caps(_hint_crudo):
		return
	var n: String = Entrada.repintado(_hint_crudo)
	if n == _hint_crudo:
		return
	_hint_crudo = n
	_hint_label.text = CareerTheme.caps(n)
	_fit_hint_box()






















var _hint_h: float = HINT_BOTTOM - HINT_TOP











const HINT_LADO_H: float = 520.0














const HINT_ARRIBA_H: float = 0.764




const HINT_SUELO_H: float = 16.0





const HINT_PLACA_AIRE: float = 16.0


func _fit_hint_box() -> void:
	if _hint_label == null:
		return
	var s: Vector2 = SceneFade.rect_visible(self).size
	var lado: float = UiKit.side_safe_inset(get_viewport()) \
			+(HINT_LADO_H * Settings.mando_escala() if s.x > s.y else 0.0)
	_hint_label.offset_left = lado
	_hint_label.offset_right = - lado
	_hint_h = hint_needed_height(_hint_label.text)
	_hint_label.offset_bottom = HINT_BOTTOM - _safe_bottom
	_hint_label.offset_top = _hint_label.offset_bottom - _hint_h




	if s.x > s.y and not (_goal_card != null and _goal_card.visible):
		_baja_hint_tumbado(s, lado)




func _baja_hint_tumbado(s: Vector2, lado: float) -> void:
	var cuelga: float = - s.y *(1.0 - HINT_ARRIBA_H)
	var arriba: float = maxf(_hint_label.offset_top, cuelga)
	if _player_chip != null and _player_chip.visible \
			and arriba + _hint_h > _chip_top() - HINT_PLACA_AIRE:



		var placa_der: float = _player_chip.offset_left + HINT_PLACA_AIRE \
				+ maxf(_player_chip.size.x, _player_chip.get_combined_minimum_size().x)
		if placa_der > lado:
			_hint_label.offset_left = placa_der
			_hint_h = hint_needed_height(_hint_label.text)
			arriba = maxf(HINT_BOTTOM - _safe_bottom - _hint_h, cuelga)
	arriba = minf(arriba, - _safe_bottom - HINT_SUELO_H - _hint_h)
	_hint_label.offset_top = arriba
	_hint_label.offset_bottom = arriba + _hint_h





func _refit_hint_tumbado() -> void:
	if UiKit.es_horizontal():
		_fit_hint_box()





func marcador_abajo() -> float:
	var y: float = 0.0
	for n in [_score_bar, _clock_box]:
		if n != null and is_instance_valid(n) and (n as Control).is_visible_in_tree():
			y = maxf(y,(n as Control).get_global_rect().end.y)
	return y





func caja_aviso() -> Rect2:
	if _hint_label == null or not _hint_label.is_visible_in_tree() \
			or _hint_label.text.strip_edges().is_empty():
		return Rect2()
	return _hint_label.get_global_rect()





func hint_needed_height(texto: String) -> float:
	var minimo: float = HINT_BOTTOM - HINT_TOP
	if texto.is_empty():
		return minimo
	var font: Font = _hint_label.get_theme_font("font")
	var fs: int = _hint_label.get_theme_font_size("font_size")
	var outline: int = _hint_label.get_theme_constant("outline_size")

	var ancho: float = _hint_label.size.x
	if ancho <= 1.0:
		ancho = float(SceneFade.rect_visible(self).size.x) \
				- _hint_label.offset_left + _hint_label.offset_right
	var envuelto: Vector2 = font.get_multiline_string_size(
		texto, HORIZONTAL_ALIGNMENT_CENTER, ancho, fs)
	var line_h: float = maxf(1.0, font.get_height(fs))
	var lineas: int = maxi(1, int(ceil(envuelto.y / line_h - 0.01)))


	var espacio: float = float(_hint_label.get_theme_constant("line_spacing"))
	return maxf(minimo, envuelto.y + espacio * float(lineas - 1) + float(outline) * 2.0)





func _build_mode_chip() -> void:
	_mode_chip = PanelContainer.new()




	_mode_chip.add_theme_stylebox_override("panel", StyleBoxEmpty.new())
















	_mode_chip.set_anchors_preset(Control.PRESET_TOP_RIGHT)
	_mode_chip.offset_right = -24.0
	_mode_chip.offset_top = 312.0
	_mode_chip.grow_horizontal = Control.GROW_DIRECTION_BEGIN




	_mode_chip.mouse_filter = Control.MOUSE_FILTER_STOP
	_mode_chip.gui_input.connect(_on_mode_chip_input)
	_mode_chip.visible = false
	var row: HBoxContainer = HBoxContainer.new()
	row.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row.add_theme_constant_override("separation", 6)
	row.alignment = BoxContainer.ALIGNMENT_CENTER


















	_mode_icon_shot = AimModeIcon.new()
	_mode_icon_shot.medalla = true
	_mode_icon_shot.custom_minimum_size = Vector2(80, 86)
	_mode_icon_shot.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_mode_icon_cross = AimModeIcon.new()
	_mode_icon_cross.medalla = true
	_mode_icon_cross.custom_minimum_size = Vector2(80, 86)
	_mode_icon_cross.mouse_filter = Control.MOUSE_FILTER_IGNORE






	_mode_word_shot = _mode_word_nueva()
	_mode_word_cross = _mode_word_nueva()
	row.add_child(_mode_icon_shot)
	row.add_child(_mode_word_shot)
	row.add_child(_mode_icon_cross)
	row.add_child(_mode_word_cross)
	_mode_chip.add_child(row)
	add_child(_mode_chip)


	_mode_label = Label.new()
	_mode_label.set_anchors_preset(Control.PRESET_TOP_RIGHT)
	_mode_label.offset_right = -24.0











	_mode_label.offset_top = 418.0
	_mode_label.grow_horizontal = Control.GROW_DIRECTION_BEGIN



	_mode_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	_mode_label.add_theme_font_size_override("font_size", CareerTheme.T_BODY)
	_mode_label.add_theme_color_override("font_outline_color", Color(0.0, 0.0, 0.0, 0.8))
	_mode_label.add_theme_constant_override("outline_size", 8)
	_mode_label.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_mode_label.modulate.a = 0.0
	add_child(_mode_label)




func _mode_word_nueva() -> Label:
	var l: Label = Label.new()
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER


	l.custom_minimum_size = Vector2(0, 0)
	l.add_theme_font_size_override("font_size", CareerTheme.T_BODY)
	l.add_theme_color_override("font_outline_color", CareerTheme.INK_DARK)
	l.add_theme_constant_override("outline_size", 8)
	l.visible = false
	return l





const MODE_WORD_HOLD: float = 0.9
const MODE_WORD_FADE: float = 0.35


























const AIM_DIM: float = 0.3
const AIM_DIM_IN: float = 0.18


const AIM_DIM_OUT: float = 0.12
var _aim_dimmed: bool = false
var _aim_dim_tw: Tween





func set_aim_dim(on: bool) -> void:
	if on == _aim_dimmed:
		return
	_aim_dimmed = on
	if _aim_dim_tw and _aim_dim_tw.is_valid():
		_aim_dim_tw.kill()
	var destino: float = AIM_DIM if on else 1.0
	var dur: float = AIM_DIM_IN if on else AIM_DIM_OUT
	_aim_dim_tw = create_tween().set_parallel(true)
	for c: Control in [_momentum_chip, _stage_chip]:
		if c != null and is_instance_valid(c):
			_aim_dim_tw.tween_property(c, "modulate:a", destino, dur) \
					.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)






func set_aim_mode(cross, tiro: String = "TIRO", solo_tiro: bool = false) -> void:
	if cross == null:
		_mode_chip.visible = false
		if _mode_tween and _mode_tween.is_valid():
			_mode_tween.kill()
		_mode_label.modulate.a = 0.0



		_mode_cross_last = ""
		return






	var nacio: bool = not _mode_chip.visible
	_mode_chip.visible = true
	if nacio:
		pulse_mode_chip()
	var on: bool = bool(cross)






	var clave: String = "CENTRO" if on else tiro

	_mode_icon_cross.visible = not solo_tiro
	if clave + str(solo_tiro) == _mode_cross_last:
		return
	_mode_cross_last = clave + str(solo_tiro)







	_mode_icon_shot.setup(false, UiKit.GOLD if not on else _ghost(UiKit.GOLD, 0.45), tiro, not on)
	_mode_icon_cross.setup(true, UiKit.CYAN if on else _ghost(UiKit.CYAN, 0.45), "TIRO", on)







	_mode_label.text = I18n.t(clave, "modo")

	var w_on: Label = _mode_word_cross if on else _mode_word_shot
	var w_off: Label = _mode_word_shot if on else _mode_word_cross
	w_on.text = I18n.t(clave, "modo")
	w_on.add_theme_color_override("font_color", AimModeIcon.estilo(clave)["col"])
	w_on.visible = true
	w_off.visible = false
	_mode_label.add_theme_color_override("font_color", UiKit.CYAN if on else UiKit.GOLD)
	if _mode_tween and _mode_tween.is_valid():
		_mode_tween.kill()




	_mode_label.modulate.a = 0.0



func _ghost(c: Color, alfa: float = 0.22) -> Color:
	return Color(c.r, c.g, c.b, alfa)




func _on_mode_chip_input(event: InputEvent) -> void:
	if _chip_press(event, _mode_chip):
		mode_toggle_requested.emit()














func _chip_press(event: InputEvent, chip: Control) -> bool:
	var press: bool =(event is InputEventScreenTouch and event.pressed) \
			or (event is InputEventMouseButton and event.pressed \
			and event.button_index == MOUSE_BUTTON_LEFT)
	if not press:
		return false
	var frame: int = Engine.get_process_frames()
	if int(chip.get_meta("press_frame", -1)) == frame:
		return false
	chip.set_meta("press_frame", frame)
	return true












const CAM_CHIP_LADO: float = 24.0


func _build_cam_chip() -> void:
	_cam_chip = PanelContainer.new()
	_cam_chip.add_theme_stylebox_override("panel", UiKit.make_chip())






	_cam_chip.set_anchors_preset(Control.PRESET_TOP_LEFT)
	_cam_chip.offset_left = CAM_CHIP_LADO




	_cam_chip.offset_top = 312.0
	_cam_chip.grow_horizontal = Control.GROW_DIRECTION_END


	_cam_chip.mouse_filter = Control.MOUSE_FILTER_STOP
	_cam_chip.gui_input.connect(_on_cam_chip_input)
	_cam_chip.visible = false
	var row: HBoxContainer = HBoxContainer.new()
	row.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row.add_theme_constant_override("separation", 10)
	row.alignment = BoxContainer.ALIGNMENT_CENTER




	_cam_icon_goal = CamFocusIcon.new()
	_cam_icon_goal.custom_minimum_size = Vector2(44, 46)
	_cam_icon_pass = CamFocusIcon.new()
	_cam_icon_pass.custom_minimum_size = Vector2(44, 46)
	_cam_seg_goal = _cam_segmento(_cam_icon_goal)
	_cam_seg_pass = _cam_segmento(_cam_icon_pass)
	row.add_child(_cam_seg_goal)
	row.add_child(_cam_seg_pass)
	_cam_chip.add_child(row)




	Glifos.cuelga(_cam_chip, "fl_camara", CORNER_TOP_RIGHT)
	add_child(_cam_chip)



	_cam_label = Label.new()
	_cam_label.set_anchors_preset(Control.PRESET_TOP_LEFT)
	_cam_label.offset_left = CAM_CHIP_LADO







	_cam_label.offset_top = 404.0
	_cam_label.grow_horizontal = Control.GROW_DIRECTION_END
	_cam_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_LEFT
	_cam_label.add_theme_font_size_override("font_size", CareerTheme.T_BODY)
	_cam_label.add_theme_color_override("font_outline_color", Color(0.0, 0.0, 0.0, 0.8))
	_cam_label.add_theme_constant_override("outline_size", 8)
	_cam_label.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_cam_label.modulate.a = 0.0
	add_child(_cam_label)




func _cam_segmento(icono: CamFocusIcon) -> PanelContainer:
	var seg: PanelContainer = PanelContainer.new()
	seg.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var h: HBoxContainer = HBoxContainer.new()
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	h.add_theme_constant_override("separation", 8)
	icono.mouse_filter = Control.MOUSE_FILTER_IGNORE
	h.add_child(icono)
	var l: Label = Label.new()
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE


	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	l.add_theme_font_size_override("font_size", CareerTheme.T_BODY)
	l.add_theme_color_override("font_color", CareerTheme.INK_DARK)
	l.visible = false
	h.add_child(l)
	seg.add_child(h)
	return seg



func _cam_pinta(seg: PanelContainer, icono: CamFocusIcon, pases: bool, activo: bool, tinta: Color) -> void:
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = tinta if activo else Color(tinta, 0.0)
	sb.set_corner_radius_all(26)
	sb.content_margin_left = 10.0
	sb.content_margin_right = 16.0 if activo else 10.0
	seg.add_theme_stylebox_override("panel", sb)
	icono.fondo = tinta if activo else UiKit.CHIP_BG
	icono.setup(pases, CareerTheme.INK_DARK if activo else _ghost(tinta))
	var l: Label = seg.get_child(0).get_child(1)
	l.visible = activo
	l.text = I18n.t("COMPAÑEROS", "vista") if pases else I18n.t("ARCO", "vista")








func cam_chip_mid_y() -> float:
	return _cam_chip.offset_top + _cam_chip.get_combined_minimum_size().y * 0.5




var _cam_chip_der: bool = false









func cam_chip_a_la_derecha(on: bool) -> void:
	if on == _cam_chip_der or _cam_chip == null:
		return
	_cam_chip_der = on


	var lado: float = CAM_CHIP_LADO + _safe_lado_puesto
	for c: Control in [_cam_chip, _cam_label]:
		c.anchor_left = 1.0 if on else 0.0
		c.anchor_right = c.anchor_left
		c.offset_left = - lado if on else lado
		c.offset_right = c.offset_left
		c.grow_horizontal = Control.GROW_DIRECTION_BEGIN if on else Control.GROW_DIRECTION_END
	_cam_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT if on \
			else HORIZONTAL_ALIGNMENT_LEFT










func set_cam_focus(pases) -> void:



	if _academia:
		_cam_chip.visible = false
		return
	if pases == null:
		_cam_chip.visible = false
		if _cam_tween and _cam_tween.is_valid():
			_cam_tween.kill()
		_cam_label.modulate.a = 0.0
		_cam_last = -1
		return
	_cam_chip.visible = true
	var on: bool = bool(pases)
	if int(on) == _cam_last:
		return
	_cam_last = int(on)
	_cam_pinta(_cam_seg_goal, _cam_icon_goal, false, not on, UiKit.GOLD)
	_cam_pinta(_cam_seg_pass, _cam_icon_pass, true, on, UiKit.CYAN)





func _on_cam_chip_input(event: InputEvent) -> void:
	if _chip_press(event, _cam_chip):
		cam_focus_requested.emit()













var _orden_rb: Glifos = null
var _orden_chip: PanelContainer = null
var _orden_label: Label = null


const ORDEN_CHIP_H: float = 48.0
const ORDEN_GLIFO_H: float = 36.0

const ORDEN_SEP: float = 10.0
const ORDEN_BORDE: float = 16.0






func pon_orden_mando(cabe: bool, junto: Variant, medio: float = 0.0) -> void:
	if cabe and _orden_rb == null and _player_chip != null:
		_orden_rb = Glifos.cuelga(_player_chip, "fl_objetivo", CORNER_TOP_RIGHT)
	if _orden_rb != null:

		(_orden_rb.get_parent() as Control).visible = cabe
	var hay: bool = cabe and junto is Vector2
	if hay and _orden_chip == null:
		_build_orden_chip()
	if _orden_chip == null:
		return
	if hay and not _orden_chip.visible:
		_orden_label.text = I18n.t("ORDENA")
	_orden_chip.visible = hay
	if not hay:
		return
	var p: Vector2 = junto
	var t: Vector2 = _orden_chip.get_combined_minimum_size()
	var vp: Rect2 = get_viewport().get_visible_rect()
	var x: float = p.x + medio + ORDEN_SEP
	if x + t.x > vp.end.x - ORDEN_BORDE:
		x = p.x - medio - ORDEN_SEP - t.x
	var y: float = clampf(p.y - t.y * 0.5, vp.position.y + ORDEN_BORDE,
		vp.end.y - ORDEN_BORDE - t.y)
	_orden_chip.position = Vector2(roundf(x), roundf(y))
	_orden_chip.size = t


func _build_orden_chip() -> void:
	_orden_chip = PanelContainer.new()
	_orden_chip.name = "OrdenMando"
	var sb: StyleBoxFlat = UiKit.make_chip()




	sb.set_corner_radius_all(int(ORDEN_CHIP_H * 0.5))
	sb.set_border_width_all(2)
	sb.border_width_bottom = 4
	sb.content_margin_left = 6.0
	sb.content_margin_right = 14.0
	sb.content_margin_top =(ORDEN_CHIP_H - ORDEN_GLIFO_H) * 0.5
	sb.content_margin_bottom = sb.content_margin_top
	_orden_chip.add_theme_stylebox_override("panel", sb)

	_orden_chip.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_orden_chip.focus_mode = Control.FOCUS_NONE
	_orden_chip.visible = false
	var row: HBoxContainer = HBoxContainer.new()
	row.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row.add_theme_constant_override("separation", 8)
	var g: Glifos = Glifos.chip("fl_toque", "", ORDEN_GLIFO_H)
	g.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	row.add_child(g)
	_orden_label = Label.new()
	_orden_label.mouse_filter = Control.MOUSE_FILTER_IGNORE

	_orden_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	_orden_label.add_theme_font_size_override("font_size", CareerTheme.T_CAP_TUMBADO)
	_orden_label.add_theme_color_override("font_color", CareerTheme.TEXT)
	_orden_label.text = I18n.t("ORDENA")
	row.add_child(_orden_label)
	_orden_chip.add_child(row)
	add_child(_orden_chip)















func _build_cancel_chip() -> void:
	_cancel_chip = PanelContainer.new()
	_cancel_chip.add_theme_stylebox_override("panel", UiKit.make_chip())
	_cancel_chip.set_anchors_preset(Control.PRESET_TOP_LEFT)
	_cancel_chip.offset_left = 24.0
	_cancel_chip.offset_top = 312.0
	_cancel_chip.grow_horizontal = Control.GROW_DIRECTION_END


	_cancel_chip.mouse_filter = Control.MOUSE_FILTER_STOP
	_cancel_chip.gui_input.connect(_on_cancel_chip_input)
	_cancel_chip.visible = false
	var row: HBoxContainer = HBoxContainer.new()
	row.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row.add_theme_constant_override("separation", 10)
	row.alignment = BoxContainer.ALIGNMENT_CENTER


	var ic: MenuIcon = MenuIcon.new()
	ic.custom_minimum_size = Vector2(44, 46)
	ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	ic.mouse_filter = Control.MOUSE_FILTER_IGNORE
	ic.setup("cerrar", CareerTheme.TEXT)
	row.add_child(ic)
	_cancel_label = Label.new()
	_cancel_label.mouse_filter = Control.MOUSE_FILTER_IGNORE


	_cancel_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	_cancel_label.add_theme_font_size_override("font_size", CareerTheme.T_BODY)
	_cancel_label.add_theme_color_override("font_color", CareerTheme.TEXT)
	_cancel_label.text = I18n.t("CANCELAR")
	row.add_child(_cancel_label)
	_cancel_chip.add_child(row)
	add_child(_cancel_chip)






func set_strike_cancel(on: bool) -> void:
	if _cancel_chip == null or _cancel_chip.visible == on:
		return
	if on:
		_cancel_label.text = I18n.t("CANCELAR")
	_cancel_chip.visible = on




func _on_cancel_chip_input(event: InputEvent) -> void:





	if _chip_press(event, _cancel_chip):
		emit_signal.call_deferred(&"strike_cancel_requested")











func pulse_mode_chip() -> void:
	if _mode_chip == null or not is_instance_valid(_mode_chip):
		return


	if not _mode_chip.visible:
		await get_tree().process_frame
		if not is_instance_valid(_mode_chip) or not _mode_chip.visible:
			return
	if _mode_pulse_tween and _mode_pulse_tween.is_valid():
		_mode_pulse_tween.kill()
	_mode_chip.pivot_offset = _mode_chip.size * 0.5
	_mode_chip.scale = Vector2(1.22, 1.22)
	_mode_pulse_tween = create_tween()
	_mode_pulse_tween.tween_property(_mode_chip, "scale", Vector2.ONE, 0.45) \
			.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)





const _COACH_MARKS: GDScript = preload("res://ui/coach_marks.gd")




const HUD_TOUR_ID: String = "@hud"
var _cross_coach_open: bool = false







func maybe_show_cross_coach() -> void:
	if _cross_coach_open or Settings.cross_hint_done:
		return
	if _mode_chip == null or not is_instance_valid(_mode_chip) or not _mode_chip.visible:
		return
	_cross_coach_open = true
	var tour: Control = _COACH_MARKS.new()
	add_child(tour)
	tour.finished.connect(func() -> void:
		Settings.set_cross_hint_done(true)
		_cross_coach_open = false)
	tour.start([{
		"target": _mode_chip,
		"title": "TIRO o CENTRO",
		"body": "Este indicador dice cómo va a salir el balón. Toca con OTRO dedo"
			+ " mientras apuntas —o toca este chip— para cambiar entre TIRO (raso)"
			+ " y CENTRO (colgado). Los córners empiezan en CENTRO.",
	}])













var _hud_tour_open: bool = false






func _tour_target(key: String) -> Control:
	var node: Control = null
	match key:
		"marcador":
			node = _clock_box
		"jugador":
			node = _player_chip
		"nota":
			node = _rating_chip
		"viento":
			node = _wind_chip
		"modo":
			node = _mode_chip
	if node == null or not is_instance_valid(node) or not node.visible:
		return null
	return node











func maybe_show_hud_tour() -> Control:
	if _hud_tour_open or Settings.tour_done(HUD_TOUR_ID):
		return null
	_hud_tour_open = true
	Settings.mark_tour_done(HUD_TOUR_ID)
	var tour: Control = _COACH_MARKS.new()
	add_child(tour)
	tour.finished.connect(func() -> void: _hud_tour_open = false)
	var steps: Array = []
	for st in Tours.HUD_STEPS:
		var key: String = String(st.get("anchor", ""))
		steps.append({
			"target":(func() -> Control: return _tour_target(key)),
			"title": String(st.get("title", "")),
			"body": String(st.get("body", "")),
		})
	tour.start(steps)
	return tour















func maybe_show_rule(id: String) -> Control:
	if _hud_tour_open or _cross_coach_open or Settings.rule_seen(id):
		return null
	var steps: Array = Tours.rule(id)
	if steps.is_empty():
		return null
	_hud_tour_open = true
	Settings.mark_rule_seen(id)
	var tour: Control = _COACH_MARKS.new()
	add_child(tour)
	tour.finished.connect(func() -> void: _hud_tour_open = false)
	tour.start(steps)
	return tour


func show_end(title: String, stats_text: String) -> void:
	set_match_state("FIM")
	_pause_button.visible = false
	_end_title.text = CareerTheme.caps(title)
	_end_stats.text = CareerTheme.caps(stats_text)
	UiKit.pop_in(_end_panel)















func show_summary(data: Dictionary) -> void:
	set_match_state("FIM")
	_pause_button.visible = false




	var padre: Node = _end_panel.get_parent()
	if _end_veil == null or not is_instance_valid(_end_veil):
		_end_veil = UiKit.night_veil()
		padre.add_child(_end_veil)
		padre.move_child(_end_veil, _end_panel.get_index())















	for hijo in get_children():
		var ci: CanvasItem = hijo as CanvasItem
		if ci == null or ci == _end_panel or ci == _end_veil:
			continue
		ci.visible = false
	_end_panel.set_anchors_preset(Control.PRESET_FULL_RECT)
	_end_panel.offset_left = 0.0
	_end_panel.offset_right = 0.0
	_end_panel.offset_top = 0.0
	_end_panel.offset_bottom = 0.0
	var sb_pagina: StyleBoxFlat = CareerTheme.plate()
	sb_pagina.bg_color = Color(sb_pagina.bg_color.r, sb_pagina.bg_color.g,
		sb_pagina.bg_color.b, 0.86)
	sb_pagina.set_corner_radius_all(0)
	sb_pagina.set_border_width_all(0)
	sb_pagina.content_margin_left = 30.0 + UiKit.side_safe_inset(get_viewport())
	sb_pagina.content_margin_right = 30.0 + UiKit.side_safe_inset(get_viewport())
	sb_pagina.content_margin_top = 36.0 + UiKit.top_safe_inset(get_viewport())
	sb_pagina.content_margin_bottom = 30.0 + UiKit.bottom_safe_inset(get_viewport())
	_end_panel.add_theme_stylebox_override("panel", sb_pagina)







	_end_title.text = String(data.get("result_text",
		data.get("title", I18n.t("FINAL", "hud")))).to_upper()



	var res: int = int(data.get("result", 0))
	_end_title.add_theme_color_override("font_color",






		CareerTheme.GOOD if res > 0 else \
				(UiKit.DANGER if res < 0 else CareerTheme.TEXT))









	_end_title.visible = not data.has("score")

	_end_stats.visible = false


	_restart_button.visible = false

	if _summary_box != null and is_instance_valid(_summary_box):
		_summary_box.queue_free()
	var vbox: VBoxContainer = _end_stats.get_parent() as VBoxContainer
	var view: MatchSummaryView = MatchSummaryView.new()
	_summary_box = view


	view.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	if UiKit.es_horizontal():
		view.size_flags_vertical = Control.SIZE_EXPAND_FILL
		vbox.add_child(view)
		vbox.move_child(view, _end_stats.get_index() + 1)
	else:
		var scroll: DragScroll = DragScroll.new()
		scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
		scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
		vbox.add_child(scroll)
		vbox.move_child(scroll, _end_stats.get_index() + 1)
		scroll.add_child(view)














	_end_panel.visible = true
	_end_panel.modulate.a = 0.0
	var tw_pagina: Tween = _end_panel.create_tween()
	tw_pagina.tween_property(_end_panel, "modulate:a", 1.0, 0.35) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	view.populate(data)






func _on_end_panel_input(ev: InputEvent) -> void:
	var pressed: bool =(ev is InputEventScreenTouch and ev.pressed) \
			or (ev is InputEventMouseButton and ev.pressed)
	if pressed and _summary_box != null and is_instance_valid(_summary_box):
		_summary_box.advance()















const HINT_TOP: float = -240.0
const HINT_BOTTOM: float = -170.0







func _apply_safe_area() -> void:
	var movil: bool = OS.has_feature("ios") or OS.has_feature("android")



	_safe_bottom = UiKit.bottom_safe_inset(get_viewport()) \
			if movil or UiKit.es_horizontal() else 0.0



	_relayout_bottom()



	var lado: float = UiKit.side_safe_inset(get_viewport()) if UiKit.es_horizontal() else 0.0
	var d_lado: float = lado - _safe_lado_puesto
	_safe_lado_puesto = lado
	if d_lado != 0.0:
		for control in [_pause_button, _chance_chip, _wind_chip, _rating_chip,
				_mode_chip, _mode_label, _cam_chip, _cam_label, _cancel_chip]:

			if control == _rating_chip and _nota_disco != null:
				continue
			var signo: float = -1.0 if control.anchor_left >= 0.5 else 1.0
			_desplaza(control, d_lado * signo, 0.0)
	var top_inset: float = maxf(0.0, UiKit.top_safe_inset(get_viewport())) \
			if movil or UiKit.es_horizontal() else 0.0
	var d_top: float = top_inset - _safe_top_puesto
	_safe_top_puesto = top_inset
	if d_top != 0.0:


		for control in [_score_chip, _pause_button, _chance_chip, _wind_chip,
				_rating_chip, _mode_chip, _mode_label, _cam_chip, _cam_label, _cancel_chip]:
			if control == _rating_chip and _nota_disco != null:
				continue
			_desplaza(control, 0.0, d_top)


	if _pen_card != null and is_instance_valid(_pen_card):
		_pen_bajo_reloj()


	if _msg_band != null and _msg_band.visible and not _message_label.text.is_empty():
		_fit_message_band(_message_label.text)













var _safe_top_puesto: float = 0.0
var _safe_lado_puesto: float = 0.0








static func _desplaza(c: Control, dx: float, dy: float) -> void:
	if dx > 0.0:
		c.offset_right += dx
		c.offset_left += dx
	elif dx < 0.0:
		c.offset_left += dx
		c.offset_right += dx
	if dy > 0.0:
		c.offset_bottom += dy
		c.offset_top += dy
	elif dy < 0.0:
		c.offset_top += dy
		c.offset_bottom += dy













func _relayout_bottom() -> void:
	_player_chip.offset_left = _chip_left()
	_player_chip.offset_top = _chip_top()
	_player_chip.offset_bottom = _chip_bottom()


	_fit_hint_box()


func _setup_theme() -> void:






	_score_label.add_theme_font_size_override("font_size", CareerTheme.T_SCORE)
	_score_label.add_theme_constant_override("outline_size", 0)
	_message_label.add_theme_font_size_override("font_size", CareerTheme.T_TITLE)
	_message_label.add_theme_color_override("font_outline_color", Color(0.0, 0.0, 0.0, 0.85))
	_message_label.add_theme_constant_override("outline_size", 12)
	_message_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART




	_msg_mid =(_message_label.offset_top + _message_label.offset_bottom) * 0.5
	_message_label.offset_left = MSG_MARGIN
	_message_label.offset_right = - MSG_MARGIN


	_message_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	_hint_label.add_theme_font_size_override("font_size", CareerTheme.T_MONEY)
	_hint_label.add_theme_color_override("font_color", Color(1.0, 1.0, 1.0, 0.85))
	_hint_label.add_theme_color_override("font_outline_color", Color(0.0, 0.0, 0.0, 0.7))
	_hint_label.add_theme_constant_override("outline_size", 8)




	_hint_label.add_theme_constant_override("line_spacing", 16)






	var modal_sb: StyleBoxFlat = CareerTheme.plate()
	modal_sb.set_content_margin_all(10.0)
	_end_panel.add_theme_stylebox_override("panel", modal_sb)
	CareerTheme.title(_end_title, 40)
	_end_stats.add_theme_font_size_override("font_size", CareerTheme.T_MONEY)
	_end_stats.add_theme_color_override("font_color", CareerTheme.TEXT)
	_end_stats.add_theme_constant_override("line_spacing", 14)





	CareerTheme.apply_button(_restart_button, CareerTheme.Kind.NEUTRAL, CareerTheme.BTN_SECONDARY_FONT)
	CareerTheme.apply_button(_menu_button, CareerTheme.Kind.PRIMARY, CareerTheme.BTN_CTA_FONT)
	_menu_button.custom_minimum_size = Vector2(0, CareerTheme.BTN_CTA_H)



	_restart_button.text = I18n.t("OTRO PARTIDO")
	_menu_button.text = I18n.t("MENÚ")



















var _safe_bottom: float = 0.0

func _chip_left() -> float: return CHIP_LEFT + UiKit.side_safe_inset(get_viewport())
func _chip_top() -> float: return CHIP_TOP - _safe_bottom
func _chip_bottom() -> float: return CHIP_BOTTOM - _safe_bottom
func _goal_top() -> float: return _chip_top() if _gol_compacta else GOAL_TOP - _safe_bottom
func _goal_bottom() -> float: return _chip_bottom() if _gol_compacta else GOAL_BOTTOM - _safe_bottom


const GOAL_TOP: float = -420.0
const GOAL_BOTTOM: float = -276.0



const GOAL_LEFT: float = CHIP_LEFT
const GOAL_RIGHT: float = - CHIP_LEFT







const GOAL_ANCHO_H: float = 860.0






func _goal_left() -> float:
	return _chip_left() if UiKit.es_horizontal() else GOAL_LEFT


func _goal_right() -> float:
	if not UiKit.es_horizontal():
		return GOAL_RIGHT
	var vp_w: float = _vp_w()
	var ancho: float = minf(GOAL_ANCHO_H, vp_w - _goal_left() - CHIP_LEFT)
	return -(vp_w - _goal_left() - ancho)




func _vp_w() -> float:
	var vp: Viewport = get_viewport()
	var w: float = vp.get_visible_rect().size.x if vp != null else 0.0
	return w if w > 1.0 else UiKit.lienzo().x





func _goal_full_w() -> float:
	return _vp_w() - _goal_left() + _goal_right()












var _gol_compacta: bool = false



func _goal_radio() -> int:
	return PLACA_RADIO if _gol_compacta else TARJETA_RADIO




func _gol_nombre_tope() -> int:
	return 34 if _gol_compacta else GOL_NOMBRE_ESCALA[0]


func _goal_card_forma() -> void:
	var c: bool = UiKit.es_horizontal()
	_gol_compacta = c
	var radio: int = _goal_radio()
	_goal_card_sb.set_corner_radius_all(radio)
	_goal_card_sb.border_width_bottom = 4 if c else 6
	_goal_num_sb.set_corner_radius_all(radio)
	_goal_num_sb.content_margin_left = 22.0 if c else 34.0
	_goal_num_sb.content_margin_right = 22.0 if c else 34.0
	_goal_num.add_theme_font_size_override("font_size",
		CareerTheme.T_HUD_DORSAL if c else CareerTheme.T_TITLE)


	_goal_face.custom_minimum_size = Vector2(PlayerAvatar.BUST_CLOSE.size.x * 2.0, 0.0) \
			if c else Vector2(92.0, 120.0)
	_goal_big_crest.custom_minimum_size = Vector2(44, 44) if c else Vector2(58, 58)
	_goal_crest_sb.set_content_margin_all(5.0 if c else 8.0)
	for chip: PanelContainer in _goal_stat_chips:
		var sb: StyleBox = chip.get_theme_stylebox("panel")
		if sb is StyleBoxFlat:
			sb.content_margin_top = 2.0 if c else 5.0
			sb.content_margin_bottom = 2.0 if c else 5.0
		var ic: Control = chip.get_meta("icono", null) as Control
		if ic != null:
			ic.custom_minimum_size = Vector2(22, 22) if c else Vector2(28, 28)
	for val: Label in _goal_stat_values:
		val.add_theme_font_size_override("font_size",
			CareerTheme.T_BODY if c else CareerTheme.T_MONEY)



	var col: VBoxContainer = _goal_stats.get_parent() as VBoxContainer
	if col != null:
		col.add_theme_constant_override("separation", 0 if c else 4)
	_goal_pad.add_theme_constant_override("margin_right", int(radio * 0.55))




func _shift_goal_card(dx: float) -> void:
	_goal_card.offset_left = _goal_left() + dx
	_goal_card.offset_right = _goal_right() + dx


func _build_goal_card() -> void:
	_goal_card = PanelContainer.new()




	_goal_card_sb = StyleBoxFlat.new()
















	_goal_card_sb.bg_color = CareerTheme.HUD_SURFACE
	_goal_card_sb.set_corner_radius_all(TARJETA_RADIO)
	_goal_card_sb.corner_detail = 20
	_goal_card_sb.border_width_bottom = 6
	_goal_card_sb.shadow_color = Color(CareerTheme.BG_DEEP.r, CareerTheme.BG_DEEP.g,
		CareerTheme.BG_DEEP.b, 0.45)
	_goal_card_sb.shadow_size = 14
	_goal_card_sb.shadow_offset = Vector2(0, 6)
	_goal_card_sb.content_margin_left = 0.0


	_goal_card_sb.content_margin_right = 0.0
	_goal_card_sb.content_margin_top = 0.0
	_goal_card_sb.content_margin_bottom = 0.0
	_goal_card.add_theme_stylebox_override("panel", _goal_card_sb)
	_goal_card.anchor_left = 0.0
	_goal_card.anchor_right = 1.0
	_goal_card.anchor_top = 1.0
	_goal_card.anchor_bottom = 1.0
	_goal_card.offset_left = _goal_left()
	_goal_card.offset_right = _goal_right()
	_goal_card.offset_top = _goal_top()
	_goal_card.offset_bottom = _goal_bottom()
	_goal_card.grow_horizontal = Control.GROW_DIRECTION_BOTH
	_goal_card.grow_vertical = Control.GROW_DIRECTION_BEGIN
	_goal_card.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_goal_card.visible = false
	add_child(_goal_card)













	_goal_patch = KitPatch.new()

	_goal_patch.visible = false
	_goal_card.add_child(_goal_patch)
	_goal_pad = MarginContainer.new()
	_goal_pad.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_goal_card.add_child(_goal_pad)
	var card_col: VBoxContainer = VBoxContainer.new()
	card_col.add_theme_constant_override("separation", 0)
	card_col.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_goal_pad.add_child(card_col)
	_goal_comp_line = ColorRect.new()
	_goal_comp_line.color = _accent
	_goal_comp_line.custom_minimum_size = Vector2(0.0, 4.0)
	_goal_comp_line.mouse_filter = Control.MOUSE_FILTER_IGNORE
	card_col.add_child(_goal_comp_line)


	_goal_comp_line.visible = false
	var main_row: HBoxContainer = HBoxContainer.new()
	main_row.add_theme_constant_override("separation", 16)
	main_row.alignment = BoxContainer.ALIGNMENT_BEGIN
	main_row.size_flags_vertical = Control.SIZE_EXPAND_FILL
	main_row.mouse_filter = Control.MOUSE_FILTER_IGNORE
	card_col.add_child(main_row)



	var gnum_holder: PanelContainer = PanelContainer.new()
	_goal_num_sb = StyleBoxFlat.new()
	_goal_num_sb.bg_color = _kit_a
	_goal_num_sb.set_corner_radius_all(TARJETA_RADIO)
	_goal_num_sb.corner_detail = 20
	_goal_num_sb.content_margin_left = 34.0
	_goal_num_sb.content_margin_right = 34.0
	gnum_holder.add_theme_stylebox_override("panel", _goal_num_sb)
	gnum_holder.size_flags_vertical = Control.SIZE_FILL
	gnum_holder.mouse_filter = Control.MOUSE_FILTER_IGNORE
	main_row.add_child(gnum_holder)
	_goal_num = Label.new()
	_goal_num.add_theme_font_size_override("font_size", CareerTheme.T_TITLE)
	_goal_num.add_theme_color_override("font_color", CareerTheme.BG_DEEP)
	_goal_num.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_goal_num.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	_goal_num.mouse_filter = Control.MOUSE_FILTER_IGNORE
	gnum_holder.add_child(_goal_num)


	_goal_face = PlayerAvatar.new()
	_goal_face.chrome = false
	_goal_face.bust = PlayerAvatar.BUST_CLOSE



	_goal_face.custom_minimum_size = Vector2(92.0, 120.0)
	_goal_face.size_flags_vertical = Control.SIZE_FILL
	_goal_face.mouse_filter = Control.MOUSE_FILTER_IGNORE
	main_row.add_child(_goal_face)





	_goal_flag = Flags.make_rect("", 30.0)
	_goal_flag.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	main_row.add_child(_goal_flag)




	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 4)
	col.alignment = BoxContainer.ALIGNMENT_CENTER


	col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	col.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	col.mouse_filter = Control.MOUSE_FILTER_IGNORE
	main_row.add_child(col)









	var name_row: HBoxContainer = HBoxContainer.new()
	name_row.add_theme_constant_override("separation", 10)
	name_row.alignment = BoxContainer.ALIGNMENT_BEGIN
	name_row.mouse_filter = Control.MOUSE_FILTER_IGNORE
	col.add_child(name_row)
	_goal_first = Label.new()
	_goal_first.add_theme_font_size_override("font_size", CareerTheme.T_HEAD)
	_goal_first.add_theme_color_override("font_color", Color(1.0, 1.0, 1.0, 0.62))
	_goal_first.vertical_alignment = VERTICAL_ALIGNMENT_BOTTOM
	_goal_first.mouse_filter = Control.MOUSE_FILTER_IGNORE
	name_row.add_child(_goal_first)
	_goal_name = Label.new()
	_goal_name.add_theme_font_size_override("font_size", GOL_NOMBRE_ESCALA[0])
	_goal_name.add_theme_color_override("font_color", Color.WHITE)
	_goal_name.add_theme_color_override("font_outline_color", Color(0.0, 0.0, 0.0, 0.6))
	_goal_name.add_theme_constant_override("outline_size", 6)
	_goal_name.vertical_alignment = VERTICAL_ALIGNMENT_BOTTOM
	_goal_name.mouse_filter = Control.MOUSE_FILTER_IGNORE




	_goal_name.clip_text = true



	_goal_name.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	name_row.add_child(_goal_name)










	_goal_stats = HBoxContainer.new()
	_goal_stats.add_theme_constant_override("separation", 10)
	_goal_stats.mouse_filter = Control.MOUSE_FILTER_IGNORE
	col.add_child(_goal_stats)
	for icon: String in ["partido", "gol", "asist"]:
		_goal_stat_values.append(_add_goal_stat(_goal_stats, icon))


	_goal_credit = Label.new()
	_goal_credit.add_theme_font_size_override("font_size", CareerTheme.T_BODY)
	_goal_credit.add_theme_color_override("font_color", _accent)
	_goal_credit.visible = false
	_goal_credit.mouse_filter = Control.MOUSE_FILTER_IGNORE
	col.add_child(_goal_credit)


	var gap: Control = Control.new()
	gap.size_flags_horizontal = Control.SIZE_EXPAND_FILL


	gap.size_flags_stretch_ratio = 0.01
	gap.mouse_filter = Control.MOUSE_FILTER_IGNORE
	main_row.add_child(gap)



	var crest_frame: PanelContainer = PanelContainer.new()
	_goal_crest_sb = StyleBoxFlat.new()
	_goal_crest_sb.bg_color = CareerTheme.BG_DEEP
	_goal_crest_sb.set_corner_radius_all(12)
	_goal_crest_sb.set_border_width_all(3)
	_goal_crest_sb.border_color = _accent
	_goal_crest_sb.set_content_margin_all(8.0)
	crest_frame.add_theme_stylebox_override("panel", _goal_crest_sb)
	crest_frame.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	crest_frame.mouse_filter = Control.MOUSE_FILTER_IGNORE
	main_row.add_child(crest_frame)
	_goal_big_crest = CrestView.new()
	_goal_big_crest.custom_minimum_size = Vector2(58, 58)
	_goal_big_crest.mouse_filter = Control.MOUSE_FILTER_IGNORE
	crest_frame.add_child(_goal_big_crest)






	_goal_minute = Label.new()
	_goal_minute.add_theme_font_size_override("font_size", CareerTheme.T_HUD_SCORE)
	_goal_minute.add_theme_color_override("font_color", _accent)
	_goal_minute.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	_goal_minute.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	_goal_minute.mouse_filter = Control.MOUSE_FILTER_IGNORE
	main_row.add_child(_goal_minute)




	_goal_flash = ColorRect.new()
	_goal_flash.color = _accent
	_goal_flash.modulate.a = 0.0
	_goal_flash.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_goal_flash.set_anchors_preset(Control.PRESET_FULL_RECT)
	_goal_card.add_child(_goal_flash)






func _add_goal_stat(row: HBoxContainer, icon_type: String) -> Label:
	var chip: PanelContainer = PanelContainer.new()
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.set_corner_radius_all(8)
	sb.content_margin_left = 12.0
	sb.content_margin_right = 14.0
	sb.content_margin_top = 5.0
	sb.content_margin_bottom = 5.0
	chip.add_theme_stylebox_override("panel", sb)
	chip.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var inner: HBoxContainer = HBoxContainer.new()
	inner.add_theme_constant_override("separation", 7)
	inner.mouse_filter = Control.MOUSE_FILTER_IGNORE
	chip.add_child(inner)
	var ic: MenuIcon = MenuIcon.new()
	ic.custom_minimum_size = Vector2(28, 28)
	ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	ic.mouse_filter = Control.MOUSE_FILTER_IGNORE
	inner.add_child(ic)
	var val: Label = Label.new()
	val.add_theme_font_size_override("font_size", CareerTheme.T_MONEY)
	val.add_theme_color_override("font_color", CareerTheme.TEXT)
	val.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	val.mouse_filter = Control.MOUSE_FILTER_IGNORE
	inner.add_child(val)
	row.add_child(chip)


	chip.set_meta("icono", ic)
	chip.set_meta("tipo", icon_type)
	_goal_stat_chips.append(chip)
	return val





const GOL_NOMBRE_ESCALA: Array[int] = [46, 40, 34, 30, 26, 22]

const PLACA_NOMBRE_ESCALA: Array[int] = [29, 26, 24, 22, 20, 18]

const PLACA_MARGEN_DER: float = 24.0








func _ajusta_nombre_gol() -> void:
	var row: Control = _goal_name.get_parent() as Control
	if row == null:
		return







	var previo: float = -1.0
	var vueltas: int = 0
	while vueltas < 40:
		await get_tree().process_frame
		if not is_instance_valid(_goal_name) or not is_instance_valid(row):
			return
		if row.size.x > 1.0 and absf(row.size.x - previo) < 0.5:
			break
		previo = row.size.x
		vueltas += 1
	if _goal_name.text.is_empty():
		return
	var disponible: float = row.size.x
	if disponible <= 1.0:
		return
	var f: Font = _goal_name.get_theme_font("font")
	if f == null:
		return
	var sep: float = float(row.get_theme_constant("separation"))

	for intento: int in 2:
		var libre: float = disponible
		if _goal_first.visible:
			var ff: Font = _goal_first.get_theme_font("font")
			if ff != null:
				libre -= ff.get_string_size(_goal_first.text,
					HORIZONTAL_ALIGNMENT_LEFT, -1, 24).x + sep
		for s: int in GOL_NOMBRE_ESCALA:
			if s > _gol_nombre_tope():
				continue
			if f.get_string_size(_goal_name.text,
					HORIZONTAL_ALIGNMENT_LEFT, -1, s).x <= libre:
				_goal_name.add_theme_font_size_override("font_size", s)
				return
		if _goal_first.visible:
			_goal_first.visible = false
		else:
			break
	_goal_name.add_theme_font_size_override("font_size",
		GOL_NOMBRE_ESCALA[GOL_NOMBRE_ESCALA.size() - 1])







func _ajusta_nombre_placa() -> void:
	await get_tree().process_frame
	if not is_instance_valid(_player_name) or _player_name.text.is_empty():
		return
	var f: Font = _player_name.get_theme_font("font")
	if f == null or _player_chip.size.x <= 1.0:
		return
	var fijo: float = _player_chip.size.x - _player_name.size.x
	var libre: float = SceneFade.rect_visible(self).size.x - _player_chip.position.x \
			- PLACA_MARGEN_DER - fijo
	for s: int in PLACA_NOMBRE_ESCALA:
		if f.get_string_size(_player_name.text,
				HORIZONTAL_ALIGNMENT_LEFT, -1, s).x <= libre:
			_player_name.add_theme_font_size_override("font_size", s)
			return
	_player_name.add_theme_font_size_override("font_size",
		PLACA_NOMBRE_ESCALA[PLACA_NOMBRE_ESCALA.size() - 1])



















func show_goal_card(assist: bool = false, scorer: String = "",
		live_goals: int = 0, live_assists: int = 0,
		mate: Dictionary = {}) -> void:
	_goal_card_forma()




	var full: String = scorer if not scorer.is_empty() else Career.player_name
	var parts: PackedStringArray = full.strip_edges().split(" ", false)
	if parts.size() >= 2:
		_goal_first.visible = true


		_goal_first.text = CareerTheme.caps(String(parts[0]))
		_goal_name.text = CareerTheme.caps(" ".join(parts.slice(1)))
	else:
		_goal_first.visible = false
		_goal_name.text = CareerTheme.caps(full)







	_goal_name.add_theme_font_size_override("font_size", _gol_nombre_tope())
	_ajusta_nombre_gol()

	_gol_bug_show()



	_goal_credit.visible = assist
	if assist:

		var mine: PackedStringArray = Career.player_name.strip_edges().split(" ", false)
		var me: String = String(mine[mine.size() - 1]) if mine.size() >= 2 else Career.player_name
		_goal_credit.text = "%s · %s" % [I18n.t("ASISTENCIA"), CareerTheme.caps(me)]










	var mate_look: Dictionary = Dictionary(mate.get("look", {}))
	if not mate.is_empty():
		_goal_num.text = str(maxi(int(mate.get("number", 0)), 1))


		_style_dorsal(mate_look)
		_goal_face.visible = not mate_look.is_empty()
		if _goal_face.visible:
			_goal_face.set_look(mate_look)
	else:
		_goal_num.text = _player_num.text
		_goal_face.visible = _player_face.visible
		if _goal_face.visible:
			_goal_face.set_look(_player_face_look)













	var mine: bool = mate.is_empty()
	var quien: String = String(mate.get("name", scorer))




	var ajeno_sin_ficha: bool = mine and not scorer.strip_edges().is_empty() \
			and scorer != Career.player_name
	_goal_stats.visible = not ajeno_sin_ficha
	_goal_stat_chips[0].visible = mine
	if not mine:


		_goal_stat_values[1].text = str(Career.mate_comp_now(_comp_key, quien, "g")
			+ maxi(live_goals, 1))
		_goal_stat_values[2].text = str(Career.mate_comp_now(_comp_key, quien, "a")
			+ live_assists)
	if mine:





		var comp: String = _comp_key
		_goal_stat_values[0].text = str(Career.season_apps_now(comp) + 1)
		_goal_stat_values[1].text = str(Career.season_comp_now(comp, "g") + live_goals)
		_goal_stat_values[2].text = str(Career.season_comp_now(comp, "a") + live_assists)








	if mine:
		_goal_flag.texture = _player_flag.texture
		_goal_flag.visible = _player_flag.visible
	else:
		var nat: String = String(mate.get("nation", ""))
		_goal_flag.texture = Flags.texture(nat)
		_goal_flag.visible = not nat.strip_edges().is_empty()

	_goal_big_crest.set_team(_you_team_data)
	_goal_minute.text = "%d'" % _match_minute

	_style_scorebar()
	_animate_goal_card(String(_comp_style.get("goal_entry", "sweep")))











func _animate_goal_card(mode: String) -> void:
	if _goal_tween and _goal_tween.is_valid():
		_goal_tween.kill()



		_reset_player_chip_rect()
	_goal_card.visible = true
	_goal_card.modulate.a = 0.0


	_goal_card.offset_top = _goal_top()
	_goal_card.offset_bottom = _goal_bottom()



	_goal_card.offset_left = _goal_left()
	_goal_card.offset_right = _goal_right()
	_goal_card.scale = Vector2.ONE





	var pv: Vector2 = _goal_card.size
	if pv.x < 1.0 or pv.y < 1.0:
		pv = Vector2(_goal_full_w(), _goal_bottom() - _goal_top())
	_goal_card.pivot_offset = pv * 0.5
	if _goal_flash != null:
		_goal_flash.modulate.a = 0.0
	_goal_tween = create_tween()








	_goal_tween.set_pause_mode(Tween.TWEEN_PAUSE_STOP)
	_goal_tween.set_ignore_time_scale(true)
	_goal_tween.set_parallel(true)









	if _player_chip != null and _player_chip.visible:
		_goal_morph_entry(mode)
		_goal_card_hold_and_exit(mode)
		return
	match mode:
		"burst":


			_goal_card.scale = Vector2(0.72, 0.72)
			_goal_tween.tween_property(_goal_card, "modulate:a", 1.0, 0.18)
			_goal_tween.tween_property(_goal_card, "scale", Vector2.ONE, 0.45) \
					.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
			if _goal_flash != null:
				_goal_flash.color = _accent
				_goal_flash.modulate.a = 0.85
				_goal_tween.tween_property(_goal_flash, "modulate:a", 0.0, 0.55) \
						.set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_OUT)
		"slam":




			_goal_card.offset_top = _goal_top() + 130.0
			_goal_card.offset_bottom = _goal_bottom() + 130.0
			_goal_tween.tween_property(_goal_card, "modulate:a", 1.0, 0.1)
			_goal_tween.tween_property(_goal_card, "offset_top", _goal_top(), 0.18) \
					.set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_OUT)
			_goal_tween.tween_property(_goal_card, "offset_bottom", _goal_bottom(), 0.18) \
					.set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_OUT)
			_goal_tween.chain()
			_goal_tween.set_parallel(false)



			var prev: float = 0.0
			for amp: float in [14.0, -7.0, 3.0, 0.0]:
				_goal_tween.tween_method(_shift_goal_card, prev, amp, 0.05)
				prev = amp
			_goal_tween.set_parallel(true)
		"wipe":




			_goal_card.offset_right = _goal_right() -(_goal_full_w() - 40.0)
			_goal_tween.tween_property(_goal_card, "modulate:a", 1.0, 0.35)
			_goal_tween.tween_property(_goal_card, "offset_right", _goal_right(), 0.75) \
					.set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
		_:
			_goal_card.offset_top = _goal_top() + 70.0
			_goal_card.offset_bottom = _goal_bottom() + 70.0
			_goal_tween.tween_property(_goal_card, "modulate:a", 1.0, 0.25)
			_goal_tween.tween_property(_goal_card, "offset_top", _goal_top(), 0.4) \
					.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
			_goal_tween.tween_property(_goal_card, "offset_bottom", _goal_bottom(), 0.4) \
					.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	_goal_card_hold_and_exit(mode)


















func _goal_morph_entry(mode: String) -> void:
	var cw: float = maxf(_player_chip.size.x, 1.0)
	var fw: float = maxf(_goal_full_w(), 1.0)



	_goal_card.pivot_offset = Vector2.ZERO
	_goal_card.scale = Vector2(cw / fw, 1.0)
	_goal_card.offset_left = _chip_left()
	_goal_card.offset_top = _chip_top()
	_goal_card.offset_bottom = _chip_bottom()


	if mode == "burst" and _goal_flash != null:
		_goal_flash.color = _accent
		_goal_flash.modulate.a = 0.85
		_goal_tween.tween_property(_goal_flash, "modulate:a", 0.0, 0.55) \
				.set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_OUT)





	if mode == "wipe":
		_morph_unfold(0.3, 0.85)
		return





	match String(_comp_style.get("goal_morph", "crece")):
		"despliega": _morph_unfold(0.24, 0.46)
		"slam": _morph_slam()
		"cizalla": _morph_shear()
		"rebota": _morph_bounce()
		"barre": _morph_wipe()
		"ceremonia": _morph_ceremony()
		"vaiven": _morph_swing()
		_: _morph_grow()




func _morph_grow() -> void:
	var d: float = 0.42
	_goal_tween.tween_property(_goal_card, "modulate:a", 1.0, 0.12)
	for prop: Array in [["scale", Vector2.ONE], ["offset_left", _goal_left()],
			["offset_top", _goal_top()], ["offset_bottom", _goal_bottom()]]:
		_goal_tween.tween_property(_goal_card, String(prop[0]), prop[1], d) \
				.set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
	_chip_rides(d, Tween.TRANS_QUINT)








func _morph_unfold(sube: float, abre: float) -> void:
	_goal_tween.tween_property(_goal_card, "modulate:a", 1.0, 0.12)
	_goal_tween.tween_property(_goal_card, "offset_top", _goal_top(), sube) \
			.set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_OUT)
	_goal_tween.tween_property(_goal_card, "offset_bottom", _goal_bottom(), sube) \
			.set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_OUT)
	_chip_rides(sube, Tween.TRANS_EXPO)
	_goal_tween.chain()
	_goal_tween.set_parallel(true)
	_goal_tween.tween_property(_goal_card, "scale", Vector2.ONE, abre) \
			.set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_IN_OUT)
	_goal_tween.tween_property(_goal_card, "offset_left", _goal_left(), abre) \
			.set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_IN_OUT)







func _morph_slam() -> void:
	var d: float = 0.2
	_goal_tween.tween_property(_goal_card, "modulate:a", 1.0, 0.07)
	_goal_tween.tween_property(_goal_card, "scale", Vector2.ONE, d) \
			.set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_OUT)
	_goal_tween.tween_property(_goal_card, "offset_left", _goal_left(), d) \
			.set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_OUT)
	_goal_tween.tween_property(_goal_card, "offset_top", _goal_top(), d) \
			.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	_goal_tween.tween_property(_goal_card, "offset_bottom", _goal_bottom(), d) \
			.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	_chip_rides(d, Tween.TRANS_EXPO)
	_goal_tween.chain()
	_goal_tween.set_parallel(false)
	var prev: float = 0.0
	for amp: float in [12.0, -6.0, 2.0, 0.0]:
		_goal_tween.tween_method(_shift_goal_card, prev, amp, 0.05)
		prev = amp
	_goal_tween.set_parallel(true)










func _morph_shear() -> void:
	var d: float = 0.44
	var rest: Vector2 = _goal_card_sb.skew
	_goal_card_sb.skew = rest * 2.2
	_goal_num_sb.skew = rest * 2.2
	_goal_tween.tween_property(_goal_card, "modulate:a", 1.0, 0.12)
	for prop: Array in [["scale", Vector2.ONE], ["offset_left", _goal_left()],
			["offset_top", _goal_top()], ["offset_bottom", _goal_bottom()]]:
		_goal_tween.tween_property(_goal_card, String(prop[0]), prop[1], d) \
				.set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
	_goal_tween.tween_property(_goal_card_sb, "skew", rest, d) \
			.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	_goal_tween.tween_property(_goal_num_sb, "skew", rest, d) \
			.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	_chip_rides(d, Tween.TRANS_QUINT)












func _morph_bounce() -> void:
	var d: float = 0.36
	_goal_tween.tween_property(_goal_card, "modulate:a", 1.0, 0.1)
	_goal_tween.tween_property(_goal_card, "scale", Vector2.ONE, d) \
			.set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
	_goal_tween.tween_property(_goal_card, "offset_left", _goal_left(), d) \
			.set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
	_goal_tween.tween_property(_goal_card, "offset_top", _goal_top(), d) \
			.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	_goal_tween.tween_property(_goal_card, "offset_bottom", _goal_bottom(), d) \
			.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	_chip_rides(d, Tween.TRANS_QUINT)





func _morph_wipe() -> void:
	var d: float = 0.26
	_goal_tween.tween_property(_goal_card, "modulate:a", 1.0, 0.1)
	for prop: Array in [["scale", Vector2.ONE], ["offset_left", _goal_left()],
			["offset_top", _goal_top()], ["offset_bottom", _goal_bottom()]]:
		_goal_tween.tween_property(_goal_card, String(prop[0]), prop[1], d) \
				.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	_chip_rides(d, Tween.TRANS_CUBIC)





func _morph_ceremony() -> void:
	_morph_unfold(0.34, 0.62)
	_goal_tween.chain()
	_goal_tween.set_parallel(false)
	_goal_tween.tween_property(_goal_card, "scale", Vector2(1.03, 1.03), 0.16) \
			.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	_goal_tween.tween_property(_goal_card, "scale", Vector2.ONE, 0.22) \
			.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	_goal_tween.set_parallel(true)






func _morph_swing() -> void:
	var d: float = 0.4
	_goal_card.rotation = deg_to_rad(-3.0)
	_goal_tween.tween_property(_goal_card, "modulate:a", 1.0, 0.1)
	for prop: Array in [["scale", Vector2.ONE], ["offset_left", _goal_left()],
			["offset_top", _goal_top()], ["offset_bottom", _goal_bottom()]]:
		_goal_tween.tween_property(_goal_card, String(prop[0]), prop[1], d) \
				.set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
	_goal_tween.tween_property(_goal_card, "rotation", 0.0, d + 0.12) \
			.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	_chip_rides(d, Tween.TRANS_QUINT)


func _chip_rides(d: float, trans: Tween.TransitionType) -> void:
	_goal_tween.tween_property(_player_chip, "offset_top", _goal_top(), d) \
			.set_trans(trans).set_ease(Tween.EASE_OUT)
	_goal_tween.tween_property(_player_chip, "offset_bottom",
		_goal_top() +(CHIP_BOTTOM - CHIP_TOP), d) \
				.set_trans(trans).set_ease(Tween.EASE_OUT)
	_goal_tween.tween_property(_player_chip, "modulate:a", 0.0, d * 0.35) \
			.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)





func _reset_player_chip_rect() -> void:
	if _player_chip == null:
		return
	_player_chip.offset_left = _chip_left()
	_player_chip.offset_top = _chip_top()
	_player_chip.offset_bottom = _chip_bottom()
	_player_chip.scale = Vector2.ONE
	_player_chip.modulate.a = 1.0





func _goal_card_hold_and_exit(mode: String) -> void:
	_goal_tween.chain()
	_goal_tween.set_parallel(false)


	_goal_tween.tween_interval(2.4 if mode == "wipe" else 1.8)
	_goal_tween.tween_property(_goal_card, "modulate:a", 0.0, 0.4)
	_goal_tween.tween_callback(func() -> void:
		_goal_card.visible = false



		_goal_card.rotation = 0.0
		_reset_player_chip_rect()


		_apply_plate_shape())


















const CELEB_NEW_TOP: float = GOAL_TOP - 216.0
const CELEB_NEW_BOTTOM: float = GOAL_TOP - 20.0

var _celeb_new_card: PanelContainer = null






func show_celeb_discovery(rows: Array) -> void:
	clear_celeb_discovery()
	if rows.is_empty():
		return
	_celeb_new_card = PanelContainer.new()


	var sb: StyleBoxFlat = CareerTheme.plate()
	sb.set_border_width_all(3)
	sb.border_color = CareerTheme.MONEY
	sb.set_content_margin_all(16.0)
	_celeb_new_card.add_theme_stylebox_override("panel", sb)
	if UiKit.es_horizontal():
		_celeb_new_tumbada(sb, rows[0])
		return
	_celeb_new_card.anchor_left = 0.5
	_celeb_new_card.anchor_right = 0.5
	_celeb_new_card.anchor_top = 1.0
	_celeb_new_card.anchor_bottom = 1.0
	_celeb_new_card.offset_top = CELEB_NEW_TOP - _safe_bottom
	_celeb_new_card.offset_bottom = CELEB_NEW_BOTTOM - _safe_bottom



	_celeb_new_card.offset_left = -460.0
	_celeb_new_card.offset_right = 460.0
	_celeb_new_card.grow_horizontal = Control.GROW_DIRECTION_BOTH
	_celeb_new_card.grow_vertical = Control.GROW_DIRECTION_BEGIN
	_celeb_new_card.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(_celeb_new_card)
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 10)
	col.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_celeb_new_card.add_child(col)
	var head: Label = CareerUi.plain(24, CareerTheme.MONEY)
	head.text = I18n.t("CELEBRACION NUEVA")
	head.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	col.add_child(head)
	for c in rows:
		col.add_child(_celeb_new_row(c))


	_celeb_new_card.modulate.a = 0.0
	_celeb_new_card.scale = Vector2(0.94, 0.94)
	_celeb_new_card.pivot_offset = Vector2(460.0,(CELEB_NEW_BOTTOM - CELEB_NEW_TOP) * 0.5)
	var tw: Tween = _celeb_new_card.create_tween()
	tw.set_parallel(false)
	tw.tween_interval(0.35)
	tw.set_parallel(true)
	tw.tween_property(_celeb_new_card, "modulate:a", 1.0, 0.25)
	tw.tween_property(_celeb_new_card, "scale", Vector2.ONE, 0.35) \
			.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)





























const CELEB_AIRE_H: float = 16.0

var _celeb_fila: float = -1.0
var _celeb_tween: Tween = null


func _celeb_new_tumbada(sb: StyleBoxFlat, c: Dictionary) -> void:
	sb.content_margin_left = 14.0
	sb.content_margin_right = 14.0
	sb.content_margin_top = 6.0
	sb.content_margin_bottom = 6.0
	var dcha: float = CHIP_LEFT + UiKit.side_safe_inset(get_viewport())


	var arriba: float = _cam_chip.offset_top if _cam_chip != null and is_instance_valid(_cam_chip) \
			else 312.0 + UiKit.top_safe_inset(get_viewport())
	_celeb_new_card.anchor_left = 1.0
	_celeb_new_card.anchor_right = 1.0
	_celeb_new_card.anchor_top = 0.0
	_celeb_new_card.anchor_bottom = 0.0
	_celeb_new_card.offset_top = arriba
	_celeb_new_card.offset_bottom = arriba +(CHIP_BOTTOM - CHIP_TOP)
	_celeb_new_card.offset_right = - dcha
	_celeb_new_card.grow_horizontal = Control.GROW_DIRECTION_BEGIN
	_celeb_new_card.grow_vertical = Control.GROW_DIRECTION_END
	_celeb_new_card.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(_celeb_new_card)
	var rare: int = int(c.get("rare", Achievements.RARE_COMMON))
	var rc: Color = Achievements.rarity_color(rare)
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 12)
	row.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_celeb_new_card.add_child(row)


	var star: Label = CareerUi.plain(CareerTheme.T_TITLE_MODAL, rc)
	star.text = "★"
	star.custom_minimum_size = Vector2(44, 0)
	star.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	star.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	star.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	row.add_child(star)
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 4)
	col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	col.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	col.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row.add_child(col)
	var head_row: HBoxContainer = HBoxContainer.new()
	head_row.add_theme_constant_override("separation", 18)
	head_row.mouse_filter = Control.MOUSE_FILTER_IGNORE
	col.add_child(head_row)
	var head: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.MONEY)
	head.text = I18n.t("CELEBRACION NUEVA")
	head.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	head_row.add_child(head)
	var rare_l: Label = CareerUi.plain(CareerTheme.T_CAPTION, rc)
	rare_l.text = I18n.t(Achievements.rarity_name(rare))
	head_row.add_child(rare_l)
	var name_l: Label = CareerUi.plain(CareerTheme.T_CARD, rc)
	name_l.text = CareerTheme.caps(I18n.t(String(c.get("name", ""))))
	col.add_child(name_l)



	var ancho: float = minf(_celeb_new_card.get_combined_minimum_size().x, _celeb_ancho_h())
	head.clip_text = true
	name_l.clip_text = true
	_celeb_new_card.offset_left = - dcha - ancho

	_celeb_fila = arriba
	_celeb_cede(false)
	_celeb_new_card.modulate.a = 0.0
	_celeb_new_card.scale = Vector2(0.94, 0.94)
	_celeb_new_card.pivot_offset = Vector2(ancho, CHIP_BOTTOM - CHIP_TOP) * 0.5
	var tw: Tween = _celeb_new_card.create_tween()
	tw.tween_interval(0.35)
	tw.set_parallel(true)
	tw.tween_property(_celeb_new_card, "modulate:a", 1.0, 0.25)
	tw.tween_property(_celeb_new_card, "scale", Vector2.ONE, 0.35) \
			.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)







func _celeb_cede(anima: bool = true) -> void:
	if _celeb_fila < 0.0 or _celeb_new_card == null or not is_instance_valid(_celeb_new_card) \
			or not UiKit.es_horizontal():
		return
	var y: float = _celeb_fila
	if _msg_band.visible and _msg_band.modulate.a > 0.01 and not _message_label.text.is_empty():
		var banda: Rect2 = _msg_band.get_global_rect()
		if banda.end.x + CELEB_AIRE_H > _celeb_new_card.get_global_rect().position.x \
				and banda.end.y + CELEB_AIRE_H > y:
			y = banda.end.y + CELEB_AIRE_H
	if _celeb_tween != null and _celeb_tween.is_valid():
		_celeb_tween.kill()
	var alto: float = CHIP_BOTTOM - CHIP_TOP
	if not anima:
		_celeb_new_card.offset_top = y
		_celeb_new_card.offset_bottom = y + alto
		return
	if absf(y - _celeb_new_card.offset_top) < 0.5:
		return
	_celeb_tween = _celeb_new_card.create_tween().set_parallel(true)
	_celeb_tween.tween_property(_celeb_new_card, "offset_top", y, 0.2) \
			.set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	_celeb_tween.tween_property(_celeb_new_card, "offset_bottom", y + alto, 0.2) \
			.set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)







func _celeb_ancho_h() -> float:
	var dcha: float = CHIP_LEFT + UiKit.side_safe_inset(get_viewport())
	return minf(GOAL_ANCHO_H, _vp_w() * 0.5 - MSG_LADO_H * 0.5 - dcha)




func _celeb_new_row(c: Dictionary) -> Control:
	var rare: int = int(c.get("rare", Achievements.RARE_COMMON))
	var rc: Color = Achievements.rarity_color(rare)
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 14)
	row.mouse_filter = Control.MOUSE_FILTER_IGNORE






	var star: Label = CareerUi.plain(CareerTheme.T_MONEY, rc)
	star.text = "★"
	star.custom_minimum_size = Vector2(38, 0)
	star.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	star.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	star.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	row.add_child(star)
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 4)
	col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	col.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	col.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row.add_child(col)
	var name_row: HBoxContainer = HBoxContainer.new()
	name_row.add_theme_constant_override("separation", 8)
	col.add_child(name_row)
	var name_l: Label = CareerUi.plain(24, rc)


	name_l.text = CareerTheme.caps(I18n.t(String(c.get("name", ""))))
	name_l.clip_text = true
	name_l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	name_row.add_child(name_l)
	var rare_l: Label = CareerUi.plain(16, rc)
	rare_l.text = I18n.t(Achievements.rarity_name(rare))
	rare_l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	name_row.add_child(rare_l)





	if bool(c.get("cond", false)):
		var como: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.MONEY)
		como.text = I18n.t("COMO SALE")
		col.add_child(como)
	var desc: Label = CareerUi.plain(18, CareerTheme.TEXT_DIM)
	desc.text = I18n.t(String(c.get("desc", "")))
	desc.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	col.add_child(desc)
	return row




func clear_celeb_discovery() -> void:
	if _celeb_new_card != null and is_instance_valid(_celeb_new_card):
		_celeb_new_card.queue_free()
	_celeb_new_card = null
	_celeb_fila = -1.0


























const OPEN_BAND_H: float = 460.0
const OPEN_CENTER_Y: float = 0.3

const OPEN_CREST: float = 190.0
const OPEN_SIDE_DX: float = 262.0


const OPEN_COL_W: float = 250.0


const OPEN_IN: float = 1.0
const OPEN_FADE: float = 0.45

var _open_root: Control
var _open_tw: Tween








var _open_mutes_hud: bool = false
var _open_muted: Array[Control] = []









var _kit_you: Dictionary = {}
var _kit_rival: Dictionary = {}


func set_match_kits(mio: Dictionary, suyo: Dictionary) -> void:
	_kit_you = mio
	_kit_rival = suyo



	_style_player_chip()


func _open_mute_hud() -> void:
	_open_mutes_hud = true
	for c: Control in [_score_chip, _comp_logo, _wind_chip]:
		if c != null and is_instance_valid(c) and c.visible:
			c.visible = false
			_open_muted.append(c)


func _open_unmute_hud() -> void:
	_open_mutes_hud = false
	for c: Control in _open_muted:
		if is_instance_valid(c):
			c.visible = true
	_open_muted.clear()





func show_broadcast_open(fixture: Dictionary, hold: float) -> void:
	hide_broadcast_open()
	_open_mute_hud()
	var vp: Vector2 = SceneFade.rect_visible(self).size
	var cx: float = vp.x * 0.5
	var cy: float = vp.y * OPEN_CENTER_Y
	var top: float = cy - OPEN_BAND_H * 0.5
	var acc: Color = Competitions.accent_of(fixture)








	var acc_txt: Color = CareerTheme.text_on_dark(acc)

	var entry: String = String(Competitions.style_of(fixture).get("open_entry", "telon"))

	var home: bool = bool(fixture.get("home", true))
	var left_team: Dictionary = _you_team_data if home else _rival_team_data
	var right_team: Dictionary = _rival_team_data if home else _you_team_data

	_open_root = Control.new()
	_open_root.set_anchors_preset(Control.PRESET_FULL_RECT)



	_open_root.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(_open_root)









	var band: OpenBand = OpenBand.new()
	band.position = Vector2(0.0, top)
	band.size = Vector2(vp.x, OPEN_BAND_H)
	_open_root.add_child(band)





	var mio: Dictionary = _kit_you if not _kit_you.is_empty() else GameState.player_kit()
	var suyo: Dictionary = _kit_rival if not _kit_rival.is_empty() else GameState.rival_kit()
	band.vestir(Competitions.id_of(fixture), acc, acc_txt,
		mio if home else suyo, suyo if home else mio)


	var comp: HBoxContainer = HBoxContainer.new()
	comp.add_theme_constant_override("separation", 12)
	comp.alignment = BoxContainer.ALIGNMENT_CENTER
	comp.mouse_filter = Control.MOUSE_FILTER_IGNORE
	comp.position = Vector2(0.0, top + 18.0)
	comp.size = Vector2(vp.x, 84.0)
	var logo: CompLogo = CompLogo.new()











	logo.custom_minimum_size = Vector2(150, 80)
	logo.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	logo.setup(Competitions.logo_type_of(fixture), acc)
	comp.add_child(logo)
	var comp_l: Label = Label.new()




	comp_l.text = CareerTheme.caps(I18n.t(Competitions.name_of(fixture)))
	comp_l.add_theme_font_size_override("font_size", CareerTheme.T_HUD_ROTULO if comp_l.text.length() > 12
		else CareerTheme.T_TITLE_MODAL)
	comp_l.add_theme_color_override("font_color", acc_txt)






	comp_l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	comp.add_child(comp_l)
	_open_root.add_child(comp)




	var lx: float = cx - OPEN_SIDE_DX - OPEN_COL_W * 0.5
	var rx: float = cx + OPEN_SIDE_DX - OPEN_COL_W * 0.5



	var side_y: float = top + 150.0





	var bloque: bool = entry == "deslizo" or entry == "abajo"
	var left: Control = _open_side(left_team)
	var right: Control = _open_side(right_team)
	if bloque:
		left.position = Vector2(lx, side_y)
		right.position = Vector2(rx, side_y)
	elif entry == "fiesta":
		left.position = Vector2(lx, side_y - 320.0)
		right.position = Vector2(rx, side_y + 320.0)
	else:
		left.position = Vector2(- OPEN_COL_W - 40.0, side_y)
		right.position = Vector2(vp.x + 40.0, side_y)
	_open_root.add_child(left)
	_open_root.add_child(right)



	var vs: Label = Label.new()
	vs.text = "VS"
	vs.add_theme_font_size_override("font_size", CareerTheme.T_HUD_VS)
	vs.add_theme_color_override("font_color", acc_txt)
	vs.add_theme_constant_override("outline_size", 8)
	vs.add_theme_color_override("font_outline_color", Color(0.05, 0.06, 0.08))
	vs.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	vs.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	vs.mouse_filter = Control.MOUSE_FILTER_IGNORE
	vs.size = Vector2(200.0, 80.0)
	vs.position = Vector2(cx - 100.0, side_y + OPEN_CREST * 0.5 - 40.0)


	vs.pivot_offset = vs.size * 0.5
	vs.scale = Vector2(0.4, 0.4)
	vs.modulate.a = 0.0
	_open_root.add_child(vs)






	var venue: String = Competitions.venue_of(fixture)
	var venue_l: Label = null
	if not venue.is_empty():
		venue_l = Label.new()
		venue_l.text = CareerTheme.caps(venue)








		venue_l.add_theme_font_size_override("font_size",
			18 if venue_l.text.length() > 34 else 22)
		venue_l.add_theme_color_override("font_color", Color(0.96, 0.95, 0.93, 0.72))
		venue_l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		venue_l.clip_text = true
		venue_l.mouse_filter = Control.MOUSE_FILTER_IGNORE

		venue_l.position = Vector2(0.0, top + 108.0)
		venue_l.size = Vector2(vp.x, 26.0)
		_open_root.add_child(venue_l)










	var ko: bool = GameState.fixture_is_knockout(fixture)
	var round_l: Label = Label.new()
	round_l.text = CareerTheme.caps(CareerUi.pretty_round(fixture))
	round_l.add_theme_font_size_override("font_size", CareerTheme.T_HUD_ROTULO if ko else CareerTheme.T_MONEY)
	round_l.add_theme_color_override("font_color", acc_txt if ko else CareerTheme.TEXT)


	round_l.clip_text = true
	round_l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	round_l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	round_l.position = Vector2(0.0, top + OPEN_BAND_H - 58.0)
	round_l.size = Vector2(vp.x, 40.0)
	_open_root.add_child(round_l)





	band.pivot_offset = Vector2(vp.x * 0.5, OPEN_BAND_H * 0.5)
	match entry:
		"barrido": band.scale = Vector2(0.06, 1.0)
		"martillo": band.position.y = top - OPEN_BAND_H - 40.0
		_: band.scale = Vector2(1.0, 0.06)
	comp.modulate.a = 0.0
	round_l.modulate.a = 0.0
	if venue_l:
		venue_l.modulate.a = 0.0









	logo.pivot_offset = Vector2(75, 40)
	logo.scale = Vector2(0.55, 0.55)



	if entry == "deslizo":
		_open_root.position.x = vp.x * 0.3
	elif entry == "abajo":
		_open_root.position.y = 150.0
	elif entry == "gala":
		_open_root.pivot_offset = vp * 0.5
		_open_root.scale = Vector2(1.06, 1.06)






	var out_at: float = maxf(hold - OPEN_FADE, OPEN_IN + 0.2)






	var band_dur: float = 0.3
	var side_dur: float = 0.55
	var side_delay: float = 0.12
	var side_trans: int = Tween.TRANS_CUBIC
	var vs_at: float = 0.62
	var vs_trans: int = Tween.TRANS_BACK
	match entry:
		"martillo":
			band_dur = 0.24
			side_dur = 0.42
			side_delay = 0.16
			side_trans = Tween.TRANS_BACK
			vs_at = 0.56
		"gala":
			band_dur = 0.42
			side_dur = 0.62
			side_delay = 0.16
			vs_at = 0.7
		"deslizo":
			band_dur = 0.34
			vs_at = 0.58
		"abajo":
			band_dur = 0.28
			vs_at = 0.54
			vs_trans = Tween.TRANS_CUBIC
		"barrido":
			band_dur = 0.34
			side_dur = 0.5
			side_delay = 0.1
			vs_at = 0.58
			vs_trans = Tween.TRANS_CUBIC
		"himno":
			band_dur = 0.55
			side_dur = 0.72
			side_delay = 0.22
			vs_at = 0.72
		"fiesta":
			band_dur = 0.3
			side_dur = 0.6
			side_trans = Tween.TRANS_BACK
			vs_at = 0.66
	_open_tw = create_tween()
	_open_tw.set_parallel(true)
	if entry == "martillo":
		_open_tw.tween_property(band, "position:y", top, band_dur) \
				.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	else:
		_open_tw.tween_property(band, "scale", Vector2.ONE, band_dur) \
				.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)


	if entry == "deslizo":
		_open_tw.tween_property(_open_root, "position:x", 0.0, 0.5) \
				.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	elif entry == "abajo":
		_open_tw.tween_property(_open_root, "position:y", 0.0, 0.45) \
				.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	elif entry == "gala":
		_open_tw.tween_property(_open_root, "scale", Vector2.ONE, 0.9) \
				.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	if not bloque:

		var eje: String = "position:y" if entry == "fiesta" else "position:x"
		var meta_l: float = side_y if entry == "fiesta" else lx
		var meta_r: float = side_y if entry == "fiesta" else rx
		_open_tw.tween_property(left, eje, meta_l, side_dur) \
				.set_trans(side_trans).set_ease(Tween.EASE_OUT).set_delay(side_delay)
		_open_tw.tween_property(right, eje, meta_r, side_dur) \
				.set_trans(side_trans).set_ease(Tween.EASE_OUT).set_delay(side_delay)
	_open_tw.tween_property(comp, "modulate:a", 1.0, 0.35).set_delay(0.3)

	_open_tw.tween_property(logo, "scale", Vector2.ONE, 0.42).set_delay(0.3) \
			.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)

	if venue_l:
		_open_tw.tween_property(venue_l, "modulate:a", 1.0, 0.35).set_delay(0.36)
	_open_tw.tween_property(round_l, "modulate:a", 1.0, 0.35).set_delay(0.4)


	_open_tw.tween_property(vs, "modulate:a", 1.0, 0.18).set_delay(vs_at)
	_open_tw.tween_property(vs, "scale", Vector2.ONE, 0.38).set_delay(vs_at) \
			.set_trans(vs_trans).set_ease(Tween.EASE_OUT)
	_open_tw.tween_property(_open_root, "modulate:a", 0.0, OPEN_FADE) \
			.set_trans(Tween.TRANS_SINE).set_delay(out_at)
	_open_tw.tween_callback(hide_broadcast_open).set_delay(out_at + OPEN_FADE)




func _open_side(team: Dictionary) -> Control:
	var col: VBoxContainer = VBoxContainer.new()
	col.alignment = BoxContainer.ALIGNMENT_CENTER
	col.add_theme_constant_override("separation", 10)
	col.mouse_filter = Control.MOUSE_FILTER_IGNORE
	col.size = Vector2(OPEN_COL_W, OPEN_CREST + 52.0)
	var medal: PanelContainer = PanelContainer.new()
	medal.size_flags_horizontal = Control.SIZE_SHRINK_CENTER






	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = Color(0, 0, 0, 0)
	sb.set_content_margin_all(12)
	medal.add_theme_stylebox_override("panel", sb)
	medal.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var crest: CrestView = CrestView.new()
	crest.custom_minimum_size = Vector2(OPEN_CREST - 34.0, OPEN_CREST - 34.0)
	crest.mouse_filter = Control.MOUSE_FILTER_IGNORE



	if not team.is_empty():
		crest.set_team(team)
	else:
		crest.visible = false
	medal.add_child(crest)
	col.add_child(medal)
	var name_l: Label = Label.new()










	var raw: String = CareerTheme.caps(Nations.team_label(team, String(team.get("abbrev", ""))))
	name_l.text = _open_wrap(raw)
	name_l.custom_minimum_size = Vector2(OPEN_COL_W, 0.0)


	var longest: int = 1
	for line in name_l.text.split("\n"):
		longest = maxi(longest, String(line).length())
	name_l.add_theme_font_size_override("font_size",
		clampi(int(OPEN_COL_W / float(longest)) - 2, 15, 30))
	name_l.add_theme_color_override("font_color", CareerTheme.TEXT)




	name_l.add_theme_color_override("font_shadow_color",
		Color(OpenBand.FONDO.r, OpenBand.FONDO.g, OpenBand.FONDO.b, 0.95))
	name_l.add_theme_constant_override("shadow_offset_x", 3)
	name_l.add_theme_constant_override("shadow_offset_y", 3)
	name_l.add_theme_constant_override("shadow_outline_size", 0)
	name_l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	name_l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	col.add_child(name_l)
	return col





func _open_wrap(s: String) -> String:
	if s.length() <= 10 or not s.contains(" "):
		return s
	var best: int = -1
	for i in s.length():
		if s[i] != " ":
			continue
		if best < 0 or absf(float(i) - float(s.length()) * 0.5) \
				< absf(float(best) - float(s.length()) * 0.5):
			best = i
	if best < 0:
		return s
	return s.substr(0, best) + "\n" + s.substr(best + 1)





func hide_broadcast_open() -> void:
	if _open_tw and _open_tw.is_valid():
		_open_tw.kill()
	_open_tw = null
	if is_instance_valid(_open_root):
		_open_root.queue_free()
	_open_root = null
	_open_unmute_hud()







































const REC_MARGIN: float = 34.0
const REC_BRACKET: float = 76.0
const REC_BRACKET_W: float = 4.0
const REC_DOT: float = 20.0
const REC_FADE: float = 0.18
const REC_BLINK: float = 0.7



const REC_VEIL: Color = Color(0.0, 0.0, 0.0, 0.45)




const REC_FOCUS: float = 360.0
const REC_FOCUS_ARM: float = 34.0
const REC_FOCUS_W: float = 3.0
const REC_FOCUS_OPEN: float = 1.45
const REC_FOCUS_T: float = 0.5





const REC_ZOOM_H: float = 300.0
const REC_ZOOM_TICKS: int = 9
const REC_ZOOM_W: float = 16.0

var _rec_root: Control
var _rec_tw: Tween
var _rec_blink_tw: Tween
var _rec_focus_tw: Tween
var _rec_clock: Label
var _rec_zoom_tick: ColorRect
var _rec_zoom_y0: float = 0.0




var _rec_mutes_hud: bool = false
var _rec_muted: Array = []






func _rec_mute_hud() -> void:
	_rec_mutes_hud = true
	_rec_muted.clear()






	if not RenderingServer.frame_pre_draw.is_connected(_rec_barre_hud):
		RenderingServer.frame_pre_draw.connect(_rec_barre_hud)
	_rec_barre_hud()





	if _msg_band != null and is_instance_valid(_msg_band):
		_msg_band.self_modulate.a = 0.0
	if _message_label != null and is_instance_valid(_message_label):
		_message_label.self_modulate.a = 0.0









func _rec_barre_hud() -> void:





	if not is_inside_tree():
		return




	var chips: Array = [_score_chip, _comp_logo, _wind_chip, _rating_chip,
		_momentum_chip, _chance_chip, _mode_chip, _stage_chip,
		_cam_chip, _cam_label, _cancel_chip, _player_chip, _heat_bar, _pause_button,
		_fly_label]
	for c in chips:
		if c != null and is_instance_valid(c) and c.visible:
			c.visible = false



			if not _rec_muted.has(c):
				_rec_muted.append(c)


func _rec_unmute_hud() -> void:
	_rec_mutes_hud = false
	if RenderingServer.frame_pre_draw.is_connected(_rec_barre_hud):
		RenderingServer.frame_pre_draw.disconnect(_rec_barre_hud)
	for c in _rec_muted:
		if c != null and is_instance_valid(c):
			c.visible = true
	_rec_muted.clear()
	if _msg_band != null and is_instance_valid(_msg_band):
		_msg_band.self_modulate.a = 1.0
	if _message_label != null and is_instance_valid(_message_label):
		_message_label.self_modulate.a = 1.0


func show_broadcast_rec() -> void:
	hide_broadcast_rec()
	_rec_mute_hud()
	var vp: Vector2 = SceneFade.rect_visible(self).size
	_rec_root = Control.new()
	_rec_root.set_anchors_preset(Control.PRESET_FULL_RECT)



	_rec_root.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(_rec_root)



	_rec_root.add_child(_vignette_rect(REC_VEIL))
	for corner in [Vector2(0.0, 0.0), Vector2(1.0, 0.0),
			Vector2(0.0, 1.0), Vector2(1.0, 1.0)]:
		_rec_bracket(vp, corner)
	var focus: Control = _rec_focus_box(vp)
	_rec_zoom_scale(vp)









	var row: Control = Control.new()
	row.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row.position = Vector2(REC_MARGIN + 6.0, REC_MARGIN + REC_BRACKET + 14.0)
	row.size = Vector2(420.0, 34.0)
	_rec_root.add_child(row)
	var dot: Panel = Panel.new()
	var dot_sb: StyleBoxFlat = StyleBoxFlat.new()
	dot_sb.bg_color = CareerTheme.DANGER


	dot_sb.set_corner_radius_all(int(REC_DOT * 0.5))
	dot.add_theme_stylebox_override("panel", dot_sb)
	dot.mouse_filter = Control.MOUSE_FILTER_IGNORE
	dot.position = Vector2(0.0,(34.0 - REC_DOT) * 0.5)
	dot.size = Vector2(REC_DOT, REC_DOT)
	row.add_child(dot)
	var rec_l: Label = Label.new()




	rec_l.text = "REC"
	rec_l.add_theme_font_size_override("font_size", CareerTheme.T_HEAD)
	rec_l.add_theme_color_override("font_color", CareerTheme.TEXT)
	rec_l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	rec_l.position = Vector2(REC_DOT + 12.0, 0.0)
	rec_l.size = Vector2(120.0, 34.0)
	rec_l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	row.add_child(rec_l)









	_rec_clock = Label.new()
	_rec_clock.text = "00:00:00:00"
	_rec_clock.add_theme_font_size_override("font_size", CareerTheme.T_DIM)
	_rec_clock.add_theme_color_override("font_color", CareerTheme.TEXT_DIM)
	_rec_clock.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_rec_clock.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	_rec_clock.position = Vector2(REC_DOT + 108.0, 0.0)
	_rec_clock.size = Vector2(280.0, 34.0)
	row.add_child(_rec_clock)
	_rec_camera_id(vp)





	_rec_root.modulate.a = 0.0 if not Settings.reduce_motion else 1.0
	_rec_tw = create_tween()
	_rec_tw.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	_rec_tw.set_ignore_time_scale(true)
	_rec_tw.set_parallel(true)
	if not Settings.reduce_motion:
		_rec_tw.tween_property(_rec_root, "modulate:a", 1.0, REC_FADE)


	_rec_tw.tween_method(_rec_set_clock, 0.0, 60.0, 60.0)
	if Settings.reduce_motion:
		return
	_rec_blink_tw = create_tween()
	_rec_blink_tw.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	_rec_blink_tw.set_ignore_time_scale(true)
	_rec_blink_tw.set_loops()
	_rec_blink_tw.tween_property(dot, "modulate:a", 0.25, REC_BLINK) \
			.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	_rec_blink_tw.tween_property(dot, "modulate:a", 1.0, REC_BLINK) \
			.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)




	focus.scale = Vector2.ONE * REC_FOCUS_OPEN
	focus.modulate.a = 0.0


	_rec_tw.tween_property(focus, "scale", Vector2.ONE, REC_FOCUS_T) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	_rec_tw.tween_property(focus, "modulate:a", 1.0, REC_FOCUS_T * 0.6)




	_rec_focus_tw = create_tween()
	_rec_focus_tw.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	_rec_focus_tw.set_ignore_time_scale(true)
	_rec_focus_tw.set_loops()
	_rec_focus_tw.tween_interval(REC_FOCUS_T)
	_rec_focus_tw.tween_property(focus, "scale", Vector2.ONE * 1.03, 1.1) \
			.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	_rec_focus_tw.tween_property(focus, "scale", Vector2.ONE, 1.1) \
			.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)




func _rec_bracket(vp: Vector2, corner: Vector2) -> void:
	var cx: float = REC_MARGIN if corner.x == 0.0 else vp.x - REC_MARGIN
	var cy: float = REC_MARGIN if corner.y == 0.0 else vp.y - REC_MARGIN
	var col: Color = Color(CareerTheme.TEXT, 0.85)
	var arm_h: ColorRect = ColorRect.new()
	arm_h.color = col
	arm_h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	arm_h.position = Vector2(cx if corner.x == 0.0 else cx - REC_BRACKET,
		cy if corner.y == 0.0 else cy - REC_BRACKET_W)
	arm_h.size = Vector2(REC_BRACKET, REC_BRACKET_W)
	_rec_root.add_child(arm_h)
	var arm_v: ColorRect = ColorRect.new()
	arm_v.color = col
	arm_v.mouse_filter = Control.MOUSE_FILTER_IGNORE
	arm_v.position = Vector2(cx if corner.x == 0.0 else cx - REC_BRACKET_W,
		cy if corner.y == 0.0 else cy - REC_BRACKET)
	arm_v.size = Vector2(REC_BRACKET_W, REC_BRACKET)
	_rec_root.add_child(arm_v)









func _rec_focus_box(vp: Vector2) -> Control:
	var box: Control = Control.new()
	box.mouse_filter = Control.MOUSE_FILTER_IGNORE
	box.size = Vector2(REC_FOCUS, REC_FOCUS)
	box.position = Vector2((vp.x - REC_FOCUS) * 0.5, vp.y * 0.46 - REC_FOCUS * 0.5)
	box.pivot_offset = Vector2(REC_FOCUS, REC_FOCUS) * 0.5
	_rec_root.add_child(box)
	var col: Color = Color(CareerTheme.TEXT, 0.7)
	for corner in [Vector2(0.0, 0.0), Vector2(1.0, 0.0),
			Vector2(0.0, 1.0), Vector2(1.0, 1.0)]:
		var cx: float = 0.0 if corner.x == 0.0 else REC_FOCUS
		var cy: float = 0.0 if corner.y == 0.0 else REC_FOCUS
		var h: ColorRect = ColorRect.new()
		h.color = col
		h.mouse_filter = Control.MOUSE_FILTER_IGNORE
		h.position = Vector2(cx if corner.x == 0.0 else cx - REC_FOCUS_ARM,
			cy if corner.y == 0.0 else cy - REC_FOCUS_W)
		h.size = Vector2(REC_FOCUS_ARM, REC_FOCUS_W)
		box.add_child(h)
		var v: ColorRect = ColorRect.new()
		v.color = col
		v.mouse_filter = Control.MOUSE_FILTER_IGNORE
		v.position = Vector2(cx if corner.x == 0.0 else cx - REC_FOCUS_W,
			cy if corner.y == 0.0 else cy - REC_FOCUS_ARM)
		v.size = Vector2(REC_FOCUS_W, REC_FOCUS_ARM)
		box.add_child(v)
	var mid: Vector2 = Vector2(REC_FOCUS, REC_FOCUS) * 0.5
	var cross_col: Color = Color(CareerTheme.TEXT, 0.4)
	var ch: ColorRect = ColorRect.new()
	ch.color = cross_col
	ch.mouse_filter = Control.MOUSE_FILTER_IGNORE
	ch.position = mid - Vector2(12.0, 1.0)
	ch.size = Vector2(24.0, 2.0)
	box.add_child(ch)
	var cv: ColorRect = ColorRect.new()
	cv.color = cross_col
	cv.mouse_filter = Control.MOUSE_FILTER_IGNORE
	cv.position = mid - Vector2(1.0, 12.0)
	cv.size = Vector2(2.0, 24.0)
	box.add_child(cv)
	return box





func _rec_zoom_scale(vp: Vector2) -> void:
	var x: float = vp.x - REC_MARGIN - REC_ZOOM_W - 6.0
	var y0: float = vp.y * 0.5 - REC_ZOOM_H * 0.5
	_rec_zoom_y0 = y0
	var col: Color = Color(CareerTheme.TEXT, 0.5)
	for i in REC_ZOOM_TICKS:
		var t: ColorRect = ColorRect.new()
		t.color = col
		t.mouse_filter = Control.MOUSE_FILTER_IGNORE

		var long: bool =(i == 0 or i == REC_ZOOM_TICKS - 1)
		t.size = Vector2(REC_ZOOM_W if long else REC_ZOOM_W * 0.55, 2.0)
		t.position = Vector2(x +(0.0 if long else REC_ZOOM_W * 0.45),
			y0 + REC_ZOOM_H * float(i) / float(REC_ZOOM_TICKS - 1))
		_rec_root.add_child(t)
	_rec_zoom_tick = ColorRect.new()
	_rec_zoom_tick.color = Color(CareerTheme.TEXT, 0.9)
	_rec_zoom_tick.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_rec_zoom_tick.size = Vector2(REC_ZOOM_W + 10.0, 4.0)
	_rec_zoom_tick.position = Vector2(x - 10.0, y0 + REC_ZOOM_H * 0.5)
	_rec_root.add_child(_rec_zoom_tick)





func _rec_camera_id(vp: Vector2) -> void:
	var y: float = REC_MARGIN + REC_BRACKET + 14.0
	var pila_w: float = 34.0
	var lab: Label = Label.new()
	lab.text = "CAM 1"
	lab.add_theme_font_size_override("font_size", CareerTheme.T_CAPTION)
	lab.add_theme_color_override("font_color", CareerTheme.TEXT_DIM)
	lab.mouse_filter = Control.MOUSE_FILTER_IGNORE
	lab.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	lab.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	lab.size = Vector2(160.0, 26.0)
	lab.position = Vector2(vp.x - REC_MARGIN - 6.0 - pila_w - 10.0 - 160.0, y)
	_rec_root.add_child(lab)


	var x0: float = vp.x - REC_MARGIN - 6.0 - pila_w
	var shell: Panel = Panel.new()
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = Color(0, 0, 0, 0.0)
	sb.border_color = Color(CareerTheme.TEXT, 0.6)
	sb.set_border_width_all(2)
	sb.set_corner_radius_all(2)
	shell.add_theme_stylebox_override("panel", sb)
	shell.mouse_filter = Control.MOUSE_FILTER_IGNORE
	shell.position = Vector2(x0, y + 4.0)
	shell.size = Vector2(pila_w, 18.0)
	_rec_root.add_child(shell)
	for i in 3:
		var cell: ColorRect = ColorRect.new()
		cell.color = Color(CareerTheme.TEXT, 0.6)
		cell.mouse_filter = Control.MOUSE_FILTER_IGNORE
		cell.position = Vector2(x0 + 4.0 + float(i) * 9.0, y + 8.0)
		cell.size = Vector2(7.0, 10.0)
		_rec_root.add_child(cell)
	var nub: ColorRect = ColorRect.new()
	nub.color = Color(CareerTheme.TEXT, 0.6)
	nub.mouse_filter = Control.MOUSE_FILTER_IGNORE
	nub.position = Vector2(x0 + pila_w, y + 8.0)
	nub.size = Vector2(3.0, 10.0)
	_rec_root.add_child(nub)






func set_broadcast_zoom(t: float) -> void:
	if not is_instance_valid(_rec_zoom_tick):
		return

	_rec_zoom_tick.position.y = _rec_zoom_y0 \
			+ REC_ZOOM_H *(1.0 - clampf(t, 0.0, 1.0)) - 1.0





func _rec_set_clock(t: float) -> void:
	if not is_instance_valid(_rec_clock):
		return
	var s: int = int(t)
	var f: int = int((t - float(s)) * 25.0)
	_rec_clock.text = "00:%02d:%02d:%02d" % [s / 60, s % 60, f]


func hide_broadcast_rec() -> void:
	if _rec_tw and _rec_tw.is_valid():
		_rec_tw.kill()
	_rec_tw = null
	if _rec_blink_tw and _rec_blink_tw.is_valid():
		_rec_blink_tw.kill()
	_rec_blink_tw = null
	if _rec_focus_tw and _rec_focus_tw.is_valid():
		_rec_focus_tw.kill()
	_rec_focus_tw = null
	_rec_clock = null
	_rec_zoom_tick = null
	if is_instance_valid(_rec_root):
		_rec_root.queue_free()
	_rec_root = null



	if _rec_mutes_hud or not _rec_muted.is_empty():
		_rec_unmute_hud()






























func callar_instrucciones(on: bool) -> void:
	_calladas = maxi(_calladas +(1 if on else -1), 0)
	var callado: bool = _calladas > 0
	if _chance_chip != null:

		_chance_chip.visible = _practice and not callado \
				and _chance_label != null and not _chance_label.text.is_empty()
	if _hint_label != null:
		_hint_label.visible = not callado




	if _wind_chip != null and is_instance_valid(_wind_chip):
		if callado and _wind_chip.visible:
			_wind_chip.visible = false
			_wind_callado = true
		elif not callado and _wind_callado:
			_wind_callado = false
			_wind_chip.visible = not _open_mutes_hud and not _rec_mutes_hud \
					and not _dianas_on









func set_academia(on: bool) -> void:
	_academia = on
	if _score_chip != null:
		_score_chip.visible = not on
	if _comp_logo != null:
		_comp_logo.visible = not on
	if on and _cam_chip != null:
		_cam_chip.visible = false
