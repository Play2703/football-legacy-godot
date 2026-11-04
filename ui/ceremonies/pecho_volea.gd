extends "res://ui/ceremonies/banca_juego.gd"






























































const BALON_M: float = 0.42
const BALON_PAD_PX: float = 3.0
const VUELTAS_VARA: float = 2.5



const YO_EN: Vector3 = Vector3(-13.0, 0.0, 36.0)



const CAM_ATRAS: float = 8.0
const CAM_LADO: float = 1.2
const CAM_H: float = 3.6
const CAM_FOCO: float = 8.0
const CAM_AIM_Y: float = 0.0
const CAM_FOV: float = 44.0
const CAM_ENTRA: float = 3.0








const CAM_FOV_H: float = 36.0
const CAM_AIM_Y_H: float = 0.45







const HUD_ANCHO: float = 660.0
const HUD_MARGEN: float = 24.0












const CAM_YO_ALTO: float = 1.9
const CAM_MIRA_S: float = 0.45
const CAM_MARGEN: float = 0.04
const CAM_FOV_MAX: float = 72.0


const CAM_SIGUE: float = 10.0
const CAM_CABECEO_MAX: float = 25.0








const CAM_ARRIBA_DESDE: float = 2.8
const CAM_ARRIBA_LLENO: float = 4.5
const CAM_ARRIBA_Y: float = 0.3
const CAM_ARRIBA_RAP: float = 6.0
const CAM_CABEZA_Y: float = 1.45
const CAM_ABRE: float = 9.0
const CAM_CIERRA: float = 2.5









const CAM_GLOBO_VUELVE: float = 1.0
const CAM_GLOBO_LISTO: float = 0.45




const PECHO_ADELANTE: float = 0.3
const PECHO_LADO: float = 0.22
const PECHO_Y: float = 1.3
const VOLEA_ADELANTE: float = 0.62
const VOLEA_LADO: float = 0.2




const LEAD_EMPEINE: float = 2.0 / 12.0
const LEAD_PECHO: float = 3.0 / 7.0
const LEAD_VOLEA: float = 2.0 / 12.0
const LEAD_CONTROL: float = 1.0 / 8.0



const ESPERA: float = 0.7
const PAUSA: float = 1.25
const DEL_MONTON_T: float = 0.5










const CORRE: float = 6.5


const VUELVE_TRAS: float = 0.3


const IMAN_S: float = 0.35

const MIRA_EL_Y: float = 1.0
const MIRA_DEDO_MIN: float = 0.5


const AUTO_GLOBOS: int = 20
const ANDA: float = 2.2


const ARO_R: int = 17
const ARO_TRAZO: int = 2
const ARO_LEJOS: float = 3.0
const ARO_ENTRA: float = 0.08
const ARO_ECO: float = 0.24
const ARO_CASI: float = 0.4






















const AYUDA_PASADA_S: float = 0.95
const AYUDA_APOYA_S: float = 0.3
const AYUDA_QUEDA_S: float = 0.15
const AYUDA_APAGA_S: float = 0.2
const AYUDA_LARGO: float = 0.32
const AYUDA_PANZA: float = 0.28
const AYUDA_MANO_PX: float = 6.0 / 1920.0
const RELOJ_R_MIN: float = 26.0
const RELOJ_R_BALON: float = 2.0
const RELOJ_TRAZO: float = 6.0
const RELOJ_AMBAR: float = 0.5
const RELOJ_ROJO: float = 0.25










const AUTO_PLAN: Array[Dictionary] = [
	{"pecho": 0.0, "abre": 0.0, "desvio": 0.0, "largo": 0.0},
	{"pecho": -0.03, "abre": 8.0, "desvio": 0.0, "largo": 0.0},
	{"pecho": 0.02, "abre": 0.0, "desvio": 1.0, "largo": 1.0},
	{"pecho": 0.0, "abre": -7.0, "desvio": 0.0, "largo": 0.0, "globo": 1.0},
	{"pecho": -0.04, "abre": 0.0, "desvio": 0.0, "largo": -1.5},
	{"pecho": 0.0, "abre": 6.0, "desvio": 0.0, "largo": 1.0},
	{"pecho": 0.03, "abre": 0.0, "desvio": -1.0, "largo": 0.0},
	{"pecho": 0.0, "abre": -9.0, "desvio": 0.0, "largo": 0.0},
	{"pecho": -0.02, "abre": 0.0, "desvio": 0.0, "largo": 2.0},
	{"pecho": 0.0, "abre": 7.0, "desvio": 0.0, "largo": -1.0},
	{"pecho": 0.01, "abre": 0.0, "desvio": 0.5, "largo": 0.0, "globo": 0.6},
	{"pecho": 0.0, "abre": -6.0, "desvio": 0.0, "largo": 1.0},
	{"pecho": -0.3, "abre": 0.0, "desvio": 0.0, "largo": 0.0},
	{"pecho": 0.0, "abre": 0.0, "desvio": 0.0, "largo": 0.0},
	{"pecho": 0.02, "abre": 8.0, "desvio": 0.0, "largo": 0.0},
	{"pecho": 0.0, "abre": 0.0, "desvio": -1.0, "largo": -1.0},
	{"pecho": -0.03, "abre": -8.0, "desvio": 0.0, "largo": 0.0},
	{"pecho": 0.0, "abre": 0.0, "desvio": 0.0, "largo": 1.5, "globo": 1.0},
	{"pecho": 0.0, "abre": 6.0, "desvio": 0.0, "largo": 0.0},
	{"pecho": 0.0, "abre": 0.0, "desvio": 0.0, "largo": -9.0},
]

const AUTO_VOLEA: float = 0.22

var _dir: Vector3 = Vector3.RIGHT
var _lado: Vector3 = Vector3.BACK
var _hacia: Vector3 = Vector3.LEFT
var _derecha: Vector3 = Vector3.BACK
var _casa_el: Vector3 = Vector3.ZERO
var _el_meta: Vector3 = Vector3.ZERO
var _yo_punto: Vector3 = YO_EN
var _yo_meta: Vector3 = YO_EN
var _look_yo: Dictionary = {}

var _balon: AnimatedSprite3D
var _monton: Array[AnimatedSprite3D] = []
var _sueltos: Array[Dictionary] = []
var _al_pie: bool = true

var _fase: String = ""
var _t: float = 0.0
var _ronda: int = 0
var _globo: Dictionary = {}
var _caida: Dictionary = {}
var _pecho_res: String = ""
var _pecho_gesto: bool = false
var _rebota_en_llegada: bool = false
var _pase: Dictionary = {}
var _tray: PackedVector3Array = PackedVector3Array()
var _recibo: Dictionary = {}
var _control_hecho: bool = false
var _tras_pausa: String = ""
var _cam_p: float = NAN
var _cam_k: float = NAN
var _cam_sigue: Vector3 = Vector3.ZERO
var _estados: Array = []
var _racha: int = 0
var _mejor: int = 0
var _record0: int = 0
var _cantado: bool = false
var _avisado_raya: bool = false
var _contacto: float = 0.0
var _volea_gesto: bool = false
var _pecho_el: bool = false
var _ctl_el: String = PechoVolea.PECHO
var _ctl: String = PechoVolea.PECHO
var controles_yo: Dictionary = {}
var controles_el: Dictionary = {}
var _caida_el: Dictionary = {}
var _contacto_el: float = 0.0
var _volea_el_gesto: bool = false

var voleas_el: int = 0
var _voleas_yo: int = 0
var _ayuda_reloj: float = 0.0

var _lienzo: Control
var _trazando: bool = false
var _trazo: PackedVector2Array = PackedVector2Array()
var _trazo_t: PackedFloat64Array = PackedFloat64Array()
var _trazo_mira: Vector2 = Vector2.ZERO
var _mando_apunta: bool = false
var _mando_e: PackedVector2Array = PackedVector2Array()
var _mando_t: PackedFloat64Array = PackedFloat64Array()

var _cuenta_l: Label
var _record_l: Label
var _corona: MenuIcon
var _aro_meta: Sprite3D
var _aro_cierra: Sprite3D
var _aro_eco: Sprite3D
var _aros: Dictionary = {}
var _aro_tw: Tween


func _kind() -> String:
	return Ceremonies.PREVIA_PECHO_VOLEA


