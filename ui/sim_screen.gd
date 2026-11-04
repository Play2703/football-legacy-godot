class_name SimScreen
extends CanvasLayer
















const SPEED_LEVELS: Array[int] = [1, 2, 3]





const SPEED_FACTORS: Array[float] = [1.0, 2.0, 2.4]










const FADE_TOP: float = 1.0
const FADE_REST: float = 0.72


const HISTORY_MAX: int = 300







const RUIDO_PILA: Array[String] = ["assist", "assist_rival"]


const TAP_SLOP: float = 24.0











const BODY_MIX: float = 0.45














const KEYWORDS: Array[Dictionary] = [

	{"w": "FINAL DEL PARTIDO", "c": UiKit.INK_HI},
	{"w": "DESCANSO", "c": UiKit.INK_HI},
	{"w": "GOOOL", "c": UiKit.GOLD},
	{"w": "GOLAZO", "c": UiKit.GOLD},
	{"w": "GOLES", "c": UiKit.GOLD},
	{"w": "GOL", "c": UiKit.GOLD},
	{"w": "ASISTENCIA", "c": UiKit.GOLD},
	{"w": "ASISTE", "c": UiKit.GOLD},

	{"w": "ATAJADÓN", "c": UiKit.CYAN},
	{"w": "PARADA", "c": UiKit.CYAN},
	{"w": "POSTE", "c": UiKit.CYAN},
	{"w": "TRAVESAÑO", "c": UiKit.CYAN},
	{"w": "CABECEA", "c": UiKit.CYAN},
	{"w": "REMATA", "c": UiKit.CYAN},
	{"w": "REMATE", "c": UiKit.CYAN},
	{"w": "DISPARO", "c": UiKit.CYAN},
	{"w": "TIRO LIBRE", "c": UiKit.CYAN},
	{"w": "CÓRNER", "c": UiKit.CYAN},
	{"w": "PENAL", "c": UiKit.CYAN},
	{"w": "ENTRA", "c": UiKit.CYAN},
	{"w": "CAMBIO", "c": UiKit.CYAN},

	{"w": "FUERA DE JUEGO", "c": UiKit.DANGER},
	{"w": "LESIONADO", "c": UiKit.DANGER},
	{"w": "AMARILLA", "c": UiKit.DANGER},
	{"w": "ROJA", "c": UiKit.DANGER},
	{"w": "EXPULSADO", "c": UiKit.DANGER},
	{"w": "LESIÓN", "c": UiKit.DANGER},
	{"w": "FALTA", "c": UiKit.DANGER},
	{"w": "PÉRDIDA", "c": UiKit.DANGER},
]





















const DIV_BCAST: Dictionary = {
	1: {"motif": true, "watermark": true, "glows": true, "bug_glow": true,
		"dominio": true, "goal_flair": true},
	2: {"motif": true, "watermark": true, "glows": false, "bug_glow": true,
		"dominio": true, "goal_flair": true},
	3: {"motif": false, "watermark": false, "glows": false, "bug_glow": false,
		"dominio": false, "goal_flair": false},
}

var _bcfg: Dictionary = DIV_BCAST[1]
var _dominio_band: Control

signal speed_changed(mult: float)
signal skip_requested







signal pause_requested





signal replay_requested(gol_id: int)


signal style_changed(index: int)
signal intensity_changed(index: int)




signal substitution_requested







signal tapa_cambia(tapa: bool)


var _bg_grad: Gradient
var _glow_rival: TextureRect
var _glow_rival_grad: Gradient
var _glow_you: TextureRect
var _glow_you_grad: Gradient
var _bug_glow: TextureRect
var _bug_glow_grad: Gradient
var _comp_watermark: CompLogo
var _pitch_motif: Control



var _tema: String = "liga"




















var _plate_motif: Control
var _plate_anim: Control
var _plate_campo: Control
var _lienzo: Control


const CAPA_TODO: int = 0
const CAPA_SUELO: int = 1
const CAPA_VIVA: int = 2
const CAPA_CAL: int = 3





var _t_fondo: float = 0.0



var _halo_tex: GradientTexture2D


var _div: int = 1


var _sb_paneles: Array[StyleBoxFlat] = []


func _tick_fondo() -> void:

	if _plate_anim == null or not _plate_anim.is_visible_in_tree():
		return
	_t_fondo = float(Time.get_ticks_msec()) / 1000.0
	_plate_anim.queue_redraw()




var _accent: Color = UiKit.GOLD
var _you_accent: Color = UiKit.CYAN
var _rival_accent: Color = UiKit.GOLD














var _eventos: Array[Dictionary] = [{}, {}]











var _goles: Array[Dictionary] = []







var _hito_pend: Dictionary = {}
var _you_team: Dictionary = {}
var _rival_team: Dictionary = {}



var _bug: PanelContainer





var _bug_band: OpenBand
var _comp_cap: PanelContainer
var _comp_cap_sb: StyleBoxFlat
var _comp_logo: CompLogo
var _comp_name: Label
var _round_chip: Label
var _venue_label: Label
var _minute_label: Label
var _you_crest: CrestView
var _rival_crest: CrestView
var _you_medal_sb: StyleBoxFlat
var _rival_medal_sb: StyleBoxFlat
var _you_name: Label
var _rival_name: Label
var _score_label: Label













var _pulso_zona: Control

























var _gol_bug: Control


var _score_row: Control
var _gol_bug_in: Control
var _gol_bug_bg: ColorRect
var _gol_bug_patch: KitPatch
var _gol_bug_label: Label



var _gol_bug_side: HBoxContainer
var _gol_bug_crest: CrestView
var _gol_bug_abbr: Label
var _gol_bug_tw: Tween












var _gol_bug_brillo: ColorRect
var _gol_bug_fx_tw: Tween







var _gol_bug_segunda: ColorRect
var _gol_bug_rayas: Array[ColorRect] = []
var _gol_bug_letras: Control
var _gol_bug_chispas: Array[ColorRect] = []
const BUG_RAYAS: int = 5
const BUG_CHISPAS: int = 22


const BUG_LETRA_PASO: float = 0.06

const BUG_GRITO_ESCALA: float = 1.3











const GRITO_CAIDA: int = 0
const GRITO_SELLO: int = 1
const GRITO_DERRAPE: int = 2
const GRITO_MUELLE: int = 3
const GRITO_ESTILOS: int = 4

var gol_estilo_forzado: int = -1

var gol_estilo_ultimo: int = -1


var _gol_pop_tw: Tween



const BUG_IN: float = 0.32
const BUG_HOLD: float = 1.05
const BUG_OUT: float = 0.26

const BUG_CREST: float = 38.0



var _agg_band: Control
var _agg_label: Label
var _leg1: Array = []




var _ko_seed: int = 0


















var _pulso_fila: Control



var _pulso_graf: GraficoPulso










var _rot_local: ColorRect
var _rot_visita: ColorRect










var _pulso_hist: PackedFloat32Array = PackedFloat32Array()


var _pulso_total: int = PULSO_MIN_REG



var _pulso_idx: int = -1

var _pulso_eje: Control











var _pulso_peso: PackedFloat32Array = PackedFloat32Array()
var _pulso_lado: PackedByteArray = PackedByteArray()





var _pulso_kind: PackedStringArray = PackedStringArray()



var _pulso_ilado: PackedByteArray = PackedByteArray()
var _pulso_irank: PackedByteArray = PackedByteArray()

var _marcas_local: Control
var _marcas_visita: Control




var _soy_local: bool = true

var _relato_host: Control



var _you_sub: Label
var _riv_sub: Label
var _pila_filas: Array[Dictionary] = []
var _hist: Array[Dictionary] = []
var _dom_box: Control
var _live_box: Control


var _card: PanelContainer
var _card_min: String = ""



var _lineas: int = 0




var _ultimas: PackedStringArray = PackedStringArray()
var _card_txt: String = ""
var _card_col: Color = UiKit.INK_BODY


var _card_rid: int = -1


var _card_kind: String = ""

var _card_team: String = ""

var _pila_sb: Dictionary = {}
var _prev_min: Label
var _prev_text: Label
var _tira_tw: Tween
var _dom_value: Label

var _dom_club: Label


var _poss_you: float = 0.5




















var _dom_you: float = 0.5


var _you_goals: int = 0
var _rival_goals: int = 0
var _diff: int = 0








var _energy_meter: Control
var _energy_fill: ColorRect


const BARRA_H: float = 18.0
var _energy_pct: Label
var _energy_frac: float = 1.0
var _energy_low: bool = false
var _energy_pulse_tw: Tween










const NOTA_FONT: int = CareerTheme.T_TITLE_MODAL
var _rating_label: Label
var _rating_value: float = 6.0




var _rating_hist: PackedFloat32Array = PackedFloat32Array()
var _rating_shown: float = 6.0
var _rating_target: float = 6.0
var _rating_delta: Label

var _nota_ecg: NotaEcg


var _nota_zona: int = -1

var _dom_tw: Tween




var _dom_shown: float = 0.5
var _rating_tw: Tween

















const SIM_BED_DB: float = -27.0
const SIM_BED_SUBE: float = 5.0






const SIM_LLENADO: Dictionary = {1: 0.88, 2: 0.72, 3: 0.55}

var _bed: AudioStreamPlayer = null

var _minute: int = 0




var _minute_extra: int = 0


var _clock_sb: StyleBoxFlat
var _half_label: Label
var _tic: Timer
var _tic_on: bool = true



const RELOJ_TENSO: int = 80







var _kw_cache: Array[Dictionary] = []
var _kw_locale: String = ""
var _drag_amount: float = 0.0
var _dragging: bool = false
var _live_dot: ColorRect


var _speed_btn: Button
var _sub_btn: Button
var _sub_word: Label
var _style_tile: Button
var _intensity_tile: Button


var _pause_tomada: bool = false





var _sub_locked: bool = false













var _sub_tone_col: Color = UiKit.GOLD

var _sub_fill: ColorRect


var _sub_icon: MenuIcon


const SUB_ICON: float = 34.0
var _sub_hold_tw: Tween




const SUB_HOLD_SECONDS: float = 0.45

var _sub_tone: int = -1




var _sub_hold: bool = false
var _speed_idx: int = 0
var _root: Control
var _flash: ColorRect
var _tap: Control










var _fade_tw: Tween




var _telon_lleno: bool = false

var _tapa: bool = false





















const STYLE_PALETTES: Array = [UiKit.BTN_BLUE, UiKit.BTN_AMBER, UiKit.BTN_RED]




const INTENSITY_PALETTES: Array = [UiKit.BTN_BLUE, UiKit.BTN_AMBER, UiKit.BTN_RED]














const STYLE_ICONS: Array[String] = ["pared", "partido", "target"]
const INTENSITY_ICONS: Array[String] = ["ritmo_1", "ritmo_2", "ritmo_3"]


const SEG_ICON: float = 26.0







var _on_pitch: bool = true


var _lesionado: bool = false





var _titular: bool = true





var _he_entrado: bool = false




func _ready() -> void:
	_build_ui()
	_root.visible = false



	_root.add_to_group(Entrada.CAPA_GROUP)





	_root.set_meta(Entrada.A_AVANZA_META, true)



	var vecina: _Vecina = _Vecina.new()
	vecina.name = "VecinaVelocidad"
	vecina.cambia = _fl_velocidad
	vecina.add_to_group("fl_vecina")
	_root.add_child(vecina)


	_root.visibility_changed.connect(_avisa_tapa)
	visibility_changed.connect(_avisa_tapa)


	set_process(false)

































const DANGER_PULSE_HZ: float = 2.6
const DANGER_KNOB: float = 0.55
const DANGER_DIM: float = 0.45

var _danger: float = 0.0
var _danger_t: float = 0.0





func set_danger(v: float) -> void:
	var nv: float = clampf(v, -1.0, 1.0)
	if is_equal_approx(nv, _danger):
		return
	_danger = nv





	_danger_t = 0.0
	if is_zero_approx(_danger):
		set_process(false)
		_danger_rest()
		return
	set_process(true)




func _danger_rest() -> void:
	if _dom_value != null:
		_dom_value.scale = Vector2.ONE
		_dom_value.modulate = Color.WHITE


func _process(delta: float) -> void:
	if is_zero_approx(_danger) or _dom_value == null:
		return
	_danger_t += delta



	var k: float = absf(_danger) \
			*(0.5 - 0.5 * cos(_danger_t * DANGER_PULSE_HZ * TAU))




	_dom_value.pivot_offset = _dom_value.size * 0.5
	_dom_value.scale = Vector2(1.0 + DANGER_KNOB * k, 1.0 + DANGER_KNOB * k)
	_dom_value.modulate = Color.WHITE.lightened(0.35 * k) if _danger > 0.0 \
			else Color.WHITE.darkened(DANGER_DIM * k)







func nuevo_partido() -> void:
	_hist.clear()
	_pulso_hist = PackedFloat32Array()
	_pulso_peso = PackedFloat32Array()
	_pulso_lado = PackedByteArray()
	_pulso_kind = PackedStringArray()
	_pulso_ilado = PackedByteArray()
	_pulso_irank = PackedByteArray()
	_pinta_marcas()



	if _pulso_total != PULSO_MIN_REG and _pulso_fila != null:
		_pulso_total = PULSO_MIN_REG
		_rehace_pulso()
	else:
		_pulso_total = PULSO_MIN_REG
	_pulso_idx = -1
	_rating_hist = PackedFloat32Array()



	_titular = true
	_he_entrado = false


	_pinta_pila()
	_pinta_pulso()








func begin(you_team: Dictionary, rival_team: Dictionary, div: int = 1,
		keep: bool = false) -> void:



	_tap.mouse_filter = Control.MOUSE_FILTER_STOP



	if not keep:
		_root.set_meta(Entrada.A_AVANZA_META, true)


	_bcfg = DIV_BCAST.get(clampi(div, 1, 3), DIV_BCAST[3])
	_div = clampi(div, 1, 3)
	_arranca_grada(div)
	_pitch_motif.visible = bool(_bcfg["motif"])
	_comp_watermark.visible = bool(_bcfg["watermark"])
	_glow_you.visible = bool(_bcfg["glows"])
	_glow_rival.visible = bool(_bcfg["glows"])
	_bug_glow.visible = bool(_bcfg["bug_glow"])








	Music.play(Competitions.music_of(GameState.current_fixture()), 0.9)
	_tune_music()

	_you_team = you_team
	_rival_team = rival_team





	_you_crest.set_team(you_team)
	_rival_crest.set_team(rival_team)




	_you_name.text = CareerTheme.caps(Nations.team_label(you_team, I18n.t("TÚ")))
	_rival_name.text = CareerTheme.caps(Nations.team_label(rival_team, I18n.t("RIVAL")))

	var fx: Dictionary = GameState.current_fixture()
	var accent: Color = Competitions.accent_of(fx)
	_accent = accent
	_tema = Competitions.id_of(fx)




	_you_accent = _side_tint(you_team, UiKit.CYAN)
	_rival_accent = _side_tint(rival_team, accent)



	var yid: String = String(you_team.get("id", ""))
	var rid: String = String(rival_team.get("id", ""))
	if _riv_sub != null:
		_riv_sub.text = ScenarioStore.formation_of(rid)
	if _you_sub != null:
		_you_sub.text = ScenarioStore.formation_of(yid)
	_reencaja.call_deferred()




	if Teams.kits_clash(_you_accent, _rival_accent):


		var kit2: Color = rival_team.get("kit2", Color.WHITE)
		_rival_accent = _vivid(kit2)
		if Teams.kits_clash(_you_accent, _rival_accent):
			_rival_accent = _vivid(accent)
		if Teams.kits_clash(_you_accent, _rival_accent):
			_rival_accent = UiKit.GOLD








	_soy_local = bool(fx.get("home", true))
	if _rot_local != null:
		_rot_local.color = _you_accent if _soy_local else _rival_accent
		_rot_visita.color = _rival_accent if _soy_local else _you_accent


	_pinta_marcas()




	_comp_name.text = I18n.t(Competitions.name_of(fx))
	_comp_logo.setup(Competitions.logo_type_of(fx), CareerTheme.TEXT)






	var venue: String = Competitions.venue_of(fx)
	var round_txt: String = Competitions.round_of(fx)
	_round_chip.text = MatchStrip.round_display(round_txt)





	_leg1 = GameState.your_first_leg(fx)
	_ko_seed = 0
	if GameState.tie_rule(fx) == "sembrado":
		_ko_seed = 1 if GameState.liguilla_you_better(String(fx.get("opp", ""))) else -1
	_agg_band.visible = not _leg1.is_empty()
	_update_agg()
	_venue_label.text = venue
	_venue_label.visible = not venue.is_empty()


	_bg_grad.colors = PackedColorArray([
		SUP_FONDO.lerp(accent, 0.32), SUP_FONDO.lerp(accent, 0.1), SUP_FONDO])
	_glow_rival_grad.colors = PackedColorArray([
		Color(_rival_accent.r, _rival_accent.g, _rival_accent.b, 0.9),
		Color(_rival_accent.r, _rival_accent.g, _rival_accent.b, 0.0)])
	_bug_glow_grad.colors = PackedColorArray([
		Color(accent.r, accent.g, accent.b, 0.6), Color(accent.r, accent.g, accent.b, 0.0)])
	_comp_watermark.setup(Competitions.logo_type_of(fx), accent)





	var style: Dictionary = Competitions.style_of(fx)





	_comp_watermark.modulate.a = float(style.get("mark", 0.2))






	var stage: String = Competitions.stage_of(fx)
	_round_chip.add_theme_color_override("font_color",
		_claro(accent) if not stage.is_empty() else UiKit.INK_DIM)
	_round_chip.add_theme_font_size_override("font_size", 24 if not stage.is_empty() else 18)
	_pitch_motif.queue_redraw()


	for capa: Control in [_plate_motif, _plate_anim, _plate_campo]:
		if capa != null:
			capa.queue_redraw()





	_viste_bug(accent)


	var acc_txt: Color = CareerTheme.text_on_dark(accent)
	_clock_sb.border_color = acc_txt
	_half_label.add_theme_color_override("font_color", acc_txt)



	for psb: StyleBoxFlat in _sb_paneles:
		psb.bg_color = SUP_PANEL.lerp(accent, 0.22)
		psb.border_color = SUP_FILO.lerp(accent, 0.45)
	var tab_pal: Dictionary = {"bg": SUP_ELEVADO.lerp(accent, 0.24),
		"border": SUP_FILO.lerp(accent, 0.5), "pressed": SUP_PANEL.lerp(accent, 0.24)}
	for tb: Button in _tab_btns:
		UiKit.style_button(tb, tab_pal)


	_you_name.add_theme_color_override("font_color", _tinta(_you_accent))

	_glow_you_grad.colors = PackedColorArray([
		Color(_you_accent.r, _you_accent.g, _you_accent.b, 0.0),
		Color(_you_accent.r, _you_accent.g, _you_accent.b, 0.9)])

	_rival_name.add_theme_color_override("font_color", _tinta(_rival_accent))


	_pinta_dom_cifra()


	_repinta_fichas()


	_apply_sub_lock()




	if not keep:
		if _card != null and is_instance_valid(_card):
			_card.queue_free()
		_card = null
		_card_min = ""
		_card_txt = ""
		_card_rid = -1
		_card_kind = ""
		_lineas = 0
		_ultimas = PackedStringArray()










		_minute = 0
		_score_label.text = "0 - 0"




	_pinta_pila()
	_pinta_pulso()
	_relayout_bars.call_deferred()
	_reencaja.call_deferred()






	set_energy(Career.energy / 100.0, Career.energy < Career.INJURY_RAMP_TOP)


	if not keep:
		_poss_you = 0.5
		_dom_shown = 0.5
		set_momentum(0.5, 0, "")
		set_dominio(0.5)





	if _fade_tw != null and _fade_tw.is_valid():
		_fade_tw.kill()
	_tap.mouse_filter = Control.MOUSE_FILTER_STOP
	_root.modulate.a = 1.0 if keep else 0.0
	_telon_lleno = keep
	_root.visible = true
	_avisa_tapa()
	if not keep:
		_fade_tw = _root.create_tween()
		_fade_tw.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
		_fade_tw.set_ignore_time_scale(true)
		_fade_tw.tween_property(_root, "modulate:a", 1.0, 0.22)

		_fade_tw.tween_callback(func() -> void:
			_telon_lleno = true
			_avisa_tapa())


func set_score(you: int, rival: int) -> void:
	_score_label.text = "%d - %d" % [you, rival]
	_diff = you - rival
	_you_goals = you
	_rival_goals = rival
	_update_agg()






	if _tab_idx == 1:
		_refresca_alineacion()
	_tune_music()





func _update_agg() -> void:
	if _agg_band == null or not _agg_band.visible or _leg1.size() < 2:
		return
	var mine: int = _you_goals + int(_leg1[0])
	var his: int = _rival_goals + int(_leg1[1])
	_agg_label.text = "%s %d-%d  ·  %s" % [I18n.t("IDA", "ronda"),
		int(_leg1[0]), int(_leg1[1]), I18n.tf("GLOBAL {0}-{1}", [mine, his])]



	if mine == his and _ko_seed != 0:
		var dueno: String = I18n.t("PASAS POR POSICIÓN") if _ko_seed > 0 \
				else I18n.t("FUERA POR POSICIÓN")
		_agg_label.text += "  ·  " + dueno
		mine += _ko_seed







	var ink: Color = _claro(_accent) if mine > his else (
		UiKit.INK_HI if mine == his else UiKit.DANGER)
	_agg_label.add_theme_color_override("font_color", ink)


func set_minute(minute: int) -> void:
	var nuevo: bool = minute != _minute
	if nuevo:

		_minute_extra = 0







		if minute > PULSO_MIN_REG:
			_amplia_prorroga()
		_pulso_idx = clampi(minute - 1, 0, _pulso_total - 1)
		_asegura_hist()
		_pulso_hist[_pulso_idx] = _dom_you
		_pinta_pulso()
	_minute = minute
	_pinta_reloj(minute)







	if nuevo and _tab_idx == 1:
		_refresca_alineacion()
	_tune_music()







func _pinta_reloj(minute: int) -> void:
	if _minute_label == null:
		return
	var tenso: bool = minute >= RELOJ_TENSO

	var late: bool = tenso and not Settings.reduce_motion
	if late and _tic.is_stopped():
		_tic_on = true
		_tic.start()
	elif not late:
		if not _tic.is_stopped():
			_tic.stop()
		_tic_on = true
	var cifra: String = "%d+%d" % [minute, _minute_extra] if _minute_extra > 0 \
			else "%d" % minute
	_minute_label.text = cifra +("'" if _tic_on else " ")
	_minute_label.add_theme_color_override("font_color",
		CareerTheme.text_on_dark(UiKit.DANGER) if tenso else UiKit.GOLD)


	_half_label.text = I18n.t("1T") if minute <= 45 \
			else (I18n.t("2T") if minute <= PULSO_MIN_REG else I18n.t("PR"))


func _on_tic() -> void:
	_tic_on = not _tic_on
	_pinta_reloj(_minute)















func _arranca_grada(div: int) -> void:
	var cfg: Dictionary = MatchAudio.DIV_CROWD.get(clampi(div, 1, 3),
		MatchAudio.DIV_CROWD[3])
	if _bed == null or not is_instance_valid(_bed):
		var st: AudioStream = AudioBank.stream(String(cfg["bed"]))
		if st == null:
			return
		_bed = AudioStreamPlayer.new()
		_bed.stream = st



		_bed.bus = "SFX"
		add_child(_bed)
	else:
		_bed.stream = AudioBank.stream(String(cfg["bed"]))
	var destino: float = SIM_BED_DB + _grada_gain(div)
	if _bed.playing:
		_bed.volume_db = destino
		return
	_bed.volume_db = -60.0
	_bed.play()
	var tw: Tween = _bed.create_tween()
	tw.set_ignore_time_scale(true)
	tw.tween_property(_bed, "volume_db", destino, 1.4)





func _grada_gain(div: int) -> float:
	var fx: Dictionary = GameState.current_fixture()
	var local: String = String(fx.get("rival", "")) if not bool(fx.get("home", true)) \
			else String(GameState.player_team_id)
	if local.is_empty():
		return 0.0
	var cap: int = Stadiums.capacity_of(local)
	if cap <= 0:
		return 0.0
	return MatchAudio.gente_gain(float(cap) * float(SIM_LLENADO.get(
		clampi(div, 1, 3), 0.55)))






