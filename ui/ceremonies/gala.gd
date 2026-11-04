extends Ceremony















































const GALA_SHEET: String = "res://assets/sprites/anim/gala_south_"
















const GALA_CLAP_SHEET: String = "res://assets/sprites/anim/gala_clap_south_"


const STAGE_SIZE: Vector3 = Vector3(9.0, 0.55, 5.5)
const BACKDROP: Vector2 = Vector2(15.0, 5.6)





const BACKDROP_Z: float = 9.6











const PEDESTAL_H: float = 0.8
const TROPHY_H: float = 0.62














const PEDESTAL_POS: Vector2 = Vector2(0.0, -1.7)




const PLAYER_POS: Vector2 = Vector2(0.1, 0.5)


const ROWS: int = 5
const PER_ROW: int = 16
const FILAS_CON_CARA: int = 2
const ROW_Z0: float = -4.2
const ROW_DZ: float = 2.1
const SEAT_W: float = 1.05



















const SENTADO_HOJA: String = "res://assets/sprites/anim/sentado_foto_south_"
const SENTADO_PALMAS: String = "res://assets/sprites/anim/sentado_gana_south_"
const COJIN_FRENTE: float = 0.24



const NOMINADO_DIM: float = 0.58







const BUTACA_CAM: Dictionary = {"dist": 2.15, "push": 0.22, "h": 1.48,
	"aim_y": 1.0, "fov": 54.0}











const CAM_ENTREGA: Dictionary = {"dist": 7.2, "h": 2.55, "yaw": 0.0, "aim_y": 1.3,
	"fov": 34.0}
const CAM_CIERRE: Dictionary = {"dist": 7.8, "h": 2.75, "yaw": 2.0, "aim_y": 1.25,
	"fov": 32.0}












const COUNT_FROM: int = 10
const COUNT_TO: int = 4
const COUNT_START: float = 2.8



const COUNT_STEP_FAST: float = 0.9
const COUNT_STEP_SLOW: float = 1.2


const T_PODIUM: float = COUNT_START \
		+ float(COUNT_FROM - COUNT_TO + 1) * COUNT_STEP_FAST
const T_REVEAL: float = T_PODIUM + 2.0 * COUNT_STEP_SLOW



const T_HUSH: float = T_REVEAL - 0.45







const RANK_SHOWN_MAX: int = 25




const BAR_H: float = 96.0




const PUSH_RATE: float = 0.03
const PUSH_MAX: float = 0.12

var _trophy: Sprite3D
var _key_light: SpotLight3D

var _haze: Array[MeshInstance3D] = []




const HAZE_ALPHA: Array[float] = [0.075, 0.06, 0.048, 0.036]
var _pool: Array[MeshInstance3D] = []
var _trophy_light: OmniLight3D
var _env: Environment
var _trophy_y: float = 0.0
var _seats: Array[AnimatedSprite3D] = []
var _pareja: AnimatedSprite3D = null
var _revealed: bool = false
var _hushed: bool = false

var _podium: Array = []
var _figs: Array[AnimatedSprite3D] = []
var _winner_fig: AnimatedSprite3D
var _winner_home: Vector3 = Vector3.ZERO


var _invitados: Dictionary = {}
var _you_rank: int = 0
var _mine: bool = false






var _chico: bool = false




var _desde: int = COUNT_FROM
var _inicio: float = COUNT_START
var _paso: float = COUNT_STEP_FAST



const CHICO_PASO: float = 1.4




var _caras: Dictionary = {}


var _serie: Dictionary = {}
var _lit: int = -1
var _ticker: PanelContainer
var _tick_pos: Label
var _tick_name: Label
var _tick_pts: Label
var _tick_tros: HBoxContainer
var _bars: Array[ColorRect] = []



var _idolo: Dictionary = {}
var _idolo_fig: AnimatedSprite3D = null
var _idolo_cita: PanelContainer = null



func _accent_for() -> Color:
	return CareerTheme.MONEY


func _build() -> void:





	focus = Vector3(0.0, 0.0, 1.6)
	_chico = String(data.get("premio", "")) == "chico"
	_build_room()
	_build_recinto()
	_build_stage_floor()
	_build_backdrop()
	_build_cortinas()
	_build_pantalla()
	_build_truss()
	_read_gala()
	_build_audience()
	_build_pedestal()
	if _chico:
		_cuenta_chico()



	_build_nominees()
	if not _idolo.is_empty():
		_build_idolo()
	make_camera(_claves())


	player = _winner_fig





	make_audio(0.45, true)
	flash_pool = _press_pool()



	flash_rate = 30.0
	flash_burst_at = T_REVEAL
	flash_burst_dur = 2.2
	flash_burst_mult = 9.0
	flash_radius = 11.0
	confetti_colors = [CareerTheme.MONEY, Color("fff0b8"), Color("d9a52a")]










	if _chico:
		make_chyron(I18n.t("CHICO DE ORO"), I18n.t("LA PROMESA DEL AÑO"), {}, T_REVEAL)
	else:
		make_chyron(I18n.t(Competitions.demarca("BALÓN DE ORO")),
			I18n.t("EL MEJOR DEL MUNDO"), {}, T_REVEAL, "", _linea_serie())
	_build_ticker()
	_build_bars()
	_build_card()
	if not _idolo.is_empty():
		_build_idolo_cita()
		_marca_gala_tambien()










func _build_card() -> void:
	var w: Dictionary = _podium[0]

	make_card(T_LLEGA +(IDOLO_FICHA if not _idolo.is_empty() else 1.4))
	if _mine:
		card_title(CareerTheme.caps(Career.player_name), 42)
		card_sub(_ordinal_line())
	else:


		card_title(CareerUi.display_name(String(w.get("name", "?"))).to_upper(), 38)
		card_sub(I18n.tf("LA PROMESA DEL AÑO · {0}" if _chico \
				else "EL MEJOR DEL MUNDO · {0}", [String(Teams.by_id(
			String(w.get("team", ""))).get("name", "")).to_upper()]))
	_card_numbers(w)
	_card_trophies(w)



	card_note(_nota_idolo() if not _idolo.is_empty() else _nota_puesto())
	card_cta(I18n.t("SEGUIR"))










func _card_numbers(w: Dictionary) -> void:
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 18)
	row.alignment = BoxContainer.ALIGNMENT_CENTER
	card_box.add_child(row)






	_stat_cell(row, "gol", str(int(w.get("goals", 0)) + int(w.get("ucl_goals", 0))))
	_stat_cell(row, "asist",
		str(int(w.get("assists", 0)) + int(w.get("ucl_assists", 0))))
	_stat_cell(row, "media", I18n.num(float(w.get("avg", 0.0)), 1))




func _stat_cell(row: HBoxContainer, icon: String, value: String) -> void:
	var cell: HBoxContainer = HBoxContainer.new()
	cell.add_theme_constant_override("separation", 8)
	var ic: MenuIcon = MenuIcon.new()
	ic.custom_minimum_size = Vector2(38, 38)
	ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	ic.setup(icon, text_accent())
	cell.add_child(ic)
	var v: Label = CareerUi.plain(34, CareerTheme.TEXT)
	v.text = value
	v.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	cell.add_child(v)
	row.add_child(cell)










func _card_trophies(w: Dictionary) -> void:
	var won: Array = w.get("titles", [])
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 10)
	row.alignment = BoxContainer.ALIGNMENT_CENTER
	card_box.add_child(row)



	var fila: Array[String] = BallonDor.fila_titulos(won)
	var lado: float = 46.0 if fila.size() <= 8 else maxf(30.0, 46.0 * 8.0 / float(fila.size()))
	if fila.size() > 8:
		row.add_theme_constant_override("separation", 6)
	for t in fila:
		var type: String = String(t)
		var has: bool = won.has(type)
		var cell: VBoxContainer = VBoxContainer.new()
		cell.add_theme_constant_override("separation", 2)
		row.add_child(cell)
		var ic: TrophyIcon = TrophyIcon.new()
		ic.custom_minimum_size = Vector2(lado, lado)
		ic.set_type(type)



		if not has:
			ic.modulate = Color(0.5, 0.5, 0.55, 0.6)
		cell.add_child(ic)
		var pts: Label = CareerUi.plain(15,
			CareerTheme.MONEY if has else CareerTheme.TEXT)



		pts.text = "+%d" % int(BallonDor.title_pts(type, String(w.get("country", ""))))
		pts.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		if not has:



			pts.modulate = Color(1, 1, 1, 0.7)
		cell.add_child(pts)
		if has:
			_pop_trophy(cell)








func _pop_trophy(cell: Control) -> void:
	cell.pivot_offset = cell.custom_minimum_size * 0.5
	cell.scale = Vector2(0.4, 0.4)
	cell.modulate.a = 0.0
	var tw: Tween = create_tween()
	tw.tween_interval(rng.randf_range(0.0, 0.28))
	tw.set_parallel(true)
	tw.tween_property(cell, "scale", Vector2.ONE, 0.34) \
			.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	tw.tween_property(cell, "modulate:a", 1.0, 0.18)










func _read_gala() -> void:
	var g: Dictionary = data.get("gala", {})
	_podium =(g.get("podium", []) as Array).duplicate()
	_you_rank = int(g.get("you_rank", 0))
	if _podium.is_empty():


		_podium = [{"name": Career.player_name, "team": club_del_acto(),
			"you": true, "goals": int(data.get("goals", 0)),
			"assists": int(data.get("assists", 0)),
			"avg": float(data.get("avg", 0.0)), "score": 0.0}]
		_you_rank = 1
	_mine = bool((_podium[0] as Dictionary).get("you", false))


	_idolo = data["idolo"] if data.get("idolo") is Dictionary and _mine and not _chico else {}



	_caras = data["caras"] if data.get("caras") is Dictionary \
			else Career.caras_de_gala(_podium)
	if _segundo() and not _chico:
		_serie = data["serie"] if data.get("serie") is Dictionary \
				else BallonDor.serie_juntos(Career.ballon_history, g,
				String((_podium[0] as Dictionary).get("name", "")))










func _segundo() -> bool:
	return not _mine and _you_rank == 2 and _podium.size() >= 2 \
			and bool((_podium[1] as Dictionary).get("you", false))








func _semilla_de(ficha: Dictionary) -> String:
	var nombre: String = String(ficha.get("name", "?"))
	var cara: String = String(_caras.get(nombre, ""))
	return cara if not cara.is_empty() else nombre