func _titulo() -> String:
	return "CONTROL Y VOLEA"



func _bolitas() -> int:
	return 0


func _monta_marcador() -> void:
	pass





func _monta_ficha() -> void:
	super()





	_estado.add_to_group(Entrada.VIVO_GROUP)
	if not UiKit.es_horizontal():
		CareerUi.autoshrink(_estado, CareerTheme.T_CARD)
		return
	card_box.add_theme_constant_override("separation", 6)
	var titulo: Label = card_box.get_child(0) as Label
	if titulo != null:
		titulo.add_theme_font_size_override("font_size", CareerTheme.T_HEAD)
	_estado.add_theme_font_size_override("font_size", CareerTheme.T_HUD_ROTULO)
	CareerUi.autoshrink(_estado, CareerTheme.T_CARD)
	_record_l.add_theme_font_size_override("font_size", CareerTheme.T_HUD_ROTULO)
	_corona.custom_minimum_size = Vector2(32, 32)


func di(texto: String, col: Color = CareerTheme.TEXT) -> void:
	super(texto, col)
	CareerUi.reshrink(_estado)



func _card_en_columna() -> void:
	var vp: Viewport = get_viewport()
	card.anchor_left = 1.0
	card.anchor_right = 1.0
	card.anchor_top = 0.0
	card.anchor_bottom = 0.0
	card.offset_right = -(UiKit.side_safe_inset(vp) + HUD_MARGEN)
	card.offset_left = card.offset_right - HUD_ANCHO
	card.grow_horizontal = Control.GROW_DIRECTION_BEGIN
	card.grow_vertical = Control.GROW_DIRECTION_END
	_card_rest = UiKit.top_safe_inset(vp) + HUD_MARGEN



func _ceder_columna() -> void:
	if card == null:
		return
	_columna_cede = - card.offset_left
	_foto_ajusta_ancho()


func _contra() -> bool:
	return false


func _gestos() -> Array:
	return []




func _consume() -> Dictionary:
	return {
		"kind": _kind(),
		"status": Standing.STATUS_TITULAR,
		"div": GameState.home_div(),
		"club": GameState.player_team_id,
		"season": GameState.season_num,
		"n": GameState.matches_played,
	}




func _sienta_pareja() -> void:
	var kit: Dictionary = GameState.kit_variant(team(), 0)


	var look: Dictionary = GameState.team_custom.duplicate()
	for k in KitRecolor.TEAM_KEYS:
		look.erase(k)
	look.merge(kit, true)
	look["number"] = dorsal_vivido()
	_look_yo = look
	piel_yo = look.get("skin", KitRecolor.REF_SKIN)
	_dir = Vector3.RIGHT
	_lado = _dir.cross(Vector3.UP).normalized()
	yo = _de_pie(player_frames(look), YO_EN, look)

	_casa_el = YO_EN + _dir * PechoVolea.DISTANCIA
	var pool: Array[SpriteFrames] = squad_frames_pool(kit, 1,
		club_del_acto(), "south", true)
	var fr: SpriteFrames = pool[0] if not pool.is_empty() \
			else player_frames(KitRecolor.appearance_for("pecho_volea_compa", look))
	el = _de_pie(fr, _casa_el, {})
	_el_meta = _casa_el
	llave_el = "pecho_volea_compa"
	nombre_el = I18n.t("TU COMPAÑERO")
	focus = YO_EN + _dir * CAM_FOCO


func _de_pie(fr: SpriteFrames, at: Vector3, cfg: Dictionary) -> AnimatedSprite3D:
	var s: AnimatedSprite3D = AnimatedSprite3D.new()
	s.pixel_size = PLAYER_HEIGHT_M / PLAYER_METRICS.x
	s.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	s.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	s.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	s.sprite_frames = fr
	viewport.add_child(s)
	s.position = Vector3(at.x, feet_offset(s.pixel_size) - PLAYER_SINK, at.z)
	s.play("idle")
	add_idle_views(s, cfg)
	add_gesto(s, "empeine", 5, 12.0, cfg)
	add_gesto(s, "chest", 6, 7.0, cfg)
	add_gesto(s, "header", 4, 9.0, cfg)
	add_gesto(s, "volea", 5, 12.0, cfg)
	add_gesto(s, "control", 6, 8.0, cfg)
	add_run(s, cfg if not cfg.is_empty() else fr.get_meta("look_cfg", {}))
	CaraViva.pon(s)
	s.animation_finished.connect(_al_reposo.bind(s))
	_y0[s] = s.position.y
	return s



func _juego_keys() -> Array:
	var c1: Vector3 = YO_EN - _dir * CAM_ATRAS + _lado * CAM_LADO
	var c0: Vector3 = c1 - _dir * CAM_ENTRA + _lado * 0.8
	return [_key(0.0, c0, CAM_H + 0.9), _key(2.0, c1, CAM_H)]


func _key(t: float, c: Vector3, h: float) -> Dictionary:
	var d: Vector3 = Vector3(c.x - focus.x, 0.0, c.z - focus.z)
	return {"t": t, "dist": d.length(), "h": h,
		"yaw": rad_to_deg(atan2(d.x, - d.z)), "aim_y": _cam_aim_y(), "fov": _cam_fov()}



func _cam_fov() -> float:
	return CAM_FOV_H if UiKit.es_horizontal() else CAM_FOV


func _cam_aim_y() -> float:
	return CAM_AIM_Y_H if UiKit.es_horizontal() else CAM_AIM_Y


func _build() -> void:
	super._build()

	orbit_speed = 0.0
	var h: Vector3 =(YO_EN - _dir * CAM_ATRAS + _lado * CAM_LADO) - focus
	h.y = 0.0
	_hacia = h.normalized()
	_derecha =(- _hacia).cross(Vector3.UP).normalized()
	var fx: Dictionary = GameState.current_fixture()
	var frames: SpriteFrames = BallDeco.frames_for(fx if not fx.is_empty() else {"comp": "league"})

	for i in PechoVolea.MONTON:
		var b: AnimatedSprite3D = _balon_nuevo(frames)
		var ang: float = float(i) * 2.399
		var r: float = 0.28 * sqrt(float(i))
		b.position = _casa_el + _dir * 1.3 + _lado * 0.5 \
				+ Vector3(cos(ang) * r, PechoVolea.SUELO_Y, sin(ang) * r)
		_monton.append(b)
	_balon = _monton.pop_back()
	_balon.position = _pie_de(el)
	_aro_meta = _aro_sprite()
	_aro_cierra = _aro_sprite()
	_aro_eco = _aro_sprite()
	_monta_lienzo()
	_fase = "espera"
	pinta_marcador([], [])


func _balon_nuevo(frames: SpriteFrames) -> AnimatedSprite3D:
	var b: AnimatedSprite3D = AnimatedSprite3D.new()
	b.sprite_frames = frames
	b.pixel_size = BALON_M / 32.0
	b.offset = Vector2(0.0, - BALON_PAD_PX)
	b.billboard = BaseMaterial3D.BILLBOARD_ENABLED
	b.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	b.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD

	b.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_ON
	viewport.add_child(b)
	if frames != null:
		b.play("idle")
	return b



func _pie_de(n: AnimatedSprite3D) -> Vector3:
	var p: Vector3 = n.global_position
	var hacia: Vector3 = - _dir if n == el else _dir
	return Vector3(p.x, PechoVolea.SUELO_Y, p.z) + hacia * 0.5 + _lado * 0.12



func _pecho() -> Vector3:
	return _yo_punto + _dir * PECHO_ADELANTE + _lado * PECHO_LADO \
			+ Vector3.UP * float(PechoVolea.CONTROLES[_ctl]["y"])








func _al_reposo(n: AnimatedSprite3D) -> void:
	super._al_reposo(n)
	if n == yo:
		idle_play(yo, _dir)
	elif n == el:
		idle_play(el, - _dir)