func _para_grada(dur: float = 0.5) -> void:
	if _bed == null or not is_instance_valid(_bed) or not _bed.playing:
		return
	dur = maxf(dur, 0.18)
	var tw: Tween = _bed.create_tween()
	tw.set_ignore_time_scale(true)
	tw.tween_property(_bed, "volume_db", -60.0, dur)
	tw.tween_callback(_bed.stop)




func _div_actual() -> int:
	for d in MatchAudio.DIV_CROWD.keys():
		if DIV_BCAST.get(d, {}) == _bcfg:
			return int(d)
	return 1


func _tune_music() -> void:
	var late: float = clampf(float(_minute) / 90.0, 0.0, 1.0)
	var tight: float = 1.0 - clampf(float(absi(_diff)) / 3.0, 0.0, 1.0)
	var heat: float = absf(_poss_you - 0.5) * 2.0
	var intensidad: float = clampf(0.18 + late * 0.34 + tight * late * 0.34
		+ heat * 0.16, 0.0, 1.0)
	Music.set_intensity(intensidad)





	if _bed != null and is_instance_valid(_bed) and _bed.playing:
		_bed.volume_db = SIM_BED_DB + _grada_gain(_div_actual()) \
				+ intensidad * SIM_BED_SUBE


func _line_style(kind: String) -> Dictionary:


	match kind:
		"goal_rival":
			return {"color": UiKit.DANGER, "icon": "balon", "size": 46}
		"goal_team":
			return {"color": UiKit.GOLD, "icon": "balon", "size": 46}
		"goal_you":




			return {"color": UiKit.GOLD, "icon": "balon", "size": 46}
		"near_rival":
			return {"color": UiKit.AMBER, "icon": "precision", "size": 40}
		"near_team", "near_you":






			return {"color": CareerTheme.GOOD, "icon": "precision", "size": 40}
		"you":


			return {"color": UiKit.CYAN, "icon": "media", "size": 38}
		"sub":
			return {"color": UiKit.CYAN, "icon": "equipo", "size": 38}
		"set_piece":



			return {"color": UiKit.INK_BODY, "icon": "corner", "size": 36}
		"plan":



			return {"color": UiKit.GOLD, "icon": "analista", "size": 36}
		"assist":



			return {"color": Color(UiKit.GOLD.r, UiKit.GOLD.g, UiKit.GOLD.b, 0.8),
				"icon": "asist", "size": 34}
		"assist_rival":




			return {"color": Color(UiKit.DANGER.r, UiKit.DANGER.g, UiKit.DANGER.b, 0.8),
				"icon": "asist", "size": 34}
		"card", "card_you":








			return {"color": UiKit.AMBER, "icon": "tarjeta", "size": 36}
		"red", "red_you":




			return {"color": UiKit.DANGER, "icon": "tarjeta", "size": 42}
		"save_you":


			return {"color": UiKit.CYAN, "icon": "guante", "size": 38}
		"save_rival":

			return {"color": UiKit.DANGER, "icon": "guante", "size": 38}
		"injury", "injury_you":






			return {"color": UiKit.DANGER, "icon": "cruz_medica",
				"size": 42 if kind == "injury_you" else 36}
		"hito", "hito_mal":





			return {"color": UiKit.GOLD if kind == "hito" else UiKit.DANGER,
				"icon": "corona", "size": 38}
		"dorsal":




			return {"color": CareerTheme.NAV_GENTE, "icon": "aficion", "size": 42}
		"panolada":



			return {"color": UiKit.DANGER, "icon": "aficion", "size": 42}
		"curva_si", "curva_no":



			return {"color": CareerTheme.NAV_GENTE if kind == "curva_si" else UiKit.DANGER,
				"icon": "aficion", "size": 42}
		"hito_tarjeta":


			return {"color": UiKit.AMBER, "icon": "tarjeta", "size": 38}
		"break":






			return {"color": UiKit.INK_HI, "icon": "reloj", "size": 42}
		_:
			return {"color": UiKit.INK_BODY, "icon": "", "size": 34}


func _line_icon(icon_type: String, color: Color, size: int) -> Control:
	if icon_type.is_empty():
		var holder: CenterContainer = CenterContainer.new()
		holder.custom_minimum_size = Vector2(size, size)
		holder.mouse_filter = Control.MOUSE_FILTER_IGNORE
		var dot: ColorRect = ColorRect.new()
		dot.custom_minimum_size = Vector2(10, 10)
		dot.color = color
		dot.mouse_filter = Control.MOUSE_FILTER_IGNORE
		holder.add_child(dot)
		return holder
	var icon: MenuIcon = MenuIcon.new()
	icon.custom_minimum_size = Vector2(size, size)
	icon.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	icon.setup(icon_type, color)
	return icon


func _minute_chip(minute: int, extra: int = 0) -> PanelContainer:
	var chip: PanelContainer = PanelContainer.new()
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = UiKit.INK_WASH
	sb.set_corner_radius_all(6)
	sb.content_margin_left = 8.0
	sb.content_margin_right = 8.0
	sb.content_margin_top = 2.0
	sb.content_margin_bottom = 2.0
	chip.add_theme_stylebox_override("panel", sb)
	chip.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	chip.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var l: Label = Label.new()
	l.text = "%d+%d'" % [minute, extra] if extra > 0 else "%d'" % minute
	l.add_theme_font_size_override("font_size", 24)
	l.add_theme_color_override("font_color", UiKit.INK_BODY)
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	chip.add_child(l)
	return chip





















func _face_chip(name: String, team: String, num: int) -> Control:
	var tint: Color = _rival_accent if team == "rival" else _you_accent
	var frame: PanelContainer = PanelContainer.new()
	var sb: StyleBoxFlat = StyleBoxFlat.new()




	sb.bg_color = Color(tint.r, tint.g, tint.b, 0.22)
	sb.set_corner_radius_all(8)
	sb.set_border_width_all(2)
	sb.border_color = Color(tint.r, tint.g, tint.b, 0.9)
	sb.set_content_margin_all(2)
	frame.add_theme_stylebox_override("panel", sb)
	frame.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	frame.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	frame.mouse_filter = Control.MOUSE_FILTER_IGNORE

	var av: PlayerAvatar = PlayerAvatar.new()


	av.chrome = false
	av.bust = PlayerAvatar.BUST_CLOSE












	av.custom_minimum_size = Vector2(138, 180)
	av.mouse_filter = Control.MOUSE_FILTER_IGNORE








	av.club = _rival_team if team == "rival" else _you_team
	frame.add_child(av)

	var mine: bool = not name.is_empty() \
			and name.to_upper() == CareerTheme.caps(Career.player_name).to_upper()
	if mine:
		av.set_look(GameState.player_look())
	else:
		var src: Dictionary = _rival_team if team == "rival" else _you_team
		var base: Dictionary = GameState.kit_variant(src, 0)





		var portero: bool = _es_portero(name, src)
		if portero:


			base = KitRecolor.keeper_con_pecho(KitRecolor.keeper_cfg(
				String(src.get("id", "")), -1, String(base.get("pattern", "solid"))), base)
		base["number"] = num
		av.set_look(KitRecolor.appearance_for(name, base),
			PlayerCard.KEEPER_TEX if portero else null)
	return frame




func _es_portero(name: String, team: Dictionary) -> bool:
	var up: String = name.to_upper()
	for p in Squad.of(String(team.get("id", ""))):
		if String((p as Dictionary).get("name", "")).to_upper() == up:
			return String((p as Dictionary).get("pos", "")) == "POR"
	return false


func _jersey_chip(num: int, team: String) -> PanelContainer:
	var bg: Color = _rival_accent if team == "rival" else _you_accent
	var chip: PanelContainer = PanelContainer.new()
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = bg
	sb.set_corner_radius_all(6)
	sb.content_margin_left = 8.0
	sb.content_margin_right = 8.0
	sb.content_margin_top = 2.0
	sb.content_margin_bottom = 2.0
	chip.add_theme_stylebox_override("panel", sb)
	chip.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	chip.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var l: Label = Label.new()
	l.text = "#%d" % num
	l.add_theme_font_size_override("font_size", 24)
	l.add_theme_color_override("font_color",
		Color.BLACK if bg.get_luminance() > 0.5 else Color.WHITE)
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	chip.add_child(l)
	return chip









func _bump_possession(you: Variant, peso: float = DOM_CASI) -> void:
	if typeof(you) != TYPE_BOOL:
		_dom_you = lerpf(_dom_you, 0.5, DOM_RELAJA)
	elif bool(you):
		_dom_you = clampf(_dom_you + peso, DOM_MIN, DOM_MAX)
	else:
		_dom_you = clampf(_dom_you - peso, DOM_MIN, DOM_MAX)
	_pinta_dom_cifra()
	_update_possession_bar()


	if _pulso_fila != null:
		_empuja_dominio(_dom_you)




func set_dominio(you_frac: float) -> void:
	_dom_you = clampf(you_frac, DOM_MIN, DOM_MAX)
	_pinta_dom_cifra()
	_update_possession_bar()
	if _pulso_fila != null:
		_empuja_dominio(_dom_you)












func _pinta_dom_cifra() -> void:
	if _dom_value == null:
		return
	var tuyo: int = int(round(_dom_you * 100.0))
	var mio: bool = tuyo >= 50
	var tinta: Color = _claro(_you_accent if mio else _rival_accent)
	_dom_value.text = "%d%%" %(tuyo if mio else 100 - tuyo)
	_dom_value.add_theme_color_override("font_color", tinta)
	if _dom_club == null:
		return
	_dom_club.text =(_you_name if mio else _rival_name).text
	_dom_club.add_theme_color_override("font_color", tinta)


	var f: Font = _dom_club.get_theme_font("font")
	var ancho: float = f.get_string_size(_dom_club.text, HORIZONTAL_ALIGNMENT_LEFT, -1.0,
		CareerTheme.T_HEAD).x + 4.0
	_dom_club.custom_minimum_size.x = minf(ancho, DOM_CLUB_MAX)




func _update_possession_bar() -> void:




	if _glow_you != null:
		_glow_you.modulate.a = clampf(0.3 + 1.1 *(_dom_you - 0.5), 0.05, 0.55)
		_glow_rival.modulate.a = clampf(0.3 + 1.1 *(0.5 - _dom_you), 0.05, 0.55)













func set_momentum(you_frac: float, level: int, label: String) -> void:
	_poss_you = clampf(you_frac, DOM_MIN, DOM_MAX)
	_tune_music()















func _empuja_dominio(destino: float) -> void:
	if _dom_tw != null and _dom_tw.is_valid():
		_dom_tw.kill()
	var desde: float = _dom_shown
	if absf(desde - destino) < 0.005:
		_pinta_dominio(destino)
		return
	_dom_tw = create_tween()
	_dom_tw.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	_dom_tw.set_ignore_time_scale(true)
	_dom_tw.tween_method(_pinta_dominio, desde, destino, 0.45) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)


func _pinta_dominio(f: float) -> void:
	_dom_shown = f



	if _pulso_idx < 0:
		return
	if _pulso_idx < _pulso_hist.size():
		_pulso_hist[_pulso_idx] = f
	_pinta_columna(_pulso_idx, f)





func _build_gol_bug() -> void:
	_gol_bug = Control.new()
	_gol_bug.mouse_filter = Control.MOUSE_FILTER_IGNORE


	_gol_bug.clip_contents = true
	_gol_bug.visible = false
	_root.add_child(_gol_bug)


	_gol_bug_segunda = ColorRect.new()
	_gol_bug_segunda.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_gol_bug.add_child(_gol_bug_segunda)
	_gol_bug_in = Control.new()
	_gol_bug_in.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_gol_bug.add_child(_gol_bug_in)


	for i in BUG_RAYAS:
		var raya: ColorRect = ColorRect.new()
		raya.mouse_filter = Control.MOUSE_FILTER_IGNORE
		raya.visible = false
		_gol_bug.add_child(raya)
		_gol_bug_rayas.append(raya)
	_gol_bug_bg = ColorRect.new()
	_gol_bug_bg.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_gol_bug_in.add_child(_gol_bug_bg)


	_gol_bug_patch = KitPatch.new()
	_gol_bug_patch.alfa_base = 0.0
	_gol_bug_patch.alfa_patron = 0.34
	_gol_bug_patch.esquinas = Vector4.ZERO
	_gol_bug_in.add_child(_gol_bug_patch)



	_gol_bug_brillo = ColorRect.new()
	_gol_bug_brillo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_gol_bug_brillo.rotation = deg_to_rad(14.0)
	_gol_bug_brillo.visible = false
	_gol_bug_in.add_child(_gol_bug_brillo)
	_gol_bug_label = Label.new()
	_gol_bug_label.add_theme_font_size_override("font_size", CareerTheme.T_HUD_SCORE)
	_gol_bug_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_gol_bug_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	_gol_bug_label.clip_text = true
	_gol_bug_label.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_gol_bug_in.add_child(_gol_bug_label)
	_gol_bug_side = HBoxContainer.new()
	_gol_bug_side.add_theme_constant_override("separation", 8)
	_gol_bug_side.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_gol_bug_in.add_child(_gol_bug_side)
	_gol_bug_crest = CrestView.new()




	_gol_bug_crest.set_halo(true)
	_gol_bug_crest.custom_minimum_size = Vector2(BUG_CREST, BUG_CREST)
	_gol_bug_crest.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	_gol_bug_crest.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_gol_bug_side.add_child(_gol_bug_crest)
	_gol_bug_abbr = Label.new()
	_gol_bug_abbr.add_theme_font_size_override("font_size", CareerTheme.T_CARD)
	_gol_bug_abbr.vertical_alignment = VERTICAL_ALIGNMENT_CENTER





	_gol_bug_abbr.clip_text = true
	_gol_bug_abbr.custom_minimum_size = Vector2(120.0, 0.0)
	_gol_bug_abbr.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_gol_bug_side.add_child(_gol_bug_abbr)



	_gol_bug_label.visible = false
	_gol_bug_letras = Control.new()
	_gol_bug_letras.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_gol_bug_in.add_child(_gol_bug_letras)
	for i in BUG_CHISPAS:
		var ch: ColorRect = ColorRect.new()
		ch.mouse_filter = Control.MOUSE_FILTER_IGNORE
		ch.visible = false
		_gol_bug_in.add_child(ch)
		_gol_bug_chispas.append(ch)





func _gol_bug_kit(you: bool) -> Dictionary:
	var equipo: Dictionary = _you_team if you else _rival_team
	if equipo.is_empty():
		return {}
	return GameState.kit_of(equipo,(not _soy_local) if you else _soy_local)





func _gol_bug_show(you: bool) -> void:


	if not bool(_bcfg["goal_flair"]):
		return









	var zona: Control = _score_row if _score_row != null else _pulso_zona


	if _gol_bug == null or zona == null or not zona.is_inside_tree() \
			or not zona.visible:
		return
	var r: Rect2 = zona.get_global_rect()
	if r.size.x <= 1.0:
		return
	var equipo: Dictionary = _you_team if you else _rival_team
	var kit: Dictionary = _gol_bug_kit(you)






	var derecha: bool = you != _soy_local



	var base: Color = UiKit.GOLD if you else UiKit.DANGER
	var kc: Variant = kit.get("kit", null)
	if kc is Color:
		base = kc
		if base.get_luminance() < 0.18:
			base = base.lightened(0.42)
	_gol_bug.set_anchors_preset(Control.PRESET_TOP_LEFT)
	_gol_bug.global_position = r.position
	_gol_bug.size = r.size
	_gol_bug_in.position = Vector2.ZERO
	_gol_bug_in.size = r.size
	_gol_bug_bg.color = base
	_gol_bug_bg.size = r.size
	_gol_bug_patch.size = r.size
	_gol_bug_patch.kit = kit
	_gol_bug_label.position = Vector2.ZERO
	_gol_bug_label.size = r.size
	_gol_bug_label.text = CareerTheme.caps(I18n.t("gol"))


	var tinta: Color = CareerTheme.INK_DARK if base.get_luminance() > 0.55 \
			else CareerTheme.TEXT
	_gol_bug_label.add_theme_color_override("font_color", tinta)





	var esc: float = clampf(r.size.y * 0.72, BUG_CREST, 148.0)
	_gol_bug_crest.custom_minimum_size = Vector2(esc, esc)
	_gol_bug_crest.size = Vector2(esc, esc)


	_gol_bug_abbr.text = String(equipo.get("abbrev", "MI" if you else "RIV"))
	_gol_bug_abbr.add_theme_color_override("font_color", tinta)
	_gol_bug_crest.visible = not equipo.is_empty()
	if not equipo.is_empty():
		_gol_bug_crest.set_team(equipo)

	_gol_bug_side.move_child(_gol_bug_crest, 1 if derecha else 0)
	_gol_bug_abbr.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT if derecha \
			else HORIZONTAL_ALIGNMENT_LEFT
	var ancho_lado: float = _gol_bug_side.get_combined_minimum_size().x
	_gol_bug_side.size = Vector2(ancho_lado, r.size.y)
	_gol_bug_side.position = Vector2(
		r.size.x - 18.0 - ancho_lado if derecha else 18.0, 0.0)
	_gol_bug.visible = true


	if _root.get_child(_root.get_child_count() - 1) != _gol_bug:
		_root.move_child(_gol_bug, _root.get_child_count() - 1)
	if _gol_bug_tw and _gol_bug_tw.is_valid():
		_gol_bug_tw.kill()
	_gol_bug_tw = create_tween()





	_gol_bug_tw.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	_gol_bug_tw.set_ignore_time_scale(true)


	var dir: float = -1.0 if derecha else 1.0
	_gol_bug_in.position.x = - r.size.x * dir
	_gol_bug_tw.tween_property(_gol_bug_in, "position:x", 0.0, BUG_IN) \
			.set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
	_gol_bug_tw.tween_interval(BUG_HOLD)
	_gol_bug_tw.tween_property(_gol_bug_in, "position:x", r.size.x * dir, BUG_OUT) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN)
	_gol_bug_tw.tween_callback(func() -> void: _gol_bug.visible = false)
	_gol_bug_coreografia(r.size, tinta, base, kit, derecha)









func _gol_bug_coreografia(tam: Vector2, tinta: Color, base: Color, kit: Dictionary,
		derecha: bool) -> void:
	if _gol_bug_fx_tw and _gol_bug_fx_tw.is_valid():
		_gol_bug_fx_tw.kill()


	var dir: float = -1.0 if derecha else 1.0
	var segundo: Color = kit.get("kit2", tinta) if kit.get("kit2", null) is Color else tinta


	if absf(segundo.get_luminance() - base.get_luminance()) < 0.12:
		segundo = tinta
	var fx: Tween = create_tween().set_parallel()
	fx.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	fx.set_ignore_time_scale(true)
	_gol_bug_fx_tw = fx




	_gol_bug_segunda.color = segundo
	_gol_bug_segunda.size = tam
	_gol_bug_segunda.position = Vector2(- tam.x * dir, 0.0)
	fx.tween_property(_gol_bug_segunda, "position:x", 0.0, BUG_IN * 0.85) \
			.set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
	fx.tween_property(_gol_bug_segunda, "position:x", tam.x * dir, BUG_OUT) \
			.set_delay(BUG_IN + BUG_HOLD - 0.04).set_trans(Tween.TRANS_CUBIC) \
			.set_ease(Tween.EASE_IN)



	var alturas: Array[float] = [0.16, 0.34, 0.52, 0.7, 0.86]
	for k in _gol_bug_rayas.size():
		var raya: ColorRect = _gol_bug_rayas[k]
		var largo: float = tam.x *(0.22 + 0.08 * float(k % 3))
		raya.color = Color(tinta.r, tinta.g, tinta.b, 0.5)
		raya.size = Vector2(largo, 4.0 if k % 2 == 0 else 6.0)
		raya.position = Vector2(- largo if dir > 0.0 else tam.x,
			tam.y * alturas[k % alturas.size()])
		raya.modulate.a = 1.0
		raya.visible = true
		var t0: float = 0.02 * float(k)
		fx.tween_property(raya, "position:x", tam.x if dir > 0.0 else - largo,
			BUG_IN + 0.08).set_delay(t0).set_trans(Tween.TRANS_SINE) \
					.set_ease(Tween.EASE_OUT)
		fx.tween_property(raya, "modulate:a", 0.0, 0.14).set_delay(t0 + BUG_IN - 0.04)











	for n in _gol_bug_letras.get_children():
		n.queue_free()
	_gol_bug_letras.position = Vector2.ZERO
	_gol_bug_letras.size = tam
	var fuente: Font = _gol_bug_label.get_theme_font("font")
	var cuerpo: int = CareerTheme.T_SCORE


	var ini: float = 0.0
	var fin: float = tam.x
	if derecha:
		fin = _gol_bug_side.position.x - 16.0
	else:
		ini = _gol_bug_side.position.x + _gol_bug_side.get_combined_minimum_size().x \
				+ 16.0



	var palabra: String = _gol_grito(_gol_bug_label.text, fuente, cuerpo,
		(fin - ini - 24.0) / BUG_GRITO_ESCALA)
	var ancho: float = fuente.get_string_size(palabra, HORIZONTAL_ALIGNMENT_LEFT, -1,
		cuerpo).x
	var alto: float = fuente.get_height(cuerpo)
	var x: float = ini +(fin - ini - ancho) * 0.5 - 6.0
	var y: float =(tam.y - alto) * 0.5 - 6.0
	var centro: Vector2 = Vector2(x + ancho * 0.5, tam.y * 0.5)
	_gol_bug_letras.pivot_offset = centro
	_gol_bug_letras.scale = Vector2(BUG_GRITO_ESCALA, BUG_GRITO_ESCALA)
	var relieve: Color = base.darkened(0.6)
	var cae: float = BUG_IN * 0.7
	var n_letras: int = palabra.length()
	var mitad: float = float(n_letras - 1) * 0.5
	var estilo: int = _gol_estilo_elige()
	var letras: Array[Label] = []
	for k in n_letras:
		var c: String = palabra[k]
		var w: float = fuente.get_string_size(c, HORIZONTAL_ALIGNMENT_LEFT, -1, cuerpo).x
		var l: Label = _gol_letra(c, cuerpo, tinta, relieve)
		for d: float in [12.0, 8.0, 4.0]:
			var capa: Label = _gol_letra(c, cuerpo, relieve.lerp(base, d / 24.0), relieve)
			capa.position = Vector2(d, d)
			capa.show_behind_parent = true
			l.add_child(capa)
		_gol_bug_letras.add_child(l)
		letras.append(l)
		l.position = Vector2(x, y)
		l.size = Vector2(w, alto)
		l.pivot_offset = Vector2(w, alto) * 0.5
		l.modulate.a = 0.0
		var t: float = cae
		match estilo:
			GRITO_SELLO:


				l.pivot_offset = centro - l.position
				l.scale = Vector2(3.2, 3.2)
				fx.tween_property(l, "scale", Vector2.ONE, 0.16).set_delay(t) \
						.set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_IN)
				fx.tween_property(l, "modulate:a", 1.0, 0.06).set_delay(t)
			GRITO_DERRAPE:



				var orden: int =(n_letras - 1 - k) if dir > 0.0 else k
				t = cae + 0.04 * float(orden)
				l.position.x = x - dir * tam.x * 0.7
				l.rotation = deg_to_rad(14.0 * dir)
				fx.tween_property(l, "position:x", x, 0.28).set_delay(t) \
						.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
				fx.tween_property(l, "rotation", 0.0, 0.34).set_delay(t) \
						.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
				fx.tween_property(l, "modulate:a", 1.0, 0.06).set_delay(t)
			GRITO_MUELLE:

				t = cae + 0.06 * absf(float(k) - mitad)
				l.scale = Vector2.ZERO
				fx.tween_property(l, "scale", Vector2.ONE, 0.5).set_delay(t) \
						.set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_OUT)
				fx.tween_property(l, "modulate:a", 1.0, 0.05).set_delay(t)
			_:

				t = cae + BUG_LETRA_PASO * 0.75 * float(k)
				l.position.y = y - 40.0
				l.scale = Vector2(2.4, 2.4)
				l.rotation = deg_to_rad(-10.0 if k % 2 == 0 else 10.0)
				fx.tween_property(l, "position:y", y, 0.3).set_delay(t) \
						.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
				fx.tween_property(l, "scale", Vector2.ONE, 0.3).set_delay(t) \
						.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
				fx.tween_property(l, "rotation", 0.0, 0.3).set_delay(t) \
						.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
				fx.tween_property(l, "modulate:a", 1.0, 0.08).set_delay(t)
		x += w


	var golpe: float = cae + 0.16
	match estilo:
		GRITO_DERRAPE:
			golpe = cae + 0.04 * float(maxi(0, n_letras - 1)) + 0.2
		GRITO_MUELLE:
			golpe = cae + 0.06 * mitad + 0.18
		GRITO_CAIDA:
			golpe = cae + BUG_LETRA_PASO * 0.75 * float(maxi(0, n_letras - 1)) + 0.14

	var remate: float = golpe + 0.3
	match estilo:
		GRITO_SELLO:

			var s0: Vector2 = Vector2(BUG_GRITO_ESCALA, BUG_GRITO_ESCALA)
			for i in 2:
				var tl: float = remate + 0.26 * float(i)
				fx.tween_property(_gol_bug_letras, "scale", s0 * 1.1, 0.08).set_delay(tl) \
						.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
				fx.tween_property(_gol_bug_letras, "scale", s0, 0.16).set_delay(tl + 0.08) \
						.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
		GRITO_MUELLE:

			for k in letras.size():
				var tm: float = remate + 0.03 * float(k)
				var g: float = deg_to_rad(9.0 if k % 2 == 0 else -9.0)
				fx.tween_property(letras[k], "rotation", g, 0.09).set_delay(tm) \
						.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
				fx.tween_property(letras[k], "rotation", - g * 0.5, 0.1).set_delay(tm + 0.09) \
						.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
				fx.tween_property(letras[k], "rotation", 0.0, 0.12).set_delay(tm + 0.19) \
						.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
		_:


			for k in letras.size():
				var orden: int = k
				if estilo == GRITO_DERRAPE and dir < 0.0:
					orden = letras.size() - 1 - k
				var t_ola: float = remate + 0.045 * float(orden)
				fx.tween_property(letras[k], "position:y", y - 16.0, 0.12) \
						.set_delay(t_ola).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
				fx.tween_property(letras[k], "position:y", y, 0.16) \
						.set_delay(t_ola + 0.12).set_trans(Tween.TRANS_BOUNCE) \
						.set_ease(Tween.EASE_OUT)




	var eje: String = "position:x" if estilo == GRITO_DERRAPE else "position:y"
	var s: float = dir if estilo == GRITO_DERRAPE else 1.0
	fx.tween_property(_gol_bug_letras, eje, 9.0 * s, 0.04).set_delay(golpe)
	fx.tween_property(_gol_bug_letras, eje, -6.0 * s, 0.05).set_delay(golpe + 0.04)
	fx.tween_property(_gol_bug_letras, eje, 3.0 * s, 0.05).set_delay(golpe + 0.09)
	fx.tween_property(_gol_bug_letras, eje, 0.0, 0.05).set_delay(golpe + 0.14)




	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	var paleta: Array[Color] = [tinta, segundo, base.darkened(0.45)]
	for k in _gol_bug_chispas.size():
		var ch: ColorRect = _gol_bug_chispas[k]
		var lado: float = 8.0 if k % 3 == 0 else 14.0
		ch.color = paleta[k % paleta.size()]
		ch.size = Vector2(lado, lado)
		ch.pivot_offset = ch.size * 0.5
		ch.position = centro - ch.size * 0.5
		ch.rotation = 0.0
		ch.modulate.a = 0.0
		ch.visible = true
		var ang: float = TAU * float(k) / float(_gol_bug_chispas.size()) \
				+ rng.randf_range(-0.2, 0.2)
		var dist: float = rng.randf_range(0.28, 0.5) * tam.x
		var dest: Vector2 = centro + Vector2(cos(ang) * dist, sin(ang) * dist * 0.45) \
				- ch.size * 0.5
		var suelo: float = dest.y + rng.randf_range(40.0, 90.0)
		var sale: float = golpe + rng.randf_range(0.0, 0.05)
		fx.tween_property(ch, "modulate:a", 1.0, 0.03).set_delay(sale)
		fx.tween_property(ch, "position", dest, 0.32).set_delay(sale) \
				.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
		fx.tween_property(ch, "position:y", suelo, 0.4).set_delay(sale + 0.32) \
				.set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN)
		fx.tween_property(ch, "rotation", rng.randf_range(- PI, PI), 0.72).set_delay(sale)
		fx.tween_property(ch, "modulate:a", 0.0, 0.25).set_delay(sale + 0.47)



	var lado_x: float = _gol_bug_side.position.x
	_gol_bug_side.position.x = lado_x - 60.0 * dir
	_gol_bug_side.modulate.a = 0.0
	var club: float = golpe + 0.06
	fx.tween_property(_gol_bug_side, "position:x", lado_x, 0.26) \
			.set_delay(club).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	fx.tween_property(_gol_bug_side, "modulate:a", 1.0, 0.18).set_delay(club)



	_gol_bug_brillo.color = Color(tinta.r, tinta.g, tinta.b, 0.22)
	_gol_bug_brillo.size = Vector2(70.0, tam.y * 1.6)
	_gol_bug_brillo.position = Vector2(-160.0 if dir > 0.0 else tam.x + 160.0,
		- tam.y * 0.3)
	_gol_bug_brillo.visible = true
	fx.tween_property(_gol_bug_brillo, "position:x",
		tam.x + 160.0 if dir > 0.0 else -160.0, 0.55) \
				.set_delay(remate).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)