func _recuerdo() -> Dictionary:
	if _podium.is_empty():
		_read_gala()
	var out: Dictionary = data.duplicate(true)
	out["caras"] = _caras.duplicate(true)
	if not _serie.is_empty():
		out["serie"] = _serie.duplicate(true)
	return out




func _winner_pintado() -> String:
	return CareerUi.display_name(Competitions.demarca(
		String((_podium[0] as Dictionary).get("name", "?"))))




func _nota_puesto() -> String:
	if _mine:
		return I18n.t("Ningún equipo levanta esto por ti. Este se gana solo.")
	if _segundo():


		return I18n.tf("Tú quedaste {0}, detrás de {1}.",
			[I18n.ordinal(_you_rank), _winner_pintado()])
	if _you_rank > 0 and _you_rank <= RANK_SHOWN_MAX:
		return I18n.tf("Tú quedaste {0}.", [I18n.ordinal(_you_rank)])

	return I18n.t("Este año no entraste en la votación.")






const SERIE_MIN: int = 3


func _linea_serie() -> String:
	if not _segundo() or int(_serie.get("juntos", 0)) < SERIE_MIN:
		return ""


	return I18n.tf("{0} GALA JUNTOS: {1} {2}, {3} {4}", [
		I18n.ordinal_vez(int(_serie["juntos"])), CareerUi.surname(_winner_pintado()),
		int(_serie.get("el", 0)), CareerUi.you_name(), int(_serie.get("tu", 0))])












func _build_nominees() -> void:
	var libres: Array[int] = _orden_butacas()
	var suya: Vector2i = Vector2i(1, 7)
	for idx in mini(_podium.size(), COUNT_FROM):
		if libres.is_empty():
			return
		var ficha: Dictionary = _podium[idx]
		var i: int = libres.pop_front()
		var fig: AnimatedSprite3D = _make_nominee(ficha, Vector3(_butaca_x(i), 0.0,
			ROW_Z0))
		_libera_butaca(Vector2i(0, i))
		_figs.append(fig)
		if idx == 0:
			_winner_fig = fig
			_winner_home = fig.position
			_hojas_paseo(fig.get_meta("de_pie"))
		if bool(ficha.get("you", false)):
			var fuera: int = i +(1 if _butaca_x(i) > 0.0 else -1)
			if fuera >= 0 and fuera < PER_ROW:
				libres.erase(fuera)
				suya = Vector2i(0, fuera)
	_seat_pareja(suya)




func _orden_butacas() -> Array[int]:
	var out: Array[int] = []
	var c: int = PER_ROW / 2
	for k in PER_ROW:
		var i: int = c +(k / 2) if k % 2 == 0 else c - 1 -(k / 2)
		if i >= 0 and i < PER_ROW:
			out.append(i)
	return out


func _butaca_x(i: int) -> float:
	return (float(i) - float(PER_ROW - 1) * 0.5) * SEAT_W



func _libera_butaca(b: Vector2i) -> void:
	var p: AnimatedSprite3D = _invitados.get(b, null)
	if p == null:
		return
	_invitados.erase(b)
	_seats.erase(p)
	p.queue_free()








func _make_nominee(ficha: Dictionary, pos: Vector3) -> AnimatedSprite3D:
	var you: bool = bool(ficha.get("you", false))


	var cfg: Dictionary = GameState.team_custom.duplicate() if you \
			else KitRecolor.appearance_for(_semilla_de(ficha), {})
	var spr: AnimatedSprite3D = AnimatedSprite3D.new()
	spr.pixel_size = PLAYER_HEIGHT_M / PLAYER_METRICS.x
	spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD



	var frames: SpriteFrames = player_frames(cfg, "south", GALA_SHEET, true)
	_add_clap(frames, cfg)
	spr.set_meta("de_pie", frames)
	spr.sprite_frames = _frames_sentado(cfg)
	spr.position = _pos_sentado(spr.pixel_size, pos.x, pos.z)
	spr.play("idle")
	spr.modulate = Color(NOMINADO_DIM, NOMINADO_DIM, NOMINADO_DIM * 1.1)
	viewport.add_child(spr)
	return spr







func _frames_sentado(cfg: Dictionary) -> SpriteFrames:
	var gala: Dictionary = KitRecolor.GALA_WEAR.preview_cfg(cfg)
	var frames: SpriteFrames = SpriteFrames.new()
	var fuentes: Dictionary = {}
	for par in [["idle", SENTADO_HOJA, 4.5], ["clap", SENTADO_PALMAS, 5.0]]:
		var anim: String = par[0]
		if not frames.has_animation(anim):
			frames.add_animation(anim)
		frames.set_animation_loop(anim, true)
		frames.set_animation_speed(anim, float(par[2]))
		var rutas: Array = []
		for i in range(1, 6):
			var path: String = "%s%02d.png" % [String(par[1]), i]
			if ResourceLoader.exists(path):
				frames.add_frame(anim, KitRecolor.apply(load(path), gala))
				rutas.append(path)
		fuentes[anim] = rutas
	if frames.get_frame_count("clap") == 0:
		frames.remove_animation("clap")
		fuentes.erase("clap")
	frames.set_meta("look_cfg", gala)
	frames.set_meta("cara_fuentes", fuentes)
	return frames




func _pos_sentado(px: float, x: float, z: float) -> Vector3:
	return Vector3(x, feet_offset(px, SENTADO_HOJA + "01.png"), z + COJIN_FRENTE)









const PASEO_HOJAS: Dictionary = {
	"walk_south": "res://assets/sprites/anim/gala_walk_south_",
	"walk_east": "res://assets/sprites/anim/gala_walk_east_",
}
const PASEO_CUADROS: int = 6
const PASEO_FPS: float = 8.0
const PASEO_ZANCADA_MS: float = 1.35


func _hojas_paseo(frames: SpriteFrames) -> void:
	var cfg: Dictionary =(frames.get_meta("look_cfg", {}) as Dictionary).duplicate()
	for k in KitRecolor.TEAM_KEYS:
		cfg.erase(k)
	var fuentes: Dictionary =(frames.get_meta("cara_fuentes", {}) as Dictionary).duplicate()
	for anim in PASEO_HOJAS:
		var rutas: Array = []
		frames.add_animation(anim)
		frames.set_animation_loop(anim, true)
		frames.set_animation_speed(anim, PASEO_FPS)
		for i in PASEO_CUADROS:
			var path: String = "%s%02d.png" % [String(PASEO_HOJAS[anim]), i]
			if ResourceLoader.exists(path):
				frames.add_frame(anim, KitRecolor.apply(load(path), cfg))
				rutas.append(path)
		if rutas.is_empty():
			frames.remove_animation(anim)
		elif frames.has_meta("cara_fuentes"):
			fuentes[anim] = rutas
	if frames.has_meta("cara_fuentes"):
		frames.set_meta("cara_fuentes", fuentes)










func _add_clap(frames: SpriteFrames, cfg: Dictionary) -> void:
	esmoquin_clap(frames, cfg)









func _losers_flash() -> void:
	for i in _figs.size():
		var fig: AnimatedSprite3D = _figs[i]
		if fig == _winner_fig:
			continue
		var rest: Color = fig.modulate
		var tw: Tween = create_tween()
		tw.tween_interval(rng.randf_range(0.0, 0.22))
		tw.tween_property(fig, "modulate", Color(0.92, 0.92, 0.96), 0.1)
		tw.tween_property(fig, "modulate", rest, 0.55) \
				.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)











func _clap_others() -> void:
	for i in _figs.size():
		var fig: AnimatedSprite3D = _figs[i]
		if fig == _winner_fig or fig.sprite_frames == null:
			continue
		if not fig.sprite_frames.has_animation("clap"):
			continue
		fig.play("clap")
		fig.frame = i % maxi(fig.sprite_frames.get_frame_count("clap"), 1)












func _rank_at(now: float) -> int:
	if now < _inicio:
		return 0
	var fast_n: int = _desde - COUNT_TO + 1
	var k: float = now - _inicio
	if k < float(fast_n) * _paso:
		return _desde - int(k / _paso)
	var k2: float = k - float(fast_n) * _paso
	if k2 < COUNT_STEP_SLOW:
		return 3
	if k2 < 2.0 * COUNT_STEP_SLOW:
		return 2
	return 0





func _tick_countdown() -> void:
	var rank: int = _rank_at(t)
	var idx: int = rank - 1
	if idx == _lit:
		return


	if _lit >= 0 and _lit < _figs.size():
		_dim_fig(_figs[_lit], _lit)
	_lit = idx
	if idx < 0 or idx >= _figs.size() or idx >= _podium.size():
		_show_ticker(false)


		if not _revealed:
			_pinta_pantalla(0, {})
		return
	var fig: AnimatedSprite3D = _figs[idx]
	fig.modulate = Color.WHITE


	if _key_light != null:
		_key_light.look_at_from_position(
			Vector3(fig.position.x + 0.6, 6.5, fig.position.z + 3.2),
			Vector3(fig.position.x, 0.6, fig.position.z))


	_palmas_para(idx)
	applause(true, -6.0 if rank <= 3 else -8.0)
	var ficha: Dictionary = _podium[idx]
	_set_ticker(rank, ficha)

	_pinta_pantalla(rank, ficha)



	sting("ui_toggle", -12.0)





func _palmas_para(idx: int) -> void:
	for i in _figs.size():
		var fig: AnimatedSprite3D = _figs[i]
		if fig.sprite_frames == null:
			continue
		if idx < 0 or i == idx or not fig.sprite_frames.has_animation("clap"):
			fig.play("idle")
			continue
		if fig.animation != &"clap":
			fig.play("clap")
			fig.frame = i % maxi(fig.sprite_frames.get_frame_count("clap"), 1)



func _dim_fig(fig: AnimatedSprite3D, _idx: int) -> void:
	fig.modulate = Color(NOMINADO_DIM, NOMINADO_DIM, NOMINADO_DIM * 1.1)