func _monta_juego(caja: VBoxContainer) -> void:
	_record0 = Career.pv_record
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 24)
	fila.alignment = BoxContainer.ALIGNMENT_CENTER
	fila.mouse_filter = Control.MOUSE_FILTER_IGNORE
	caja.add_child(fila)
	_cuenta_l = _cuenta(CareerTheme.NAV_YO, CareerTheme.T_SCORE)
	fila.add_child(_cuenta_l)
	var rec: VBoxContainer = VBoxContainer.new()
	rec.alignment = BoxContainer.ALIGNMENT_CENTER
	rec.add_theme_constant_override("separation", 0)
	rec.mouse_filter = Control.MOUSE_FILTER_IGNORE
	fila.add_child(rec)
	_corona = MenuIcon.new()
	_corona.custom_minimum_size = Vector2(40, 40)
	_corona.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	_corona.mouse_filter = Control.MOUSE_FILTER_IGNORE
	rec.add_child(_corona)
	_corona.setup("corona", CareerTheme.NAV_LEGADO)
	_record_l = _cuenta(CareerTheme.NAV_LEGADO, CareerTheme.T_TITLE_MODAL)
	rec.add_child(_record_l)
	_pinta_cuentas()


func _cuenta(col: Color, tam: int) -> Label:
	var l: Label = CareerUi.plain(tam, col)
	l.text = "0"
	l.custom_minimum_size.x = 120
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	l.clip_text = true
	return l


func _pinta_cuentas() -> void:
	_cuenta_l.text = str(_racha)
	_record_l.text = str(maxi(_record0, _mejor))




func _monta_lienzo() -> void:
	_lienzo = Control.new()
	_lienzo.set_anchors_preset(Control.PRESET_FULL_RECT)
	_lienzo.mouse_filter = Control.MOUSE_FILTER_STOP
	_lienzo.gui_input.connect(_on_lienzo)
	_lienzo.draw.connect(_pinta_ayuda)
	_lienzo.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	add_child(_lienzo)
	if card != null:
		move_child(_lienzo, card.get_index())




func _on_lienzo(ev: InputEvent) -> void:
	if auto or acabado or not jugando:
		return


	if Entrada.modo == Entrada.Modo.MANDO:
		return
	if ev is InputEventMouseButton:
		var mb: InputEventMouseButton = ev
		if mb.button_index != MOUSE_BUTTON_LEFT:
			return
		if mb.pressed:
			_dedo_baja(mb.global_position)
		else:
			_dedo_sube(mb.global_position)
	elif ev is InputEventMouseMotion:
		var mm: InputEventMouseMotion = ev
		if (mm.button_mask&MOUSE_BUTTON_MASK_LEFT) != 0 and _trazando:
			_apunta_dedo(mm.global_position)







func _input(ev: InputEvent) -> void:
	if not (ev is InputEventJoypadButton) or Entrada.modo != Entrada.Modo.MANDO:
		return
	if auto or acabado or not jugando or not ev.is_action("fl_avanza"):
		return
	get_viewport().set_input_as_handled()
	if ev.is_pressed() and _fase == "globo":
		_toca_pecho(_t)







func _dedo_baja(p: Vector2) -> void:
	if _fase == "globo":
		_toca_pecho(_t)
		if _fase != "cae":
			return
	if _fase == "cae":
		_trazando = true
		_trazo = PackedVector2Array()
		_trazo_t = PackedFloat64Array()
		_trazo_mira = _mira_el(p)
		_apunta_dedo(p)


func _apunta_dedo(p: Vector2) -> void:
	_trazo.append(p)
	_trazo_t.append(float(Time.get_ticks_usec()) / 1000000.0)


func _dedo_sube(p: Vector2) -> void:
	if not _trazando:
		return
	if _fase != "cae":
		_trazando = false
		return
	_apunta_dedo(p)
	if not _lee_raya():
		_trazando = false



func _lee_raya() -> bool:
	var f: Dictionary = PechoVolea.lee_flick(_trazo,
		PechoVolea.dura_de(_trazo, _trazo_t, _palmo()), _palmo())
	if f.is_empty():
		return false
	_trazando = false
	_volea_raya(f)
	return true








func _palmo() -> float:
	return maxf(size.x, size.y)




func _tick(delta: float) -> void:
	super._tick(delta)


	_ayuda_reloj += delta
	_cuerpos(delta)
	_mueve_sueltos(delta)
	_encuadra(delta)











func _encuadra(delta: float) -> void:
	if cam == null or cam_keys.is_empty() or acabado or viewport_box == null:
		return
	var key: Dictionary = cam_keys[cam_keys.size() - 1]

	if yo != null:
		var aparte: Vector3 = Vector3(yo.position.x - YO_EN.x, 0.0, yo.position.z - YO_EN.z)
		_cam_sigue = _cam_sigue.lerp(aparte, 1.0 - exp(- CAM_SIGUE * delta))
	var foco: Vector3 = focus + _cam_sigue
	key["focus_x"] = foco.x
	key["focus_z"] = foco.z
	var dist: float = float(key["dist"])
	var h: float = float(key["h"])
	var wb: float = world_band if world_band < 0.999 else 1.0
	var p0: float = atan2(_cam_aim_y() - h, dist)
	var k0: float = tan(deg_to_rad(_cam_fov()) * 0.5) * wb
	var k_max: float = tan(deg_to_rad(CAM_FOV_MAX) * 0.5) * wb
	if is_nan(_cam_p):
		_cam_p = p0
		_cam_k = k0
	var caja: Rect2 = viewport_box.get_global_rect()
	if caja.size.x <= 0.0 or caja.size.y <= 0.0:
		return
	var franja: Rect2 = _franja_libre(caja)
	var u_t: float = 1.0 - 2.0 *(franja.position.y + CAM_MARGEN)
	var u_b: float = 2.0 *(franja.end.y - CAM_MARGEN) - 1.0
	var u_d: float = 2.0 *(franja.end.x - CAM_MARGEN) - 1.0
	var u_i: float = 1.0 - 2.0 *(franja.position.x + CAM_MARGEN)
	if u_t <= 0.0 or u_b <= 0.0 or u_d <= 0.0 or u_i <= 0.0:
		return
	var aspecto: float = caja.size.x / caja.size.y

	var yaw: float = deg_to_rad(float(key["yaw"]))
	var pos: Vector3 = Vector3(foco.x + sin(yaw) * dist, h, foco.z - cos(yaw) * dist)
	var fwd: Vector3 = Vector3(foco.x - pos.x, 0.0, foco.z - pos.z).normalized()

	var yo_en: Vector3 = YO_EN if yo == null else Vector3(yo.position.x, 0.0, yo.position.z)
	var balon: Array[Vector3] = _balon_pts()
	var marco: Array[float] = [u_t, u_b, u_d, u_i, aspecto, p0, k0, k_max]
	var todo: Array[Vector3] = [yo_en, yo_en + Vector3.UP * CAM_YO_ALTO]
	todo.append_array(balon)
	var plano: Dictionary = _plano(todo, pos, fwd, marco, null, 0.0)
	if plano.is_empty():
		return



	var alto_b: float = - INF
	for q: Vector3 in balon:
		alto_b = maxf(alto_b, q.y)
	var arriba: float = _mira_arriba(balon)
	if arriba > 0.0:
		var cabeza: Array[Vector3] = [yo_en + Vector3.UP * CAM_CABEZA_Y,
			yo_en + Vector3.UP * CAM_YO_ALTO]
		if _fase == "globo":



			var aro: Vector3 = yo_en +(_pecho() - Vector3(_yo_punto.x, 0.0, _yo_punto.z))
			var r_aro: float = ARO_R * ARO_LEJOS * BALON_M / 32.0
			cabeza = [aro + Vector3.DOWN * r_aro, aro + Vector3.UP * r_aro,
				yo_en + Vector3.UP * CAM_YO_ALTO]
		cabeza.append_array(balon)
		var sigue: Dictionary = _plano(cabeza, pos, fwd, marco, _balon.position,
			franja.position.y + CAM_ARRIBA_Y * franja.size.y)
		if not sigue.is_empty():
			var p_n: float = float(plano["p"])
			var k_n: float = float(plano["k"])
			if _fase == "globo":
				sigue["p"] = maxf(float(sigue["p"]), p_n)
			if arriba >= 0.5:
				plano = sigue
			plano["p"] = lerpf(p_n, float(sigue["p"]), arriba)
			plano["k"] = lerpf(k_n, float(sigue["k"]), arriba)
	var p: float = float(plano["p"])
	var k: float = float(plano["k"])
	var e_top: float = float(plano["e_top"])
	var e_bot: float = float(plano["e_bot"])

	var fuera: bool = _cam_p < e_top - atan(u_t * _cam_k) or _cam_p > e_bot + atan(u_b * _cam_k)
	var rap: float = CAM_ABRE if k > _cam_k + 0.0001 or fuera else CAM_CIERRA

	if arriba > 0.0 or (_fase == "globo" and alto_b > CAM_ARRIBA_DESDE):
		rap = maxf(rap, CAM_ARRIBA_RAP)
	var w: float = 1.0 - exp(- rap * delta)
	_cam_p = lerpf(_cam_p, p, w)
	_cam_k = lerpf(_cam_k, k, w)
	key["aim_y"] = h + dist * tan(_cam_p)
	key["fov"] = rad_to_deg(2.0 * atan(_cam_k / wb))