func _gol_estilo_elige() -> int:
	var e: int = gol_estilo_forzado % GRITO_ESTILOS
	if gol_estilo_forzado < 0:
		e = randi() % GRITO_ESTILOS
		if e == gol_estilo_ultimo:
			e =(e + 1 + randi() %(GRITO_ESTILOS - 1)) % GRITO_ESTILOS
	gol_estilo_ultimo = e
	return e





func _gol_grito(base_txt: String, fuente: Font, cuerpo: int, hueco: float) -> String:
	var p: String = base_txt.to_upper()
	var v: int = -1
	for k in p.length():
		if "AEIOUÁÉÍÓÚ".contains(p[k]):
			v = k
			break
	var abre: String = "¡" if I18n.locale == "es" else ""
	for extra in [2, 1, 0]:
		var w: String = p if v < 0 else p.substr(0, v + 1) + p[v].repeat(extra) \
				+ p.substr(v + 1)
		w = abre + w + "!"
		if fuente.get_string_size(w, HORIZONTAL_ALIGNMENT_LEFT, -1, cuerpo).x <= hueco:
			return w
	return p




func _gol_letra(c: String, cuerpo: int, tinta: Color, contorno: Color) -> Label:
	var l: Label = Label.new()
	l.text = c
	l.add_theme_font_size_override("font_size", cuerpo)
	l.add_theme_color_override("font_color", tinta)
	l.add_theme_color_override("font_outline_color", contorno)
	l.add_theme_constant_override("outline_size", 12)
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return l



func _react_goal(you: bool) -> void:



	_gol_bug_show(you)





	Music.duck(-10.0, MatchAudio.GOL_BREVE_S * 0.5, 1.5)
	var color: Color = UiKit.GOLD if you else UiKit.DANGER
	_flash.color = Color(color.r, color.g, color.b, 0.4)
	var ftw: Tween = create_tween()
	ftw.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	ftw.set_ignore_time_scale(true)
	ftw.tween_property(_flash, "color:a", 0.0, 0.5)







	var espera: float = BUG_IN + BUG_HOLD + BUG_OUT * 0.6 \
			if _gol_bug != null and _gol_bug.visible else 0.0
	var crest: CrestView = _you_crest if you else _rival_crest
	crest.pivot_offset = crest.size * 0.5
	_score_label.pivot_offset = _score_label.size * 0.5
	if _gol_pop_tw and _gol_pop_tw.is_valid():
		_gol_pop_tw.kill()
		crest.scale = Vector2.ONE
		_score_label.scale = Vector2.ONE
	_gol_pop_tw = create_tween().set_parallel()
	_gol_pop_tw.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	_gol_pop_tw.set_ignore_time_scale(true)
	_gol_pop_tw.tween_property(crest, "scale", Vector2(1.28, 1.28), 0.12) \
			.set_delay(espera).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	_gol_pop_tw.tween_property(crest, "scale", Vector2.ONE, 0.3) \
			.set_delay(espera + 0.12).set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_OUT)



	_gol_pop_tw.tween_property(_score_label, "scale", Vector2(1.22, 1.22), 0.1) \
			.set_delay(espera).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	_gol_pop_tw.tween_property(_score_label, "scale", Vector2.ONE, 0.28) \
			.set_delay(espera + 0.1).set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_OUT)





	if not bool(_bcfg["goal_flair"]):
		return
	var side: TextureRect = _glow_you if you else _glow_rival
	for node in [_bug_glow, side]:
		var start_a: float = node.modulate.a
		var gtw: Tween = create_tween()
		gtw.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
		gtw.set_ignore_time_scale(true)
		gtw.tween_property(node, "modulate:a", 0.7, 0.12)
		gtw.tween_property(node, "modulate:a", start_a, 0.4)








func telon_puesto() -> void:
	while _fade_tw != null and _fade_tw.is_valid() and _fade_tw.is_running() \
			and _root.visible and is_inside_tree():
		await get_tree().process_frame



func finish() -> void:
	Music.stop(0.5)
	_para_grada(0.6)



	set_danger(0.0)

	_tic.stop()


	if _fade_tw != null and _fade_tw.is_valid():
		_fade_tw.kill()

	_telon_lleno = false
	_avisa_tapa()
	_fade_tw = _root.create_tween()
	_fade_tw.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	_fade_tw.set_ignore_time_scale(true)


	_tap.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_fade_tw.tween_property(_root, "modulate:a", 0.0, 0.25)
	_fade_tw.tween_callback(func() -> void: _root.visible = false)







func _matar_tweens() -> void:
	for t: Tween in [_rating_tw, _tira_tw, _gol_bug_fx_tw, _gol_pop_tw]:
		if t != null and t.is_valid():
			t.kill()


func hide_now() -> void:
	_matar_tweens()
	_tic.stop()
	Music.stop(0.25)
	_para_grada(0.0)
	set_danger(0.0)


	if _fade_tw != null and _fade_tw.is_valid():
		_fade_tw.kill()
	_root.modulate.a = 1.0
	_telon_lleno = false
	_root.visible = false
	_avisa_tapa()




	_tap.mouse_filter = Control.MOUSE_FILTER_IGNORE







func veil(on: bool) -> void:
	if not on:
		_reencaja.call_deferred()
	_root.visible = not on





func tapa_todo() -> bool:
	return _telon_lleno and visible and is_inside_tree() and _root != null \
			and _root.visible and _root.modulate.a >= 0.999


func _avisa_tapa() -> void:
	var t: bool = tapa_todo()
	if t != _tapa:
		_tapa = t
		tapa_cambia.emit(t)




func _build_ui() -> void:
	layer = 40
	_root = Control.new()
	_root.set_anchors_preset(Control.PRESET_FULL_RECT)
	_root.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(_root)

	_build_background()






















	_tap = Control.new()
	_tap.set_anchors_preset(Control.PRESET_FULL_RECT)













	_tap.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_tap.gui_input.connect(_on_tap)
	add_child(_tap)









	move_child(_tap, 0)


	var col: VBoxContainer = VBoxContainer.new()
	col.set_anchors_preset(Control.PRESET_FULL_RECT)







	col.offset_left = 24.0
	col.offset_right = -24.0
	col.offset_top = 40.0 + UiKit.top_safe_inset(get_viewport())
	col.offset_bottom = -(48.0 + UiKit.top_safe_inset(get_viewport()) * 0.5)
	col.add_theme_constant_override("separation", 16)
	col.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_root.add_child(col)

	col.add_child(_build_bug())





	col.add_child(_build_zona_central())
	col.add_child(_build_marcadores())



	col.add_child(_build_footer())
	if UiKit.es_horizontal():
		_tumba(col)


	_flash = ColorRect.new()
	_flash.color = UiKit.INK_NONE
	_flash.set_anchors_preset(Control.PRESET_FULL_RECT)
	_flash.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_root.add_child(_flash)





	_build_gol_bug()

















func _tumba(col: VBoxContainer) -> void:
	var vp: Viewport = get_viewport()
	var lado: float = maxf(24.0, UiKit.side_safe_inset(vp))
	col.offset_left = lado
	col.offset_right = - lado
	col.offset_top = 24.0
	col.offset_bottom = - maxf(24.0, UiKit.bottom_safe_inset(vp))
	var bug: Control = col.get_child(0) as Control
	var zona: VBoxContainer = col.get_child(1) as VBoxContainer
	var marcadores: Control = col.get_child(2) as Control
	var pie: Control = col.get_child(3) as Control
	var barra: Control = zona.get_child(0) as Control

	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 20)
	fila.size_flags_vertical = Control.SIZE_EXPAND_FILL
	fila.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var izq: VBoxContainer = VBoxContainer.new()
	izq.add_theme_constant_override("separation", 12)
	izq.mouse_filter = Control.MOUSE_FILTER_IGNORE
	fila.add_child(izq)




	var placa: PanelContainer = PanelContainer.new()
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = SUP_PANEL
	sb.set_border_width_all(2)
	sb.border_color = SUP_FILO
	sb.set_corner_radius_all(16)
	sb.set_content_margin_all(14)
	_sb_paneles.append(sb)
	placa.add_theme_stylebox_override("panel", sb)
	placa.size_flags_vertical = Control.SIZE_EXPAND_FILL
	placa.mouse_filter = Control.MOUSE_FILTER_IGNORE

	for n: Control in [bug, barra, _medidor_caja, marcadores, pie]:
		if n == null:
			continue
		n.get_parent().remove_child(n)
		if n == _medidor_caja:
			placa.add_child(n)
			izq.add_child(placa)
		else:
			izq.add_child(n)
	col.remove_child(zona)
	zona.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	fila.add_child(zona)
	col.add_child(fila)



func _build_background() -> void:

	_bg_grad = Gradient.new()
	_bg_grad.offsets = PackedFloat32Array([0.0, 0.35, 1.0])
	_bg_grad.colors = PackedColorArray([
		UiKit.BCAST_BG_TOP, SUP_FONDO, SUP_FONDO])
	_root.add_child(_full_tex(_grad_tex(_bg_grad, false)))


	_glow_rival_grad = Gradient.new()
	_glow_rival_grad.offsets = PackedFloat32Array([0.0, 1.0])
	_glow_rival_grad.colors = PackedColorArray([
		UiKit.INK_HI, UiKit.INK_NONE])
	_glow_rival = _band_tex(_grad_tex(_glow_rival_grad, false), true)
	_glow_rival.modulate.a = 0.3
	_root.add_child(_glow_rival)

	_glow_you_grad = Gradient.new()
	_glow_you_grad.offsets = PackedFloat32Array([0.0, 1.0])
	_glow_you_grad.colors = PackedColorArray([
		Color(UiKit.CYAN.r, UiKit.CYAN.g, UiKit.CYAN.b, 0.0),
		Color(UiKit.CYAN.r, UiKit.CYAN.g, UiKit.CYAN.b, 0.9)])
	_glow_you = _band_tex(_grad_tex(_glow_you_grad, false), false)
	_glow_you.modulate.a = 0.3
	_root.add_child(_glow_you)


	_pitch_motif = Control.new()

	_pitch_motif.texture_filter = CanvasItem.TEXTURE_FILTER_LINEAR
	_pitch_motif.set_anchors_preset(Control.PRESET_FULL_RECT)
	_pitch_motif.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_pitch_motif.draw.connect(_on_motif_draw)
	_root.add_child(_pitch_motif)


	_comp_watermark = CompLogo.new()
	_comp_watermark.custom_minimum_size = Vector2(620, 620)
	_comp_watermark.set_anchors_preset(Control.PRESET_CENTER)
	_comp_watermark.offset_left = -310.0
	_comp_watermark.offset_right = 310.0
	_comp_watermark.offset_top = 260.0
	_comp_watermark.offset_bottom = 880.0
	_comp_watermark.modulate.a = 0.1




	_comp_watermark.sin_placa = true
	_comp_watermark.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_comp_watermark.setup("liga_es", CareerTheme.TEXT)
	_root.add_child(_comp_watermark)


	_bug_glow_grad = Gradient.new()
	_bug_glow_grad.offsets = PackedFloat32Array([0.0, 1.0])
	_bug_glow_grad.colors = PackedColorArray([
		UiKit.INK_DIM, UiKit.INK_NONE])
	_bug_glow = TextureRect.new()
	_bug_glow.texture = _grad_tex(_bug_glow_grad, true)
	_bug_glow.stretch_mode = TextureRect.STRETCH_SCALE
	_bug_glow.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	_bug_glow.set_anchors_preset(Control.PRESET_TOP_WIDE)
	_bug_glow.offset_top = -40.0
	_bug_glow.offset_bottom = 420.0
	_bug_glow.modulate.a = 0.5
	_bug_glow.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_root.add_child(_bug_glow)


	var vig_grad: Gradient = Gradient.new()
	vig_grad.offsets = PackedFloat32Array([0.55, 1.0])
	vig_grad.colors = PackedColorArray([UiKit.CLEAR, UiKit.SHADE])
	_root.add_child(_full_tex(_grad_tex(vig_grad, true)))


func _on_motif_draw() -> void:
	_dibuja_motivo(_pitch_motif)


func _on_plate_motif_draw() -> void:
	_dibuja_motivo(_plate_motif, CAPA_SUELO)


func _on_plate_anim_draw() -> void:
	_dibuja_motivo(_plate_anim, CAPA_VIVA)


func _on_plate_campo_draw() -> void:
	_dibuja_motivo(_plate_campo, CAPA_CAL)





func _decorado() -> String:




	match _tema:
		"champions", "libertadores", "concacaf", "oriente", "atlas":
			return "estrellas"



		"europa", "conference", "sudamericana", "sol", "baobab", "coral":
			return "hexagonos"
		"copa":
			return "copa"
		"mundial", "mundialito":
			return "mundial"




	if _div >= 3:
		return "gastado"
	if _div == 1:
		return "segado"
	return ""


func _dibuja_motivo(ci: Control, capa: int = CAPA_TODO) -> void:
	_lienzo = ci
	var w: float = ci.size.x
	var h: float = ci.size.y
	var t: float = _t_fondo


	if w < 40.0 or h < 40.0:
		return


	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash(_tema)


	var decorado: String = _decorado()


	if capa == CAPA_SUELO:
		_motivo_base(w, h)
		if decorado == "gastado":
			_calvas(w, h, rng)
		return

	if capa == CAPA_CAL:
		_motivo_campo(w, h)
		return

	if capa == CAPA_VIVA:
		_motivo_halo(w, h)
	match decorado:
		"estrellas":
			_motivo_estrellas(w, h, rng, t)
		"hexagonos":
			_motivo_hexagonos(w, h, t)
		"copa":
			_motivo_rayos(w, h, 0.1, t)
		"mundial":
			_motivo_rayos(w, h, 0.09, t)
			_motivo_confeti(w, h, rng, t)
		"gastado":


			if capa == CAPA_TODO:
				_calvas(w, h, rng)
			_motivo_nubes(w, h, t)
		"segado":
			_motivo_cesped(w, h, t)
	if capa == CAPA_TODO:
		_motivo_campo(w, h)





func _colores_base() -> Array[Color]:
	match _tema:
		"champions", "europa", "conference", "copa", "mundial", "mundialito", \
				"libertadores", "sudamericana", "concacaf", "oriente", "sol", "atlas", "baobab", "coral":
			return [_accent.darkened(0.52), _accent.darkened(0.84)]


	if _div >= 3:
		return [CareerTheme.PITCH_GRASS_A.lerp(UiKit.GOLD, 0.35).darkened(0.64),
			CareerTheme.PITCH_GRASS_B.lerp(UiKit.GOLD, 0.2).darkened(0.84)]
	return [CareerTheme.PITCH_GRASS_A.darkened(0.6), CareerTheme.PITCH_GRASS_B.darkened(0.82)]




func _motivo_base(w: float, h: float) -> void:
	var cols: Array[Color] = _colores_base()
	var r: float = 18.0
	var pts: PackedVector2Array = PackedVector2Array()
	var centros: Array[Vector2] = [Vector2(w - r, r), Vector2(w - r, h - r),
		Vector2(r, h - r), Vector2(r, r)]
	for c in range(4):
		for k in range(7):
			var ang: float = - PI * 0.5 + PI * 0.5 * float(c) + PI * 0.5 * float(k) / 6.0
			pts.append(centros[c] + Vector2(cos(ang), sin(ang)) * r)
	var tintes: PackedColorArray = PackedColorArray()
	for p in pts:
		tintes.append(cols[0].lerp(cols[1], clampf(p.y / maxf(h, 1.0), 0.0, 1.0)))
	_lienzo.draw_polygon(pts, tintes)






func _motivo_halo(w: float, h: float) -> void:
	if _div >= 3:
		return
	var claro: Color = _claro(_accent) if _tema != "liga" and _tema != "clasif" \
			else CareerTheme.PITCH_GRASS_A
	var resp: float = 0.75 + 0.25 * sin(_t_fondo * 0.6)


	_lienzo.draw_texture_rect(_halo(), Rect2(w * 0.5 - 540.0, h * 0.42 - 540.0, 1080.0, 1080.0),
		false, Color(claro.r, claro.g, claro.b, 0.155 * resp))




func _halo() -> GradientTexture2D:
	if _halo_tex == null:
		var g: Gradient = Gradient.new()
		g.offsets = PackedFloat32Array([0.0, 0.22, 1.0])
		g.colors = PackedColorArray([UiKit.INK_HI, UiKit.INK_HI, UiKit.INK_NONE])
		_halo_tex = GradientTexture2D.new()
		_halo_tex.gradient = g
		_halo_tex.fill = GradientTexture2D.FILL_RADIAL
		_halo_tex.fill_from = Vector2(0.5, 0.5)
		_halo_tex.fill_to = Vector2(0.5, 0.0)
		_halo_tex.width = 128
		_halo_tex.height = 128
	return _halo_tex





func _motivo_campo(w: float, h: float) -> void:
	var claro: Color = _claro(_accent)

	var col: Color = Color(claro.r, claro.g, claro.b, 0.09 if _div < 3 else 0.055)
	var cx: float = w * 0.5
	var cy: float = h * 0.56
	_lienzo.draw_line(Vector2(0, cy), Vector2(w, cy), col, 4.0)
	_lienzo.draw_arc(Vector2(cx, cy), 240.0, 0.0, TAU, 96, col, 4.0, true)



func _motivo_cesped(w: float, h: float, t: float) -> void:
	var col: Color = Color(1.0, 1.0, 1.0, 0.035)
	var alto: float = 150.0
	var y: float = -2.0 * alto + fmod(t * 10.0, 2.0 * alto)
	var i: int = 0
	while y < h:
		if i % 2 == 0:
			_lienzo.draw_rect(Rect2(0, y, w, alto), col)
		y += alto
		i += 1









func _calvas(w: float, h: float, rng: RandomNumberGenerator) -> void:


	var tierra: Color = UiKit.GOLD.lerp(UiKit.DANGER, 0.4).darkened(0.45)
	var calvas: Array[Vector3] = [Vector3(w * 0.5, h * 0.56, 130.0),
		Vector3(w * 0.5, h * 0.97, 200.0)]
	for _i in range(6):
		calvas.append(Vector3(rng.randf() * w, rng.randf() * h, rng.randf_range(40.0, 95.0)))
	for c: Vector3 in calvas:


		_calva(Vector2(c.x, c.y), Vector2(c.z * 1.25, c.z * 0.7), rng,
			Color(tierra.r, tierra.g, tierra.b, 0.1))
		_calva(Vector2(c.x, c.y), Vector2(c.z, c.z * 0.5), rng,
			Color(tierra.r, tierra.g, tierra.b, 0.16))



func _motivo_nubes(w: float, h: float, t: float) -> void:
	var sombra: Color = Color(UiKit.SHADE.r, UiKit.SHADE.g, UiKit.SHADE.b, 0.22)
	for k in range(3):
		var lado: float = 520.0 + 140.0 * float(k)
		var tramo: float = w + lado
		var x: float = fmod(t *(9.0 + 3.0 * float(k)) + tramo * float(k) / 3.0, tramo) - lado * 0.5
		var y: float = h *(0.2 + 0.3 * float(k))
		_lienzo.draw_texture_rect(_halo(), Rect2(x - lado * 0.5, y - lado * 0.35, lado, lado * 0.7),
			false, sombra)