func _build_ticker() -> void:
	_ticker = PanelContainer.new()
	var sb: StyleBoxFlat = CareerTheme.plate()
	sb.bg_color = Color(0.047, 0.047, 0.055, 0.88)
	sb.border_color = CareerTheme.MONEY
	_ticker.add_theme_stylebox_override("panel", sb)
	_ticker.set_anchors_preset(Control.PRESET_CENTER_BOTTOM)
	_ticker.grow_horizontal = Control.GROW_DIRECTION_BOTH
	_ticker.grow_vertical = Control.GROW_DIRECTION_BEGIN
	_ticker.offset_bottom = -300.0



	_ticker.custom_minimum_size = Vector2(640.0, 0.0)
	_ticker.modulate.a = 0.0
	add_child(_ticker)
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 20)
	_ticker.add_child(row)
	_tick_pos = CareerUi.plain(56, CareerTheme.MONEY)
	_tick_pos.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	row.add_child(_tick_pos)
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 2)




	col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	row.add_child(col)
	_tick_name = CareerUi.plain(34, CareerTheme.TEXT)
	_tick_name.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	col.add_child(_tick_name)
	_tick_pts = CareerUi.plain(22, CareerTheme.TEXT_DIM)
	col.add_child(_tick_pts)



	_tick_tros = HBoxContainer.new()
	_tick_tros.add_theme_constant_override("separation", 8)
	col.add_child(_tick_tros)




func _set_ticker(rank: int, ficha: Dictionary) -> void:
	if _ticker == null:
		return
	var you: bool = bool(ficha.get("you", false))
	_tick_pos.text = I18n.ordinal(rank)
	_tick_name.text = CareerTheme.caps(CareerUi.display_name(String(ficha.get("name", "?"))))
	_tick_name.add_theme_color_override("font_color",
		CareerTheme.MONEY if you else CareerTheme.TEXT)
	_tick_pts.text = I18n.tf("{0} PTS", ["%.0f" % float(ficha.get("score", 0.0))])
	_pon_trofeos(ficha)
	_show_ticker(true)


	_ticker.pivot_offset = _ticker.size * 0.5
	_ticker.scale = Vector2(1.1, 1.1)
	var tw: Tween = create_tween()
	tw.tween_property(_ticker, "scale", Vector2.ONE, 0.16) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)





const TICKER_TROFEOS: int = 5
const TICKER_TROFEO_PX: float = 72.0

func _pon_trofeos(ficha: Dictionary) -> void:
	if _tick_tros == null:
		return
	for h in _tick_tros.get_children():
		h.queue_free()
	var won: Array = ficha.get("titles", [])
	var pais: String = String(ficha.get("country", ""))
	if pais.is_empty():
		pais = Teams.country_of(String(ficha.get("team", "")))
	var n: int = 0
	for tipo in BallonDor.TODOS:
		if n >= TICKER_TROFEOS or not won.has(tipo):
			continue
		var ti: TrophyIcon = TrophyIcon.new()
		ti.custom_minimum_size = Vector2(TICKER_TROFEO_PX, TICKER_TROFEO_PX)
		ti.mouse_filter = Control.MOUSE_FILTER_IGNORE

		_tick_tros.add_child(ti)
		ti.set_type(String(tipo))
		ti.set_country(pais)
		n += 1
	_tick_tros.visible = n > 0


func _show_ticker(on: bool) -> void:
	if _ticker == null:
		return
	var tw: Tween = create_tween()
	tw.tween_property(_ticker, "modulate:a", 1.0 if on else 0.0, 0.18)




func _build_bars() -> void:
	for i in 2:
		var bar: ColorRect = ColorRect.new()
		bar.color = Color(0.0, 0.0, 0.0, 1.0)
		bar.mouse_filter = Control.MOUSE_FILTER_IGNORE



		bar.set_anchors_preset(Control.PRESET_TOP_WIDE if i == 0
			else Control.PRESET_BOTTOM_WIDE)
		bar.mouse_filter = Control.MOUSE_FILTER_IGNORE
		if i == 0:
			bar.offset_bottom = 0.0
		else:
			bar.offset_top = 0.0
		add_child(bar)
		_bars.append(bar)
	var tw: Tween = create_tween().set_parallel(true) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	tw.tween_property(_bars[0], "offset_bottom", BAR_H, 0.7)
	tw.tween_property(_bars[1], "offset_top", - BAR_H, 0.7)



func _hide_bars() -> void:
	if _bars.size() < 2:
		return
	var tw: Tween = create_tween().set_parallel(true) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN)
	tw.tween_property(_bars[0], "offset_bottom", 0.0, 0.45)
	tw.tween_property(_bars[1], "offset_top", 0.0, 0.45)








func _tick_push() -> void:
	if t < T_LLEGA or cam == null:
		return
	var k: float = t - T_LLEGA
	cam.position = cam.position.lerp(focus, minf(k * PUSH_RATE, PUSH_MAX))







func _build_room() -> void:
	var env: Environment = Environment.new()
	env.background_mode = Environment.BG_COLOR
	env.background_color = Color(0.012, 0.014, 0.022)
	env.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	env.ambient_light_color = Color(0.16, 0.16, 0.22)
	env.ambient_light_energy = 0.55
	env.fog_enabled = true
	env.fog_light_color = Color(0.05, 0.05, 0.09)
	env.fog_density = 0.018
	var we: WorldEnvironment = WorldEnvironment.new()
	we.environment = env
	viewport.add_child(we)
	_env = env


	var floor_m: MeshInstance3D = MeshInstance3D.new()
	var plane: PlaneMesh = PlaneMesh.new()
	plane.size = Vector2(60.0, 60.0)
	floor_m.mesh = plane
	var fm: StandardMaterial3D = StandardMaterial3D.new()
	fm.albedo_color = Color(0.045, 0.048, 0.065)
	fm.roughness = 0.45
	fm.metallic = 0.15
	floor_m.material_override = fm
	viewport.add_child(floor_m)

	_build_haze()
	_build_gold_pool()


	_key_light = SpotLight3D.new()
	_key_light.light_color = Color(1.0, 0.96, 0.86)
	_key_light.light_energy = 2.1
	_key_light.spot_range = 16.0
	_key_light.spot_angle = 26.0
	_key_light.shadow_enabled = false
	_key_light.look_at_from_position(Vector3(PLAYER_POS.x + 1.0, 7.5, -3.0),
		Vector3(PLAYER_POS.x, 1.0, PLAYER_POS.y))
	viewport.add_child(_key_light)

	var rim: SpotLight3D = SpotLight3D.new()
	rim.light_color = Color("ffd27a")
	rim.light_energy = 2.4
	rim.spot_range = 14.0
	rim.spot_angle = 30.0
	rim.shadow_enabled = false
	rim.look_at_from_position(Vector3(-3.4, 5.6, 4.2), Vector3(0.0, 1.2, 0.0))
	viewport.add_child(rim)





	var tiers_l: SpotLight3D = SpotLight3D.new()
	tiers_l.light_color = Color(0.86, 0.88, 1.0)
	tiers_l.light_energy = 1.35
	tiers_l.spot_range = 22.0
	tiers_l.spot_angle = 44.0
	tiers_l.shadow_enabled = false
	tiers_l.look_at_from_position(Vector3(0.0, 8.4, -1.2),
		Vector3(0.0, 1.0, 5.3))
	viewport.add_child(tiers_l)




	make_beam(Vector3(PLAYER_POS.x + 1.0, 7.5, -3.0),
		Vector3(PLAYER_POS.x, 0.0, PLAYER_POS.y), 0.18, 1.9,
		Color(1.0, 0.96, 0.86), 0.055)
	make_beam(Vector3(-3.4, 5.6, 4.2), Vector3(0.0, 0.0, 0.6), 0.16, 1.7,
		Color("ffd27a"), 0.045)











const RECINTO_X: float = 10.6
const RECINTO_Z0: float = -17.5
const RECINTO_TECHO: float = 12.0
const PILASTRA_PASO: float = 3.2