func _plano(pts: Array[Vector3], pos: Vector3, fwd: Vector3, marco: Array[float], mira: Variant,
		y_mira: float) -> Dictionary:
	var u_t: float = marco[0]
	var u_b: float = marco[1]
	var u_d: float = marco[2]
	var u_i: float = marco[3]
	var aspecto: float = marco[4]
	var p0: float = marco[5]
	var k0: float = marco[6]
	var k_max: float = marco[7]
	var der: Vector3 = fwd.cross(Vector3.UP)
	var e_top: float = - INF
	var e_bot: float = INF
	var rel: Array[Vector3] = []
	for q: Vector3 in pts:
		var d: Vector3 = q - pos
		var z: float = d.dot(fwd)
		if z < 1.0:
			continue
		var e: float = atan2(d.y, z)
		e_top = maxf(e_top, e)
		e_bot = minf(e_bot, e)
		rel.append(Vector3(d.dot(der), d.y, z))
	if rel.is_empty():
		return {}
	var e_mira: float = NAN
	if mira is Vector3:
		var dm: Vector3 =(mira as Vector3) - pos
		var zm: float = dm.dot(fwd)
		if zm >= 1.0:
			e_mira = atan2(dm.y, zm)
	var k: float = k0
	if e_top - atan(u_t * k) > e_bot + atan(u_b * k):

		var lo: float = k0
		var hi: float = k_max
		for _i in 24:
			var m: float =(lo + hi) * 0.5
			if atan(u_t * m) + atan(u_b * m) >= e_top - e_bot:
				hi = m
			else:
				lo = m
		k = hi
	var p: float = _cabeceo(_prefiere(p0, e_mira, k, y_mira), k, e_top, e_bot, u_t, u_b)

	var k_lados: float = 0.0
	for r: Vector3 in rel:
		var zc: float = r.z * cos(p) + r.y * sin(p)
		if zc <= 0.5:
			continue
		var x: float = r.x / zc / aspecto
		k_lados = maxf(k_lados, x / u_d if x > 0.0 else - x / u_i)
	if k_lados > k:
		k = minf(k_lados, k_max)
		p = _cabeceo(_prefiere(p0, e_mira, k, y_mira), k, e_top, e_bot, u_t, u_b)
	p = clampf(p, p0 - deg_to_rad(CAM_CABECEO_MAX), p0 + deg_to_rad(CAM_CABECEO_MAX))
	return {"p": p, "k": k, "e_top": e_top, "e_bot": e_bot}




func _prefiere(p0: float, e_mira: float, k: float, y_mira: float) -> float:
	if is_nan(e_mira):
		return p0
	return e_mira - atan(k *(1.0 - 2.0 * y_mira))






func _mira_arriba(balon: Array[Vector3]) -> float:
	if not _fase in ["vuelo", "globo"] or balon.is_empty():
		return 0.0
	var alto: float = - INF
	for q: Vector3 in balon:
		alto = maxf(alto, q.y)
	var w: float = smoothstep(CAM_ARRIBA_DESDE, CAM_ARRIBA_LLENO, alto)
	if _fase == "globo":
		w *= smoothstep(CAM_GLOBO_LISTO, CAM_GLOBO_VUELVE, float(_globo["dur"]) - _t)
	return w




func _cabeceo(p0: float, k: float, e_top: float, e_bot: float, u_t: float, u_b: float) -> float:
	var bajo: float = e_top - atan(u_t * k)
	var alto: float = e_bot + atan(u_b * k)
	if bajo > alto:
		return (bajo + alto) * 0.5
	return clampf(p0, bajo, alto)








func _franja_libre(caja: Rect2) -> Rect2:
	var r: Rect2 = Rect2(0.0, 0.0, 1.0, 1.0)
	var vista: Rect2 = caja.intersection(get_viewport_rect())
	if vista.size.x > 0.0 and vista.size.y > 0.0:
		r = Rect2((vista.position - caja.position) / caja.size, vista.size / caja.size)
	if card == null or not card.visible:
		return r
	var c: Rect2 = card.get_global_rect()
	if not c.intersects(caja):
		return r
	if c.position.y > caja.get_center().y:
		r.size.y = clampf((c.position.y - caja.position.y) / caja.size.y - r.position.y,
			0.5 * r.size.y, r.size.y)
	elif c.position.x > caja.get_center().x and c.end.y > caja.get_center().y:
		r.size.x = clampf((c.position.x - caja.position.x) / caja.size.x - r.position.x,
			0.5 * r.size.x, r.size.x)
	return r




func _balon_pts() -> Array[Vector3]:
	var out: Array[Vector3] = []
	if _balon == null:
		return out
	out.append(_balon.position)
	for s: float in [0.5, 1.0]:
		var t: float = _t + CAM_MIRA_S * s
		match _fase:
			"globo":
				var dur: float = float(_globo["dur"])
				out.append(PechoVolea.globo_en(_globo["desde"], _globo["v"], float(_globo["comba"]),
					_lado, minf(t, dur), dur))
			"vuelo":
				if not _tray.is_empty():
					out.append(_tray[mini(int(t / PechoVolea.PASO), _tray.size() - 1)])
			"el_pecho":
				var q: Vector3 = PechoVolea.arco_en(_caida_el["desde"], _caida_el["v"], t)
				q.y = maxf(q.y, PechoVolea.SUELO_Y)
				out.append(q)
	return out


func _juega(delta: float) -> void:
	var dt: float = delta
	_t += dt
	match _fase:
		"espera":
			if _t >= ESPERA and _al_pie:
				_fase = "empeine"
				_t = 0.0
				if not gesto_play(el, "empeine", - _dir):
					bota(el, 0.05)
		"empeine":
			if _t >= LEAD_EMPEINE:
				_manda_globo()
		"globo":
			if _t >= VUELVE_TRAS:
				_el_meta = _casa_el

			if _t >= PechoVolea.YO_REACCION:
				_yo_meta = _yo_punto
			_globo_tick()
		"cae":
			_cae_tick()
		"volea":
			_cae_mueve()
			if not _volea_gesto and _t >= _contacto - LEAD_VOLEA:
				_volea_gesto = true
				if not gesto_play(yo, "volea", _dir):
					bota(yo, 0.05)
			if _t >= _contacto:
				_pega()
		"vuelo":

			if _t >= VUELVE_TRAS:
				_yo_meta = YO_EN
			_vuelo_tick()
		"pausa":

			if _t >= VUELVE_TRAS:
				_yo_meta = YO_EN
			if _t >= PAUSA:
				_tras_la_pausa()
		"el_pecho":
			_balon.position = PechoVolea.arco_en(_caida_el["desde"], _caida_el["v"], _t)
			if not _volea_el_gesto and _t >= _contacto_el - LEAD_VOLEA:
				_volea_el_gesto = true
				if not gesto_play(el, "volea", - _dir):
					bota(el, 0.05)
			if _t >= _contacto_el:


				_ronda += 1
				voleas_el += 1
				sting("kick", -8.0)
				_manda_globo()
		"monton":
			if _el_llego() and _t >= DEL_MONTON_T:
				_fase = "espera"
				_t = 0.0
	_pinta_aro()
	if _lienzo != null:
		_lienzo.queue_redraw()



func _cuerpos(dt: float) -> void:
	if el == null:
		return
	_corre_yo(dt)
	var d: Vector3 = Vector3(_el_meta.x - el.position.x, 0.0, _el_meta.z - el.position.z)
	if d.length() > 0.08:


		var vel: float = CORRE if d.length() > 1.2 or _fase in ["vuelo", "globo"] else ANDA
		var paso: float = minf(vel * dt, d.length())
		el.position += d.normalized() * paso
		run_play(el, d)
	else:


		if el.animation.begins_with("run_"):
			run_play(el, Vector3.ZERO)
		idle_play(el, - _dir)