func _calva(c: Vector2, radios: Vector2, rng: RandomNumberGenerator, col: Color) -> void:
	var pts: PackedVector2Array = PackedVector2Array()
	for k in range(16):
		var ang: float = TAU * float(k) / 16.0
		var m: float = rng.randf_range(0.7, 1.1)
		pts.append(c + Vector2(cos(ang) * radios.x, sin(ang) * radios.y) * m)
	_lienzo.draw_colored_polygon(pts, col)




func _motivo_estrellas(w: float, h: float, rng: RandomNumberGenerator, t: float) -> void:
	var claro: Color = _claro(_accent)
	for _i in range(90):
		var p: Vector2 = Vector2(rng.randf() * w, rng.randf() * h)
		var r: float = rng.randf_range(1.5, 4.0)
		var a0: float = rng.randf_range(0.15, 0.5)
		var vel: float = rng.randf_range(0.6, 1.8)
		var fase: float = rng.randf() * TAU
		var a: float = a0 *(0.55 + 0.45 * sin(t * vel + fase))


		_lienzo.draw_rect(Rect2(p.x - r, p.y - r, r * 2.0, r * 2.0), Color(claro.r, claro.g, claro.b, a))
	var centro: Vector2 = Vector2(w * 0.5, h * 0.56)
	var giro: float = t * 0.05
	for k in range(8):
		var ang: float = TAU * float(k) / 8.0 - PI * 0.5 + giro
		_estrella(centro + Vector2(cos(ang), sin(ang)) * 330.0, 46.0,
			Color(claro.r, claro.g, claro.b, 0.14))






func _estrella(c: Vector2, r: float, col: Color) -> void:
	var pts: PackedVector2Array = PackedVector2Array()
	for k in range(10):
		var ang: float = PI * float(k) / 5.0 - PI * 0.5
		var rr: float = r if k % 2 == 0 else r * 0.42
		pts.append(c + Vector2(cos(ang), sin(ang)) * rr)
	var tinte: PackedColorArray = PackedColorArray([col])
	for k in range(10):
		_lienzo.draw_primitive(PackedVector2Array([c, pts[k], pts[(k + 1) % 10]]), tinte,
			PackedVector2Array())




func _motivo_hexagonos(w: float, h: float, t: float) -> void:
	var claro: Color = _claro(_accent)
	var col: Color = Color(claro.r, claro.g, claro.b, 0.12)
	var r: float = 70.0
	var dx: float = r * sqrt(3.0)
	var dy: float = r * 1.5
	var esquinas: PackedVector2Array = PackedVector2Array()
	for k in range(7):
		var ang: float = PI / 3.0 * float(k) - PI * 0.5
		esquinas.append(Vector2(cos(ang), sin(ang)) * r)


	var aristas: PackedVector2Array = PackedVector2Array()

	var fila: int = 0
	var y: float = -2.0 * dy - fmod(t * 8.0, 2.0 * dy)
	while y < h + r:
		var x: float = dx * 0.5 if fila % 2 == 1 else 0.0
		var colu: int = 0
		while x < w + r:
			var c: Vector2 = Vector2(x, y)
			for k in range(6):
				aristas.append(c + esquinas[k])
				aristas.append(c + esquinas[k + 1])
			var chispa: float = sin(t * 0.7 + float(colu * 7 + fila * 13))
			if chispa > 0.86:



				var tinte: PackedColorArray = PackedColorArray(
					[Color(claro.r, claro.g, claro.b,(chispa - 0.86) / 0.14 * 0.1)])
				_lienzo.draw_primitive(PackedVector2Array([c + esquinas[0], c + esquinas[1],
					c + esquinas[2], c + esquinas[3]]), tinte, PackedVector2Array())
				_lienzo.draw_primitive(PackedVector2Array([c + esquinas[0], c + esquinas[3],
					c + esquinas[4], c + esquinas[5]]), tinte, PackedVector2Array())
			x += dx
			colu += 1
		y += dy
		fila += 1
	_lienzo.draw_multiline(aristas, col, 3.0)




func _motivo_rayos(w: float, h: float, alfa: float, t: float) -> void:
	var claro: Color = _claro(_accent)
	var origen: Vector2 = Vector2(w * 0.5, -120.0)
	var n: int = 14
	var vaiven: float = sin(t * 0.35) * 0.06
	for k in range(n):
		var a0: float = lerpf(0.12, PI - 0.12, float(k) / float(n)) + vaiven
		var a1: float = a0 +(PI - 0.24) / float(n) * 0.5
		var lejos: float = h * 1.6
		var a: float = alfa *(0.7 + 0.3 * sin(t * 1.1 + float(k)))



		_lienzo.draw_primitive(PackedVector2Array([origen,
			origen + Vector2(cos(a0), sin(a0)) * lejos,
			origen + Vector2(cos(a1), sin(a1)) * lejos]),
			PackedColorArray([Color(claro.r, claro.g, claro.b, a)]), PackedVector2Array())



func _motivo_confeti(w: float, h: float, rng: RandomNumberGenerator, t: float) -> void:
	var claro: Color = _claro(_accent)
	for _i in range(70):
		var x0: float = rng.randf() * w
		var y0: float = rng.randf() * h
		var vel: float = rng.randf_range(20.0, 60.0)
		var fase: float = rng.randf() * TAU
		var giro0: float = rng.randf() * TAU
		var col: Color = claro if rng.randf() < 0.6 else UiKit.INK_HI
		col.a = rng.randf_range(0.18, 0.4)
		var p: Vector2 = Vector2(x0 + sin(t * 1.5 + fase) * 12.0,
			fmod(y0 + t * vel, h + 20.0) - 10.0)
		_lienzo.draw_set_transform(p, giro0 + t * 1.2, Vector2.ONE)
		_lienzo.draw_rect(Rect2(-7, -3, 14, 6), col)
	_lienzo.draw_set_transform(Vector2.ZERO, 0.0, Vector2.ONE)




func _build_bug() -> Control:
	_bug = PanelContainer.new()



	_bug.add_theme_stylebox_override("panel", StyleBoxEmpty.new())
	_bug.mouse_filter = Control.MOUSE_FILTER_IGNORE

	_bug_band = OpenBand.new()
	_bug.add_child(_bug_band)





	_bug_band.clip_children = CanvasItem.CLIP_CHILDREN_DISABLED
	_bug_band.clip_contents = true


	_bug_band.pie_h = 0.0

	var box: VBoxContainer = VBoxContainer.new()
	box.add_theme_constant_override("separation", 0)
	box.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_bug.add_child(box)

	_comp_cap = _build_comp_cap()


	_comp_cap.resized.connect(func() -> void: _bug_band.rotulo_h = _comp_cap.size.y)
	box.add_child(_comp_cap)
	_score_row = _build_score_row()
	box.add_child(_score_row)
	_agg_band = _build_agg()
	box.add_child(_agg_band)








	_dominio_band = null
	return _bug




func _build_comp_cap() -> PanelContainer:
	var cap: PanelContainer = PanelContainer.new()




	_comp_cap_sb = StyleBoxFlat.new()
	_comp_cap_sb.draw_center = false
	_comp_cap_sb.content_margin_left = 18.0
	_comp_cap_sb.content_margin_right = 18.0
	_comp_cap_sb.content_margin_top = 8.0
	_comp_cap_sb.content_margin_bottom = 8.0
	cap.add_theme_stylebox_override("panel", _comp_cap_sb)
	cap.mouse_filter = Control.MOUSE_FILTER_IGNORE




	var cap_col: VBoxContainer = VBoxContainer.new()
	cap_col.add_theme_constant_override("separation", 2)
	cap_col.mouse_filter = Control.MOUSE_FILTER_IGNORE
	cap.add_child(cap_col)

	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 12)
	row.mouse_filter = Control.MOUSE_FILTER_IGNORE
	cap_col.add_child(row)

	_comp_logo = CompLogo.new()





	_comp_logo.custom_minimum_size = Vector2(54, 54)
	_comp_logo.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	_comp_logo.setup("liga_es", CareerTheme.TEXT)
	row.add_child(_comp_logo)

	_comp_name = Label.new()


	_comp_name.text = "LIGA"
	_comp_name.add_theme_font_size_override("font_size", 26)
	_comp_name.add_theme_color_override("font_color", CareerTheme.TEXT)
	_comp_name.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	_comp_name.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row.add_child(_comp_name)






	_round_chip = Label.new()
	_round_chip.add_theme_font_size_override("font_size", 18)
	_round_chip.add_theme_color_override("font_color", UiKit.INK_DIM)
	_round_chip.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	_round_chip.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	_round_chip.clip_text = true
	_round_chip.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_round_chip.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row.add_child(_round_chip)













	_venue_label = Label.new()


	_venue_label.add_theme_font_size_override("font_size", CareerTheme.T_DIM)
	_venue_label.add_theme_color_override("font_color", UiKit.INK_DIM)



	_venue_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_venue_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_venue_label.mouse_filter = Control.MOUSE_FILTER_IGNORE
	cap_col.add_child(_venue_label)
	return cap



func _build_score_row() -> Control:
	var margin: MarginContainer = MarginContainer.new()
	margin.add_theme_constant_override("margin_left", 20)
	margin.add_theme_constant_override("margin_right", 20)




	margin.add_theme_constant_override("margin_top", 18)


	margin.add_theme_constant_override("margin_bottom", 22)
	margin.mouse_filter = Control.MOUSE_FILTER_IGNORE

	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 26)
	row.alignment = BoxContainer.ALIGNMENT_CENTER
	row.mouse_filter = Control.MOUSE_FILTER_IGNORE
	margin.add_child(row)

	_you_name = _make_name(UiKit.CYAN)
	_you_sub = _make_form()
	_you_medal_sb = _medal_style()
	_you_crest = CrestView.new()
	_you_crest.custom_minimum_size = Vector2(112, 112)
	_you_crest.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row.add_child(_team_column(_you_crest, _you_medal_sb, _you_name, _you_sub, 0))

	_score_label = Label.new()
	_score_label.text = "0 - 0"






	_score_label.add_theme_font_size_override("font_size", CareerTheme.T_SCORE)
	_score_label.add_theme_color_override("font_color", Color.WHITE)
	_score_label.add_theme_color_override("font_outline_color", UiKit.OUTLINE_HARD)
	_score_label.add_theme_constant_override("outline_size", 8)
	_score_label.custom_minimum_size = Vector2(300, 0)
	_score_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_score_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	_score_label.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	_score_label.mouse_filter = Control.MOUSE_FILTER_IGNORE



	var centro: VBoxContainer = VBoxContainer.new()
	centro.add_theme_constant_override("separation", 6)
	centro.custom_minimum_size = Vector2(300, 0)
	centro.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	centro.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var vivo_fila: HBoxContainer = HBoxContainer.new()
	vivo_fila.add_theme_constant_override("separation", 8)
	vivo_fila.alignment = BoxContainer.ALIGNMENT_CENTER
	vivo_fila.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_live_dot = ColorRect.new()
	_live_dot.custom_minimum_size = Vector2(12, 12)
	_live_dot.color = UiKit.DANGER
	_live_dot.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	vivo_fila.add_child(_live_dot)
	var vivo: Label = Label.new()
	vivo.text = I18n.t("EN VIVO")

	vivo.add_theme_font_size_override("font_size", CareerTheme.T_DIM)
	vivo.add_theme_color_override("font_color", UiKit.INK_BODY)
	vivo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	vivo_fila.add_child(vivo)
	centro.add_child(vivo_fila)
	centro.add_child(_score_label)






	var clock_fila: HBoxContainer = HBoxContainer.new()
	clock_fila.alignment = BoxContainer.ALIGNMENT_CENTER
	clock_fila.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var clock: PanelContainer = PanelContainer.new()






	_clock_sb = UiKit.make_readout()
	_clock_sb.bg_color = OpenBand.FONDO
	_clock_sb.set_border_width_all(3)
	_clock_sb.content_margin_left = 22.0
	_clock_sb.content_margin_right = 22.0
	_clock_sb.content_margin_top = 10.0
	_clock_sb.content_margin_bottom = 10.0
	clock.add_theme_stylebox_override("panel", _clock_sb)
	clock.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var clock_in: HBoxContainer = HBoxContainer.new()
	clock_in.add_theme_constant_override("separation", 14)
	clock_in.mouse_filter = Control.MOUSE_FILTER_IGNORE
	clock.add_child(clock_in)



	_half_label = Label.new()
	_half_label.add_theme_font_size_override("font_size", CareerTheme.T_DIM)
	_half_label.add_theme_color_override("font_color", UiKit.INK_BODY)
	_half_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	_half_label.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	_half_label.mouse_filter = Control.MOUSE_FILTER_IGNORE
	clock_in.add_child(_half_label)
	_minute_label = Label.new()
	_minute_label.text = "0'"


	_minute_label.add_theme_font_size_override("font_size", CareerTheme.T_MONEY)
	_minute_label.add_theme_color_override("font_color", UiKit.GOLD)
	_minute_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_minute_label.mouse_filter = Control.MOUSE_FILTER_IGNORE
	clock_in.add_child(_minute_label)
	clock_fila.add_child(clock)



	_tic = Timer.new()
	_tic.wait_time = 0.5
	_tic.ignore_time_scale = true
	_tic.timeout.connect(_on_tic)
	add_child(_tic)
	centro.add_child(clock_fila)
	_live_box = centro
	row.add_child(centro)

	_rival_name = _make_name(UiKit.GOLD)
	_riv_sub = _make_form()
	_rival_medal_sb = _medal_style()
	_rival_crest = CrestView.new()
	_rival_crest.custom_minimum_size = Vector2(112, 112)
	_rival_crest.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row.add_child(_team_column(_rival_crest, _rival_medal_sb, _rival_name, _riv_sub, 1))
	return margin





func _build_agg() -> Control:
	var margin: MarginContainer = MarginContainer.new()
	margin.add_theme_constant_override("margin_left", 20)
	margin.add_theme_constant_override("margin_right", 20)
	margin.add_theme_constant_override("margin_bottom", 10)
	margin.mouse_filter = Control.MOUSE_FILTER_IGNORE
	margin.visible = false

	var chip: PanelContainer = PanelContainer.new()

	chip.add_theme_stylebox_override("panel", UiKit.make_readout())
	chip.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	chip.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_agg_label = Label.new()
	_agg_label.add_theme_font_size_override("font_size", 22)
	_agg_label.add_theme_color_override("font_color", UiKit.GOLD)
	_agg_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER







	_agg_label.clip_text = true
	_agg_label.custom_minimum_size = Vector2(640, 0)
	_agg_label.mouse_filter = Control.MOUSE_FILTER_IGNORE
	chip.add_child(_agg_label)
	margin.add_child(chip)
	return margin












func _team_column(crest: CrestView, medal_sb: StyleBoxFlat, name_label: Label,
		sub_label: Label, lado: int = -1) -> Control:
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 6)
	col.alignment = BoxContainer.ALIGNMENT_CENTER
	col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	col.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var medal: PanelContainer = PanelContainer.new()
	medal.add_theme_stylebox_override("panel", medal_sb)
	medal.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	medal.mouse_filter = Control.MOUSE_FILTER_IGNORE
	medal.add_child(crest)
	col.add_child(medal)
	col.add_child(name_label)
	col.add_child(sub_label)
	if lado >= 0:


		var toque: Button = Button.new()
		toque.flat = true



		Entrada.foco_para(toque)
		toque.set_anchors_preset(Control.PRESET_FULL_RECT)
		toque.pressed.connect(func() -> void: _ver_alineaciones(lado))
		col.add_child(toque)
	return col





func _make_form() -> Label:
	var l: Label = Label.new()
	l.add_theme_font_size_override("font_size", CareerTheme.T_DIM)
	l.add_theme_color_override("font_color", UiKit.INK_BODY)
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return l






func _medal_style() -> StyleBoxFlat:
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.draw_center = false
	sb.set_content_margin_all(14)
	return sb







func _viste_bug(accent: Color) -> void:
	if _bug_band == null:
		return
	_bug_band.vestir(_tema, accent, CareerTheme.text_on_dark(accent),
		_gol_bug_kit(true), _gol_bug_kit(false))
	var m: Vector2 = _bug_band.margenes()
	_comp_cap_sb.content_margin_top = 8.0 + m.x
	_score_row.add_theme_constant_override("margin_bottom", int(22.0 + m.y))


func _make_name(color: Color) -> Label:
	var l: Label = Label.new()





	l.add_theme_font_size_override("font_size", CareerTheme.T_HEAD)
	l.add_theme_color_override("font_color", color)
	l.add_theme_color_override("font_outline_color", UiKit.OUTLINE)
	l.add_theme_constant_override("outline_size", 5)
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	l.custom_minimum_size = Vector2(240, 0)
	l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	l.max_lines_visible = 2
	l.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return l


func _layout_energy() -> void:
	if _energy_meter == null:
		return
	_energy_fill.size = Vector2(_energy_meter.size.x * _energy_frac, _energy_meter.size.y)




func set_energy(frac: float, low: bool) -> void:
	_energy_frac = clampf(frac, 0.0, 1.0)
	if _energy_pct != null:
		_energy_pct.text = "%d%%" % roundi(_energy_frac * 100.0)
	if _energy_fill != null:


		_energy_fill.color = CareerTheme.energy_color(_energy_frac * 100.0)
	_layout_energy()
	if low != _energy_low:
		_energy_low = low
		_set_energy_pulse(low)


func _set_energy_pulse(on: bool) -> void:
	if _energy_pulse_tw != null:
		_energy_pulse_tw.kill()
		_energy_pulse_tw = null
	if _energy_fill != null:
		_energy_fill.modulate.a = 1.0
	if not on or _energy_fill == null:
		return
	_energy_pulse_tw = _energy_fill.create_tween()
	_energy_pulse_tw.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	_energy_pulse_tw.set_ignore_time_scale(true)
	_energy_pulse_tw.set_loops()
	_energy_pulse_tw.tween_property(_energy_fill, "modulate:a", 0.35, 0.55) \
			.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	_energy_pulse_tw.tween_property(_energy_fill, "modulate:a", 1.0, 0.55) \
			.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)


func _legend_dot(color: Color) -> ColorRect:
	var d: ColorRect = ColorRect.new()
	d.custom_minimum_size = Vector2(12, 12)
	d.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	d.color = color
	d.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return d


func _legend_label(text: String, color: Color) -> Label:
	var l: Label = Label.new()
	l.text = text
	l.add_theme_font_size_override("font_size", 16)
	l.add_theme_color_override("font_color", color)
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return l


func _rail_tick() -> ColorRect:
	var t: ColorRect = ColorRect.new()
	t.color = UiKit.INK_TICK
	t.size = Vector2(2, 8)
	t.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return t













func _build_pulso() -> Control:
	var plate: PanelContainer = PanelContainer.new()
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = SUP_PANEL
	sb.set_border_width_all(2)
	sb.border_color = SUP_FILO
	sb.set_corner_radius_all(20)


	sb.set_content_margin_all(2)
	plate.add_theme_stylebox_override("panel", sb)
	plate.size_flags_vertical = Control.SIZE_EXPAND_FILL
	plate.mouse_filter = Control.MOUSE_FILTER_IGNORE
	plate.clip_contents = true


	_plate_motif = Control.new()

	_plate_motif.texture_filter = CanvasItem.TEXTURE_FILTER_LINEAR
	_plate_motif.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_plate_motif.draw.connect(_on_plate_motif_draw)
	plate.add_child(_plate_motif)

	_plate_anim = Control.new()
	_plate_anim.texture_filter = CanvasItem.TEXTURE_FILTER_LINEAR
	_plate_anim.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_plate_anim.draw.connect(_on_plate_anim_draw)
	plate.add_child(_plate_anim)

	_plate_campo = Control.new()
	_plate_campo.texture_filter = CanvasItem.TEXTURE_FILTER_LINEAR
	_plate_campo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_plate_campo.draw.connect(_on_plate_campo_draw)
	plate.add_child(_plate_campo)
	var reloj: Timer = Timer.new()
	reloj.wait_time = 1.0 / 30.0
	reloj.ignore_time_scale = true
	reloj.autostart = true
	reloj.timeout.connect(_tick_fondo)
	plate.add_child(reloj)

	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 22)
	col.size_flags_vertical = Control.SIZE_EXPAND_FILL
	col.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var aire: MarginContainer = MarginContainer.new()
	for lado in ["left", "right", "top", "bottom"]:
		aire.add_theme_constant_override("margin_" + lado, 16)
	aire.mouse_filter = Control.MOUSE_FILTER_IGNORE
	aire.add_child(col)
	plate.add_child(aire)
	_medidor_caja = _build_medidor()
	col.add_child(_medidor_caja)



	_relato_host = Control.new()
	_relato_host.custom_minimum_size = Vector2(0, 190)
	_relato_host.size_flags_vertical = Control.SIZE_EXPAND_FILL
	_relato_host.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_relato_host.resized.connect(_reencaja)
	col.add_child(_relato_host)




	col.add_child(_build_pila())
	return plate





func _build_medidor() -> Control:
	var caja: VBoxContainer = VBoxContainer.new()





	caja.add_theme_constant_override("separation", 6)
	caja.mouse_filter = Control.MOUSE_FILTER_IGNORE





	_pulso_zona = caja












	var dom_fila: HBoxContainer = HBoxContainer.new()
	dom_fila.alignment = BoxContainer.ALIGNMENT_CENTER
	dom_fila.add_theme_constant_override("separation", 18)
	dom_fila.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_dom_club = _chapa("", CareerTheme.T_HEAD, UiKit.GOLD)
	_sin_chapa(_dom_club)
	_dom_club.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	_dom_club.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	_dom_club.add_theme_color_override("font_outline_color", SUP_FONDO)
	_dom_club.add_theme_constant_override("outline_size", 8)
	dom_fila.add_child(_dom_club)
	_dom_value = _chapa("", CareerTheme.T_TITLE, UiKit.GOLD)
	_dom_value.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_sin_chapa(_dom_value)

	_dom_value.clip_text = false
	_dom_value.add_theme_color_override("font_outline_color", SUP_FONDO)
	_dom_value.add_theme_constant_override("outline_size", 10)
	dom_fila.add_child(_dom_value)
	_dom_box = dom_fila
	caja.add_child(dom_fila)

























	var marco: PanelContainer = PanelContainer.new()
	var msb: StyleBoxFlat = StyleBoxFlat.new()
	msb.bg_color = Color(SUP_FONDO.r, SUP_FONDO.g, SUP_FONDO.b, 0.55)
	msb.set_corner_radius_all(14)
	msb.content_margin_left = 14.0
	msb.content_margin_right = 14.0
	msb.content_margin_top = 6.0
	msb.content_margin_bottom = 4.0
	marco.add_theme_stylebox_override("panel", msb)
	marco.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var graf: VBoxContainer = VBoxContainer.new()
	graf.add_theme_constant_override("separation", 6)
	graf.mouse_filter = Control.MOUSE_FILTER_IGNORE
	marco.add_child(graf)
	caja.add_child(marco)
	_marcas_local = _tira_marcas(true)
	graf.add_child(_marcas_local)
	_pulso_fila = _fila_barras()
	graf.add_child(_pulso_fila)
	_marcas_visita = _tira_marcas(false)
	graf.add_child(_marcas_visita)





	_pulso_eje = _eje_minutos()
	graf.add_child(_pulso_eje)









	return caja




















func _fila_barras() -> Control:


	var guias: Array[int] = [45]
	if _pulso_total > PULSO_MIN_REG:
		guias.append(90)
	var zona: GraficoPulso = GraficoPulso.new()
	zona.arma(_pulso_total, guias, PULSO_SEP, PULSO_LINEA, UiKit.INK_TICK, UiKit.INK_WASH)
	zona.custom_minimum_size = Vector2(0, PULSO_ALTO)
	zona.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_pulso_graf = zona
	return zona




func _alto_media(i: int, arriba: bool) -> float:
	return _pulso_graf.alto_media(i, arriba) if _pulso_graf != null else 0.0


func _pon_alto_media(i: int, arriba: bool, alto: float) -> void:
	if _pulso_graf != null:
		_pulso_graf.pon_alto(i, arriba, alto)