func _build_recinto() -> void:
	var z1: float = PANTALLA_Z + 0.45
	var largo: float = z1 - RECINTO_Z0
	var zc: float =(z1 + RECINTO_Z0) * 0.5
	var madera: StandardMaterial3D = StandardMaterial3D.new()
	madera.albedo_texture = _tex_paneles()
	madera.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	madera.uv1_triplanar = true
	madera.uv1_scale = Vector3(0.5, 0.5, 0.5)
	madera.roughness = 0.7


	madera.emission_enabled = true
	madera.emission = Color(0.085, 0.045, 0.04)
	var techo_m: StandardMaterial3D = StandardMaterial3D.new()
	techo_m.albedo_color = Color(0.06, 0.055, 0.07)
	techo_m.emission_enabled = true
	techo_m.emission = Color(0.035, 0.032, 0.05)
	var oro: StandardMaterial3D = _mat_luz(Color("b8892c"))
	var aplique: StandardMaterial3D = _mat_luz(Color("ffd9a0"))
	var cabina: StandardMaterial3D = _mat_luz(Color(0.22, 0.3, 0.46))


	var muros: Array = [
		[Vector3(0.3, RECINTO_TECHO, largo), Vector3(- RECINTO_X, RECINTO_TECHO * 0.5, zc)],
		[Vector3(0.3, RECINTO_TECHO, largo), Vector3(RECINTO_X, RECINTO_TECHO * 0.5, zc)],
		[Vector3(2.0 * RECINTO_X, RECINTO_TECHO, 0.3),
			Vector3(0.0, RECINTO_TECHO * 0.5, RECINTO_Z0)],
		[Vector3(2.0 * RECINTO_X, RECINTO_TECHO, 0.3),
			Vector3(0.0, RECINTO_TECHO * 0.5, z1)],
	]
	for m in muros:
		_caja(m[0], m[1], madera)
	_caja(Vector3(2.0 * RECINTO_X, 0.3, largo), Vector3(0.0, RECINTO_TECHO, zc), techo_m)

	for y in [1.05, RECINTO_TECHO - 0.55]:
		for sx in [-1.0, 1.0]:
			_caja(Vector3(0.06, 0.07, largo),
				Vector3(float(sx) *(RECINTO_X - 0.17), y, zc), oro)
		_caja(Vector3(2.0 * RECINTO_X, 0.07, 0.06), Vector3(0.0, y, RECINTO_Z0 + 0.17), oro)

	var piso_pil: BoxMesh = BoxMesh.new()
	piso_pil.size = Vector3(0.22, RECINTO_TECHO - 0.6, 0.5)
	piso_pil.material = madera
	var luz_box: BoxMesh = BoxMesh.new()
	luz_box.size = Vector3(0.1, 0.34, 0.2)
	luz_box.material = aplique
	var pil: Array[Transform3D] = []
	var luces: Array[Transform3D] = []
	var z: float = RECINTO_Z0 + 1.6
	while z < z1 - 0.8:
		for sx in [-1.0, 1.0]:
			var x: float = float(sx) *(RECINTO_X - 0.25)
			pil.append(Transform3D(Basis(), Vector3(x,(RECINTO_TECHO - 0.6) * 0.5, z)))
			luces.append(Transform3D(Basis(), Vector3(x - float(sx) * 0.16, 3.3, z)))
		z += PILASTRA_PASO
	var x2: float = - RECINTO_X + 1.6
	while x2 < RECINTO_X - 1.0:
		pil.append(Transform3D(Basis(Vector3.UP, PI * 0.5),
			Vector3(x2,(RECINTO_TECHO - 0.6) * 0.5, RECINTO_Z0 + 0.25)))
		luces.append(Transform3D(Basis(Vector3.UP, PI * 0.5),
			Vector3(x2, 3.3, RECINTO_Z0 + 0.41)))
		x2 += PILASTRA_PASO
	for par in [[piso_pil, pil], [luz_box, luces]]:
		var mm: MultiMesh = MultiMesh.new()
		mm.transform_format = MultiMesh.TRANSFORM_3D
		mm.mesh = par[0]
		var tr: Array[Transform3D] = par[1]
		mm.instance_count = tr.size()
		for i in tr.size():
			mm.set_instance_transform(i, tr[i])
		var mi: MultiMeshInstance3D = MultiMeshInstance3D.new()
		mi.multimesh = mm
		viewport.add_child(mi)



	var halo_m: StandardMaterial3D = _mat_luz(Color(1.0, 0.72, 0.42, 0.22))
	halo_m.albedo_texture = _tex_halo()
	halo_m.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	halo_m.blend_mode = BaseMaterial3D.BLEND_MODE_ADD
	var halo_q: QuadMesh = QuadMesh.new()
	halo_q.size = Vector2(1.9, 2.6)
	halo_q.material = halo_m
	var halos: MultiMesh = MultiMesh.new()
	halos.transform_format = MultiMesh.TRANSFORM_3D
	halos.mesh = halo_q
	halos.instance_count = luces.size()
	for i in luces.size():
		var tl: Transform3D = luces[i]
		var hacia: Vector3 = Vector3(- signf(tl.origin.x), 0.0, 0.0) \
				if absf(tl.origin.x) > RECINTO_X - 1.0 else Vector3(0.0, 0.0, 1.0)
		var b: Basis = Basis.looking_at(- hacia, Vector3.UP)
		halos.set_instance_transform(i, Transform3D(b, tl.origin + hacia * 0.02
			+ Vector3(0.0, 0.4, 0.0)))
	var hmi: MultiMeshInstance3D = MultiMeshInstance3D.new()
	hmi.multimesh = halos
	viewport.add_child(hmi)



	_caja(Vector3(2.0 * RECINTO_X - 0.6, 0.9, 1.6), Vector3(0.0, 4.6, RECINTO_Z0 + 0.95), madera)
	_caja(Vector3(2.0 * RECINTO_X - 0.6, 0.06, 0.06), Vector3(0.0, 5.08, RECINTO_Z0 + 1.76), oro)
	_caja(Vector3(2.0 * RECINTO_X - 0.6, 0.05, 0.05), Vector3(0.0, 4.17, RECINTO_Z0 + 1.76), oro)
	for sx in [-1.0, 0.0, 1.0]:
		_caja(Vector3(2.6, 0.8, 0.05), Vector3(float(sx) * 4.2, 6.6, RECINTO_Z0 + 0.17), cabina)


	var punto: BoxMesh = BoxMesh.new()
	punto.size = Vector3(0.16, 0.04, 0.16)
	punto.material = aplique
	var dots: Array[Transform3D] = []
	var dz: float = RECINTO_Z0 + 1.2
	while dz < z1 - 0.6:
		var dx: float = - RECINTO_X + 1.2
		while dx < RECINTO_X - 1.0:
			dots.append(Transform3D(Basis(), Vector3(dx, RECINTO_TECHO - 0.16, dz)))
			dx += 2.4
		dz += 2.4
	var dmm: MultiMesh = MultiMesh.new()
	dmm.transform_format = MultiMesh.TRANSFORM_3D
	dmm.mesh = punto
	dmm.instance_count = dots.size()
	for i in dots.size():
		dmm.set_instance_transform(i, dots[i])
	var dmi: MultiMeshInstance3D = MultiMeshInstance3D.new()
	dmi.multimesh = dmm
	viewport.add_child(dmi)





func _tex_paneles() -> ImageTexture:
	var img: Image = Image.create(32, 32, false, Image.FORMAT_RGB8)
	var base: Color = Color("3a2016")
	for y in 32:
		for x in 32:
			var c: Color = base
			if x % 16 == 0:
				c = base.darkened(0.45)
			elif x % 16 == 1:
				c = base.lightened(0.12)
			elif y == 0:
				c = base.darkened(0.35)
			elif (x * 7 + y * 3) % 11 == 0:
				c = base.darkened(0.12)
			img.set_pixel(x, y, c)
	return ImageTexture.create_from_image(img)



func _tex_halo() -> ImageTexture:
	var img: Image = Image.create(32, 32, false, Image.FORMAT_RGBA8)
	for y in 32:
		for x in 32:
			var d: float = Vector2(float(x) - 15.5,(float(y) - 15.5) * 1.0).length() / 15.5
			var a: float = clampf(1.0 - d, 0.0, 1.0)
			img.set_pixel(x, y, Color(1, 1, 1, a * a))
	return ImageTexture.create_from_image(img)

















func _build_haze() -> void:

	var img: Image = Image.create(64, 64, false, Image.FORMAT_RGBA8)
	for y in 64:
		for x in 64:


			var d: float = Vector2(x - 31.5, y - 31.5).length() / 31.5
			var a: float = clampf(1.0 - d, 0.0, 1.0)
			img.set_pixel(x, y, Color(1, 1, 1, a * a))
	var tex: ImageTexture = ImageTexture.create_from_image(img)



	var layers: Array = [
		{"y": 0.1, "s": 22.0, "z": -2.0},
		{"y": 0.17, "s": 17.0, "z": 1.5},
		{"y": 0.25, "s": 19.0, "z": -5.0},
		{"y": 0.34, "s": 14.0, "z": 3.0},
	]
	for i in layers.size():
		var L: Dictionary = layers[i]
		var m: MeshInstance3D = MeshInstance3D.new()
		var pm: PlaneMesh = PlaneMesh.new()
		pm.size = Vector2(float(L["s"]), float(L["s"]))
		m.mesh = pm
		var mat: StandardMaterial3D = StandardMaterial3D.new()
		mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
		mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
		mat.albedo_texture = tex
		mat.albedo_color = Color(0.62, 0.66, 0.82, HAZE_ALPHA[i])


		mat.depth_draw_mode = BaseMaterial3D.DEPTH_DRAW_DISABLED
		mat.cull_mode = BaseMaterial3D.CULL_DISABLED
		m.material_override = mat
		m.position = Vector3(0.0, float(L["y"]), float(L["z"]))
		viewport.add_child(m)
		_haze.append(m)















func _build_gold_pool() -> void:
	var img: Image = Image.create(64, 64, false, Image.FORMAT_RGBA8)
	for y in 64:
		for x in 64:
			var d: float = Vector2(x - 31.5, y - 31.5).length() / 31.5
			var a: float = clampf(1.0 - d, 0.0, 1.0)
			img.set_pixel(x, y, Color(1, 1, 1, pow(a, 1.7)))
	var tex: ImageTexture = ImageTexture.create_from_image(img)









	var pieces: Array = [
		{"sz": Vector2(7.6, 3.0), "x": 0.0, "z": -0.6, "a": 0.5},
		{"sz": Vector2(2.2, 4.0), "x": PLAYER_POS.x, "z": -1.6, "a": 0.3},
	]
	for p in pieces:
		var m: MeshInstance3D = MeshInstance3D.new()
		var pm: PlaneMesh = PlaneMesh.new()
		pm.size = Vector2(p["sz"])
		m.mesh = pm
		var mat: StandardMaterial3D = StandardMaterial3D.new()
		mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
		mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA


		mat.blend_mode = BaseMaterial3D.BLEND_MODE_ADD
		mat.albedo_texture = tex
		mat.albedo_color = Color(1.0, 0.8, 0.36, 0.0)
		mat.depth_draw_mode = BaseMaterial3D.DEPTH_DRAW_DISABLED
		mat.cull_mode = BaseMaterial3D.CULL_DISABLED
		m.material_override = mat

		m.position = Vector3(float(p["x"]), STAGE_SIZE.y + 0.012, float(p["z"]))
		m.set_meta("a_max", float(p["a"]))
		viewport.add_child(m)
		_pool.append(m)







func _tick_atmos() -> void:
	for i in _haze.size():
		var m: MeshInstance3D = _haze[i]
		var ph: float = float(i) * 1.9


		m.position.x = sin(t * 0.085 + ph) * 1.6

		var mat: StandardMaterial3D = m.material_override
		mat.albedo_color.a = HAZE_ALPHA[i] *(0.82 + 0.18 * sin(t * 0.33 + ph))


	var k: float = clampf((t - T_REVEAL) / 0.65, 0.0, 1.0)
	for m in _pool:
		var mat2: StandardMaterial3D = m.material_override


		mat2.albedo_color.a = float(m.get_meta("a_max")) * k \
				*(0.9 + 0.1 * sin(t * 1.7))