func _corre_yo(dt: float) -> void:
	if yo == null:
		return
	var d: Vector3 = Vector3(_yo_meta.x - yo.position.x, 0.0, _yo_meta.z - yo.position.z)
	if d.length() > 0.08 and not (en_gesto(yo) and not yo.animation.begins_with("run_")):
		var vel: float = PechoVolea.YO_CORRE if d.length() > 1.2 or _fase == "globo" else ANDA
		yo.position += d.normalized() * minf(vel * dt, d.length())
		run_play(yo, d)
		return
	if d.length() <= 0.08 and yo.animation.begins_with("run_"):
		run_play(yo, Vector3.ZERO)
	idle_play(yo, _dir)


func _el_llego() -> bool:
	return Vector2(_el_meta.x - el.position.x, _el_meta.z - el.position.z).length() <= 0.08




func _manda_globo() -> void:


	var g: Dictionary = PechoVolea.globo_de(azar, _ronda, _racha)

	_ctl = String(g.get("control", PechoVolea.PECHO))
	var desvio: Vector2 = g.get("desvio", Vector2.ZERO)
	_yo_punto = YO_EN + _lado * desvio.x + _dir * desvio.y
	var dur: float = float(g["dur"])
	var desde: Vector3 = _balon.position
	_globo = {"desde": desde, "v": PechoVolea.arco_vel(desde, _pecho(), dur), "dur": dur,
		"comba": float(g["comba"]), "tipo": String(g["tipo"])}
	_al_pie = false
	_pecho_res = ""
	_pecho_gesto = false
	_rebota_en_llegada = false
	_fase = "globo"
	_t = 0.0
	sting("kick", -10.0)
	_gira(_balon, -1.2, "rollfwd")
	cara_fondo(yo, "concentra")
	if _ronda == 0:
		di(Entrada.texto_f("TOCA EN EL ARO", "PULSA {0} EN EL ARO", [],
			[Entrada.boton("fl_avanza")]), CareerTheme.TEXT)


func _globo_tick() -> void:
	var dur: float = float(_globo["dur"])


	_balon.position = PechoVolea.globo_en(_globo["desde"], _globo["v"], float(_globo["comba"]),
		_lado, minf(_t, dur), dur)
	var ctl: Dictionary = PechoVolea.CONTROLES[_ctl]
	if not _pecho_gesto and _t >= dur - float(ctl["lead"]):
		_pecho_gesto = true
		if not gesto_play(yo, String(ctl["gesto"]), _dir):
			bota(yo, 0.04)
	if auto and _pecho_res.is_empty():
		var plan: Dictionary = AUTO_PLAN[_ronda % AUTO_PLAN.size()]
		if plan.get("pecho") != null and _t >= dur + float(plan["pecho"]):
			_toca_pecho(_t)
	if _rebota_en_llegada and _t >= dur:
		_rebota()
		return
	if _pecho_res.is_empty() and PechoVolea.pecho_pasado(_t, dur):
		_pecho_res = PechoVolea.TARDE
		_aro_suelta(_pecho(), CareerTheme.DANGER, 1.25)
		_rebota()


func _toca_pecho(t: float) -> void:
	if _fase != "globo" or not _pecho_res.is_empty():
		return
	var dur: float = float(_globo["dur"])
	var res: String = PechoVolea.pecho_toque(t, dur)
	match res:
		PechoVolea.NADA:
			return
		PechoVolea.PRONTO, PechoVolea.TARDE:
			_pecho_res = res
			_aro_suelta(_pecho(), CareerTheme.DANGER, 1.25)

			if t < dur:
				_rebota_en_llegada = true
			else:
				_rebota()
		_:
			_pecho_res = res
			_amortigua()



func _amortigua() -> void:
	var clavado: bool = _pecho_res == PechoVolea.CLAVADO
	_aro_suelta(_pecho(), CareerTheme.NAV_YO, 1.6 if clavado else 1.3)
	di(I18n.t("¡CLAVADO!") if clavado else I18n.t("¡CONTROL!"), CareerTheme.NAV_YO)
	sting("intro_bote", -6.0)
	UiAudio.haptic(18 if clavado else 10)
	_caida = {"desde": _balon.position,
		"v": Vector3.UP * float(PechoVolea.CONTROLES[_ctl]["sube"]) + _dir * 0.25 + _lado * -0.05}
	controles_yo[_ctl] = int(controles_yo.get(_ctl, 0)) + 1
	_fase = "cae"
	_t = 0.0
	_mando_apunta = false
	_mando_e = PackedVector2Array()
	_mando_t = PackedFloat64Array()
	_quieto(_balon)
	if not _avisado_raya:
		_avisado_raya = true
		di(Entrada.texto_f("¡DESLIZA HACIA ÉL!", "STICK: APUNTA · {0}: GLOBO", [],
			[Entrada.boton("fl_modo")]), CareerTheme.NAV_YO)



func _rebota() -> void:
	var dur: float = float(_globo["dur"])
	var p0: Vector3 = PechoVolea.globo_en(_globo["desde"], _globo["v"], float(_globo["comba"]),
		_lado, dur, dur)
	var vin: Vector3 = PechoVolea.globo_vel(_globo["v"], float(_globo["comba"]), _lado, dur, dur)
	var v: Vector3 = Vector3(- vin.x * 0.3, absf(vin.y) * 0.25, - vin.z * 0.3) \
			+ _lado * azar.randf_range(-1.6, 1.6)
	_balon.position = p0
	sting("intro_bote", -4.0)
	_suelta(_balon, v)
	di(I18n.t("¡SE TE ESCAPA!"), CareerTheme.DANGER)
	cara_fondo(yo, "")
	cara_momento(yo, "lamento", CARA_MOMENTO_S)
	_cierra_globo(false, "monton")




func _cae_tick() -> void:
	_cae_mueve()
	if auto and _t >= AUTO_VOLEA:
		_volea_auto()
		return


	if _trazando and _t >= _t_volea() - LEAD_VOLEA and _lee_raya():
		return
	if _mando_tick():
		return
	if _balon.position.y <= PechoVolea.SUELO_Y + 0.001:

		var v: Vector3 = _caida_vel()
		_suelta(_balon, v)
		di(I18n.t("¡SE CAE!"), CareerTheme.DANGER)
		cara_momento(yo, "lamento", CARA_MOMENTO_S)
		_cierra_globo(false, "monton")


func _cae_mueve() -> void:
	var p: Vector3 = PechoVolea.arco_en(_caida["desde"], _caida["v"], _t)
	p.y = maxf(p.y, PechoVolea.SUELO_Y)
	_balon.position = p




func _t_volea() -> float:
	return _baja_a_volea(_caida)



func _baja_a_volea(c: Dictionary) -> float:
	return _baja_a(c, PechoVolea.VOLEA_Y)



func _baja_a(c: Dictionary, y: float) -> float:
	var y0: float =(c["desde"] as Vector3).y - y
	var vy: float =(c["v"] as Vector3).y
	return (vy + sqrt(maxf(vy * vy + 2.0 * PechoVolea.G * y0, 0.0))) / PechoVolea.G


func _caida_vel() -> Vector3:
	return (_caida["v"] as Vector3) + Vector3.DOWN * PechoVolea.G * _t




func _volea_raya(f: Dictionary) -> void:
	var cuerda: Vector3 = _dir_suelo(f["cuerda"])
	var salida: Vector3 = cuerda
	if absf(float(f["panza"])) >= PechoVolea.PANZA_RECTA:
		salida = _dir_suelo(f["salida"])
	_volea(salida, cuerda, PechoVolea.largo_de(float(f["fuerza"])), float(f.get("globo", 0.0)))