class GraficoPulso extends Control:

	var n: int = 0
	var sep: int = 2
	var linea: float = 2.0
	var tinta: Color = Color.WHITE

	var guias: PackedFloat32Array = PackedFloat32Array()

	var of: PackedFloat32Array = PackedFloat32Array()

	var col: PackedColorArray = PackedColorArray()

	var _cx: PackedInt32Array = PackedInt32Array()
	var _cw: PackedInt32Array = PackedInt32Array()
	var _sy: PackedFloat32Array = PackedFloat32Array()
	var _h: PackedFloat32Array = PackedFloat32Array()
	var _gx: PackedFloat32Array = PackedFloat32Array()
	var _gw: PackedFloat32Array = PackedFloat32Array()
	var _ly: float = 0.0
	var _lh: float = 0.0

	var _hcol: int = 0

	var _clave: Vector3 = Vector3(-1.0, -1.0, -1.0)

	var _f32: PackedFloat32Array = PackedFloat32Array([0.0])

	var _sin_lista: Array = []

	func arma(total: int, minutos_guia: Array[int], separacion: int, grosor: float,
			c_tinta: Color, c_lavado: Color) -> void:
		n = total
		sep = separacion
		linea = grosor
		tinta = c_tinta
		guias.clear()
		for m: int in minutos_guia:
			guias.append(float(m) / float(n))
		of.resize(2 * n)
		col.resize(2 * n)
		for i: int in n:

			of[2 * i] = - linea * 0.5
			of[2 * i + 1] = linea * 0.5
			col[2 * i] = c_lavado
			col[2 * i + 1] = c_lavado
		_sy.resize(2 * n)
		_h.resize(2 * n)
		_clave = Vector3(-1.0, -1.0, -1.0)
		queue_redraw()



	func _f(x: float) -> float:
		_f32[0] = x
		return _f32[0]

	func alto_media(i: int, arriba: bool) -> float:
		if i < 0 or i >= n:
			return 0.0
		return (- of[2 * i] - linea * 0.5) if arriba else (of[2 * i + 1] - linea * 0.5)

	func pon_alto(i: int, arriba: bool, alto: float) -> void:
		if i < 0 or i >= n:
			return
		var k: int = 2 * i +(0 if arriba else 1)
		_pon_of(- linea * 0.5 - alto if arriba else linea * 0.5 + alto, k)

	func color_media(i: int, arriba: bool) -> Color:
		return col[2 * i +(0 if arriba else 1)] if i >= 0 and i < n else Color.BLACK

	func pon_color(i: int, arriba: bool, c: Color) -> void:
		if i < 0 or i >= n:
			return
		var k: int = 2 * i +(0 if arriba else 1)
		if col[k] == c:
			return
		col[k] = c
		if _h[k] > 0.0:
			queue_redraw()



	func crece(i: int, arriba: bool, alto: float) -> void:
		if i < 0 or i >= n:
			return
		var k: int = 2 * i +(0 if arriba else 1)
		var media: float = linea * 0.5
		var fin: float =(- media - alto) if arriba else (media + alto)
		var tw: Tween = create_tween()
		tw.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
		tw.set_ignore_time_scale(true)
		tw.tween_method(_pon_of.bind(k), - media if arriba else media, fin, 0.4) \
				.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)



	func _pon_of(v: float, k: int) -> void:
		var antes: float = of[k]
		of[k] = v
		if of[k] == antes:
			return
		if _clave == _clave_de_ahora():
			var h0: float = _h[k]
			var y0: float = _sy[k]
			_geo_mitad(k)
			if _h[k] == h0 and _sy[k] == y0:
				return
		queue_redraw()

	func _clave_de_ahora() -> Vector3:
		return Vector3(size.x, size.y, 1.0 if is_layout_rtl() else 0.0)



	func _geo_mitad(k: int) -> void:
		var mitad: float = _f(0.5 * float(_hcol))
		var media: float = linea * 0.5
		var et: float
		var eb: float
		if k % 2 == 0:
			et = _f(of[k] + mitad)
			eb = _f(- media + mitad)
		else:
			et = _f(media + mitad)
			eb = _f(of[k] + mitad)
		var alto: float = _f(eb - et)
		_h[k] = alto if alto > 0.0 else 0.0
		_sy[k] = floorf(_f(et + 0.5))



	func _rearma() -> void:
		_clave = _clave_de_ahora()
		var rtl: bool = _clave.z > 0.5
		var ancho_f: float = size.x
		var alto_f: float = size.y
		var ancho: int = int(ancho_f)
		_hcol = int(alto_f)

		_cx.resize(n)
		_cw.resize(n)
		var stretch_max: int = ancho -(n - 1) * sep
		var avail: int = maxi(stretch_max, 0)
		var trozo: float = _f(float(avail) / float(n))
		var entero: int = int(trozo)
		var resto: float = _f(trozo - float(entero))
		var error: float = 0.0
		var fin: PackedInt32Array = PackedInt32Array()
		fin.resize(n)
		var suma: int = 0
		for i: int in n:
			error = _f(error + resto)
			var t: int = entero
			if error >= 1.0:
				t += 1
				error = _f(error - 1.0)
			fin[i] = t
			suma += t
		var ofs: int = maxi(stretch_max - suma, 0) if rtl else 0
		for idx: int in n:
			var i: int =(n - 1 - idx) if rtl else idx
			if idx > 0:
				ofs += sep
			var desde: int = ofs
			var hasta: int = ancho if idx == n - 1 else ofs + fin[i]
			_cx[i] = desde


			_cw[i] = maxi(hasta - desde, 0)
			ofs = hasta

		_gx.resize(guias.size())
		_gw.resize(guias.size())
		for g: int in guias.size():
			var rw: float = _f(guias[g] * ancho_f)
			var izq: float = _f(-1.0 + rw)
			var gw: float = _f(_f(1.0 + rw) - izq)
			if rtl:
				izq = _f(_f(ancho_f - izq) - gw)
			_gx[g] = floorf(_f(izq + 0.5))
			_gw[g] = gw

		var mitad_z: float = _f(0.5 * alto_f)
		var arriba_l: float = _f(- linea * 0.5 + mitad_z)
		_lh = _f(_f(linea * 0.5 + mitad_z) - arriba_l)
		_ly = floorf(_f(arriba_l + 0.5))
		for k: int in 2 * n:
			_geo_mitad(k)








	func _notification(what: int) -> void:
		if what == NOTIFICATION_LAYOUT_DIRECTION_CHANGED or what == NOTIFICATION_TRANSLATION_CHANGED:
			queue_redraw()

	func _draw() -> void:
		if n <= 0:
			return
		_recorre(_sin_lista, false)





	func piezas() -> Array:
		var out: Array = []
		if n > 0:
			_recorre(out, true)
		return out





	func _recorre(out: Array, apunta: bool) -> void:
		if _clave != _clave_de_ahora():
			_rearma()


		for g: int in _gx.size():
			_pieza(out, apunta, Vector2(_gx[g], 0.0), Vector2(_gw[g], size.y), tinta)
		_pieza(out, apunta, Vector2(0.0, _ly), Vector2(size.x, _lh), tinta)
		for i: int in n:
			for m: int in 2:
				var k: int = 2 * i + m
				if _h[k] <= 0.0:
					continue
				_pieza(out, apunta, Vector2(float(_cx[i]), _sy[k]), Vector2(float(_cw[i]), _h[k]),
					col[k])
		if not apunta:
			draw_set_transform(Vector2.ZERO)



	func _pieza(out: Array, apunta: bool, origen: Vector2, tam: Vector2, c: Color) -> void:
		if apunta:
			out.append([origen, tam, c])
			return
		draw_set_transform(origen)
		draw_rect(Rect2(Vector2.ZERO, tam), c)




func _tira_marcas(arriba: bool) -> Control:
	var tira: Control = Control.new()
	tira.custom_minimum_size = Vector2(0, MARCA_TIRA)
	tira.mouse_filter = Control.MOUSE_FILTER_IGNORE




	var rot: ColorRect = ColorRect.new()
	rot.color = UiKit.INK_WASH
	rot.mouse_filter = Control.MOUSE_FILTER_IGNORE
	rot.set_anchors_preset(Control.PRESET_CENTER_LEFT)
	rot.offset_left = 0.0
	rot.offset_right = ROT_CLUB_ANCHO
	rot.offset_top = - ROT_CLUB_ALTO * 0.5
	rot.offset_bottom = ROT_CLUB_ALTO * 0.5
	tira.add_child(rot)
	if arriba:
		_rot_local = rot
	else:
		_rot_visita = rot
	return tira













func _pinta_marcas() -> void:
	if _marcas_local == null:
		return



	for tira: Control in [_marcas_local, _marcas_visita]:
		for hijo: Node in tira.get_children():
			if hijo == _rot_local or hijo == _rot_visita:
				continue
			tira.remove_child(hijo)
			hijo.queue_free()
	for i: int in mini(_pulso_kind.size(), _pulso_total):
		var kind: String = _pulso_kind[i]
		if kind.is_empty():
			continue
		var ev: Dictionary = PULSO_EVENTOS.get(kind, {})
		if ev.is_empty() or String(ev.get("icono", "")).is_empty():
			continue
		var arriba: bool =(_pulso_ilado[i] == 1) == _soy_local
		var tira: Control = _marcas_local if arriba else _marcas_visita





		var ic: Control = _pieza_suceso(String(ev["icono"]),
			_tinte_marca(String(ev.get("tinte", ""))))
		ic.mouse_filter = Control.MOUSE_FILTER_IGNORE


		var r: float =(float(i) + 0.5) / float(_pulso_total)
		ic.anchor_left = r
		ic.anchor_right = r
		ic.anchor_top = 0.0
		ic.anchor_bottom = 1.0
		ic.offset_left = - ALIN_ICONO * 0.5
		ic.offset_right = ALIN_ICONO * 0.5
		ic.offset_top = 0.0
		ic.offset_bottom = 0.0
		tira.add_child(ic)





func _tinte_marca(tinte: String) -> Color:
	match tinte:
		"amber":
			return UiKit.AMBER
		"malo":
			return CareerTheme.DANGER
		"bueno":
			return CareerTheme.GOOD
	return Color.WHITE













func _eje_minutos() -> Control:
	var eje: Control = Control.new()
	eje.custom_minimum_size = Vector2(0, PULSO_EJE_ALTO)
	eje.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var marcas: PackedInt32Array = PackedInt32Array([0, 45, 90]) \
			if _pulso_total <= PULSO_MIN_REG \
			else PackedInt32Array([0, 45, 90, 105, 120])
	for m: int in marcas:
		var r: float = float(m) / float(_pulso_total)
		var l: Label = _chapa(str(m), CareerTheme.T_DIM, UiKit.INK_DIM)
		_sin_chapa(l)
		l.mouse_filter = Control.MOUSE_FILTER_IGNORE
		l.anchor_left = r
		l.anchor_right = r
		l.anchor_top = 0.0
		l.anchor_bottom = 1.0
		if m == 0:
			l.horizontal_alignment = HORIZONTAL_ALIGNMENT_LEFT
			l.offset_left = 0.0
			l.offset_right = PULSO_EJE_ANCHO
		elif r >= 0.999:
			l.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
			l.offset_left = - PULSO_EJE_ANCHO
			l.offset_right = 0.0
		else:
			l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
			l.offset_left = - PULSO_EJE_ANCHO * 0.5
			l.offset_right = PULSO_EJE_ANCHO * 0.5
		eje.add_child(l)
	return eje












func _amplia_prorroga() -> void:
	if _pulso_total >= PULSO_MIN_EXT or _pulso_fila == null:
		return
	_pulso_total = PULSO_MIN_EXT
	_asegura_hist()
	_rehace_pulso()





func _rehace_pulso() -> void:
	if _pulso_fila == null:
		return
	var caja: Node = _pulso_fila.get_parent()
	var pos_fila: int = _pulso_fila.get_index()
	var pos_eje: int = _pulso_eje.get_index() if _pulso_eje != null else pos_fila + 1



	caja.remove_child(_pulso_fila)
	_pulso_fila.queue_free()
	if _pulso_eje != null:
		caja.remove_child(_pulso_eje)
		_pulso_eje.queue_free()
	_pulso_fila = _fila_barras()
	caja.add_child(_pulso_fila)
	caja.move_child(_pulso_fila, pos_fila)
	_pinta_marcas()
	_pulso_eje = _eje_minutos()
	caja.add_child(_pulso_eje)
	caja.move_child(_pulso_eje, pos_eje)
	_pinta_pulso()




func _sin_chapa(l: Label) -> void:
	l.add_theme_stylebox_override("normal", StyleBoxEmpty.new())






func _asegura_hist() -> void:
	var antes: int = _pulso_hist.size()
	if antes >= _pulso_total:
		return
	_pulso_hist.resize(_pulso_total)
	for i: int in range(antes, _pulso_total):
		_pulso_hist[i] = -1.0


	_pulso_peso.resize(_pulso_total)
	_pulso_lado.resize(_pulso_total)
	_pulso_kind.resize(_pulso_total)
	_pulso_ilado.resize(_pulso_total)
	_pulso_irank.resize(_pulso_total)









func _marca_evento(kind: String, minuto: int, tuyo: bool = true) -> void:
	var ev: Dictionary = PULSO_EVENTOS.get(kind, {})
	if ev.is_empty():
		return
	var m: int = minuto if minuto > 0 else _minute
	if m > PULSO_MIN_REG:
		_amplia_prorroga()
	_asegura_hist()
	var idx: int = m - 1
	if idx < 0 or idx >= _pulso_peso.size():
		return


	var mio: bool = bool(ev["you"]) and tuyo




	var peso: float = float(ev["peso"])
	var cambia_barra: bool = peso > _pulso_peso[idx]
	if cambia_barra:
		_pulso_peso[idx] = peso
		_pulso_lado[idx] = 1 if mio else 2





	var rango: int = int(ev.get("rank", 0))
	var ilado: int = 1 if mio else 2
	var manda_icono: bool = rango > 0 and rango >= int(_pulso_irank[idx])
	var cambia_marca: bool = manda_icono and (kind != _pulso_kind[idx]
		or ilado != int(_pulso_ilado[idx]))
	if manda_icono:


		_pulso_kind[idx] = kind
		_pulso_ilado[idx] = ilado
		_pulso_irank[idx] = rango
	if not cambia_barra and not cambia_marca:
		return
	_pinta_columna(idx, _pulso_hist[idx] if _pulso_hist[idx] >= 0.0 else _dom_shown)





	if cambia_marca:
		_pinta_marcas()




func _pinta_pulso() -> void:
	if _pulso_fila == null:
		return
	for i: int in _pulso_total:



		_pinta_columna(i, _pulso_hist[i] if i < _pulso_hist.size() else -1.0)

















func _pinta_columna(i: int, v: float) -> void:
	if _pulso_graf == null or i < 0 or i >= _pulso_graf.n:
		return
	if v < 0.0:
		_pon_alto_media(i, true, 0.0)
		_pon_alto_media(i, false, 0.0)
		return
	var mio: bool = v >= 0.5
	var fuerza: float = clampf(absf(v - 0.5) * 2.0 / PULSO_TOPE, 0.0, 1.0)



	var lado: int = _pulso_lado[i] if i < _pulso_lado.size() else 0
	if lado != 0:
		fuerza = maxf(fuerza, _pulso_peso[i])
		mio = lado == 1
	var alto: float = PULSO_SUELO + PULSO_RECORRIDO * fuerza
	var c: Color = _you_accent if mio else _rival_accent


	var a: float = 1.0 if i == _pulso_idx or lado != 0 else PULSO_ALFA



	var va_arriba: bool = mio == _soy_local
	_pon_alto_media(i, not va_arriba, 0.0)
	_pulso_graf.pon_color(i, va_arriba, Color(c.r, c.g, c.b, a))





	if i == _pulso_idx:
		_pon_alto_media(i, va_arriba, alto)
	elif not is_equal_approx(_alto_media(i, va_arriba), alto):
		_crece_barra(i, va_arriba, alto)
	else:
		_pon_alto_media(i, va_arriba, alto)









func _crece_barra(i: int, arriba: bool, alto: float) -> void:
	if _pulso_graf != null:
		_pulso_graf.crece(i, arriba, alto)




func _chapa(txt: String, size: int, ink: Color) -> Label:
	var l: Label = Label.new()
	l.text = txt
	l.add_theme_font_size_override("font_size", size)
	l.add_theme_color_override("font_color", ink)


	l.clip_text = true
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = Color(0.04, 0.05, 0.08, 0.72)
	sb.set_corner_radius_all(6)
	sb.content_margin_left = 8.0
	sb.content_margin_right = 8.0
	sb.content_margin_top = 3.0
	sb.content_margin_bottom = 3.0
	l.add_theme_stylebox_override("normal", sb)
	return l




func _reencaja() -> void:
	_encaja_tarjeta()





func _build_marcadores() -> Control:
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 14)
	row.mouse_filter = Control.MOUSE_FILTER_IGNORE
	for pieza: Control in [_build_nota(), _build_energy()]:
		var caja: PanelContainer = PanelContainer.new()
		var sb: StyleBoxFlat = StyleBoxFlat.new()
		sb.bg_color = SUP_PANEL
		sb.set_border_width_all(2)
		sb.border_color = SUP_FILO
		sb.set_corner_radius_all(16)
		sb.set_content_margin_all(14)
		_sb_paneles.append(sb)
		caja.add_theme_stylebox_override("panel", sb)
		caja.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		caja.mouse_filter = Control.MOUSE_FILTER_IGNORE
		caja.add_child(pieza)
		row.add_child(caja)
	return row







func _encaja_tarjeta() -> void:
	if _card == null or not is_instance_valid(_card) or _relato_host == null:
		return
	var w: float = maxf(120.0, _relato_host.size.x)
	var h: float = minf(_card.get_combined_minimum_size().y, _relato_host.size.y)
	_card.size = Vector2(w, h)
	var y: float = maxf(0.0,(_relato_host.size.y - h) * 0.5)
	if is_equal_approx(_card.position.y, 0.0):

		_card.position = Vector2(0.0, y)
		var tw: Tween = _card.create_tween()
		tw.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
		tw.set_ignore_time_scale(true)
		tw.tween_property(_card, "position:y", y, 0.18).from(y + 14.0)
	else:
		_card.position = Vector2(0.0, y)






func _build_pila() -> Control:
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 10)
	col.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_pila_filas.clear()
	for i: int in PILA_FILAS:





		var fondo: PanelContainer = PanelContainer.new()
		fondo.add_theme_stylebox_override("panel", _pila_sin_fondo())



		fondo.custom_minimum_size = Vector2(0, 56)
		fondo.mouse_filter = Control.MOUSE_FILTER_IGNORE
		var fila: HBoxContainer = HBoxContainer.new()
		fila.add_theme_constant_override("separation", 14)
		fila.mouse_filter = Control.MOUSE_FILTER_IGNORE
		fondo.add_child(fila)






		var hondo: float = float(i) / float(maxi(1, PILA_FILAS - 1))
		fondo.modulate.a = 1.0 - 0.4 * hondo
		var minuto: Label = Label.new()


		minuto.add_theme_font_size_override("font_size", CareerTheme.T_DIM)
		minuto.add_theme_color_override("font_color", UiKit.INK_FAINT)
		minuto.custom_minimum_size = Vector2(72, 0)
		minuto.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		fila.add_child(minuto)






		var marca: CenterContainer = CenterContainer.new()
		marca.custom_minimum_size = Vector2(PILA_ICONO, PILA_ICONO)
		marca.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		marca.mouse_filter = Control.MOUSE_FILTER_IGNORE
		var icono: MenuIcon = MenuIcon.new()
		icono.custom_minimum_size = Vector2(PILA_ICONO, PILA_ICONO)
		icono.mouse_filter = Control.MOUSE_FILTER_IGNORE
		marca.add_child(icono)
		var punto: ColorRect = ColorRect.new()
		punto.custom_minimum_size = Vector2(8, 8)
		punto.mouse_filter = Control.MOUSE_FILTER_IGNORE
		punto.visible = false
		marca.add_child(punto)
		fila.add_child(marca)
		var texto: Label = Label.new()







		texto.add_theme_font_size_override("font_size", CareerTheme.T_DIM)
		texto.add_theme_color_override("font_color", UiKit.INK_BODY)





		texto.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART





		texto.add_theme_constant_override("line_spacing", 0)
		texto.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		texto.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		fila.add_child(texto)












		var ver: Button = Button.new()
		ver.text = I18n.t("▸ GOL")
		ver.custom_minimum_size = Vector2(0, 56)
		UiKit.apply_button(ver, UiKit.BTN_GRAY, CareerTheme.T_DIM)
		boton_de_fila(ver)
		ver.add_theme_color_override("font_color", UiKit.GOLD)
		ver.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		ver.visible = false
		ver.set_meta("rid", -1)
		ver.pressed.connect(_tira_ver.bind(ver))










		fila.add_child(ver)
		col.add_child(fondo)
		_pila_filas.append({"fila": fondo, "min": minuto, "icono": icono,
			"punto": punto, "txt": texto, "ver": ver})


	if not _pila_filas.is_empty():
		_prev_min = _pila_filas[0]["min"]
		_prev_text = _pila_filas[0]["txt"]
	_pinta_pila()
	return col




func _chapa_plana(texto: String, tam: int, color: Color) -> Label:
	var l: Label = Label.new()
	l.text = texto
	l.add_theme_font_size_override("font_size", tam)
	l.add_theme_color_override("font_color", color)
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return l





func _lado_de_linea(kind: String, team: String) -> int:
	if team == "you":
		return 0
	if team == "rival":
		return 1
	match kind:
		"goal_team", "goal_you", "assist", "near_team", "near_you", "card_you", \
				"red_you", "save_you", "you", "plan", "hito":
			return 0
		"goal_rival", "assist_rival", "near_rival", "save_rival", "hito_mal":
			return 1
	return -1



func _pila_margenes(sb: StyleBox) -> StyleBox:
	sb.content_margin_left = 10.0
	sb.content_margin_right = 6.0
	sb.content_margin_top = 0.0
	sb.content_margin_bottom = 0.0
	return sb


func _pila_sin_fondo() -> StyleBox:
	return _pila_margenes(StyleBoxEmpty.new())















func _pila_fondo(lado: int) -> StyleBox:
	if lado != 0 and lado != 1:
		return _pila_sin_fondo()
	var acento: Color = _you_accent if lado == 0 else _rival_accent
	var clave: String = acento.to_html()
	var sb: StyleBoxFlat = _pila_sb.get(clave)
	if sb == null:
		sb = StyleBoxFlat.new()
		sb.bg_color = SUP_PANEL.lerp(acento, 0.32)
		sb.set_corner_radius_all(4)
		_pila_margenes(sb)
		_pila_sb[clave] = sb
	return sb


func _pinta_pila() -> void:






	for i: int in _pila_filas.size():
		var f: Dictionary = _pila_filas[i]
		var fila: Control = f["fila"] as Control
		if i >= _hist.size():








			fila.visible = true
			(f["min"] as Label).text = ""
			fila.add_theme_stylebox_override("panel", _pila_sin_fondo())
			(f["txt"] as Label).text = ""
			(f["icono"] as MenuIcon).setup("", UiKit.INK_NONE)
			(f["punto"] as ColorRect).visible = false
			var vacio: Button = f["ver"] as Button
			vacio.set_meta("rid", -1)
			vacio.visible = false
			continue
		fila.visible = true
		var e: Dictionary = _hist[i]
		(f["min"] as Label).text = String(e["min"])
		(f["txt"] as Label).text = String(e["txt"])
		fila.add_theme_stylebox_override("panel", _pila_fondo(int(e.get("lado", -1))))
		var ic: String = String(e.get("icon", ""))
		(f["icono"] as MenuIcon).setup(ic, e["col"])
		var pt: ColorRect = f["punto"] as ColorRect
		pt.visible = ic.is_empty()
		pt.color = e["col"]
		var b: Button = f["ver"] as Button
		var rid: int = int(e.get("rid", -1))
		b.set_meta("rid", rid)
		b.visible = rid >= 0







func _tira_ver(b: Button) -> void:
	var rid: int = int(b.get_meta("rid", -1))
	if rid >= 0:
		replay_requested.emit(rid)











static func boton_de_fila(b: Button) -> void:
	for estado: String in ["normal", "pressed"]:
		var sb: StyleBoxFlat = b.get_theme_stylebox(estado) as StyleBoxFlat
		if sb == null:
			continue
		sb.content_margin_left -= 18.0
		sb.content_margin_right -= 18.0
		sb.content_margin_top -= 16.0
		sb.content_margin_bottom -= 16.0