func _build_stage_floor() -> void:
	var box: MeshInstance3D = MeshInstance3D.new()
	var mesh: BoxMesh = BoxMesh.new()
	mesh.size = STAGE_SIZE
	box.mesh = mesh
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = Color(0.07, 0.07, 0.09)
	mat.roughness = 0.85
	box.material_override = mat
	box.position = Vector3(0.0, STAGE_SIZE.y * 0.5, 0.0)
	viewport.add_child(box)

	var rug: MeshInstance3D = MeshInstance3D.new()
	var rq: PlaneMesh = PlaneMesh.new()
	rq.size = Vector2(STAGE_SIZE.x * 0.86, STAGE_SIZE.z * 0.8)
	rug.mesh = rq
	var rm: StandardMaterial3D = StandardMaterial3D.new()
	rm.albedo_color = Color("6d1420")
	rm.roughness = 1.0
	rug.material_override = rm
	rug.position = Vector3(0.0, STAGE_SIZE.y + 0.005, 0.0)
	viewport.add_child(rug)






	var frente: StandardMaterial3D = StandardMaterial3D.new()
	frente.albedo_color = Color(0.025, 0.025, 0.035)
	frente.metallic = 0.45
	frente.roughness = 0.22
	var zf: float = - STAGE_SIZE.z * 0.5
	_caja(Vector3(STAGE_SIZE.x, STAGE_SIZE.y - 0.02, 0.02),
		Vector3(0.0, STAGE_SIZE.y * 0.5, zf - 0.012), frente)
	var filo: StandardMaterial3D = _mat_luz(Color("f0c060"))
	for y in [STAGE_SIZE.y - 0.025, 0.03]:
		_caja(Vector3(STAGE_SIZE.x + 0.04, 0.04, 0.04), Vector3(0.0, y, zf - 0.03), filo)
		for s in [-1.0, 1.0]:
			_caja(Vector3(0.04, 0.04, STAGE_SIZE.z),
				Vector3(float(s) *(STAGE_SIZE.x * 0.5 + 0.02), y, 0.0), filo)



	var peldanos: int = 2
	var alto_p: float = STAGE_SIZE.y / float(peldanos + 1)
	for i in peldanos:
		var h: float = alto_p * float(i + 1)
		var fondo: float = 0.42 * float(peldanos - i)
		var zc: float = zf - fondo * 0.5
		_caja(Vector3(3.2, h, fondo), Vector3(0.0, h * 0.5, zc), mat)
		_caja(Vector3(3.2, 0.03, 0.03), Vector3(0.0, h - 0.015, zf - fondo - 0.015), filo)






func _build_backdrop() -> void:




	var img: Image = Image.create(256, 128, false, Image.FORMAT_RGB8)
	img.fill(Color(0.055, 0.055, 0.075))
	var gold: Color = CareerTheme.MONEY





	var text: String = I18n.t("CHICO DE ORO") if _chico \
			else I18n.t(Competitions.demarca("BALÓN DE ORO"))
	var w: int = PixelText.text_width(text, 1)
	for row in 12:

		var off: int = 0 if row % 2 == 0 else (w + 8) / 2
		var x: int = - off
		while x < 256:
			PixelText.draw_text(img, x, 4 + row * 10, text,
				gold.darkened(0.15 if row % 2 == 0 else 0.35), 1)
			x += w + 8
	var tex: ImageTexture = ImageTexture.create_from_image(img)
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = tex
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	mat.uv1_scale = Vector3(3.0, 2.0, 1.0)
	mat.roughness = 1.0
	var quad: MeshInstance3D = MeshInstance3D.new()
	var qm: QuadMesh = QuadMesh.new()
	qm.size = BACKDROP
	quad.mesh = qm
	quad.material_override = mat

	quad.position = Vector3(0.0, BACKDROP.y * 0.5, BACKDROP_Z)
	quad.rotation_degrees = Vector3(0.0, 180.0, 0.0)
	viewport.add_child(quad)






















const PUBLICO_DIM: float = 0.46
const PUBLICO_SOBRE: float = 0.24
const PUBLICO_MIN: int = 12
const PUBLICO_MAX: int = 22
const SILUETA: Color = Color(0.05, 0.045, 0.06)
var _brillo_sala: float = PUBLICO_DIM
var _publico_palmas: bool = false


func _build_audience() -> void:
	_build_butacas()


	if _podium.is_empty():
		_read_gala()
	var gente: Array[SpriteFrames] = _frames_publico()
	var px: float = PLAYER_HEIGHT_M / PLAYER_METRICS.x
	var pies: float = feet_offset(px, SENTADO_HOJA + "01.png")
	for row in ROWS:
		var z: float = ROW_Z0 - float(row) * ROW_DZ
		for i in PER_ROW:
			var spr: AnimatedSprite3D = AnimatedSprite3D.new()
			spr.pixel_size = px
			spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
			spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
			spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD


			spr.sprite_frames = gente[(row * 5 + i) % gente.size()]






			var con_cara: bool = row < FILAS_CON_CARA \
					and spr.sprite_frames.has_meta("cara_fuentes")
			if con_cara:
				spr.sprite_frames = spr.sprite_frames.duplicate()
			spr.position = Vector3(_butaca_x(i) + rng.randf_range(-0.04, 0.04), pies,
				z + COJIN_FRENTE)
			spr.play("idle")
			spr.frame = rng.randi_range(0, 1)
			spr.speed_scale = rng.randf_range(0.85, 1.15)
			spr.modulate = Color(PUBLICO_DIM, PUBLICO_DIM, PUBLICO_DIM * 1.08)
			viewport.add_child(spr)
			if con_cara:
				var cara: CaraViva = CaraViva.pon(spr)
				if cara != null:
					cara.anima(Expresiones.de_bolsa(animo_extras(), rng))
			_seats.append(spr)
			_invitados[Vector2i(row, i)] = spr
	_luz_sala()










func _frames_publico() -> Array[SpriteFrames]:
	var fuera: Dictionary = {Career.player_name: true}
	var clubes: Array[String] = []
	for f in _podium:
		var ficha: Dictionary = f
		fuera[String(ficha.get("name", ""))] = true
		var tm: String = String(ficha.get("team", ""))
		if not tm.is_empty() and not clubes.has(tm):
			clubes.append(tm)
	var planteles: Array = []
	for tm in clubes:
		planteles.append(Squad.of(tm))
	var nombres: Array[String] = []
	for k in 30:
		for pl in planteles:
			if nombres.size() >= PUBLICO_MAX or k >=(pl as Array).size():
				continue
			var nm: String = String(((pl as Array)[k] as Dictionary).get("name", ""))
			if not nm.is_empty() and not fuera.has(nm) and not nombres.has(nm):
				nombres.append(nm)
	while nombres.size() < PUBLICO_MIN:
		nombres.append("gala_publico_%d" % nombres.size())
	var out: Array[SpriteFrames] = []
	for nm in nombres:
		var cfg: Dictionary = KitRecolor.appearance_for(nm, {})
		out.append(_frames_sentado(cfg))
	return out









func _build_butacas() -> void:
	var velvet: StandardMaterial3D = StandardMaterial3D.new()
	velvet.albedo_color = Color("6a1626")
	velvet.roughness = 1.0
	var rulo_m: StandardMaterial3D = StandardMaterial3D.new()
	rulo_m.albedo_color = Color("82202f")
	rulo_m.roughness = 0.85
	var madera: StandardMaterial3D = StandardMaterial3D.new()
	madera.albedo_color = Color("2b1a12")
	madera.roughness = 0.6
	var oro: StandardMaterial3D = StandardMaterial3D.new()
	oro.albedo_color = Color("c9a33a")
	oro.metallic = 0.35
	oro.roughness = 0.4
	oro.emission_enabled = true
	oro.emission = Color("6b4d12")
	var respaldo: BoxMesh = BoxMesh.new()
	respaldo.size = Vector3(0.84, 0.8, 0.14)
	respaldo.material = velvet
	var rulo: CylinderMesh = CylinderMesh.new()
	rulo.top_radius = 0.085
	rulo.bottom_radius = 0.085
	rulo.height = 0.84
	rulo.radial_segments = 10
	rulo.material = rulo_m
	var asiento: BoxMesh = BoxMesh.new()
	asiento.size = Vector3(0.8, 0.42, 0.46)
	asiento.material = velvet
	var brazo: BoxMesh = BoxMesh.new()
	brazo.size = Vector3(0.1, 0.58, 0.52)
	brazo.material = madera
	var canto: BoxMesh = BoxMesh.new()
	canto.size = Vector3(0.12, 0.03, 0.54)
	canto.material = oro
	var placa: BoxMesh = BoxMesh.new()
	placa.size = Vector3(0.16, 0.07, 0.012)
	placa.material = oro
	var tumbado: Basis = Basis(Vector3(0.0, 0.0, 1.0), PI * 0.5)
	var piezas: Array = [

		[respaldo, [Basis(), Vector3(0.0, 0.56, -0.26)]],
		[rulo, [tumbado, Vector3(0.0, 0.96, -0.26)]],
		[asiento, [Basis(), Vector3(0.0, 0.21, -0.02)]],
		[placa, [Basis(), Vector3(0.0, 0.84, -0.34)]],
	]
	for p in piezas:
		var mm: MultiMesh = MultiMesh.new()
		mm.transform_format = MultiMesh.TRANSFORM_3D
		mm.mesh = p[0]
		mm.instance_count = ROWS * PER_ROW
		var n: int = 0
		for row in ROWS:
			for i in PER_ROW:
				mm.set_instance_transform(n, Transform3D(p[1][0], p[1][1]
					+ Vector3(_butaca_x(i), 0.0, ROW_Z0 - float(row) * ROW_DZ)))
				n += 1
		_multi(mm)

	for p in [[brazo, 0.29], [canto, 0.59]]:
		var mm: MultiMesh = MultiMesh.new()
		mm.transform_format = MultiMesh.TRANSFORM_3D
		mm.mesh = p[0]
		mm.instance_count = ROWS *(PER_ROW + 1)
		var n: int = 0
		for row in ROWS:
			for i in PER_ROW + 1:
				mm.set_instance_transform(n, Transform3D(Basis(), Vector3(
					_butaca_x(i) - SEAT_W * 0.5, float(p[1]),
					ROW_Z0 - float(row) * ROW_DZ - 0.03)))
				n += 1
		_multi(mm)


func _multi(mm: MultiMesh) -> void:
	var mi: MultiMeshInstance3D = MultiMeshInstance3D.new()
	mi.multimesh = mm
	mi.layers = CAPA_SALA
	viewport.add_child(mi)







func _tick_publico() -> void:
	var cz: float = cam.global_position.z
	var palmas: bool = _revealed or (t >= _inicio and not _hushed)
	var cambia: bool = palmas != _publico_palmas
	_publico_palmas = palmas
	var tono: Color = Color(_brillo_sala, _brillo_sala, _brillo_sala * 1.08)
	for s in _seats:
		s.modulate = SILUETA if cz < s.position.z else tono
		if cambia:
			if palmas and s.sprite_frames.has_animation("clap"):
				s.play("clap")
				s.frame = rng.randi_range(0, s.sprite_frames.get_frame_count("clap") - 1)
			else:
				s.play("idle")
	var sentados: Array[AnimatedSprite3D] = []
	for f in _figs:
		if f != _winner_fig or t < T_REVEAL:
			sentados.append(f)
	if _pareja != null:
		sentados.append(_pareja)
	for f in sentados:
		if cz < f.position.z:
			if not f.has_meta("tono"):
				f.set_meta("tono", f.modulate)
			f.modulate = SILUETA
		elif f.has_meta("tono"):
			f.modulate = f.get_meta("tono")
			f.remove_meta("tono")