func _mando_tick() -> bool:
	if Entrada.modo != Entrada.Modo.MANDO:
		return false
	var e: Vector2 = Entrada.eje(true)
	var m: float = e.length()
	if not _mando_apunta:
		if m < PechoVolea.MANDO_ZM:
			return false
		_mando_apunta = true

	_trazo_mira = Vector2.UP
	if m >= PechoVolea.MANDO_SUELTA:
		_mando_e.append(e)
		_mando_t.append(_t)
		while _mando_t.size() > 1 and _t - _mando_t[0] > PechoVolea.MANDO_PICO_S * 2.0:
			_mando_e.remove_at(0)
			_mando_t.remove_at(0)
		if _t < _t_volea() - LEAD_VOLEA:
			return false
	else:
		e = PechoVolea.pico(_mando_e, _mando_t, _t)
	_mando_apunta = false
	_mando_e = PackedVector2Array()
	_mando_t = PackedFloat64Array()
	var f: Dictionary = PechoVolea.lee_stick(e, Input.is_action_pressed("fl_modo"))
	if f.is_empty():
		return false
	_volea_raya(f)
	return true



func _volea_auto() -> void:
	var plan: Dictionary = AUTO_PLAN[_ronda % AUTO_PLAN.size()]
	var hacia: Vector3 = el.global_position - _balon.position
	hacia.y = 0.0
	var cuerda: Vector3 = hacia.normalized().rotated(Vector3.UP,
		deg_to_rad(- float(plan.get("desvio", 0.0))))
	var salida: Vector3 = cuerda.rotated(Vector3.UP, deg_to_rad(- float(plan.get("abre", 0.0))))
	_volea(salida, cuerda, hacia.length() + float(plan.get("largo", 0.0)),
		float(plan.get("globo", 0.0)))


func _volea(salida: Vector3, cuerda: Vector3, d: float, globo: float = 0.0) -> void:


	if _pecho_res == PechoVolea.BIEN and not auto:
		var giro: float = deg_to_rad(azar.randf_range(-1.0, 1.0) * PechoVolea.ERROR_BIEN_GRADOS)
		salida = salida.rotated(Vector3.UP, giro)
		cuerda = cuerda.rotated(Vector3.UP, giro)
		d *= 1.0 + azar.randf_range(-1.0, 1.0) * PechoVolea.ERROR_BIEN_FUERZA
	_pase = {"salida": salida, "d": d, "globo": globo,
		"rosca": PechoVolea.rosca_para(salida, cuerda, d, globo)}





	_contacto = maxf(_t_volea(), _t + LEAD_VOLEA)
	_volea_gesto = false
	_voleas_yo += 1
	_fase = "volea"




func _pega() -> void:
	var desde: Vector3 = _balon.position
	var d: float = float(_pase["d"])
	var rosca: float = float(_pase["rosca"])
	_tray = PechoVolea.vuelo(desde,
		PechoVolea.volea_vel(_pase["salida"], d, float(_pase.get("globo", 0.0))), rosca)
	_recibo = PechoVolea.recibe(_tray, el.global_position, desde)
	_control_hecho = false
	_pecho_el = false
	if PechoVolea.recogida(float(_recibo["error"])) and not _ultimo():
		var alto: Dictionary = PechoVolea.al_aire(_tray, el.global_position, desde, azar)
		if not alto.is_empty():


			_pecho_el = true
			_ctl_el = String(alto["control"])
			_recibo["i"] = alto["i"]
			_recibo["punto"] = alto["punto"]
	_fase = "vuelo"
	_t = 0.0
	sting("kick", -6.0)
	UiAudio.haptic(14)
	cara_fondo(yo, "")
	if PechoVolea.recogida(float(_recibo["error"])):


		var pt: Vector3 = _recibo["punto"]
		_el_meta = Vector3(pt.x, 0.0, pt.z) + _dir * 0.35
	_gira(_balon, 1.6, "rollfwd")


func _vuelo_tick() -> void:
	var f: float = _t / PechoVolea.PASO
	var i: int = int(floor(f))
	var ok: bool = PechoVolea.recogida(float(_recibo["error"]))
	var fin: int = int(_recibo["i"]) if ok else _tray.size() - 1
	if i >= fin:
		_balon.position = _iman() if ok else _tray[fin]
		if ok:
			_recibe()
		else:
			_no_llega()
		return
	_balon.position = _tray[i].lerp(_tray[mini(i + 1, _tray.size() - 1)], f - float(i))
	var resta: float = float(fin) * PechoVolea.PASO - _t
	if ok and resta < IMAN_S:
		_balon.position = _balon.position.lerp(_iman(), smoothstep(0.0, 1.0, 1.0 - resta / IMAN_S))
	var ctl: Dictionary = PechoVolea.CONTROLES[_ctl_el]
	var lead: float = float(ctl["lead"]) if _pecho_el else LEAD_CONTROL
	if ok and not _control_hecho and float(fin - i) * PechoVolea.PASO <= lead:
		_control_hecho = true
		if not gesto_play(el, String(ctl["gesto"]) if _pecho_el else "control", - _dir):
			bota(el, 0.04)



func _recibe() -> void:
	var rosca: float = float(_pase["rosca"])
	var e: float = float(_recibo["error"])
	_quieto(_balon)
	if not _pecho_el:
		_al_pie = true
		controles_el["pie"] = int(controles_el.get("pie", 0)) + 1
	sting("intro_bote", -8.0)
	var con_rosca: bool = absf(rosca) >= PechoVolea.ROSCA_MIN
	var globo: bool = float(_pase.get("globo", 0.0)) >= PechoVolea.GLOBO_CANTA
	di(I18n.t("¡GLOBO!") if globo else (I18n.t("¡CON ROSCA!") if con_rosca else I18n.t("¡AL PIE!")),
		CareerTheme.NAV_YO)
	cara_momento(yo, "grito" if e < 0.35 or con_rosca else "alegria", CARA_MOMENTO_S)
	cara_momento(el, "alegria", CARA_MOMENTO_S)
	_cierra_globo(true, "sigue")
	if _pecho_el:

		var sube: float = float(PechoVolea.CONTROLES[_ctl_el]["sube_el"])
		_caida_el = {"desde": _balon.position, "v": Vector3.UP * sube - _dir * 0.25}
		controles_el[_ctl_el] = int(controles_el.get(_ctl_el, 0)) + 1
		_contacto_el = _baja_a_volea(_caida_el)
		_volea_el_gesto = false
		_fase = "el_pecho"



func _no_llega() -> void:
	_suelta(_balon, PechoVolea.vuelo_vel_final(_tray))
	var que: String = PechoVolea.fallo_de(_recibo)
	di(I18n.t({PechoVolea.CORTO: "¡CORTO!", PechoVolea.LARGO: "¡LARGO!"}.get(que,
		"¡DESVIADO!")), CareerTheme.DANGER)
	cara_momento(yo, "lamento", CARA_MOMENTO_S)
	cara_momento(el, "resoplar", CARA_MOMENTO_S)
	_cierra_globo(false, "monton")





func _cierra_globo(bien: bool, luego: String) -> void:
	_estados.append(BIEN if bien else MAL)
	_racha = _racha + 1 if bien else 0
	_mejor = maxi(_mejor, _racha)

	if _mejor > Career.pv_record and not GameState.practica_en_curso and not auto:
		Career.pv_record = _mejor
		Career._save()
	if bien and not _cantado and _record0 > 0 and _racha > _record0:
		_cantado = true
		di(I18n.t("NUEVO RÉCORD"), CareerTheme.NAV_LEGADO)
		UiKit.punch(_corona)
		stadium.crowd_react("home", "save")
	_pinta_cuentas()
	if bien:
		UiKit.punch(_cuenta_l)
	_fase = "pausa"
	_t = 0.0
	_tras_pausa = luego


func _tras_la_pausa() -> void:
	if _ultimo():
		_fase = "fin"
		termina(0)
		return
	_ronda += 1
	if _tras_pausa == "sigue":
		_fase = "espera"
		_t = 0.0
		return
	_del_monton()



func _ultimo() -> bool:
	return auto and _ronda + 1 >= AUTO_GLOBOS




func _iman() -> Vector3:
	if not _pecho_el:
		return _pie_de(el)
	var p: Vector3 = el.global_position
	return Vector3(p.x, float(PechoVolea.CONTROLES[_ctl_el]["y"]), p.z) - _dir * PECHO_ADELANTE \
			- _lado * PECHO_LADO