func _baja_a_pila(kind: String) -> bool:
	return not RUIDO_PILA.has(kind)











func _pintar_tira(minuto: String, texto: String, color: Color, rid: int = -1,
		kind: String = "", team: String = "") -> void:
	if not _baja_a_pila(kind):
		return
	_hist.push_front({"min": minuto, "txt": texto, "col": color, "rid": rid,
		"icon": String(_line_style(kind)["icon"]), "lado": _lado_de_linea(kind, team)})
	while _hist.size() > PILA_FILAS:
		_hist.pop_back()
	_pinta_pila()
	if _pila_filas.is_empty():
		return


	var fila: Control = _pila_filas[0]["fila"]
	if _tira_tw != null and _tira_tw.is_valid():
		_tira_tw.kill()
	_tira_tw = fila.create_tween()
	_tira_tw.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	_tira_tw.set_ignore_time_scale(true)
	_tira_tw.tween_property(fila, "modulate:a", 0.86, 0.18).from(0.3)






func _fanfarria(card: Control, color: Color) -> void:
	if card == null or not is_instance_valid(card) or card.size.x < 10.0:
		return

	card.pivot_offset = card.size * 0.5
	var tw: Tween = card.create_tween()
	tw.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	tw.set_ignore_time_scale(true)
	tw.tween_property(card, "scale", Vector2.ONE, 0.36).from(Vector2(1.1, 1.1)) \
			.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)

	var banda: ColorRect = ColorRect.new()
	banda.color = Color(color.r, color.g, color.b, 0.24)
	banda.size = Vector2(190.0, card.size.y)
	banda.position = Vector2(-210.0, 0.0)
	banda.mouse_filter = Control.MOUSE_FILTER_IGNORE
	card.add_child(banda)
	var bt: Tween = banda.create_tween()
	bt.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	bt.set_ignore_time_scale(true)
	bt.tween_property(banda, "position:x", card.size.x + 60.0, 0.55) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
	bt.parallel().tween_property(banda, "modulate:a", 0.0, 0.55).from(1.0)


	bt.tween_callback(banda.queue_free)




func _minute_chip_text(minute: int, extra: int) -> String:
	return "%d+%d'" % [minute, extra] if extra > 0 else "%d'" % minute





func _espaciada(clave: String) -> String:



	var txt: String = I18n.t(clave).to_upper()
	var out: String = ""
	for i: int in txt.length():
		if i > 0:
			out += " "
		out += txt[i]
	return out





func _palabra_de_kind(kind: String) -> String:
	match kind:
		"goal_you", "goal_team", "goal_rival":
			return I18n.t("GOL")
		"post":
			return I18n.t("POSTE")
		"card", "card_you", "red", "red_you":
			return I18n.t("FALTA")
		"dorsal":
			return I18n.t("OVACION")
		"panolada":
			return I18n.t("PAÑOLADA")
		"curva_si":
			return I18n.t("APLAUSOS")
		"curva_no":
			return I18n.t("PITOS")
	return ""




const FEED_FADE_H := 44.0






const PULSO_MIN_REG: int = 90
const PULSO_MIN_EXT: int = 120




const PULSO_ALTO: float = 112.0


const DOM_CLUB_MAX: float = 600.0


const PULSO_LINEA: float = 2.0


const PULSO_MEDIA: float =(PULSO_ALTO - PULSO_LINEA) * 0.5


const DOM_MIN: float = 0.16
const DOM_MAX: float = 0.84





const DOM_GOL: float = 0.16
const DOM_CASI: float = 0.09
const DOM_RELAJA: float = 0.06




const PULSO_TOPE: float =(DOM_MAX - DOM_MIN)



const PULSO_SEP: int = 2


const PULSO_ALFA: float = 0.82




const PICO_GOL: float = 1.0
const PICO_CASI: float = 0.58



const PICO_TARJETA: float = 0.4
const PICO_ROJA: float = 1.0
const PICO_LESION: float = 0.4












const PULSO_EVENTOS: Dictionary = {
	"goal_team": {"peso": PICO_GOL, "you": true, "icono": "gol", "rank": 3},
	"goal_you": {"peso": PICO_GOL, "you": true, "icono": "gol", "rank": 3},
	"goal_rival": {"peso": PICO_GOL, "you": false, "icono": "gol", "rank": 3},
	"near_team": {"peso": PICO_CASI, "you": true, "icono": "", "rank": 0},
	"near_you": {"peso": PICO_CASI, "you": true, "icono": "", "rank": 0},
	"near_rival": {"peso": PICO_CASI, "you": false, "icono": "", "rank": 0},


	"card": {"peso": PICO_TARJETA, "you": false, "icono": "icono:tarjeta",
		"tinte": "amber", "rank": 2},
	"card_you": {"peso": PICO_TARJETA, "you": true, "icono": "icono:tarjeta",
		"tinte": "amber", "rank": 2},
	"red": {"peso": PICO_ROJA, "you": false, "icono": "icono:tarjeta",
		"tinte": "malo", "rank": 3},
	"red_you": {"peso": PICO_ROJA, "you": true, "icono": "icono:tarjeta",
		"tinte": "malo", "rank": 3},
	"penal_miss": {"peso": PICO_CASI, "you": true, "icono": "icono:precision",
		"tinte": "amber", "rank": 2},
	"penal_miss_rival": {"peso": PICO_CASI, "you": false, "icono": "icono:precision",
		"tinte": "amber", "rank": 2},



	"injury_you": {"peso": PICO_LESION, "you": true, "icono": "icono:cruz_medica",
		"tinte": "malo", "rank": 2},
	"injury_rival": {"peso": PICO_LESION, "you": false, "icono": "icono:cruz_medica",
		"tinte": "malo", "rank": 2},



	"sub_out": {"peso": 0.0, "you": true, "icono": "sale", "tinte": "malo",
		"rank": 1},
	"sub_in": {"peso": 0.0, "you": true, "icono": "entra", "tinte": "bueno",
		"rank": 1},
}





const MARCA_TIRA: float = ALIN_ICONO + 4.0



const ROT_CLUB_ANCHO: float = 96.0
const ROT_CLUB_ALTO: float = 10.0



const PULSO_EJE_ALTO: float = 24.0
const PULSO_EJE_ANCHO: float = 54.0
const PULSO_SUELO: float = 6.0
const PULSO_RECORRIDO: float = PULSO_MEDIA - PULSO_SUELO






const PILA_FILAS: int = 9


const PILA_ICONO: float = 30.0
























const SUP_PELDANO: float = 0.6
const SUP_PASO: Color =(UiKit.MODAL_BG - UiKit.BCAST_BG_MID) * SUP_PELDANO
const SUP_FONDO: Color = UiKit.BCAST_BG_MID
const SUP_PANEL: Color = SUP_FONDO + SUP_PASO
const SUP_ELEVADO: Color = SUP_FONDO + SUP_PASO * 2.0
const SUP_FILO: Color = SUP_FONDO + SUP_PASO * 3.0



const TAB_PALETA: Dictionary = {
	"bg": SUP_ELEVADO, "border": SUP_FILO, "pressed": SUP_PANEL,
}











func _relayout_bars() -> void:
	_reencaja()
	_update_possession_bar()
	_layout_energy()




func goles() -> Array[Dictionary]:
	return _goles.duplicate(true)











func _engancha_asistencia(asist: String, minute: int, lado: int) -> void:
	for i in range(_goles.size() - 1, -1, -1):
		var g: Dictionary = _goles[i]
		if int(g.get("lado", 0)) != lado:
			continue



		if int(g.get("min", -1)) == minute and String(g.get("asist", "")).is_empty() \
				and String(g.get("name", "")).to_upper() != asist.to_upper():
			g["asist"] = asist
		return









func add_line(minute: int, text: String, kind: String, num: int = 0,
		team: String = "", name: String = "", extra: int = 0,
		replay: bool = false, replay_id: int = -1) -> void:



	if extra > 0:
		_minute_extra = extra
		_pinta_reloj(minute)
	_lineas += 1
	_ultimas.append(text)
	while _ultimas.size() > 12:
		_ultimas.remove_at(0)





	_hito_pend = {}
	_apunta_evento(kind, name, minute, team, num)
	if kind == "goal_team" or kind == "goal_you" or kind == "goal_rival":
		_goles.append({"min": minute, "extra": extra, "name": name, "num": num,
			"lado": 1 if kind == "goal_rival" else 0, "asist": "",
			"rid": replay_id if replay else -1})
	elif (kind == "assist" or kind == "assist_rival") and not name.strip_edges().is_empty():
		_engancha_asistencia(name, minute, 1 if kind == "assist_rival" else 0)
	var st: Dictionary = _line_style(kind)
	var color: Color = st["color"]

	_vivo = {"min": minute, "extra": extra, "txt": text, "name": name,
		"col": color, "icon": String(st["icon"])}
	_pinta_vivo(true)




	var size: int = CareerTheme.T_TITLE if int(st["size"]) >= 40 \
			else CareerTheme.T_TITLE_MODAL





	var card: PanelContainer = PanelContainer.new()
	var card_sb: StyleBoxFlat = StyleBoxFlat.new()
	card_sb.bg_color = UiKit.CLEAR
	card_sb.set_corner_radius_all(12)
	card_sb.content_margin_left = 12.0
	card_sb.content_margin_right = 12.0
	card_sb.content_margin_top = 8.0
	card_sb.content_margin_bottom = 8.0
	card.add_theme_stylebox_override("panel", card_sb)
	card.set_meta("sb", card_sb)
	card.set_meta("accent", color)
	card.mouse_filter = Control.MOUSE_FILTER_IGNORE





	var card_col: VBoxContainer = VBoxContainer.new()
	card_col.add_theme_constant_override("separation", 18)
	card_col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	card_col.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	card_col.mouse_filter = Control.MOUSE_FILTER_IGNORE






	if name.is_empty():
		card.add_child(card_col)
	else:
		var fila_retrato: HBoxContainer = HBoxContainer.new()
		fila_retrato.add_theme_constant_override("separation", 22)
		fila_retrato.mouse_filter = Control.MOUSE_FILTER_IGNORE
		card.add_child(fila_retrato)
		fila_retrato.add_child(_face_chip(name, team, num))
		fila_retrato.add_child(card_col)

	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 10)
	row.mouse_filter = Control.MOUSE_FILTER_IGNORE
	card_col.add_child(row)






	row.add_child(_line_icon(String(st["icon"]), color, size))
	row.add_child(_minute_chip(minute, extra))






	if name.is_empty() and num > 0:
		row.add_child(_jersey_chip(num, team))








	var line: RichTextLabel = RichTextLabel.new()
	line.bbcode_enabled = true
	line.fit_content = true
	line.scroll_active = false
	line.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	line.mouse_filter = Control.MOUSE_FILTER_IGNORE
	line.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	line.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	line.add_theme_font_size_override("normal_font_size", size)

	line.add_theme_color_override("default_color", color.lerp(UiKit.INK_BODY, BODY_MIX))
	line.add_theme_color_override("font_outline_color", UiKit.OUTLINE)
	line.add_theme_constant_override("outline_size", 6)
	line.text = _decorate(CareerTheme.caps(text), CareerTheme.caps(name), color)
	card_col.add_child(line)




	var palabra: String = _palabra_de_kind(kind)
	if not palabra.is_empty():
		var lp: Label = Label.new()
		lp.text = _espaciada(palabra)
		lp.add_theme_font_size_override("font_size", CareerTheme.T_DIM)
		lp.add_theme_color_override("font_color", color)
		lp.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		lp.mouse_filter = Control.MOUSE_FILTER_IGNORE
		row.add_child(lp)








	if not name.is_empty():
		var ficha: Dictionary = _ficha_de(name, team)
		if not ficha.is_empty():
			var iconos: Control = _iconos_de(ficha)
			if iconos.get_child_count() > 0:
				iconos.size_flags_vertical = Control.SIZE_SHRINK_CENTER
				iconos.mouse_filter = Control.MOUSE_FILTER_IGNORE
				row.add_child(iconos)
			else:
				iconos.free()













	if replay:
		var boton: Button = Button.new()
		boton.text = I18n.t("▸ GOL")
		boton.custom_minimum_size = Vector2(170, 72)
		UiKit.apply_button(boton, UiKit.BTN_GRAY, 26)
		boton.add_theme_color_override("font_color", UiKit.GOLD)
		boton.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		boton.pressed.connect(func() -> void: replay_requested.emit(replay_id))
		row.add_child(boton)








	if _card != null and is_instance_valid(_card):
		_pintar_tira(_card_min, _card_txt, _card_col, _card_rid, _card_kind, _card_team)
		_card.queue_free()
	_card = card
	_card_min = _minute_chip_text(minute, extra)
	_card_txt = text
	_card_col = color


	_card_rid = replay_id if replay else -1
	_card_kind = kind
	_card_team = team
	card.set_anchors_preset(Control.PRESET_TOP_LEFT)



	var csb: StyleBoxFlat = card.get_meta("sb", null) as StyleBoxFlat
	if csb != null:








		csb.bg_color = SUP_ELEVADO
		csb.set_corner_radius_all(0)
		csb.border_width_left = 8
		csb.border_color = color
		csb.content_margin_left = 22.0
		csb.content_margin_right = 14.0
		csb.content_margin_top = 10.0
		csb.content_margin_bottom = 10.0
	if _relato_host != null:
		_relato_host.add_child(card)





		card.size.x = maxf(120.0, _relato_host.size.x)
		_encaja_tarjeta.call_deferred()



	if kind == "goal_you" or kind == "goal_team" or kind == "goal_rival":
		_fanfarria.call_deferred(card, color)
	card.modulate.a = 0.0
	var tw: Tween = card.create_tween()


	tw.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	tw.set_ignore_time_scale(true)
	tw.tween_property(card, "modulate:a", 1.0, 0.18)
















	if kind == "injury":

		_marca_evento("injury_rival" if team == "rival" else "injury_you", minute)
	else:


		_marca_evento(kind, minute, team != "rival")
	match kind:
		"goal_team":
			_bump_possession(true, DOM_GOL)
			_react_goal(true)
		"goal_you":



			_bump_possession(true, DOM_GOL)
		"goal_rival":
			_bump_possession(false, DOM_GOL)
			_react_goal(false)
		"near_team":
			_bump_possession(true)
		"near_rival":
			_bump_possession(false)
		_:
			_bump_possession(-1.0)

























func _decorate(text: String, name: String, ink: Color = UiKit.INK_BODY) -> String:
	var taken: Array[bool] = []
	taken.resize(text.length())
	taken.fill(false)
	var spans: Array[Dictionary] = []
	if not name.is_empty():
		_mark(text, name, UiKit.INK, taken, spans)
	for kw in _keywords():
		_mark(text, String(kw["w"]), ink, taken, spans)
	if spans.is_empty():
		return _esc(text)
	spans.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return int(a["at"]) < int(b["at"]))
	var out: String = ""
	var cur: int = 0
	for s in spans:
		var at: int = int(s["at"])
		var to: int = at + int(s["len"])
		out += _esc(text.substr(cur, at - cur))
		out += "[color=#%s]%s[/color]" % [(s["c"] as Color).to_html(false),
			_esc(text.substr(at, to - at))]
		cur = to
	return out + _esc(text.substr(cur))


















func _keywords() -> Array[Dictionary]:
	if _kw_locale == I18n.locale:
		return _kw_cache
	_kw_cache = []
	for i in KEYWORDS.size():
		var w: String = I18n.t(String(KEYWORDS[i]["w"]), "sim")
		if w.length() < 3:
			continue
		_kw_cache.append({"w": w, "c": KEYWORDS[i]["c"], "i": i})


	_kw_cache.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		var la: int = String(a["w"]).length()
		var lb: int = String(b["w"]).length()
		if la != lb:
			return la > lb
		return int(a["i"]) < int(b["i"]))
	_kw_locale = I18n.locale
	return _kw_cache





func _mark(text: String, word: String, c: Color, taken: Array[bool],
		spans: Array[Dictionary]) -> void:
	if word.is_empty():
		return
	var n: int = word.length()
	var at: int = text.find(word)
	while at >= 0:
		var to: int = at + n
		var free: bool = true
		for i in range(at, to):
			if taken[i]:
				free = false
				break
		if free and not _is_word_char(text, at - 1) and not _is_word_char(text, to):
			for i in range(at, to):
				taken[i] = true
			spans.append({"at": at, "len": n, "c": c})
		at = text.find(word, at + 1)





func _is_word_char(text: String, i: int) -> bool:
	if i < 0 or i >= text.length():
		return false
	var ch: String = text[i]
	return ch == "_" or ch.to_lower() != ch.to_upper() or (ch >= "0" and ch <= "9")




func _esc(s: String) -> String:
	return s.replace("[", "[lb]")











func _build_energy() -> Control:













	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 4)
	col.mouse_filter = Control.MOUSE_FILTER_IGNORE



	var cap: Label = Label.new()
	cap.text = I18n.t("ENERGÍA")
	cap.add_theme_font_size_override("font_size", CareerTheme.T_CAPTION)
	cap.add_theme_color_override("font_color", UiKit.INK_DIM)
	cap.mouse_filter = Control.MOUSE_FILTER_IGNORE
	col.add_child(cap)





	var box: HBoxContainer = HBoxContainer.new()
	box.add_theme_constant_override("separation", 10)
	box.size_flags_vertical = Control.SIZE_EXPAND_FILL
	box.mouse_filter = Control.MOUSE_FILTER_IGNORE
	col.add_child(box)






	_energy_meter = Control.new()






	_energy_meter.custom_minimum_size = Vector2(140, BARRA_H)
	_energy_meter.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	_energy_meter.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_energy_meter.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var track: ColorRect = ColorRect.new()
	track.color = UiKit.BCAST_TRACK
	track.set_anchors_preset(Control.PRESET_FULL_RECT)
	track.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_energy_meter.add_child(track)
	_energy_fill = ColorRect.new()





	_energy_fill.color = CareerTheme.energy_color(_energy_frac * 100.0)
	_energy_fill.position = Vector2.ZERO
	_energy_fill.size = Vector2(0, BARRA_H)
	_energy_fill.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_energy_meter.add_child(_energy_fill)
	_energy_meter.resized.connect(_layout_energy)
	box.add_child(_energy_meter)







	_energy_pct = _legend_label("100%", UiKit.INK_BODY)
	_energy_pct.add_theme_font_size_override("font_size", CareerTheme.T_VALUE)
	_energy_pct.custom_minimum_size = Vector2(88, 0)
	_energy_pct.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	_energy_pct.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	box.add_child(_energy_pct)



	return col
















func _build_nota() -> Control:
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 4)
	col.mouse_filter = Control.MOUSE_FILTER_IGNORE

	var cap: Label = Label.new()
	cap.text = I18n.t("NOTA", "hud")
	cap.add_theme_font_size_override("font_size", CareerTheme.T_CAPTION)
	cap.add_theme_color_override("font_color", UiKit.INK_DIM)
	cap.mouse_filter = Control.MOUSE_FILTER_IGNORE
	col.add_child(cap)

	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 10)
	fila.mouse_filter = Control.MOUSE_FILTER_IGNORE
	col.add_child(fila)

	_rating_label = Label.new()
	_rating_label.add_theme_font_size_override("font_size", NOTA_FONT)
	_rating_label.text = "6.0"








	_rating_label.custom_minimum_size = Vector2(164, 0)
	_rating_label.clip_text = true
	_rating_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	_rating_label.mouse_filter = Control.MOUSE_FILTER_IGNORE












	fila.add_child(_rating_label)




	_rating_delta = Label.new()
	_rating_delta.add_theme_font_size_override("font_size", CareerTheme.T_DIM)
	_rating_delta.add_theme_color_override("font_color", UiKit.GOLD)
	_rating_delta.vertical_alignment = VERTICAL_ALIGNMENT_CENTER





	_rating_delta.custom_minimum_size = Vector2(100, 0)
	_rating_delta.clip_text = true
	_rating_delta.mouse_filter = Control.MOUSE_FILTER_IGNORE
	fila.add_child(_rating_delta)










	_nota_ecg = NotaEcg.new()
	_nota_ecg.custom_minimum_size = Vector2(0, 46)
	_nota_ecg.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_nota_ecg.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	fila.add_child(_nota_ecg)









	set_rating(_rating_value)
	return col





func set_rating(value: float, delta: float = 0.0) -> void:
	_rating_value = value
	if _rating_label == null:
		return



	if not is_equal_approx(value, _rating_target):
		_rating_target = value


		_rating_hist.append(value)
		while _rating_hist.size() > 40:
			_rating_hist.remove_at(0)
		if _rating_tw != null and _rating_tw.is_valid():
			_rating_tw.kill()
		_rating_tw = create_tween()

		_rating_tw.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
		_rating_tw.set_ignore_time_scale(true)
		_rating_tw.tween_method(_pinta_nota, _rating_shown, value, 0.5) \
				.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	else:
		_pinta_nota(value)


	if _nota_ecg != null:
		_nota_ecg.late(delta, value)
	if _rating_delta != null:
		_rating_delta.text = "%+.1f" % delta if absf(delta) >= 0.05 else ""
		_rating_delta.add_theme_color_override("font_color",
			UiKit.GOLD if delta > 0.0 else UiKit.DANGER)


func _pinta_nota(v: float) -> void:
	_rating_shown = v
	_rating_label.text = "%.1f" % v


	var zona: int = 1
	var c: Color = UiKit.RATING_NEUTRAL
	if v < 5.5:
		zona = 0
		c = UiKit.DANGER
	elif v >= 8.5:
		zona = 3
		c = UiKit.GOLD
	elif v >= 7.0:
		zona = 2







		c = UiKit.GOLD
	_rating_label.add_theme_color_override("font_color", c)


	if _nota_ecg != null:
		_nota_ecg.color = c
	_marca_zona(zona, c)

















func _marca_zona(zona: int, c: Color) -> void:
	if zona == _nota_zona:
		return
	var primera: bool = _nota_zona < 0
	_nota_zona = zona
	if primera:
		return



	CareerUi.acuse(_rating_label)














func _build_footer() -> Control:
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 12)
	row.custom_minimum_size = Vector2(0, 96)
	row.mouse_filter = Control.MOUSE_FILTER_IGNORE


















	_style_tile = CareerUi.ficha_plan(I18n.t("PLANTEAMIENTO"),
		_plan_label(MatchPlan.STYLE_LABELS, Career.play_style),
		_plan_pal(STYLE_PALETTES, Career.play_style),
		STYLE_ICONS[clampi(Career.play_style, 0, STYLE_ICONS.size() - 1)],
		_abrir_estilo)
	_style_tile.custom_minimum_size = Vector2(0, 96)
	_style_tile.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	row.add_child(_style_tile)

	_intensity_tile = CareerUi.ficha_plan(I18n.t("INTENSIDAD"),
		_plan_label(MatchPlan.INTENSITY_LABELS, Career.intensity),
		_plan_pal(INTENSITY_PALETTES, Career.intensity),
		INTENSITY_ICONS[clampi(Career.intensity, 0, INTENSITY_ICONS.size() - 1)],
		_abrir_intensidad)
	_intensity_tile.custom_minimum_size = Vector2(0, 96)
	_intensity_tile.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	row.add_child(_intensity_tile)

	row.add_child(_build_sub_btn())
















	var pause_btn: Button = Button.new()


	pause_btn.text = "II"
	pause_btn.custom_minimum_size = Vector2(84, 96)
	UiKit.apply_button(pause_btn, UiKit.BTN_GRAY_LO, CareerTheme.T_BODY)
	pause_btn.add_theme_color_override("font_color", UiKit.INK_BODY)
	_estrecha(pause_btn)
	pause_btn.pressed.connect(func() -> void: pause_requested.emit())
	row.add_child(pause_btn)

	_speed_btn = Button.new()
	_speed_btn.text = "x%d" % SPEED_LEVELS[_speed_idx]
	_speed_btn.custom_minimum_size = Vector2(110, 96)
	UiKit.apply_button(_speed_btn, UiKit.BTN_GRAY_HI, 28)
	_estrecha(_speed_btn)
	_speed_btn.pressed.connect(_on_speed_pressed)



	_speed_btn.set_meta(Entrada.PRIMERO_META, true)
	row.add_child(_speed_btn)
	return row


