func _luz_sala() -> void:
	_sala = SpotLight3D.new()
	_sala.light_color = Color("ffd9b0")
	_sala.light_energy = SALA_LUZ
	_sala.spot_range = 22.0
	_sala.spot_angle = 52.0
	_sala.shadow_enabled = false
	_sala.light_cull_mask = CAPA_SALA
	var zc: float = ROW_Z0 - float(ROWS - 1) * ROW_DZ * 0.5
	_sala.look_at_from_position(Vector3(0.0, 9.0, zc + 1.0), Vector3(0.0, 0.0, zc))
	viewport.add_child(_sala)











































const PAREJA_SENTADA: String = "mujer_look_gala_sentada_"
const PAREJA_HUNDIDA: float = 0.36

func _seat_pareja(butaca: Vector2i) -> void:
	if not Career.pareja_activa():
		return
	var ficha: Dictionary = Career.pareja_ficha()
	if ficha.is_empty():
		return
	var base: String = Pareja.hoja_de(ficha, true)
	var hoja: String = Pareja.ANIM_DIR + base + "south_"
	if not ResourceLoader.exists(hoja + "00.png"):
		return


	var palmas: String = Pareja.ANIM_DIR + base.replace("_idle_", "_clap_") + "south_"
	var sentada: bool = base == "mujer_look_%s_idle_" % Pareja.OUTFIT_GALA \
			and ResourceLoader.exists(Pareja.ANIM_DIR + PAREJA_SENTADA + "clap_south_00.png")
	if sentada:
		palmas = Pareja.ANIM_DIR + PAREJA_SENTADA + "clap_south_"
	if ResourceLoader.exists(palmas + "00.png"):
		hoja = palmas
	var ella: AnimatedSprite3D = AnimatedSprite3D.new()
	ella.pixel_size = PAREJA_PIXEL
	ella.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	ella.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	ella.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	ella.sprite_frames = player_frames(
		Pareja.retrato_cfg(ficha), "south", hoja, true)



	_libera_butaca(butaca)
	var fila_z: float = ROW_Z0 - float(butaca.x) * ROW_DZ
	ella.position = Vector3(_butaca_x(butaca.y),
		feet_offset(ella.pixel_size, hoja + "00.png") -(0.0 if sentada else PAREJA_HUNDIDA),
		fila_z +(COJIN_FRENTE if sentada else 0.0))



	if hoja == palmas:
		ella.speed_scale = 2.0
	ella.play("idle")
	viewport.add_child(ella)
	_pareja = ella




	var luz: OmniLight3D = OmniLight3D.new()
	luz.position = ella.position + Vector3(0.0, 1.2, -1.0)
	luz.omni_range = 4.0
	luz.light_energy = 2.0
	luz.light_color = Color("ffe6c4")
	viewport.add_child(luz)




func _press_pool() -> Array[Vector3]:
	var out: Array[Vector3] = []
	for i in 120:
		var row: int = rng.randi_range(0, ROWS - 1)
		out.append(Vector3(
			rng.randf_range(- PER_ROW * SEAT_W * 0.5, PER_ROW * SEAT_W * 0.5),
			rng.randf_range(1.05, 1.45),
			ROW_Z0 - float(row) * ROW_DZ + 0.5))
	return out




func _build_pedestal() -> void:
	var col: MeshInstance3D = MeshInstance3D.new()
	var cyl: CylinderMesh = CylinderMesh.new()
	cyl.top_radius = 0.2
	cyl.bottom_radius = 0.26
	cyl.height = PEDESTAL_H
	col.mesh = cyl





	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = Color("9a7230")



	mat.roughness = 0.4
	mat.metallic = 0.35
	mat.emission_enabled = true
	mat.emission = Color("4a3410")
	col.material_override = mat
	col.position = Vector3(PEDESTAL_POS.x, STAGE_SIZE.y + PEDESTAL_H * 0.5,
		PEDESTAL_POS.y)
	viewport.add_child(col)
	var claro: StandardMaterial3D = StandardMaterial3D.new()
	claro.albedo_color = Color("e3b955")
	claro.roughness = 0.3
	claro.metallic = 0.4
	claro.emission_enabled = true
	claro.emission = Color("6a4c18")
	for aro in [[0.34, 0.07, STAGE_SIZE.y + 0.035], [0.27, 0.05, STAGE_SIZE.y + PEDESTAL_H]]:
		var disco: MeshInstance3D = MeshInstance3D.new()
		var dc: CylinderMesh = CylinderMesh.new()
		dc.top_radius = float(aro[0])
		dc.bottom_radius = float(aro[0])
		dc.height = float(aro[1])
		disco.mesh = dc
		disco.material_override = claro
		disco.position = Vector3(PEDESTAL_POS.x, float(aro[2]), PEDESTAL_POS.y)
		viewport.add_child(disco)


	_trophy = make_trophy("chico_oro" if _chico else "balon_oro", Vector3(PEDESTAL_POS.x,
		STAGE_SIZE.y + PEDESTAL_H + TROPHY_H * 0.5, PEDESTAL_POS.y), TROPHY_H)
	_trophy_y = _trophy.position.y
	_trophy.modulate = Color(0.3, 0.3, 0.34)
	_trophy_light = OmniLight3D.new()
	_trophy_light.light_color = Color(1.0, 0.9, 0.62)
	_trophy_light.light_energy = 0.0
	_trophy_light.omni_range = 4.5
	_trophy_light.position = Vector3(PEDESTAL_POS.x,
		STAGE_SIZE.y + PEDESTAL_H + TROPHY_H + 0.55, PEDESTAL_POS.y - 0.5)
	viewport.add_child(_trophy_light)

















const PANTALLA: Vector2 = Vector2(6.4, 3.6)
const PANTALLA_Y0: float = 3.3
const PANTALLA_Z: float = 9.45


const PANTALLA_PX: Vector2i = Vector2i(128, 72)

const CORTINA_X0: float = 4.6
const CORTINA_W: float = 16.0
const CORTINA_H: float = 9.6



const CAPA_SALA: int = 4
const CAPA_TELON: int = 2

const SALA_LUZ: float = 1.25
const SALA_SOBRE: float = 0.25

const BARRIDOS: int = 6
const BARRIDO_A: float = 0.075
const BARRIDO_A_ORO: float = 0.11

var _pantalla_img: Image = null
var _pantalla_tex: ImageTexture = null
var _pantalla_mat: StandardMaterial3D = null
var _pantalla_trofeo: Sprite3D = null
var _sala: SpotLight3D = null
var _barridos: Array[Node3D] = []
var _barrido_mats: Array[StandardMaterial3D] = []



func _caja(size: Vector3, pos: Vector3, mat: Material) -> MeshInstance3D:
	var m: MeshInstance3D = MeshInstance3D.new()
	var b: BoxMesh = BoxMesh.new()
	b.size = size
	m.mesh = b
	m.material_override = mat
	m.position = pos
	viewport.add_child(m)
	return m



func _mat_luz(c: Color) -> StandardMaterial3D:
	var m: StandardMaterial3D = StandardMaterial3D.new()
	m.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	m.albedo_color = c
	return m






func _build_pantalla() -> void:
	var yc: float = PANTALLA_Y0 + PANTALLA.y * 0.5
	_caja(Vector3(PANTALLA.x + 0.3, PANTALLA.y + 0.3, 0.16),
		Vector3(0.0, yc, PANTALLA_Z + 0.1), _mat_luz(Color(0.02, 0.02, 0.028)))
	_pantalla_img = _fondo_pantalla()
	_pantalla_tex = ImageTexture.create_from_image(_pantalla_img)
	_pantalla_mat = _mat_luz(Color(0.86, 0.86, 0.86))
	_pantalla_mat.albedo_texture = _pantalla_tex
	_pantalla_mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	var panel: MeshInstance3D = MeshInstance3D.new()
	var q: QuadMesh = QuadMesh.new()
	q.size = PANTALLA
	panel.mesh = q
	panel.material_override = _pantalla_mat
	panel.position = Vector3(0.0, yc, PANTALLA_Z)

	panel.rotation_degrees = Vector3(0.0, 180.0, 0.0)
	viewport.add_child(panel)


	_pantalla_trofeo = make_trophy("chico_oro" if _chico else "balon_oro",
		Vector3(0.0, yc + 0.55, PANTALLA_Z - 0.06), 2.0)
	_pantalla_trofeo.modulate = Color(0.55, 0.55, 0.6)

	for s in [-1.0, 1.0]:
		_caja(Vector3(0.16, CORTINA_H - 1.2, 0.1),
			Vector3(float(s) *(CORTINA_X0 - 0.3),(CORTINA_H - 1.2) * 0.5, PANTALLA_Z),
			_mat_luz(Color("f0c060")))
	_pinta_pantalla(0, {})





func _fondo_pantalla() -> Image:
	var img: Image = Image.create(PANTALLA_PX.x, PANTALLA_PX.y, false, Image.FORMAT_RGBA8)
	var halo: Vector2 = Vector2(PANTALLA_PX.x * 0.5, PANTALLA_PX.y * 0.36)
	for y in PANTALLA_PX.y:
		var k: float = float(y) / float(PANTALLA_PX.y - 1)
		var base: Color = Color(0.03, 0.035, 0.1).lerp(Color(0.08, 0.05, 0.15), k)
		for x in PANTALLA_PX.x:
			var d: float = Vector2(x, y).distance_to(halo) /(PANTALLA_PX.y * 0.6)
			var c: Color = base.lerp(Color(0.55, 0.4, 0.14), clampf(1.0 - d, 0.0, 1.0) * 0.45)
			if y % 2 == 1:
				c = c.darkened(0.18)
			img.set_pixel(x, y, c)
	var filo: Color = CareerTheme.MONEY.darkened(0.25)
	for x in PANTALLA_PX.x:
		img.set_pixel(x, 0, filo)
		img.set_pixel(x, PANTALLA_PX.y - 1, filo)
	for y in PANTALLA_PX.y:
		img.set_pixel(0, y, filo)
		img.set_pixel(PANTALLA_PX.x - 1, y, filo)
	return img