func _del_monton() -> void:
	_el_meta = _casa_el
	_fase = "monton"
	_t = 0.0
	if _monton.is_empty():
		if _sueltos.is_empty():
			return
		var viejo: AnimatedSprite3D = _sueltos.pop_front()["nodo"]
		_quieto(viejo)
		viejo.position = _casa_el + _dir * 1.3 + _lado * 0.5 + Vector3.UP * PechoVolea.SUELO_Y
		_monton.append(viejo)
	_balon = _monton.pop_back()
	var hasta: Vector3 = _casa_el - _dir * 0.5 + _lado * 0.12
	hasta.y = PechoVolea.SUELO_Y
	var tw: Tween = create_tween()
	tw.tween_interval(maxf(Vector2(_el_meta.x - el.position.x,
		_el_meta.z - el.position.z).length() / ANDA, 0.0))
	tw.tween_callback(_rueda.bind(_balon,(hasta - _balon.position) / DEL_MONTON_T))
	tw.tween_property(_balon, "position", hasta, DEL_MONTON_T) \
			.set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	tw.tween_callback(_quieto.bind(_balon))
	tw.tween_callback(func() -> void: _al_pie = true)




func _suelta(b: AnimatedSprite3D, v: Vector3) -> void:
	_sueltos.append({"nodo": b, "v": v})




func _mueve_sueltos(delta: float) -> void:
	for s: Dictionary in _sueltos:
		var v: Vector3 = s["v"]
		if v == Vector3.ZERO:
			continue
		var b: AnimatedSprite3D = s["nodo"]
		v.y -= PechoVolea.G * delta
		var p: Vector3 = b.position + v * delta
		if p.y <= PechoVolea.SUELO_Y:
			p.y = PechoVolea.SUELO_Y
			if v.y < -0.8:
				v.y = - v.y * 0.42
				v.x *= 0.72
				v.z *= 0.72
			else:
				v.y = 0.0

				v.x = move_toward(v.x, 0.0, 2.2 * delta * absf(v.x) / maxf(Vector2(v.x, v.z).length(), 0.01))
				v.z = move_toward(v.z, 0.0, 2.2 * delta * absf(v.z) / maxf(Vector2(v.x, v.z).length(), 0.01))
				if Vector2(v.x, v.z).length() < 0.12:
					v = Vector3.ZERO
			_rueda(b, v)
		b.position = p
		s["v"] = v

















func _dir_suelo(u: Vector2) -> Vector3:
	var pie: Vector3 = Vector3(_balon.position.x, 0.0, _balon.position.z)
	var mira: Vector2 = _trazo_mira if _trazo_mira.length() >= 1.0 else _mira_el()
	var hacia: Vector3 = Vector3.ZERO if el == null \
			else Vector3(el.global_position.x - pie.x, 0.0, el.global_position.z - pie.z)
	if mira.length() < 1.0 or hacia.length() < 0.5:
		var d: Vector3 = _proyecta(pie, u)
		return d if d.is_finite() else _dir
	var giro: float = mira.angle_to(u)
	var recta: Vector3 = _proyecta(pie, Vector2.UP)
	var torcida: Vector3 = _proyecta(pie, Vector2.UP.rotated(giro))
	if not recta.is_finite() or not torcida.is_finite():
		return hacia.normalized()
	return hacia.normalized().rotated(Vector3.UP, recta.signed_angle_to(torcida, Vector3.UP))









func _mira_el(dedo: Vector2 = Vector2.INF) -> Vector2:
	if el == null or _balon == null or cam == null:
		return Vector2.ZERO
	var el_p: Vector2 = _a_lienzo(el.global_position + Vector3.UP * MIRA_EL_Y)
	var mira: Vector2 = el_p - _a_lienzo(_balon.position)
	if dedo.is_finite():
		var del_dedo: Vector2 = el_p - dedo
		if del_dedo.y < 0.0 and del_dedo.length() >= MIRA_DEDO_MIN * mira.length():
			return del_dedo
	return mira



func _proyecta(pie: Vector3, u: Vector2) -> Vector3:
	var a: Vector2 = _a_lienzo(pie)
	for palmo: float in [240.0, 140.0, 70.0]:
		var w: Vector3 = _suelo_de(a + u * palmo)
		if w.is_finite():
			var d: Vector3 = Vector3(w.x - pie.x, 0.0, w.z - pie.z)
			if d.length() > 0.05:
				return d.normalized()
	return Vector3.INF


func _a_lienzo(p: Vector3) -> Vector2:
	var caja: Rect2 = viewport_box.get_global_rect()
	var vs: Vector2 = Vector2(viewport.size)
	return caja.position + cam.unproject_position(p) / vs * caja.size



func _suelo_de(q: Vector2) -> Vector3:
	var caja: Rect2 = viewport_box.get_global_rect()
	var vs: Vector2 = Vector2(viewport.size)
	var vp: Vector2 =(q - caja.position) / caja.size * vs
	var o: Vector3 = cam.project_ray_origin(vp)
	var n: Vector3 = cam.project_ray_normal(vp)
	if n.y > -0.001:
		return Vector3.INF
	return o + n *(- o.y / n.y)




func _quieto(b: AnimatedSprite3D) -> void:
	if b.sprite_frames != null:
		b.play("idle")
		b.speed_scale = 1.0


func _gira(b: AnimatedSprite3D, escala: float, eje: String = "rollfwd") -> void:
	var fr: SpriteFrames = b.sprite_frames
	if fr == null:
		return
	var anim: String = eje if fr.has_animation(eje) else "roll"
	if not fr.has_animation(anim):
		return
	if b.animation != anim or not b.is_playing():
		b.play(anim)
	b.speed_scale = escala


func _rueda(b: AnimatedSprite3D, v: Vector3) -> void:
	var plano: Vector3 = Vector3(v.x, 0.0, v.z)
	var rap: float = plano.length()
	var fr: SpriteFrames = b.sprite_frames
	if fr == null or rap < 0.02:
		_quieto(b)
		return
	var escala: float = rap /(PI * BALON_M) / VUELTAS_VARA
	var hacia: float = plano.dot(_hacia) / rap
	if absf(hacia) < 0.7071 and fr.has_animation("rollside"):
		if b.animation != "rollside" or not b.is_playing():
			b.play("rollside")
		b.speed_scale = escala * signf(plano.dot(_derecha))
		return
	_gira(b, - escala if hacia > 0.0 else escala)




func _pinta_ayuda() -> void:
	if _fase != "cae" or _balon == null or cam == null or acabado:
		return
	var aqui: Transform2D = _lienzo.get_global_transform().affine_inverse()
	var b: Vector2 = aqui * _a_lienzo(_balon.position)

	var suelo: float = _baja_a(_caida, PechoVolea.SUELO_Y)
	var queda: float = clampf(1.0 - _t / maxf(suelo, 0.001), 0.0, 1.0)
	var arriba: Vector2 = aqui * _a_lienzo(_balon.position + Vector3.UP * BALON_M * 0.5)
	var r: float = maxf(b.distance_to(arriba) * RELOJ_R_BALON, RELOJ_R_MIN)
	var col: Color = CareerTheme.NAV_YO
	if queda <= RELOJ_ROJO:
		col = CareerTheme.DANGER
	elif queda <= RELOJ_AMBAR:
		col = CareerTheme.CAUTION
	_lienzo.draw_arc(b, r, 0.0, TAU, 48, Color(col, 0.22), RELOJ_TRAZO)
	if queda > 0.0:
		_lienzo.draw_arc(b, r, - PI * 0.5, - PI * 0.5 + TAU * queda, 48, col, RELOJ_TRAZO)

	if Entrada.modo == Entrada.Modo.MANDO:
		_pinta_guia(aqui)
		return


	if _voleas_yo > 0 or (_trazando and _trazo.size() > 1
			and _trazo[_trazo.size() - 1].distance_to(_trazo[0])
				> PechoVolea.QUIETO * _palmo()):
		return
	var alto: float = _lienzo.size.y
	var el_p: Vector2 = aqui * _a_lienzo(el.global_position + Vector3.UP * PECHO_Y)
	var hacia: Vector2 =(el_p - b).normalized()
	if not hacia.is_finite() or hacia == Vector2.ZERO:
		hacia = Vector2.UP
	var reloj: float = _ayuda_reloj / AYUDA_PASADA_S
	var pasada: int = int(floor(reloj)) % 3

	var s: float =(reloj - floor(reloj)) * AYUDA_PASADA_S
	var raya_s: float = _ayuda_raya_s()
	var suelta: float = AYUDA_APOYA_S + raya_s
	if s >= suelta + AYUDA_QUEDA_S + AYUDA_APAGA_S:
		return
	var k: float = smoothstep(AYUDA_APOYA_S, suelta, s)
	var alfa: float = 1.0 - smoothstep(suelta + AYUDA_QUEDA_S,
		suelta + AYUDA_QUEDA_S + AYUDA_APAGA_S, s)
	var panza: float = float([0.0, 1.0, -1.0][pasada]) * AYUDA_PANZA
	var largo: float = AYUDA_LARGO * _palmo()
	var normal: Vector2 = Vector2(- hacia.y, hacia.x)
	var traza: PackedVector2Array = PackedVector2Array()
	for i: int in 13:
		var u: float = k * float(i) / 12.0
		traza.append(b + hacia * largo * u + normal * largo * panza * 4.0 * u *(1.0 - u))
	if k > 0.02:
		_lienzo.draw_polyline(traza, Color(CareerTheme.NAV_YO, 0.55 * alfa), RELOJ_TRAZO * 0.8,
			true)
	TouchHand.draw(_lienzo, traza[traza.size() - 1], AYUDA_MANO_PX * alto, alfa,
		s < suelta)