func _estrecha(b: Button) -> void:
	for estado: String in ["normal", "hover", "focus", "pressed", "hover_pressed"]:
		var sb: StyleBoxFlat = b.get_theme_stylebox(estado) as StyleBoxFlat
		if sb == null:
			continue
		sb.content_margin_left = 16.0
		sb.content_margin_right = 16.0




func _plan_label(tabla: Array, idx: int) -> String:
	if idx < 0 or idx >= tabla.size():
		return ""
	return I18n.t(String(tabla[idx]), "plan")




func _plan_pal(paletas: Array, idx: int) -> Dictionary:
	return paletas[clampi(idx, 0, paletas.size() - 1)]










func set_sub_agotado(on: bool) -> void:
	if _sub_btn == null or not is_instance_valid(_sub_btn):
		return
	_sub_btn.disabled = on


	_sub_btn.modulate = CareerTheme.DISABLED_INK if on else Color.WHITE
	if _sub_word != null and is_instance_valid(_sub_word):
		_sub_word.text = I18n.t("SIN CAMBIOS") if on else _sub_word.text


func _build_sub_btn() -> Button:
	_sub_btn = Button.new()
	_sub_btn.custom_minimum_size = Vector2(150, 96)
	UiKit.apply_button(_sub_btn, UiKit.BTN_GRAY, CareerTheme.T_CAPTION)
	_sub_btn.text = ""



	_sub_btn.clip_text = true
	_sub_btn.clip_contents = true



	_sub_btn.add_theme_color_override("font_color", UiKit.INK_NONE)
	_sub_btn.add_theme_color_override("font_hover_color", UiKit.INK_NONE)
	_sub_btn.add_theme_color_override("font_pressed_color", UiKit.INK_NONE)
	_sub_btn.add_theme_color_override("font_disabled_color", UiKit.INK_NONE)





	_sub_btn.add_theme_color_override("font_outline_color", UiKit.CLEAR)
	_sub_btn.add_theme_constant_override("outline_size", 0)

	_sub_fill = ColorRect.new()
	_sub_fill.color = UiKit.HOLD_FILL
	_sub_fill.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_sub_fill.anchor_left = 0.0
	_sub_fill.anchor_right = 1.0
	_sub_fill.anchor_top = 1.0
	_sub_fill.anchor_bottom = 1.0
	_sub_btn.add_child(_sub_fill)

	var caja: VBoxContainer = VBoxContainer.new()
	caja.set_anchors_preset(Control.PRESET_FULL_RECT)
	caja.offset_top = 10.0
	caja.offset_bottom = - float(CareerTheme.SINK) - 8.0
	caja.add_theme_constant_override("separation", 4)
	caja.alignment = BoxContainer.ALIGNMENT_CENTER
	caja.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_sub_btn.add_child(caja)

	_sub_icon = MenuIcon.new()
	_sub_icon.setup("banquillo", UiKit.GOLD)
	_sub_icon.custom_minimum_size = Vector2(SUB_ICON, SUB_ICON)
	_sub_icon.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	_sub_icon.mouse_filter = Control.MOUSE_FILTER_IGNORE
	caja.add_child(_sub_icon)

	_sub_word = Label.new()
	_sub_word.add_theme_font_size_override("font_size", CareerTheme.T_CAPTION)
	_sub_word.add_theme_color_override("font_color", UiKit.GOLD)
	_sub_word.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_sub_word.clip_text = true
	_sub_word.mouse_filter = Control.MOUSE_FILTER_IGNORE
	caja.add_child(_sub_word)

	_sub_btn.button_down.connect(_hold_sub_start)
	_sub_btn.button_up.connect(_hold_sub_cancel)
	_sub_btn.mouse_exited.connect(_hold_sub_cancel)
	return _sub_btn





func _abrir_plan(titulo: String, tabla: Array, paletas: Array, iconos: Array,
		actual: int, al_elegir: Callable) -> void:
	if not _on_pitch:
		return
	var box: VBoxContainer = CareerUi.modal(self)
	if box == null:
		return

	box.get_parent().get_parent().process_mode = Node.PROCESS_MODE_ALWAYS
	_pause_tomada = not get_tree().paused
	if _pause_tomada:
		get_tree().paused = true
	CareerUi.head(box, titulo)
	for i: int in tabla.size():
		var pal: Dictionary = paletas[clampi(i, 0, paletas.size() - 1)]
		var b: Button = CareerUi.menu_row(I18n.t(String(tabla[i]), "plan"), "",
			pal.get("bg", UiKit.GOLD), String(iconos[i]))
		if i == actual:
			b.modulate = Color(1, 1, 1, 0.55)
		b.pressed.connect(func() -> void:
			_cerrar_plan()
			al_elegir.call(i))
		box.add_child(b)




























const ALIN_W: Array = [50.0, 74.0, 44.0, 0.0, 168.0, 44.0, 72.0]



const ALIN_ICONOS_MAX: int = 6



const ALIN_ICONO: float = 30.0



const ALIN_OVR_NUM: int = 14






const ALIN_AMARILLA: float = -0.3
const ALIN_ROJA: float = -1.5








const ALIN_CARA: Vector2 = Vector2(46.0, 60.0)



const ALIN_BANCA: int = 7











const ALIN_W_TUMBADO: Array = [23.0, 64.0, 32.0, 0.0, 98.0, 32.0, 50.0]
const ALIN_CARA_TUMBADA: Vector2 = Vector2(23.0, 30.0)
const ALIN_OVR_NUM_TUMBADO: int = 12
const ALIN_ICONOS_MAX_TUMBADO: int = 3

const ALIN_SEP_TUMBADO: int = 6
const ALIN_FILAS_SEP_TUMBADO: int = 2
var _tab_idx: int = 0
var _tab_btns: Array[Button] = []

var _balon: Texture2D = null
var _tab_relato: Control = null
var _tab_alin: Control = null
var _alin_host: VBoxContainer = null
var _alin_scroll: ScrollContainer = null
var _alin_scroll_tw: Tween = null




var _alin_lados: Array[VBoxContainer] = []


var _medidor_caja: Control = null


var _alin_cabeceras: Array[Control] = [null, null]



var _vivo: Dictionary = {}
var _vivo_panel: PanelContainer = null
var _vivo_raya: ColorRect = null
var _vivo_chips: HBoxContainer = null
var _vivo_txt: RichTextLabel = null
var _vivo_tw: Tween = null


const VIVO_ALTO: float = 64.0
const VIVO_ICONO: int = 30














var _alin_filas: Array[Dictionary] = []




const ALIN_COL_DORSAL: int = 2
const ALIN_COL_NOMBRE: int = 3
const ALIN_COL_NOTA: int = 6



func _alin_cols() -> Array:
	var w: Array = ALIN_W_TUMBADO if _alin_tumbada() else ALIN_W
	return [
		{"text": "", "w": w[0]},
		{"text": "", "w": w[1]},
		{"text": "#", "w": w[2], "align": HORIZONTAL_ALIGNMENT_RIGHT},
		{"text": I18n.t("JUGADOR"), "w": w[3]},
		{"text": "", "w": w[4]},
		{"text": I18n.t("OVR"), "w": w[5], "align": HORIZONTAL_ALIGNMENT_CENTER},
		{"text": I18n.t("NOTA"), "w": w[6], "align": HORIZONTAL_ALIGNMENT_RIGHT},
	]




func _alin_tumbada() -> bool:
	return not _alin_lados.is_empty()



func _alin_destino(lado: int) -> VBoxContainer:
	return _alin_lados[clampi(lado, 0, 1)] if _alin_tumbada() else _alin_host




func _build_zona_central() -> Control:
	var caja: VBoxContainer = VBoxContainer.new()
	caja.add_theme_constant_override("separation", 12)
	caja.size_flags_vertical = Control.SIZE_EXPAND_FILL
	caja.mouse_filter = Control.MOUSE_FILTER_IGNORE

	var barra: HBoxContainer = HBoxContainer.new()
	barra.add_theme_constant_override("separation", 12)
	_tab_btns.clear()
	for i in 2:






		var b: Button = Button.new()

		b.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
		b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		UiKit.apply_button(b, TAB_PALETA, CareerTheme.T_BODY)





		var ic: MenuIcon = MenuIcon.new()
		ic.set_anchors_preset(Control.PRESET_FULL_RECT)
		ic.offset_top = 4.0
		ic.offset_bottom = -4.0 - float(CareerTheme.SINK)
		ic.mouse_filter = Control.MOUSE_FILTER_IGNORE


		ic.setup("tv" if i == 0 else "equipo",
			UiKit.BTN_BLUE["bg"] if i == 0 else UiKit.BTN_PURPLE["bg"])
		b.add_child(ic)
		var idx: int = i
		b.pressed.connect(func() -> void: _toca_tab(idx))
		_tab_btns.append(b)
		barra.add_child(b)
	caja.add_child(barra)

	_tab_relato = _build_pulso()
	caja.add_child(_tab_relato)
	_tab_alin = _build_alineaciones()
	caja.add_child(_tab_alin)
	_ver_tab(0)
	return caja




func _ver_tab(idx: int) -> void:
	var previo: int = _tab_idx
	_tab_idx = clampi(idx, 0, 1)
	if _tab_relato != null:
		_tab_relato.visible = _tab_idx == 0
	if _tab_alin != null:
		_tab_alin.visible = _tab_idx == 1
	for i in _tab_btns.size():



		_tab_btns[i].modulate = Color.WHITE if i == _tab_idx \
				else CareerTheme.DISABLED_INK





	if _tab_idx == 1 and (previo != 1 or _alin_filas.is_empty()):
		_pinta_alineacion()






func _ficha_de(name: String, team: String) -> Dictionary:
	var llave: String = name
	if name.to_upper() == CareerTheme.caps(Career.player_name).to_upper():
		llave = Career.player_name
	var lado: int = 1 if team == "rival" else 0
	var ficha: Dictionary =(_eventos[lado] as Dictionary).get(llave, {})
	if ficha.is_empty():
		ficha =(_eventos[1 - lado] as Dictionary).get(llave, {})
	return ficha






func _toca_tab(idx: int) -> void:
	if idx == 1 and _tab_idx == 1:
		_salta_a_equipo(1 - _equipo_a_la_vista())
		return
	_ver_tab(idx)





func _ver_alineaciones(lado: int) -> void:
	var ya_estaba: bool = _tab_idx == 1
	_ver_tab(1)
	_salta_a_equipo(lado, ya_estaba)





func _equipo_a_la_vista() -> int:
	var cab: Control = _alin_cabeceras[1]
	if _alin_scroll == null or cab == null or not is_instance_valid(cab):
		return 0
	return 1 if float(_alin_scroll.scroll_vertical) >= cab.position.y - 30.0 else 0










func _salta_a_equipo(lado: int, animado: bool = true) -> void:
	if _alin_scroll == null or not is_instance_valid(_alin_scroll):
		return
	await get_tree().process_frame
	if not is_instance_valid(_alin_scroll):
		return
	var cab: Control = _alin_cabeceras[clampi(lado, 0, 1)]
	var destino: int = 0
	if lado == 1 and cab != null and is_instance_valid(cab):
		destino = int(cab.position.y)
	if _alin_scroll_tw != null and _alin_scroll_tw.is_valid():
		_alin_scroll_tw.kill()
	if not animado:
		_alin_scroll.scroll_vertical = destino
		return
	_alin_scroll_tw = _alin_scroll.create_tween()


	_alin_scroll_tw.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	_alin_scroll_tw.set_ignore_time_scale(true)
	_alin_scroll_tw.tween_property(_alin_scroll, "scroll_vertical", destino, 0.3) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)










func _build_alineaciones() -> Control:
	var plate: PanelContainer = PanelContainer.new()
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = SUP_PANEL
	sb.set_border_width_all(2)
	sb.border_color = SUP_FILO
	sb.set_corner_radius_all(20)
	sb.set_content_margin_all(18)
	_sb_paneles.append(sb)
	plate.add_theme_stylebox_override("panel", sb)
	plate.size_flags_vertical = Control.SIZE_EXPAND_FILL

	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 12)
	col.size_flags_vertical = Control.SIZE_EXPAND_FILL
	plate.add_child(col)
	col.add_child(_build_vivo())




	if UiKit.es_horizontal():
		_alin_host = VBoxContainer.new()
		_alin_host.size_flags_vertical = Control.SIZE_EXPAND_FILL
		_alin_host.mouse_filter = Control.MOUSE_FILTER_IGNORE
		col.add_child(_alin_host)
		var par: HBoxContainer = HBoxContainer.new()
		par.add_theme_constant_override("separation", 20)
		par.size_flags_vertical = Control.SIZE_EXPAND_FILL
		par.mouse_filter = Control.MOUSE_FILTER_IGNORE
		_alin_host.add_child(par)
		_alin_lados.clear()
		for _i in 2:
			var lado: VBoxContainer = VBoxContainer.new()
			lado.size_flags_horizontal = Control.SIZE_EXPAND_FILL
			lado.add_theme_constant_override("separation", ALIN_FILAS_SEP_TUMBADO)
			lado.mouse_filter = Control.MOUSE_FILTER_IGNORE
			par.add_child(lado)
			_alin_lados.append(lado)
		return plate

	var scroll: ScrollContainer = ScrollContainer.new()
	scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
	scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	col.add_child(scroll)
	_alin_scroll = scroll
	_alin_host = VBoxContainer.new()
	_alin_host.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_alin_host.add_theme_constant_override("separation", 6)
	scroll.add_child(_alin_host)
	return plate












func _build_vivo() -> Control:
	var panel: PanelContainer = PanelContainer.new()
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = UiKit.INK_WASH
	sb.set_corner_radius_all(12)
	sb.content_margin_left = 12.0
	sb.content_margin_right = 12.0
	sb.content_margin_top = 8.0
	sb.content_margin_bottom = 8.0
	panel.add_theme_stylebox_override("panel", sb)


	panel.clip_contents = true


	panel.mouse_filter = Control.MOUSE_FILTER_STOP




	CareerUi.tocable_mando(panel)
	panel.gui_input.connect(func(ev: InputEvent) -> void:
		if ev is InputEventMouseButton and not (ev as InputEventMouseButton).pressed \
				and (ev as InputEventMouseButton).button_index == MOUSE_BUTTON_LEFT:
			_ver_tab(0))
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 12)
	fila.mouse_filter = Control.MOUSE_FILTER_IGNORE
	panel.add_child(fila)

	_vivo_raya = ColorRect.new()
	_vivo_raya.custom_minimum_size = Vector2(6, 0)
	_vivo_raya.color = UiKit.CYAN
	_vivo_raya.mouse_filter = Control.MOUSE_FILTER_IGNORE
	fila.add_child(_vivo_raya)
	_vivo_chips = HBoxContainer.new()
	_vivo_chips.add_theme_constant_override("separation", 8)
	_vivo_chips.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	_vivo_chips.mouse_filter = Control.MOUSE_FILTER_IGNORE
	fila.add_child(_vivo_chips)
	_vivo_txt = RichTextLabel.new()
	_vivo_txt.bbcode_enabled = true
	_vivo_txt.fit_content = false
	_vivo_txt.scroll_active = false
	_vivo_txt.clip_contents = true
	_vivo_txt.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_vivo_txt.vertical_alignment = VERTICAL_ALIGNMENT_CENTER

	_vivo_txt.custom_minimum_size = Vector2(0, VIVO_ALTO)
	_vivo_txt.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_vivo_txt.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_vivo_txt.add_theme_font_size_override("normal_font_size", CareerTheme.T_BODY)
	_vivo_txt.add_theme_color_override("font_outline_color", UiKit.OUTLINE)
	_vivo_txt.add_theme_constant_override("outline_size", 4)
	fila.add_child(_vivo_txt)
	_vivo_panel = panel
	_pinta_vivo(false)
	return panel






func _pinta_vivo(golpe: bool) -> void:
	if _vivo_txt == null or not is_instance_valid(_vivo_txt):
		return
	for c in _vivo_chips.get_children():
		_vivo_chips.remove_child(c)
		c.queue_free()
	if _vivo.is_empty():

		_vivo_raya.color = UiKit.CYAN
		_vivo_txt.text = "[color=#%s]%s[/color]" % [UiKit.INK_BODY.to_html(false),
			I18n.t("EN VIVO")]
		return
	var col: Color = _vivo["col"]
	_vivo_raya.color = col
	_vivo_chips.add_child(_line_icon(String(_vivo["icon"]), col, VIVO_ICONO))
	_vivo_chips.add_child(_minute_chip(int(_vivo["min"]), int(_vivo["extra"])))
	_vivo_txt.add_theme_color_override("default_color", col.lerp(UiKit.INK_BODY, BODY_MIX))
	_vivo_txt.text = _decorate(CareerTheme.caps(String(_vivo["txt"])),
		CareerTheme.caps(String(_vivo["name"])), col)
	if not golpe or _tab_idx != 1:
		return
	if _vivo_tw != null and _vivo_tw.is_valid():
		_vivo_tw.kill()
	_vivo_tw = _vivo_panel.create_tween()
	_vivo_tw.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	_vivo_tw.set_ignore_time_scale(true)
	_vivo_tw.tween_property(_vivo_panel, "modulate:a", 1.0, 0.25).from(0.35) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	if String(_vivo["icon"]) == "balon":
		_fanfarria(_vivo_panel, col)







func _destella_fila(lado: int, nom: String, clave: String) -> void:
	var col: Color = UiKit.INK_BODY
	match clave:
		"goal", "assist":
			col = UiKit.GOLD if lado == 0 else UiKit.DANGER
		"parada":
			col = UiKit.CYAN
		"amarilla", "penal":
			col = UiKit.AMBER
		"roja":
			col = UiKit.DANGER
		"fuera", "dentro":
			col = CareerTheme.TEXT
	for d in _alin_filas:
		if int(d.get("lado", -1)) != lado or String(d.get("nom", "")) != nom:
			continue
		var row: Control = SceneFade.vivo(d.get("row")) as Control
		if row == null or not is_instance_valid(row):
			return
		var brillo: Color = Color.WHITE.lerp(col, 0.55) * 1.7
		brillo.a = 1.0
		var tw: Tween = row.create_tween()
		tw.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
		tw.set_ignore_time_scale(true)
		tw.tween_property(row, "modulate", Color.WHITE, 0.6).from(brillo) \
				.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
		return







func apunta_parada(de_rival: bool, name: String, minute: int, num: int = 0) -> void:
	_apunta_evento("save_rival" if de_rival else "save_you", name, minute,
		"rival" if de_rival else "you", num)













func apunta_accion(de_rival: bool, name: String, accion: String) -> void:
	if name.strip_edges().is_empty() or accion.is_empty():
		return
	if name.to_upper() == CareerTheme.caps(Career.player_name).to_upper():
		return
	var tabla: Dictionary = _eventos[1 if de_rival else 0]
	var ficha: Dictionary = tabla.get(name, {})
	if int(ficha.get("roja", 0)) > 0:
		return
	var acc: Dictionary = ficha.get("acc", {})
	acc[accion] = int(acc.get(accion, 0)) + 1
	ficha["acc"] = acc
	tabla[name] = ficha
	if _tab_idx == 1:
		_refresca_alineacion()










func _apunta_evento(kind: String, name: String, minute: int,
		team: String = "", num: int = 0) -> void:
	if name.strip_edges().is_empty():
		return
	var lado: int = -1
	var clave: String = ""
	match kind:
		"goal_team", "goal_you":
			lado = 0
			clave = "goal"
		"assist":
			lado = 0
			clave = "assist"
		"goal_rival":
			lado = 1
			clave = "goal"
		"assist_rival":
			lado = 1
			clave = "assist"
		"card", "card_you":
			lado = 1 if kind == "card" else 0
			clave = "amarilla"
		"red", "red_you":
			lado = 1 if kind == "red" else 0
			clave = "roja"
		"penal_miss", "penal_miss_rival":
			lado = 1 if kind == "penal_miss_rival" else 0
			clave = "penal"
		"save_you":
			lado = 0
			clave = "parada"
		"save_rival":
			lado = 1
			clave = "parada"
		"injury", "injury_you":





			lado = 1 if team == "rival" else 0
			clave = "fuera"
		"sub_out", "sub_in":



			lado = 1 if team == "rival" else 0
			clave = "fuera" if kind == "sub_out" else "dentro"
		"sub":









			if name.to_upper() == CareerTheme.caps(Career.player_name).to_upper():
				lado = 0
				clave = "dentro" if _tu_sub_es_entrada() else "fuera"
	if lado < 0:
		return





	var nom_linea: String = name
	if name.to_upper() == CareerTheme.caps(Career.player_name).to_upper():
		name = Career.player_name
	var tabla: Dictionary = _eventos[lado]
	var ficha: Dictionary = tabla.get(name, {})




	if int(ficha.get("roja", 0)) > 0:
		return
	if clave == "fuera" or clave == "dentro":
		ficha[clave] = minute














		if num > 0:
			ficha["dorsal"] = num
		tabla[name] = ficha
		var par: String = _empareja_cambio(tabla, name,
			"dentro" if clave == "fuera" else "fuera", minute)
		ficha = tabla.get(name, ficha)
		ficha["por"] = par
		if not par.is_empty():
			ficha["por_num"] = int((tabla[par] as Dictionary).get("dorsal", 0))
	else:
		ficha[clave] = int(ficha.get(clave, 0)) + 1


		if clave == "amarilla" and not ficha.has("amarilla_min"):
			ficha["amarilla_min"] = minute


	if kind == "injury" or kind == "injury_you":
		ficha["lesion"] = 1
	tabla[name] = ficha
	_hito_pend = _hito_de(lado, clave, ficha, tabla, nom_linea)





	if _tab_idx == 1:
		_refresca_alineacion()
		_destella_fila(lado, name, clave)












func _tu_sub_es_entrada() -> bool:
	if _titular:
		return false
	var ficha: Dictionary =(_eventos[0] as Dictionary).get(Career.player_name, {})
	return int(ficha.get("dentro", 0)) <= 0 and int(ficha.get("fuera", 0)) <= 0









const HITO_GOLES: Dictionary = {
	2: "¡DOBLETE DE {0}!",
	3: "¡TERCERO DE {0}: HAT-TRICK!",
	4: "¡CUATRO DE {0}! SÚPER HAT-TRICK",
	5: "¡CINCO DE {0}! LA MANITA",
}
const HITO_GOLES_MAS: String = "¡{1} GOLES DE {0}! DE LEYENDA"
const HITO_ASIST: Dictionary = {
	2: "¡OTRA ASISTENCIA DE {0}! VAN DOS",
	3: "¡TERCERA ASISTENCIA DE {0}!",
}
const HITO_ASIST_MAS: String = "¡{1} ASISTENCIAS DE {0}!"
const HITO_PARADAS: Dictionary = {
	3: "{0} YA LLEVA TRES PARADAS",
	5: "¡CINCO PARADAS DE {0}!",
}
const HITO_PARADAS_MAS: String = "¡{1} PARADAS! {0} ES UN MURO"
const HITO_ROJA_TRAS_AMARILLA: String = "{0} YA TENÍA AMARILLA ({1}')"
const HITO_SEGUNDA_ROJA: Array[String] = [
	"¡OTRA ROJA! TU EQUIPO SE QUEDA CON NUEVE",
	"¡OTRA ROJA! EL RIVAL SE QUEDA CON NUEVE",
]
const HITO_AMARILLAS: Dictionary = {
	3: ["YA SON TRES AMARILLAS DE TU EQUIPO",
		"YA SON TRES AMARILLAS DEL RIVAL"],
	5: ["¡CINCO AMARILLAS DE TU EQUIPO!",
		"¡CINCO AMARILLAS DEL RIVAL!"],
}