func _pinta_pantalla(rank: int, ficha: Dictionary, ganador: bool = false) -> void:
	if _pantalla_tex == null:
		return


	if _revealed and not ganador:
		return
	var img: Image = _pantalla_img.duplicate()
	var premio: String = I18n.t("CHICO DE ORO") if _chico \
			else I18n.t(Competitions.demarca("BALÓN DE ORO"))
	var oro: Color = CareerTheme.MONEY
	var blanco: Color = Color(0.94, 0.94, 0.97)
	if ficha.is_empty():
		_texto_centrado(img, premio, 57, oro, 2)
	else:
		var nombre: String = CareerTheme.caps(CareerUi.display_name(
			String(ficha.get("name", "?"))))
		var tuyo: bool = bool(ficha.get("you", false))
		if ganador:


			_texto_centrado(img, premio, 49, oro.darkened(0.2), 1)
			_texto_centrado(img, nombre, 57, oro, 2)
		else:

			var num: String = str(rank)
			var px_n: int = 3
			var wn: int = PixelText.text_width(num, px_n)
			var px: int = 2 if PixelText.text_width(nombre, 2) <= PANTALLA_PX.x - wn - 22 else 1
			var w: int = wn + 6 + PixelText.text_width(nombre, px)
			var x0: int = maxi(4,(PANTALLA_PX.x - w) / 2)
			PixelText.draw_text(img, x0, 53, num, oro, px_n)
			PixelText.draw_text(img, x0 + wn + 6, 58 +(2 - px) * 2, nombre,
				oro if tuyo else blanco, px)
	_pantalla_tex.update(img)



func _texto_centrado(img: Image, texto: String, y: int, c: Color, px: int) -> void:
	if px > 1 and PixelText.text_width(texto, px) > PANTALLA_PX.x - 8:
		px = 1
		y += 2
	var w: int = PixelText.text_width(texto, px)
	PixelText.draw_text(img, maxi(2,(PANTALLA_PX.x - w) / 2), y, texto, c, px)










func _build_cortinas() -> void:
	var img: Image = Image.create(32, 1, false, Image.FORMAT_RGB8)
	for x in 32:
		var f: float = 0.5 + 0.5 * sin(float(x) / 32.0 * TAU)
		img.set_pixel(x, 0, Color(1, 1, 1).darkened(0.62 *(1.0 - f * f)))
	var tex: ImageTexture = ImageTexture.create_from_image(img)
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = tex
	mat.albedo_color = Color("7a1626")
	mat.roughness = 0.95
	mat.uv1_scale = Vector3(CORTINA_W / 0.9, 1.0, 1.0)
	for s in [-1.0, 1.0]:
		var c: MeshInstance3D = MeshInstance3D.new()
		var q: QuadMesh = QuadMesh.new()
		q.size = Vector2(CORTINA_W, CORTINA_H)
		c.mesh = q
		c.material_override = mat
		c.layers = CAPA_TELON
		c.position = Vector3(float(s) *(CORTINA_X0 + CORTINA_W * 0.5),
			CORTINA_H * 0.5, PANTALLA_Z + 0.05)
		c.rotation_degrees = Vector3(0.0, 180.0, 0.0)
		viewport.add_child(c)
		for xi in [6.6, 12.0]:
			var up: SpotLight3D = SpotLight3D.new()
			up.light_color = Color("ffb070")
			up.light_energy = 3.2
			up.spot_range = 10.0
			up.spot_angle = 30.0
			up.shadow_enabled = false
			up.light_cull_mask = CAPA_TELON
			up.look_at_from_position(Vector3(float(s) * xi, 0.15, PANTALLA_Z - 1.4),
				Vector3(float(s) * xi, 6.0, PANTALLA_Z))
			viewport.add_child(up)







func _build_truss() -> void:
	var metal: StandardMaterial3D = StandardMaterial3D.new()
	metal.albedo_color = Color(0.2, 0.2, 0.23)
	metal.metallic = 0.7
	metal.roughness = 0.45
	var yt: float = CORTINA_H - 0.5
	var zt: float = PANTALLA_Z - 1.3
	for dy in [0.0, 0.42]:
		_caja(Vector3(2.0 *(CORTINA_X0 + CORTINA_W), 0.07, 0.07),
			Vector3(0.0, yt + dy, zt), metal)
	for i in BARRIDOS:
		var x: float =(float(i) - float(BARRIDOS - 1) * 0.5) * 3.6
		_caja(Vector3(0.26, 0.34, 0.26), Vector3(x, yt - 0.2, zt), metal)
		var piv: Node3D = Node3D.new()
		piv.position = Vector3(x, yt - 0.4, zt)
		viewport.add_child(piv)
		var haz: MeshInstance3D = make_beam(Vector3.ZERO, Vector3(0.0, -12.0, 0.0),
			0.06, 1.0, Color("7f86ff"), BARRIDO_A)
		haz.reparent(piv, false)
		_barridos.append(piv)
		_barrido_mats.append(haz.material_override as StandardMaterial3D)
	_tick_barridos()




func _tick_barridos() -> void:
	for i in _barridos.size():
		var ph: float = float(i) * 1.37
		var piv: Node3D = _barridos[i]

		piv.rotation = Vector3(0.42 + 0.16 * sin(t * 0.47 + ph), 0.0,
			0.48 * sin(t * 0.61 + ph * 1.3))




func _barridos_a(col: Color, a: float, dur: float) -> void:
	for m in _barrido_mats:
		var tw: Tween = create_tween()
		tw.tween_property(m, "albedo_color", Color(col.r, col.g, col.b, a), dur)














const LEVANTA_DUR: float = 0.35
const T_WALK: float = T_REVEAL + 0.6
const WALK_DUR: float = 3.3
const T_LLEGA: float = T_WALK + WALK_DUR + 0.3
const PASEO: Array[Vector2] = [Vector2(0.525, -3.78), Vector2(0.9, -3.7),
	Vector2(0.9, -2.6), Vector2(0.9, -0.6), Vector2(0.1, 0.5)]



const SALIDA: float = 0.42




const SALIDA_LADO: float = 0.12

const ESCALERA_Z0: float = -3.59


func _tick(_delta: float) -> void:
	_tick_countdown()
	_tick_atmos()
	if not _hushed and t >= T_HUSH:
		_hush()
	if not _revealed and t >= T_REVEAL:
		_reveal()
	_walk_winner()
	_tick_idolo()
	_tick_publico()
	_tick_push()
	_tick_barridos()






	if _trophy != null:
		_trophy.position.y = _trophy_y + sin(t * 1.15) * 0.012
















func _walk_winner() -> void:
	if _winner_fig == null or t < T_REVEAL + 0.2:
		return



	var de_pie: SpriteFrames = _winner_fig.get_meta("de_pie", null) as SpriteFrames
	if de_pie != null and _winner_fig.sprite_frames != de_pie:
		_winner_fig.sprite_frames = de_pie
		_winner_fig.play("idle")
	var pie: float = feet_offset(_winner_fig.pixel_size, GALA_SHEET + "00.png")
	var fila: float = _winner_home.z - COJIN_FRENTE


	var kl: float = clampf((t - T_REVEAL - 0.2) / LEVANTA_DUR, 0.0, 1.0)
	var sube: float = -0.06 * pow(1.0 - kl, 3.0)
	var fuera: float = lerpf(COJIN_FRENTE, SALIDA, 1.0 - pow(1.0 - kl, 2.0))
	var lado: float = signf(PASEO[1].x - _winner_home.x) * SALIDA_LADO
	if t < T_WALK:
		_winner_fig.position = Vector3(_winner_home.x + lado *(1.0 - pow(1.0 - kl, 2.0)),
			pie + sube, fila + fuera)
		_anda(Vector3.ZERO, 0.0)
		return
	var k: float = clampf((t - T_WALK) / WALK_DUR, 0.0, 1.0)

	var e: float = k * k *(3.0 - 2.0 * k)
	var pts: Array[Vector2] = [Vector2(_winner_home.x + lado, _winner_home.z - COJIN_FRENTE + SALIDA)]
	pts.append_array(PASEO)
	var largo: float = 0.0
	for i in pts.size() - 1:
		largo += pts[i].distance_to(pts[i + 1])
	var falta: float = e * largo
	var q: Vector2 = pts[pts.size() - 1]
	for i in pts.size() - 1:
		var tramo: float = pts[i].distance_to(pts[i + 1])
		if falta <= tramo:
			q = pts[i].lerp(pts[i + 1], falta / maxf(tramo, 0.001))
			break
		falta -= tramo

	var suelo: float = clampf((q.y - ESCALERA_Z0) /(- STAGE_SIZE.z * 0.5 - ESCALERA_Z0),
		0.0, 1.0) * STAGE_SIZE.y
	var p: Vector3 = Vector3(q.x, suelo + pie, q.y)



	var v: float = 6.0 * k *(1.0 - k) * largo / WALK_DUR
	var sig: Vector2 = q
	var resto: float = e * largo + 0.05
	for i in pts.size() - 1:
		var tramo2: float = pts[i].distance_to(pts[i + 1])
		if resto <= tramo2:
			sig = pts[i].lerp(pts[i + 1], resto / maxf(tramo2, 0.001))
			break
		resto -= tramo2
		sig = pts[i + 1]
	_anda(Vector3(sig.x - q.x, 0.0, sig.y - q.y), v if k < 1.0 else 0.0)
	_winner_fig.position = p

	if _key_light != null:
		_key_light.look_at_from_position(p + Vector3(0.7, 6.5, -3.0),
			p + Vector3(0.0, 0.9, 0.0))




func _anda(dir: Vector3, v: float) -> void:
	var fr: SpriteFrames = _winner_fig.sprite_frames
	var anim: String = "idle"
	var volteo: bool = false
	if v > 0.12 and Vector2(dir.x, dir.z).length_squared() > 1e-06:
		match walk_dir_name(dir, _winner_fig):
			"east":
				anim = "walk_east"
			"west":
				anim = "walk_east"
				volteo = true
			_:
				anim = "walk_south"
		if not fr.has_animation(anim):
			anim = "idle"
			volteo = false
	_winner_fig.flip_h = volteo
	_winner_fig.speed_scale = clampf(v / PASEO_ZANCADA_MS, 0.55, 1.4) \
			if anim != "idle" else 1.0
	if _winner_fig.animation != anim:
		_winner_fig.play(anim)