func _ayuda_raya_s() -> float:
	var d: float = PechoVolea.DISTANCIA
	if el != null and _balon != null:
		d = Vector2(el.global_position.x - _balon.position.x,
			el.global_position.z - _balon.position.z).length()
	var fuerza: float = clampf(inverse_lerp(PechoVolea.D_MIN, PechoVolea.D_MAX, d), 0.0, 1.0)
	var vel: float = lerpf(PechoVolea.VEL_MIN, PechoVolea.VEL_MAX, fuerza)
	return minf(AYUDA_LARGO / vel,
		AYUDA_PASADA_S - AYUDA_APOYA_S - AYUDA_QUEDA_S - AYUDA_APAGA_S)






func _pinta_guia(aqui: Transform2D) -> void:
	if auto or el == null:
		return
	var f: Dictionary = PechoVolea.lee_stick(Entrada.eje(true), Input.is_action_pressed("fl_modo"))
	if f.is_empty():
		return
	var mira: Vector2 = _trazo_mira
	_trazo_mira = Vector2.UP
	var cuerda: Vector3 = _dir_suelo(f["cuerda"])
	_trazo_mira = mira
	var desde: Vector3 = PechoVolea.arco_en(_caida["desde"], _caida["v"],
		maxf(_t_volea(), _t + LEAD_VOLEA))
	desde.y = maxf(desde.y, PechoVolea.SUELO_Y)
	var tray: PackedVector3Array = PechoVolea.vuelo(desde, PechoVolea.volea_vel(cuerda,
		PechoVolea.largo_de(float(f["fuerza"])), float(f["globo"])), 0.0)
	var n: int = mini(tray.size(), maxi(2, ceili(tray.size() * PechoVolea.MANDO_GUIA)))
	var pts: PackedVector2Array = PackedVector2Array()
	for i: int in n:
		if i % 3 == 0 or i == n - 1:
			pts.append(aqui * _a_lienzo(tray[i]))
	if pts.size() >= 2:
		_lienzo.draw_polyline(pts, Color(CareerTheme.NAV_YO, 0.75), RELOJ_TRAZO * 0.8, true)







func _pinta_aro() -> void:
	if _aro_meta == null:
		return
	if _fase != "globo" or not _pecho_res.is_empty():
		_aro_meta.visible = false
		_aro_cierra.visible = false
		return
	var per: float = float(_globo["dur"])
	var t: float = _t
	if t < per * 0.5:
		_aro_meta.visible = false
		_aro_cierra.visible = false
		return
	var sitio: Vector3 = _pecho()
	var entra: float = clampf((t - per * 0.5) / ARO_ENTRA, 0.0, 1.0)
	var cuenta: bool = t >= per - PechoVolea.PECHO_ANTES
	var col: Color = _aro_color(t, per)
	_aro_meta.visible = true
	_aro_meta.position = sitio
	_aro_meta.texture = _aro_tex(ARO_R, ARO_TRAZO + 1 if cuenta else ARO_TRAZO)
	_aro_meta.modulate = col
	_aro_meta.modulate.a = 1.0 if cuenta else 0.45 * entra
	var k: float = clampf((per - t) /(per * 0.5), 0.0, 1.0)
	_aro_cierra.visible = k > 0.0
	_aro_cierra.position = sitio
	_aro_cierra.texture = _aro_tex(ARO_R + roundi(ARO_R *(ARO_LEJOS - 1.0) * k), ARO_TRAZO)
	_aro_cierra.modulate = col
	_aro_cierra.modulate.a = entra


func _aro_color(t: float, per: float) -> Color:
	var abre: float = per - PechoVolea.PECHO_ANTES
	if t >= abre:
		return CareerTheme.NAV_YO
	if t >= abre -(abre - per * 0.5) * ARO_CASI:
		return CareerTheme.CAUTION
	return CareerTheme.DANGER


func _aro_suelta(pos: Vector3, col: Color, crece: float) -> void:
	if _aro_eco == null:
		return
	if _aro_tw != null and _aro_tw.is_valid():
		_aro_tw.kill()
	_aro_eco.position = pos
	_aro_eco.texture = _aro_tex(ARO_R, ARO_TRAZO + 1)
	_aro_eco.modulate = col
	_aro_eco.scale = Vector3.ONE
	_aro_eco.visible = true
	_aro_tw = create_tween().set_parallel()
	_aro_tw.tween_property(_aro_eco, "scale", Vector3.ONE * crece, ARO_ECO) \
			.set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	_aro_tw.tween_property(_aro_eco, "modulate:a", 0.0, ARO_ECO)
	_aro_tw.chain().tween_callback(_aro_eco.hide)


func _aro_sprite() -> Sprite3D:
	var s: Sprite3D = Sprite3D.new()
	s.pixel_size = BALON_M / 32.0
	s.offset = Vector2(0.0, - BALON_PAD_PX)
	s.billboard = BaseMaterial3D.BILLBOARD_ENABLED
	s.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	s.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	s.no_depth_test = true
	s.render_priority = 10
	s.visible = false
	viewport.add_child(s)
	return s


func _aro_tex(r: int, trazo: int) -> ImageTexture:
	var clave: int = r * 8 + trazo
	if _aros.has(clave):
		return _aros[clave]
	var lado: int = 2 * r + 3
	var img: Image = Image.create_empty(lado, lado, false, Image.FORMAT_RGBA8)
	var c: float =(lado - 1) * 0.5
	for y in lado:
		for x in lado:
			var d: float = Vector2(x - c, y - c).length()
			if d <= r + 0.5 and d > r + 0.5 - trazo:
				img.set_pixel(x, y, Color.WHITE)
	var tex: ImageTexture = ImageTexture.create_from_image(img)
	_aros[clave] = tex
	return tex






func termina(_res: int, _premio: String = "") -> void:
	if acabado:
		return
	acabado = true
	_aro_meta.visible = false
	_aro_cierra.visible = false
	_al_campo.visible = false
	_cuenta_l.text = str(_mejor)
	_record_l.text = str(maxi(_record0, _mejor))
	UiKit.punch(_cuenta_l)
	var buena: bool = _mejor > _record0
	if buena:
		di(I18n.t("NUEVO RÉCORD"), CareerTheme.NAV_LEGADO)
		UiKit.punch(_corona)
		cara_fondo(yo, "alegria")
		cara_momento(yo, "grito", CARA_FINAL_S)
		cara_momento(el, "reir", CARA_FINAL_S)
		bota(yo, 0.1, 0.3)
		stadium.crowd_react("home", "save")
	else:
		di(I18n.t("HOY"))
		cara_fondo(yo, "")
		cara_momento(yo, "resoplar", CARA_FINAL_S)
	card_cta(I18n.t("AL CAMPO"))
	sting("ui_confirm", -4.0)
	UiAudio.haptic(30 if buena else 15)
	var tw: Tween = create_tween()
	tw.tween_interval(FIN_AUTO)
	tw.tween_callback(_leave)