func _hito_de(lado: int, clave: String, ficha: Dictionary, tabla: Dictionary,
		nom: String) -> Dictionary:
	var team: String = "you" if lado == 0 else "rival"
	var kind: String = "hito" if lado == 0 else "hito_mal"
	var n: int = int(ficha.get(clave, 0))
	var tpl: String = ""
	match clave:
		"goal":
			tpl = String(HITO_GOLES.get(n, HITO_GOLES_MAS if n > 5 else ""))
		"assist":
			tpl = String(HITO_ASIST.get(n, HITO_ASIST_MAS if n > 3 else ""))
		"parada":
			tpl = String(HITO_PARADAS.get(n,
				HITO_PARADAS_MAS if n > 5 and n % 2 == 1 else ""))
		"roja":


			var rojas: int = 0
			for f in tabla.values():
				if int((f as Dictionary).get("roja", 0)) > 0:
					rojas += 1
			if rojas == 2:
				return {"text": I18n.t(HITO_SEGUNDA_ROJA[lado]), "kind": "hito_tarjeta",
					"name": "", "team": team}
			if int(ficha.get("amarilla", 0)) > 0:
				return {"text": I18n.tf(HITO_ROJA_TRAS_AMARILLA,
					[nom, int(ficha.get("amarilla_min", 0))]),
					"kind": "hito_tarjeta", "name": nom, "team": team}
			return {}
		"amarilla":
			var amarillas: int = 0
			for f in tabla.values():
				amarillas += int((f as Dictionary).get("amarilla", 0))
			var par: Array = HITO_AMARILLAS.get(amarillas, [])
			if par.is_empty():
				return {}
			return {"text": I18n.t(String(par[lado])), "kind": "hito_tarjeta",
				"name": "", "team": team}
	if tpl.is_empty():
		return {}
	return {"text": I18n.tf(tpl, [nom, n]), "kind": kind, "name": nom, "team": team}




func saca_hito() -> Dictionary:
	var h: Dictionary = _hito_pend
	_hito_pend = {}
	return h








func _empareja_cambio(tabla: Dictionary, quien: String, busca: String,
		minute: int) -> String:
	for otro: String in tabla:
		if otro == quien:
			continue
		var f: Dictionary = tabla[otro]
		if int(f.get(busca, -1)) != minute:
			continue
		if not String(f.get("por", "")).is_empty():
			continue
		f["por"] = quien
		f["por_num"] = int((tabla.get(quien, {}) as Dictionary).get("dorsal", 0))
		tabla[otro] = f
		return otro
	return ""















func _nota_npc(ev: Dictionary, pos: String = "", lado: int = -1) -> float:
	var cuenta: Dictionary =(ev.get("acc", {}) as Dictionary).duplicate()
	cuenta["goal"] = int(ev.get("goal", 0))
	cuenta["assist"] = int(ev.get("assist", 0))
	cuenta["penal_wide"] = int(cuenta.get("penal_wide", 0)) + int(ev.get("penal", 0))
	var n: float = MatchRating.score(cuenta)



	n += MatchRating.GK_SAVE * MatchRating.GAIN * float(int(ev.get("parada", 0)))
	n += ALIN_AMARILLA * float(int(ev.get("amarilla", 0)))
	n += ALIN_ROJA * float(int(ev.get("roja", 0)))
	n += _bono_cero(pos, lado)
	return snappedf(clampf(n, 1.0, 10.0), 0.1)





func _bono_cero(pos: String, lado: int) -> float:
	if pos.is_empty() or lado < 0:
		return 0.0
	var encajados: int = _rival_goals if lado == 0 else _you_goals
	if encajados > 0:
		return 0.0
	var linea: String = Squad.line_of(pos)
	var base: float = MatchRating.CLEAN_SHEET_GK if linea == "POR" \
			else (MatchRating.CLEAN_SHEET_DEF if linea == "DEF" else 0.0)
	if base <= 0.0:
		return 0.0
	return base * clampf(float(_minute) / 90.0, 0.0, 1.0)















func _iconos_de(ev: Dictionary) -> Control:
	var caja: HBoxContainer = HBoxContainer.new()
	caja.add_theme_constant_override("separation", 4)
	caja.alignment = BoxContainer.ALIGNMENT_BEGIN
	_llena_iconos(caja, ev)
	return caja





func _llena_iconos(caja: HBoxContainer, ev: Dictionary) -> void:
	for c in caja.get_children():
		caja.remove_child(c)
		c.queue_free()
	if ev.is_empty():
		return


	var piezas: Array = []
	for i in int(ev.get("goal", 0)):
		piezas.append(["gol", Color.WHITE])
	for i in int(ev.get("assist", 0)):
		piezas.append(["asist", UiKit.GOLD])
	for i in int(ev.get("parada", 0)):
		piezas.append(["icono:guante", UiKit.CYAN])
	for i in int(ev.get("penal", 0)):
		piezas.append(["icono:precision", UiKit.AMBER])
	for i in int(ev.get("amarilla", 0)):
		piezas.append(["icono:tarjeta", UiKit.AMBER])
	for i in int(ev.get("roja", 0)):
		piezas.append(["icono:tarjeta", UiKit.DANGER])
	if int(ev.get("lesion", 0)) > 0:
		piezas.append(["icono:cruz_medica", UiKit.DANGER])
	if int(ev.get("dentro", 0)) > 0:
		piezas.append(["entra", CareerTheme.GOOD])
	if int(ev.get("fuera", 0)) > 0:
		piezas.append(["sale", CareerTheme.DANGER])








	if int(ev.get("por_num", 0)) > 0:
		piezas.append(["dorsal:%d" % int(ev["por_num"]), CareerTheme.TEXT_DIM])
	var tope: int = mini(piezas.size(), ALIN_ICONOS_MAX)


	if _alin_tumbada():
		tope = mini(piezas.size(), ALIN_ICONOS_MAX_TUMBADO)
		if piezas.size() > tope:
			tope -= 1
	for i in tope:
		caja.add_child(_pieza_suceso(String(piezas[i][0]), piezas[i][1] as Color))
	if piezas.size() > tope:
		var mas: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
		mas.text = "+%d" %(piezas.size() - tope)
		caja.add_child(mas)





func _pieza_suceso(clave: String, col: Color) -> Control:
	if clave == "gol":
		var tex: Texture2D = _balon_tex()
		if tex != null:
			var tr: TextureRect = TextureRect.new()
			tr.texture = tex
			tr.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
			tr.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
			tr.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
			tr.custom_minimum_size = Vector2(ALIN_ICONO, ALIN_ICONO)
			tr.mouse_filter = Control.MOUSE_FILTER_IGNORE
			return tr

		return _icono_menu("balon", UiKit.GOLD)
	if clave == "asist":



		var chip: PanelContainer = CareerUi.code_chip(I18n.t("A", "asist"), col,
			CareerTheme.T_CAPTION, 7.0, 2.0)
		chip.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		chip.custom_minimum_size = Vector2(0, ALIN_ICONO)
		return chip
	if clave.begins_with("dorsal:"):


		var pc: PanelContainer = CareerUi.code_chip("#" + clave.trim_prefix("dorsal:"),
			col, CareerTheme.T_CAPTION, 7.0, 2.0)
		pc.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		pc.custom_minimum_size = Vector2(0, ALIN_ICONO)
		return pc
	if clave == "entra" or clave == "sale":



		var caja: Control = Control.new()
		caja.custom_minimum_size = Vector2(ALIN_ICONO, ALIN_ICONO)
		caja.mouse_filter = Control.MOUSE_FILTER_IGNORE
		var ic: MenuIcon = _icono_menu("flecha_der", col)
		ic.set_anchors_preset(Control.PRESET_FULL_RECT)
		ic.pivot_offset = Vector2(ALIN_ICONO, ALIN_ICONO) * 0.5
		ic.rotation = - PI * 0.5 if clave == "entra" else PI * 0.5
		caja.add_child(ic)
		return caja
	return _icono_menu(clave.trim_prefix("icono:"), col)


func _icono_menu(tipo: String, col: Color) -> MenuIcon:
	var ic: MenuIcon = MenuIcon.new()
	ic.custom_minimum_size = Vector2(ALIN_ICONO, ALIN_ICONO)
	ic.mouse_filter = Control.MOUSE_FILTER_IGNORE
	ic.setup(tipo, col)
	return ic




func _balon_tex() -> Texture2D:
	if _balon != null:
		return _balon
	var frames: SpriteFrames = BallDeco.frames_for(GameState.current_fixture(), true)
	if frames == null or frames.get_frame_count("idle") <= 0:
		return null
	_balon = frames.get_frame_texture("idle", 0)
	return _balon













func _pinta_alineacion(_lado: int = 0) -> void:
	if _alin_host == null or not is_instance_valid(_alin_host):
		return
	_alin_filas.clear()
	_alin_cabeceras.fill(null)



	var cajas: Array = _alin_lados if _alin_tumbada() else [_alin_host]
	for caja: VBoxContainer in cajas:
		for c in caja.get_children():
			caja.remove_child(c)
			c.queue_free()
	for lado in 2:
		_pinta_equipo(lado)









func _refresca_alineacion() -> void:
	for d in _alin_filas:
		var row: HBoxContainer = SceneFade.vivo(d.get("row")) as HBoxContainer
		if row == null or not is_instance_valid(row):
			continue
		var lado: int = int(d.get("lado", 0))
		var eres_tu: bool = bool(d.get("eres_tu", false))
		var banca: bool = bool(d.get("banca", false))
		var ev: Dictionary =(_eventos[lado] as Dictionary).get(String(d.get("nom", "")), {})


		var jugo: bool = not banca or int(ev.get("dentro", 0)) > 0 \
				or (eres_tu and _he_entrado)
		var nota: float = _rating_value if eres_tu \
				else _nota_npc(ev, String(d.get("pos", "MC")), lado)
		var tinta: Color = CareerTheme.TEXT
		if eres_tu:
			tinta = UiKit.CYAN
		elif int(ev.get("roja", 0)) > 0 or int(ev.get("fuera", 0)) > 0 or not jugo:
			tinta = CareerTheme.TEXT_DIM
		var firma: String = str(ev)
		if firma != String(d.get("firma", "")):
			var caja: HBoxContainer = SceneFade.vivo(d.get("iconos")) as HBoxContainer
			if caja != null and is_instance_valid(caja):
				_llena_iconos(caja, ev)
			d["firma"] = firma
		for i: int in [ALIN_COL_DORSAL, ALIN_COL_NOMBRE, ALIN_COL_NOTA]:
			if i >= row.get_child_count():
				continue
			var l: Label = row.get_child(i) as Label
			if l != null:
				l.add_theme_color_override("font_color", tinta)
		if ALIN_COL_NOTA < row.get_child_count():
			var ln: Label = row.get_child(ALIN_COL_NOTA) as Label
			if ln != null:
				ln.text = I18n.gritado_seguro(("%.1f" % nota) if jugo else "-")



func _pinta_equipo(lado: int) -> void:
	var team: Dictionary = _you_team if lado == 0 else _rival_team
	var squad: Array = Squad.of(String(team.get("id", "")))
	if squad.is_empty():
		return




	var escudo: CrestView = CrestView.new()
	escudo.set_halo(true)
	escudo.custom_minimum_size = Vector2(40, 40)
	escudo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	escudo.set_team(team)
	var host: VBoxContainer = _alin_destino(lado)
	var cab: Label = CareerUi.head(host, CareerTheme.caps(String(team.get("name", "?"))),
		escudo)
	cab.clip_text = true


	_alin_cabeceras[lado] = cab.get_parent().get_parent() as Control
	var cols: Array = _alin_cols()
	var rotulos: HBoxContainer = CareerUi.table_head(host, cols)
	if _alin_tumbada():
		rotulos.add_theme_constant_override("separation", ALIN_SEP_TUMBADO)
	var mio: int = Squad.user_index(squad) if lado == 0 else -1





	var banca_yo: int = mio if lado == 0 and not _titular else -1
	if banca_yo >= 0:
		mio = -1
	var kit: Dictionary = GameState.kit_variant(team, 0)
	for i in mini(Squad.STARTING_XI, squad.size()):
		_fila_jugador(squad[i] as Dictionary, lado, i == mio, kit)
	if squad.size() > Squad.STARTING_XI or banca_yo >= 0:
		CareerUi.head(host, I18n.t("BANQUILLO"))





		if banca_yo >= 0:
			var yo: Dictionary =(squad[banca_yo] as Dictionary).duplicate()
			yo["number"] = GameState.player_number if GameState.player_number > 0 \
					else int(yo.get("number", 9))
			yo["media"] = roundi(Career.skills_avg())
			_fila_jugador(yo, lado, true, kit, true)
		var hasta: int = mini(Squad.STARTING_XI + ALIN_BANCA, squad.size())
		for i in range(Squad.STARTING_XI, hasta):
			_fila_jugador(squad[i] as Dictionary, lado, false, kit, true)








func _fila_jugador(p: Dictionary, lado: int, eres_tu: bool,
		kit: Dictionary = {}, banca: bool = false) -> void:
	var nom: String = Career.player_name if eres_tu else String(p.get("name", "?"))
	var ev: Dictionary =(_eventos[lado] as Dictionary).get(nom, {})



	var pos: String = String(p.get("pos", "MC"))


	var jugo: bool = not banca or int(ev.get("dentro", 0)) > 0 \
			or (eres_tu and _he_entrado)
	var nota: float = _rating_value if eres_tu else _nota_npc(ev, pos, lado)





	var cara: PlayerAvatar = PlayerAvatar.new()
	cara.chrome = false
	cara.bust = PlayerAvatar.BUST_CLOSE
	var tumbada: bool = _alin_tumbada()
	cara.custom_minimum_size = ALIN_CARA_TUMBADA if tumbada else ALIN_CARA
	cara.mouse_filter = Control.MOUSE_FILTER_IGNORE

	var portero: bool = pos == "POR" and not eres_tu
	var ropa: Dictionary = KitRecolor.keeper_con_pecho(KitRecolor.keeper_cfg(
		String((_you_team if lado == 0 else _rival_team).get("id", "")), -1,
		String(kit.get("pattern", "solid"))), kit) if portero else kit
	var look: Dictionary = GameState.team_custom.duplicate() if eres_tu \
			else KitRecolor.appearance_for(nom, ropa)
	if eres_tu:
		look.merge(kit, true)
	cara.set_look(look, PlayerCard.KEEPER_TEX if portero else null)



	var chip: PanelContainer = CareerUi.pos_chip(pos)
	chip.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	var med: OvrBadge = OvrBadge.new()
	med.setup(SquadMeta.ovr_pintado(p, pos, eres_tu),
		ALIN_OVR_NUM_TUMBADO if tumbada else ALIN_OVR_NUM)
	med.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	var tinta: Color = CareerTheme.TEXT
	if eres_tu:
		tinta = UiKit.CYAN
	elif int(ev.get("roja", 0)) > 0 or int(ev.get("fuera", 0)) > 0 or not jugo:

		tinta = CareerTheme.TEXT_DIM
	var iconos: HBoxContainer = _iconos_de(ev) as HBoxContainer
	var row: HBoxContainer = CareerUi.table_row(_alin_destino(lado), _alin_cols(), [
		cara,
		chip,
		str(int(p.get("number", 0))),
		CareerTheme.caps(CareerUi.surname(nom) if tumbada else nom),
		iconos,
		med,
		("%.1f" % nota) if jugo else "-",


	], tinta, CareerTheme.T_DIM)
	if tumbada:
		row.add_theme_constant_override("separation", ALIN_SEP_TUMBADO)


	_alin_filas.append({
		"row": row,
		"iconos": iconos,
		"lado": lado,
		"nom": nom,
		"pos": pos,
		"banca": banca,
		"eres_tu": eres_tu,
		"firma": str(ev),
	})


func _cerrar_plan() -> void:
	CareerUi.close_top_modal(self)


	if _pause_tomada:
		_pause_tomada = false
		get_tree().paused = false











func _abrir_estilo() -> void:
	if not _on_pitch:
		return
	_on_style_seg_pressed((Career.play_style + 1) % MatchPlan.STYLE_LABELS.size())


func _abrir_intensidad() -> void:
	if not _on_pitch:
		return
	_on_intensity_seg_pressed(
		(Career.intensity + 1) % MatchPlan.INTENSITY_LABELS.size())





func _repinta_fichas() -> void:
	CareerUi.ficha_plan_set(_style_tile,
		_plan_label(MatchPlan.STYLE_LABELS, Career.play_style),
		_plan_pal(STYLE_PALETTES, Career.play_style),
		STYLE_ICONS[clampi(Career.play_style, 0, STYLE_ICONS.size() - 1)])
	CareerUi.ficha_plan_set(_intensity_tile,
		_plan_label(MatchPlan.INTENSITY_LABELS, Career.intensity),
		_plan_pal(INTENSITY_PALETTES, Career.intensity),
		INTENSITY_ICONS[clampi(Career.intensity, 0, INTENSITY_ICONS.size() - 1)])





func _hold_sub_start() -> void:
	if _sub_locked or _sub_hold or not _on_pitch:
		return
	_hold_sub_cancel()
	var tw: Tween = _sub_btn.create_tween()
	_sub_hold_tw = tw
	tw.tween_property(_sub_fill, "anchor_right", 1.0, SUB_HOLD_SECONDS)
	tw.tween_callback(func() -> void:
		UiAudio.haptic(35)
		_hold_sub_cancel()
		substitution_requested.emit())
	UiAudio.toggle()


func _hold_sub_cancel() -> void:
	if _sub_hold_tw != null and _sub_hold_tw.is_valid():
		_sub_hold_tw.kill()
	_sub_hold_tw = null
	if _sub_fill != null:
		_sub_fill.anchor_right = 0.0








func _on_style_seg_pressed(i: int) -> void:


	if not _on_pitch:
		return
	style_changed.emit(i)
	_repinta_fichas()


func _on_intensity_seg_pressed(i: int) -> void:
	if not _on_pitch:
		return
	intensity_changed.emit(i)
	_repinta_fichas()














func _on_tap(event: InputEvent) -> void:
	if (event is InputEventScreenTouch and event.pressed) \
			or (event is InputEventMouseButton and event.pressed):
		_dragging = true
		_drag_amount = 0.0
		return



	if _dragging and (event is InputEventScreenDrag \
			or (event is InputEventMouseMotion and event.button_mask != 0)):
		_drag_amount += absf(event.relative.y)
		return
	if (event is InputEventScreenTouch and not event.pressed) \
			or (event is InputEventMouseButton and not event.pressed):
		var was_tap: bool = _dragging and _drag_amount < TAP_SLOP
		_dragging = false
		if was_tap:
			skip_requested.emit()


func _on_speed_pressed() -> void:
	_pon_velocidad((_speed_idx + 1) % SPEED_LEVELS.size())






func _fl_velocidad(dir: int) -> bool:
	var idx: int = clampi(_speed_idx + dir, 0, SPEED_LEVELS.size() - 1)
	if idx != _speed_idx and _speed_btn != null:
		_pon_velocidad(idx)
	return true



func _pon_velocidad(idx: int) -> void:
	_speed_idx = idx
	var mult: float = SPEED_FACTORS[_speed_idx]
	_speed_btn.text = "x%d" % SPEED_LEVELS[_speed_idx]


	CareerUi.acuse(_speed_btn)
	speed_changed.emit(mult)







func _on_sub_pressed() -> void:
	return












func set_sub_hold(on: bool) -> void:
	if on == _sub_hold:
		return
	_sub_hold = on
	_apply_sub_lock()


func set_sub_reading(tone: int, note: String) -> void:




	if _sub_btn == null or _sub_locked or not _on_pitch:
		return
	if tone == _sub_tone:
		return
	_sub_tone = tone
	_sub_tone_col = UiKit.DANGER
	if tone == Career.SUB_TONE_WELCOME:
		_sub_tone_col = UiKit.GOLD
	elif tone == Career.SUB_TONE_OK:
		_sub_tone_col = UiKit.INK_BODY
	_sub_tinta(_sub_tone_col)
	if _sub_icon != null:
		_sub_icon.color = _sub_tone_col





func mark_sub_pending() -> void:
	_sub_locked = true
	_apply_sub_lock()






func _sub_estado(clave_larga: String, clave_corta: String) -> void:
	if _sub_btn == null:
		return
	var largo: String = I18n.t(clave_larga)
	_sub_btn.text = largo
	_sub_btn.tooltip_text = largo
	if _sub_word != null:
		_sub_word.text = I18n.t(clave_corta, "sub")


func _sub_tinta(c: Color) -> void:
	if _sub_word != null:
		_sub_word.add_theme_color_override("font_color", c)
	if _sub_icon != null:
		_sub_icon.color = c





func _apply_sub_lock() -> void:
	if _sub_btn == null:
		return
	_sub_btn.disabled = _sub_locked or _sub_hold or not _on_pitch
	if not _on_pitch and _lesionado:




		_sub_estado("FUERA POR LESION", "LESIONADO")
	elif not _on_pitch:
		_sub_estado("FUERA DEL CAMPO", "FUERA")
	elif _sub_locked:
		_sub_estado("CAMBIO PEDIDO", "PEDIDO")
	elif _sub_hold:



		_sub_estado("EL BANQUILLO DICE QUE AGUANTES", "AGUANTA")
	else:
		_sub_estado("MANTEN PARA PEDIR CAMBIO", "MANTEN")




	var live: bool = _on_pitch and not _sub_locked and not _sub_hold
	var roto: bool = not _on_pitch and _lesionado
	if not live:
		_sub_tone = -1
		_sub_tone_col = UiKit.GOLD
		_sub_tinta(UiKit.DANGER if roto else UiKit.GOLD)
	if _sub_icon != null:


		_sub_icon.setup("cruz_medica" if roto else "banquillo",
			UiKit.DANGER if roto else (_sub_icon.color if live else UiKit.GOLD))


	_hold_sub_cancel()







func set_on_pitch(on: bool) -> void:



	if on:
		_he_entrado = true
	if on == _on_pitch:
		return
	_on_pitch = on





	if _tab_idx == 1 and not _titular:
		_refresca_alineacion()
	for b: Button in [_style_tile, _intensity_tile]:
		if b != null:
			b.disabled = not on
			b.modulate = Color(1, 1, 1, 1.0 if on else 0.45)


	if not on:
		_cerrar_plan()
	_apply_sub_lock()






func set_lesionado(on: bool) -> void:
	if on == _lesionado:
		return
	_lesionado = on
	_apply_sub_lock()











func set_titular(on: bool) -> void:
	if on == _titular:
		return
	_titular = on


	if _tab_idx == 1:
		_pinta_alineacion()








func _side_tint(team: Dictionary, fallback: Color) -> Color:
	var kit: Color = team.get("kit", fallback)
	if kit.s < 0.15:
		var kit2: Color = team.get("kit2", fallback)
		kit = kit2 if kit2.s >= 0.15 else fallback
	return _vivid(kit)






func _claro(c: Color) -> Color:
	return Color.from_hsv(c.h, minf(c.s, 0.45), 1.0)







func _tinta(c: Color) -> Color:
	var out: Color = c
	for _i in range(20):
		var lin: Color = out.srgb_to_linear()
		if 0.2126 * lin.r + 0.7152 * lin.g + 0.0722 * lin.b >= 0.2:
			break
		out = out.lightened(0.08)
	return out




func _vivid(c: Color) -> Color:
	if c.s < 0.15:
		return UiKit.KIT_NEUTRAL
	return Color.from_hsv(c.h, clampf(c.s, 0.5, 0.95), clampf(c.v, 0.66, 1.0))




func _grad_tex(g: Gradient, radial: bool) -> GradientTexture2D:
	var t: GradientTexture2D = GradientTexture2D.new()
	t.gradient = g
	t.width = 128
	t.height = 256
	if radial:
		t.fill = GradientTexture2D.FILL_RADIAL
		t.fill_from = Vector2(0.5, 0.5)
		t.fill_to = Vector2(1.0, 0.5)
	else:
		t.fill_from = Vector2(0.0, 0.0)
		t.fill_to = Vector2(0.0, 1.0)
	return t


func _full_tex(tex: Texture2D) -> TextureRect:
	var tr: TextureRect = TextureRect.new()
	tr.texture = tex
	tr.stretch_mode = TextureRect.STRETCH_SCALE
	tr.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	tr.set_anchors_preset(Control.PRESET_FULL_RECT)
	tr.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return tr



func _band_tex(tex: Texture2D, top: bool) -> TextureRect:
	var tr: TextureRect = TextureRect.new()
	tr.texture = tex
	tr.stretch_mode = TextureRect.STRETCH_SCALE
	tr.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	tr.mouse_filter = Control.MOUSE_FILTER_IGNORE
	if top:
		tr.set_anchors_preset(Control.PRESET_TOP_WIDE)
		tr.offset_bottom = 760.0
	else:
		tr.set_anchors_preset(Control.PRESET_BOTTOM_WIDE)
		tr.offset_top = -760.0
	return tr






class _Vecina extends Node:
	var cambia: Callable

	func fl_vecina(dir: int) -> bool:
		return cambia.is_valid() and bool(cambia.call(dir))