func _hush() -> void:
	_hushed = true
	applause(false)
	_palmas_para(-1)
	var tw: Tween = create_tween()
	tw.set_parallel(true)
	tw.tween_property(_key_light, "light_energy", 1.1, 0.35)
	tw.tween_property(_env, "ambient_light_energy", 0.18, 0.35)


	if _sala != null:
		tw.tween_property(_sala, "light_energy", SALA_SOBRE, 0.35)
	tw.tween_property(self, "_brillo_sala", PUBLICO_SOBRE, 0.35)
	if _pantalla_mat != null:
		tw.tween_property(_pantalla_mat, "albedo_color", Color(0.35, 0.35, 0.38), 0.35)
		_pinta_pantalla(0, {})
	_barridos_a(Color("7f86ff"), 0.0, 0.35)


func _skipped() -> void:
	_hushed = true
	if not _revealed:
		_reveal()



	t = maxf(t, T_WALK + WALK_DUR)
	_walk_winner()
	_tick_idolo()










func _reveal() -> void:
	_revealed = true
	set_confetti(true)
	sting("fanfare", -3.0)
	ovation(-1.0)
	applause(true)
	screen_flash(0.18)
	shake(0.075, 0.34)
	punch_fov(3.0, 0.32)
	var tw: Tween = create_tween()
	tw.set_parallel(true)


	tw.tween_property(_trophy, "modulate", Color.WHITE, 0.08)
	tw.tween_property(_trophy, "scale", Vector3.ONE * 1.16, 0.1) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)


	tw.tween_property(_trophy_light, "light_energy", 6.0, 0.1)
	tw.tween_property(_key_light, "light_energy", 7.0, 0.12)


	tw.tween_property(_env, "ambient_light_energy", 0.26, 0.2)
	var back: Tween = create_tween()
	back.tween_interval(0.12)
	back.set_parallel(true)
	back.tween_property(_trophy, "scale", Vector3.ONE, 0.3) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	back.tween_property(_trophy_light, "light_energy", 4.2, 0.35)
	back.tween_property(_key_light, "light_energy", 4.8, 0.4)



	if _pantalla_mat != null:
		tw.tween_property(_pantalla_mat, "albedo_color", Color.WHITE, 0.1)
		tw.tween_property(_pantalla_trofeo, "modulate", Color.WHITE, 0.1)
		if not _podium.is_empty():
			_pinta_pantalla(1, _podium[0], true)
	if _sala != null:
		tw.tween_property(_sala, "light_energy", SALA_LUZ * 0.8, 0.3)
	tw.tween_property(self, "_brillo_sala", PUBLICO_DIM * 1.3, 0.3)
	_barridos_a(Color("ffc860"), BARRIDO_A_ORO, 0.12)
	if _winner_fig != null:
		_winner_fig.modulate = Color.WHITE
	_show_ticker(false)
	_hide_bars()
	_clap_others()
	_losers_flash()
	_slam_chyron()









func _claves() -> Array:
	var k: Array = []
	k.append({"t": 0.0, "dist": 14.0, "h": 4.2, "yaw": 3.0, "aim_y": 2.4, "fov": 42.0})
	k.append({"t": maxf(_inicio - 0.02, 0.5), "dist": 10.5, "h": 3.7, "yaw": 1.0,
		"aim_y": 2.3, "fov": 40.0})
	for rank in range(_desde, 1, -1):
		var idx: int = rank - 1
		if idx >= _figs.size():
			continue
		var a: float = _empieza(rank)
		var b: float = _empieza(rank - 1) if rank > 2 else T_REVEAL
		var d: float = float(BUTACA_CAM["dist"])
		k.append(_plano_butaca(_figs[idx], a, d))
		k.append(_plano_butaca(_figs[idx], b - 0.02, d - float(BUTACA_CAM["push"])))
	if _winner_fig != null:



		var g: Dictionary = _plano_butaca(_winner_fig, T_REVEAL, 3.0)
		g["h"] = 1.6
		g["aim_y"] = 1.28
		g["yaw"] = 168.0
		k.append(g)
		var g2: Dictionary = g.duplicate()
		g2["t"] = T_REVEAL + 1.18
		g2["dist"] = 2.8
		k.append(g2)







		k.append({"t": T_REVEAL + 1.2, "dist": 5.6, "h": 2.5, "yaw": 196.0,
			"aim_y": 0.95, "fov": 48.0, "focus_x": 0.75, "focus_z": -3.0})
		k.append({"t": T_LLEGA - 0.02, "dist": 5.0, "h": 2.6, "yaw": 196.0,
			"aim_y": 1.2, "fov": 48.0, "focus_x": PLAYER_POS.x + 0.5, "focus_z": PLAYER_POS.y})
	var e: Dictionary = CAM_ENTREGA.duplicate()
	e["t"] = T_LLEGA
	k.append(e)
	if _idolo_fig != null:


		var a: Dictionary = CAM_IDOLO.duplicate()
		a["t"] = T_LLEGA + IDOLO_HABLA - 0.3
		k.append(a)
		var b: Dictionary = CAM_IDOLO.duplicate()
		b["t"] = T_LLEGA + IDOLO_FICHA
		b["dist"] = float(CAM_IDOLO["dist"]) - 0.3
		k.append(b)
		return k
	var c: Dictionary = CAM_CIERRE.duplicate()
	c["t"] = T_LLEGA + 1.5
	k.append(c)
	return k



func _empieza(rank: int) -> float:
	var fast_n: int = _desde - COUNT_TO + 1
	if rank >= COUNT_TO:
		return _inicio + float(_desde - rank) * _paso
	return _inicio + float(fast_n) * _paso + float(COUNT_TO - 1 - rank) * COUNT_STEP_SLOW


func _plano_butaca(fig: Node3D, at: float, dist: float) -> Dictionary:
	return {"t": at, "dist": dist, "h": float(BUTACA_CAM["h"]), "yaw": 180.0,
		"aim_y": float(BUTACA_CAM["aim_y"]), "fov": float(BUTACA_CAM["fov"]),
		"focus_x": fig.position.x, "focus_z": fig.position.z}




func _slam_chyron() -> void:
	if chyron == null:
		return
	chyron.pivot_offset = Vector2(0.0, chyron.size.y * 0.5)
	chyron.scale = Vector2(1.0, 1.28)
	var tw: Tween = create_tween()
	tw.tween_property(chyron, "scale", Vector2.ONE, 0.14) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)




func _ordinal_line() -> String:
	if _chico:
		var c: int = maxi(int(data.get("chicos", 1)), 1)
		if c <= 1:
			return I18n.t("TU PRIMER CHICO DE ORO")
		return I18n.tf("TU CHICO DE ORO Nº {0}", [c])
	var n: int = maxi(int(data.get("ballons", 1)), 1)
	if n <= 1:
		return I18n.t(Competitions.demarca("TU PRIMER BALÓN DE ORO"))
	return I18n.tf(Competitions.demarca("TU BALÓN DE ORO Nº {0}"), [n])






func _cuenta_chico() -> void:
	_desde = clampi(_podium.size(), COUNT_TO, COUNT_FROM)
	_paso = CHICO_PASO
	_inicio = T_PODIUM - float(_desde - COUNT_TO + 1) * _paso







const IDOLO_POS: Vector2 = Vector2(-0.8, 0.45)


const IDOLO_HABLA: float = 1.6
const IDOLO_FICHA: float = 4.6



const CAM_IDOLO: Dictionary = {"dist": 6.8, "h": 2.35, "yaw": 9.0, "aim_y": 1.45,
	"fov": 30.0, "focus_x": -0.35, "focus_z": 0.45}






func _build_idolo() -> void:
	var cfg: Dictionary = KitRecolor.appearance_for(String(_idolo.get("cara", "")), {})
	var spr: AnimatedSprite3D = AnimatedSprite3D.new()
	spr.name = "IdoloGala"
	spr.pixel_size = PLAYER_HEIGHT_M / PLAYER_METRICS.x
	spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	var frames: SpriteFrames = player_frames(cfg, "south", GALA_SHEET, true)
	_add_clap(frames, cfg)
	spr.sprite_frames = frames
	spr.position = Vector3(IDOLO_POS.x,
		STAGE_SIZE.y + feet_offset(spr.pixel_size, GALA_SHEET + "00.png"), IDOLO_POS.y)
	spr.modulate = Color(NOMINADO_DIM, NOMINADO_DIM, NOMINADO_DIM * 1.1)
	spr.play("idle")
	viewport.add_child(spr)
	_idolo_fig = spr
	CaraViva.pon(spr)





func _tick_idolo() -> void:
	if _idolo_fig == null:
		return
	var anim: String = "clap" if t >= T_REVEAL and t < T_LLEGA \
			and _idolo_fig.sprite_frames.has_animation("clap") else "idle"
	if _idolo_fig.animation != anim:
		_idolo_fig.play(anim)
	if t >= T_REVEAL:
		_idolo_fig.modulate = Color.WHITE
	var dice: bool = t >= T_LLEGA + IDOLO_HABLA and t < T_LLEGA + IDOLO_FICHA - 0.6
	var cara: CaraViva = CaraViva.de(_idolo_fig)
	if cara != null and cara._hablando != dice:
		cara.habla(dice)
	if _idolo_cita != null:
		var a0: float = T_LLEGA + IDOLO_HABLA
		var a1: float = T_LLEGA + IDOLO_FICHA - 0.2
		_idolo_cita.modulate.a = clampf(minf((t - a0) / 0.25,(a1 - t) / 0.3), 0.0, 1.0)





func _build_idolo_cita() -> void:
	var balones: int = int(_idolo.get("balones", 0))
	_idolo_cita = make_cita_idolo(String(_idolo.get("nombre", "")),
		I18n.tf(IdoloEscenas.frase_balon(balones), [balones]))



func _nota_idolo() -> String:
	return I18n.tf("Te lo entregó {0}, el ídolo del que hablaste aquella noche.",
		[CareerUi.display_name(String(_idolo.get("nombre", "")))])





func _marca_gala_tambien() -> void:
	if replay or (standalone and not embedded):
		return
	if Career.marca_escena_vivida(sella_vivo(recuerdo_de_gala())):
		Career._save()



func recuerdo_de_gala() -> Dictionary:
	var r: Dictionary = _recuerdo()
	r.erase("idolo")
	r["kind"] = Ceremonies.GALA
	return r
