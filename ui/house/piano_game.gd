class_name PianoGame
extends Control












































const MIDI_MIN: int = 36
const MIDI_MAX: int = 96
const PASO_MUESTRA: int = 3
const MUESTRA_PATH: String = "res://assets/audio/piano/p_%d.ogg"



const VOCES: int = 16


const VOL_DB: float = -3.0

const APAGADOR_TAU: float = 0.06


const REGOLPE_TAU: float = 0.02





const BLANCAS_VERTICAL: int = 8
const BLANCAS_TUMBADO: int = 15


const OCTAVAS: Array[int] = [2, 3, 4, 5]


const OCTAVA_INICIAL: int = 4



const TECLA_LARGO: float = 6.0
const TECLAS_ALTO_MAX_V: float = 0.25
const TECLAS_ALTO_MAX_H: float = 0.3

const MARGEN_ABAJO: float = 36.0


const PIXELES_POR_TECLA: float = 10.0

const NEGRA_ANCHO: float = 0.58
const NEGRA_ALTO: float = 0.62

const BLANCA_SEMI: Array[int] = [0, 2, 4, 5, 7, 9, 11]
const CON_NEGRA: Array[bool] = [true, true, false, true, true, true, false]


const TECLAS: Dictionary = {
	KEY_A: 0, KEY_W: 1, KEY_S: 2, KEY_E: 3, KEY_D: 4, KEY_F: 5, KEY_T: 6, KEY_G: 7,
	KEY_Y: 8, KEY_H: 9, KEY_U: 10, KEY_J: 11, KEY_K: 12, KEY_O: 13, KEY_L: 14, KEY_P: 15,
	KEY_SEMICOLON: 16, KEY_APOSTROPHE: 17,
}

const NOTAS_MAX: int = 36
















const MELODIAS_OCARINA: Array = [
	[71, 74, 69, 71, 74, 69],
	[74, 71, 69, 74, 71, 69],
	[65, 69, 71, 65, 69, 71, 65, 69, 71, 76, 74, 71, 72, 71, 67, 64],
	[69, 65, 74, 69, 65, 74],
	[69, 62, 65, 69, 62, 65],
	[62, 65, 74, 62, 65, 74],
]

const OIDO: int = 16


const FESTEJO_OCARINA: String = Celebs.OCARINA_ID
const OCARINA_AVISO: String = "Te pones el gorro verde, te salen orejas de duende y tocas la ocarina. Lo estrenas en tu próximo gol."
const AVISO: GDScript = preload("res://ui/achievement_popup.gd")









const LAMINA: String = "piano_toca"
const LAMINA_ARTE: String = "pc_teclea"
const LAMINA_CUADROS: int = 7
const TOCA_FPS: float = 10.0


const TOCA_RESPIRO: float = 0.35








const TECLAS_FONDOS: float = 0.4725
const MANOS_AIRE: float = 0.05
const DEDOS_PX: float = 53.0
const TECLAS_M: float = 0.75


const BANQUETA_ALTO: float = 0.45
const BANQUETA_FONDOS: float = 0.66




const PICADO: float = 46.0
const PICADO_MAX: float = 70.0
const MURO_ALTO: float = 2.4
const ESCENA_M: float = 2.7
const LLENA: float = 0.72
const CAM_FOV: float = 40.0


const FONDO: Color = Color("0d0c10")
const LACA: Color = Color("15151b")
const LACA_BRILLO: Color = Color("2a2a34")
const FILETE: Color = Color("b8964a")
const FIELTRO: Color = Color("7a1f2a")
const MARFIL: Color = Color("f3eee3")
const MARFIL_LABIO: Color = Color("d9d2c3")
const MARFIL_HUNDIDO: Color = Color("cfc7b6")
const ESCUDO_DO: Color = Color("b3aa98")
const EBANO: Color = Color("1a1a20")
const EBANO_CARA: Color = Color("3a3a45")
const EBANO_HUNDIDO: Color = Color("2c2c35")


static var _muestras: Dictionary = {}

var _octava: int = OCTAVA_INICIAL
var _blancas: int = BLANCAS_VERTICAL
var _voces: Array[AudioStreamPlayer] = []

var _estado: Array[Dictionary] = []


var _pulsadas: Dictionary = {}
var _dedos: Dictionary = {}
var _teclas_fisicas: Dictionary = {}
var _pad_midi: int = -1
var _cursor: int = 60
var _teclado: Rect2 = Rect2()
var _caja: Rect2 = Rect2()
var _rects_blancas: Array[Dictionary] = []
var _rects_negras: Array[Dictionary] = []
var _notas: Array[Dictionary] = []
var _sucio: bool = true
var _cerrando: bool = false
var _musica_baja: bool = false
var _tocadas: int = 0
var _arriba: MarginContainer
var _controles: VBoxContainer
var _pista: Label
var _fila_atras: HBoxContainer
var _pixeles: SubViewport
var _pintor: Node2D
var _lienzo: TextureRect

var _px: float = 2.0


var _casa: Node = null
var _prop: Dictionary = {}
var _sitio: Vector2 = Vector2.ZERO
var _frente: Vector2 = Vector2(0.0, -1.0)
var _banqueta: Node3D = null
var _cam_tr: Transform3D = Transform3D()
var _cam_fov: float = 48.0
var _jug_pos: Vector3 = Vector3.ZERO
var _jug_proc: int = Node.PROCESS_MODE_INHERIT
var _jug_visible: bool = true

var _oido: Array[int] = []
var _aviso: Control = null
var _ocarina_avisada: bool = false

var _toca_t: float = 0.0
var _toca_reloj: float = 0.0


const HUD_CASA: Array[String] = ["_hud_top", "_hud_bottom", "_grid_btn", "_zoom_in_btn",
	"_zoom_out_btn", "_comeback_btn"]
var _hud_antes: Dictionary = {}


func _ready() -> void:


	set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	process_mode = Node.PROCESS_MODE_ALWAYS

	mouse_filter = Control.MOUSE_FILTER_IGNORE
	get_tree().paused = true

	Entrada.juego(self, true)
	if UiKit.es_horizontal():
		_blancas = BLANCAS_TUMBADO
	_cursor = _do_ventana()
	_carga_muestras()
	for i in VOCES:
		var v: AudioStreamPlayer = AudioStreamPlayer.new()
		v.bus = UiAudio.SFX_BUS
		add_child(v)
		_voces.append(v)
		_estado.append({"midi": -1, "amp": 0.0, "tau": 0.0, "gain": VOL_DB, "inicio": 0})


	Music.duck(-30.0, 36000.0, 0.8)
	_musica_baja = true
	_sienta()

	_monta_pixeles()
	_construye_ui()
	resized.connect(_coloca)
	_coloca()


func _construye_ui() -> void:
	_arriba = MarginContainer.new()


	_arriba.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_arriba.set_anchors_preset(Control.PRESET_TOP_WIDE)
	for side in ["left", "right", "top"]:
		_arriba.add_theme_constant_override("margin_" + side, 30)
	add_child(_arriba)
	CareerUi.apply_safe_area(_arriba, get_viewport())
	var col: VBoxContainer = VBoxContainer.new()
	col.mouse_filter = Control.MOUSE_FILTER_IGNORE
	col.add_theme_constant_override("separation", 18)
	_arriba.add_child(col)
	_fila_atras = CareerUi.back_button(col, _cerrar).get_parent() as HBoxContainer



	_controles = VBoxContainer.new()
	_controles.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_controles.add_theme_constant_override("separation", 10)
	if UiKit.es_horizontal():
		_controles.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		_fila_atras.add_child(_controles)
	else:
		col.add_child(_controles)
	_construye_controles()

	_pista = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_MID)
	_pista.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER

	_pista.clip_text = true
	_pista.text = Entrada.texto_f("TOCA LAS TECLAS", "CRUCETA ELIGE · {0} TOCA", [],
		[Entrada.boton("fl_avanza")])
	_pista.add_to_group(Entrada.VIVO_GROUP)
	col.add_child(_pista)







func _monta_pixeles() -> void:
	_pixeles = SubViewport.new()
	_pixeles.transparent_bg = true
	_pixeles.disable_3d = true
	_pixeles.render_target_update_mode = SubViewport.UPDATE_ONCE
	add_child(_pixeles)
	_pintor = Node2D.new()
	_pintor.draw.connect(func() -> void: _pinta(_pintor))
	_pixeles.add_child(_pintor)
	_lienzo = TextureRect.new()
	_lienzo.texture = _pixeles.get_texture()
	_lienzo.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	_lienzo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_lienzo.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	_lienzo.stretch_mode = TextureRect.STRETCH_SCALE
	add_child(_lienzo)



func _repinta() -> void:
	if _pintor == null:
		return
	_pintor.queue_redraw()
	_pixeles.render_target_update_mode = SubViewport.UPDATE_ONCE




func _construye_controles() -> void:
	for c in _controles.get_children():
		_controles.remove_child(c)
		c.queue_free()


	CareerUi.pager(_controles, I18n.tf("OCTAVA {0}", [_octava]),
		_octavas().size(), _octavas().find(_octava), _cambia_octava)




func _coloca() -> void:
	var w: float = size.x
	var h: float = size.y
	if w <= 0.0 or h <= 0.0:
		return
	var tumbado: bool = UiKit.es_horizontal()
	var vp: Viewport = get_viewport()
	var abajo: float = UiKit.bottom_safe_inset(vp)
	var lado: float = UiKit.side_safe_inset(vp)
	var mx: float = 24.0 + lado
	var k: float =(w - mx * 2.0) / _blancas
	var alto: float = minf(k * TECLA_LARGO, h *(TECLAS_ALTO_MAX_H if tumbado else TECLAS_ALTO_MAX_V))
	var bottom: float = h - abajo - MARGEN_ABAJO
	_teclado = Rect2(mx, bottom - alto, w - mx * 2.0, alto)

	_caja = Rect2(_teclado.position.x - 14.0, _teclado.position.y - 64.0,
		_teclado.size.x + 28.0, _teclado.size.y + 78.0)
	if tumbado:


		_controles.custom_minimum_size.x = clampf(w - mx * 2.0 - 360.0, 0.0, 720.0)
	_rehace_teclas()
	_px = maxf(2.0, roundf(k / PIXELES_POR_TECLA))
	_pixeles.size = Vector2i(ceili(w / _px), ceili(h / _px))
	_pintor.scale = Vector2.ONE / _px
	_lienzo.position = Vector2.ZERO
	_lienzo.size = Vector2(_pixeles.size) * _px
	_encuadra()
	queue_redraw()
	_repinta()



func _do_ventana() -> int:
	return 12 *(_octava + 1)



func _ultima_de(o: int) -> int:
	var i: int = _blancas - 1
	return 12 *(o + 1) + 12 * int(i / 7) + BLANCA_SEMI[i % 7]



func _octavas() -> Array[int]:
	var r: Array[int] = []
	for o: int in OCTAVAS:
		if _ultima_de(o) <= MIDI_MAX:
			r.append(o)
	return r


func _ancho_blanca() -> float:
	return _teclado.size.x / _blancas




func _rehace_teclas() -> void:
	_rects_blancas.clear()
	_rects_negras.clear()
	var ancho: float = _teclado.size.x / _blancas
	var do0: int = _do_ventana()
	for i in _blancas:
		var grado: int = i % 7
		var midi: int = do0 + 12 * int(i / 7) + BLANCA_SEMI[grado]
		var x: float = _teclado.position.x + ancho * i
		_rects_blancas.append({"midi": midi,
			"rect": Rect2(floorf(x) + 2.0, _teclado.position.y, floorf(ancho) - 4.0, _teclado.size.y)})
		if CON_NEGRA[grado] and i < _blancas - 1 and midi + 1 <= MIDI_MAX:
			var nw: float = ancho * NEGRA_ANCHO
			_rects_negras.append({"midi": midi + 1,
				"rect": Rect2(floorf(x + ancho - nw * 0.5), _teclado.position.y, floorf(nw),
					floorf(_teclado.size.y * NEGRA_ALTO))})
	_cursor = clampi(_cursor, _primera(), _ultima())
	_sucio = true


func _primera() -> int:
	return int(_rects_blancas[0]["midi"]) if not _rects_blancas.is_empty() else MIDI_MIN


func _ultima() -> int:
	return int(_rects_blancas[-1]["midi"]) if not _rects_blancas.is_empty() else MIDI_MAX



func tecla_en(p: Vector2) -> int:
	if not _teclado.has_point(p):
		return -1
	for n: Dictionary in _rects_negras:
		if (n["rect"] as Rect2).has_point(p):
			return int(n["midi"])
	var ancho: float = _teclado.size.x / _blancas
	var i: int = clampi(int((p.x - _teclado.position.x) / ancho), 0, _blancas - 1)
	return int(_rects_blancas[i]["midi"])





func _fuerza(p: Vector2, midi: int) -> float:
	var alto: float = _teclado.size.y *(NEGRA_ALTO if _es_negra(midi) else 1.0)
	return lerpf(0.7, 1.0, clampf((p.y - _teclado.position.y) / maxf(alto, 1.0), 0.0, 1.0))


static func _es_negra(midi: int) -> bool:
	return not BLANCA_SEMI.has(posmod(midi, 12))









func _sienta() -> void:
	var padre: Node = get_parent()
	if padre == null or not (padre.get("cam") is Camera3D) \
			or not (padre.get("player") is AnimatedSprite3D) or not padre.has_method("_plano"):
		return
	_casa = padre
	_prop = _prop_piano()
	if _prop.is_empty():
		_casa = null
		return
	var cam: Camera3D = _casa.get("cam")
	var jug: AnimatedSprite3D = _casa.get("player")
	_cam_tr = cam.global_transform
	_cam_fov = cam.fov
	_jug_pos = jug.position
	_jug_proc = jug.process_mode
	_jug_visible = jug.visible


	_hud(false)
	if not jug.sprite_frames.has_animation(LAMINA):
		var cfg: Dictionary = KitRecolor.casual_of(GameState.team_custom)
		for i in LAMINA_CUADROS:
			var path: String = "res://assets/sprites/anim/%s_south_%02d.png" % [LAMINA_ARTE, i]
			if not ResourceLoader.exists(path):
				continue
			if not jug.sprite_frames.has_animation(LAMINA):
				jug.sprite_frames.add_animation(LAMINA)
				jug.sprite_frames.set_animation_loop(LAMINA, false)
				jug.sprite_frames.set_animation_speed(LAMINA, 0.0)
			jug.sprite_frames.add_frame(LAMINA, KitRecolor.apply(load(path), cfg))





	var r: Rect2 = _prop["rect"]
	var fab: int = int(_prop.get("face_fab", House.base_face(_prop)))&3
	var giro: int =(int(_prop.get("face", fab)) - fab)&3
	_frente = Vector2(0.0, -1.0).rotated(- PI * 0.5 * giro).round()
	var fondo: float = absf(_frente.x) * r.size.x + absf(_frente.y) * r.size.y
	_sitio = r.get_center() + _frente * fondo * BANQUETA_FONDOS
	var manos: Vector2 = r.get_center() + _frente *(fondo * TECLAS_FONDOS + MANOS_AIRE)
	var medio_px: float = 46.0
	if jug.sprite_frames.has_animation(LAMINA):
		medio_px = jug.sprite_frames.get_frame_texture(LAMINA, 0).get_height() * 0.5
	jug.position = Vector3(manos.x, TECLAS_M +(DEDOS_PX - medio_px) * jug.pixel_size, manos.y)
	jug.visible = true
	jug.flip_h = false
	if jug.sprite_frames.has_animation(LAMINA):
		jug.play(LAMINA)
		jug.pause()
		jug.frame = 0
	jug.speed_scale = 1.0

	jug.process_mode = Node.PROCESS_MODE_ALWAYS
	_banqueta = _haz_banqueta()
	(_casa.get("viewport") as Node).add_child(_banqueta)




func _prop_piano() -> Dictionary:
	var pl: Dictionary = _casa.call("_plano")
	var donde: Variant = _casa.get("_pos")
	var aqui: Vector2 = donde if donde is Vector2 else Vector2.ZERO
	var mejor: Dictionary = {}
	var mejor_d: float = INF
	for prop in (pl.get("props", []) as Array):
		if String(prop.get("kind", "")) != "piano" or bool(prop.get("guardado", false)):
			continue
		var d: float =(prop["rect"] as Rect2).get_center().distance_to(aqui)
		if d < mejor_d:
			mejor = prop
			mejor_d = d
	return mejor




func _haz_banqueta() -> Node3D:
	var b: Node3D = Node3D.new()
	b.position = Vector3(_sitio.x, 0.0, _sitio.y)

	b.rotation.y = atan2(_frente.x, _frente.y)
	var laca: StandardMaterial3D = StandardMaterial3D.new()
	laca.albedo_color = LACA
	laca.roughness = 0.35
	var cojin: StandardMaterial3D = StandardMaterial3D.new()
	cojin.albedo_color = Color("2b2228")
	cojin.roughness = 0.9
	_caja_3d(b, Vector3(0.0, BANQUETA_ALTO - 0.05, 0.0), Vector3(0.78, 0.06, 0.34), laca)
	_caja_3d(b, Vector3(0.0, BANQUETA_ALTO - 0.005, 0.0), Vector3(0.72, 0.03, 0.3), cojin)
	for x in [-0.34, 0.34]:
		for z in [-0.13, 0.13]:
			_caja_3d(b, Vector3(x,(BANQUETA_ALTO - 0.08) * 0.5, z),
				Vector3(0.04, BANQUETA_ALTO - 0.08, 0.04), laca)
	return b


func _caja_3d(padre: Node3D, at: Vector3, tam: Vector3, mat: Material) -> void:
	var m: MeshInstance3D = MeshInstance3D.new()
	var bm: BoxMesh = BoxMesh.new()
	bm.size = tam
	bm.material = mat
	m.mesh = bm
	m.position = at
	padre.add_child(m)







func _encuadra() -> void:
	if _casa == null or not is_instance_valid(_casa):
		return
	var cam: Camera3D = _casa.get("cam")
	if cam == null or size.y <= 0.0:
		return
	var arriba: float = 0.0
	if _arriba != null:
		arriba = _arriba.get_combined_minimum_size().y
	var libre: float = clampf((_caja.position.y - arriba) / size.y, 0.25, 1.0)
	var c: Vector2 =(_prop["rect"] as Rect2).get_center()
	var centro: Vector2 = c.lerp(_sitio, 0.42)
	var sujeto: Vector3 = Vector3(centro.x, 0.7, centro.y)
	cam.fov = CAM_FOV
	var tan_medio: float = tan(deg_to_rad(CAM_FOV) * 0.5)
	var lejos: float = clampf(ESCENA_M /(2.0 * tan_medio * LLENA * libre), 4.5, 13.0)
	var atras: Vector3 = Vector3(- _frente.x, 0.0, - _frente.y)
	var plano: Dictionary = _casa.call("_plano")
	var picado: float = PICADO
	while picado < PICADO_MAX and not _rayo_libre(plano, sujeto, atras, deg_to_rad(picado), lejos):
		picado += 4.0
	var a: float = deg_to_rad(picado)
	var ojo: Vector3 = sujeto + atras * lejos * cos(a) + Vector3.UP * lejos * sin(a)
	var tr: Transform3D = Transform3D(Basis(), ojo).looking_at(sujeto, Vector3.UP)

	var y_libre: float =(arriba + _caja.position.y) * 0.5 / size.y
	var baja: float = atan((1.0 - 2.0 * y_libre) * tan_medio)
	tr.basis = Basis(tr.basis.x, - baja) * tr.basis
	cam.global_transform = tr






func _rayo_libre(plano: Dictionary, sujeto: Vector3, atras: Vector3, a: float, lejos: float) -> bool:
	var aqui: Vector2 = Vector2(sujeto.x, sujeto.z)
	var sala: Rect2 = Rect2()
	for room in plano.get("rooms", []):
		if (room["rect"] as Rect2).has_point(aqui):
			sala =(room["rect"] as Rect2).grow(-0.05)
			break
	var s: float = 0.4
	while s < lejos:
		var p: Vector3 = sujeto + atras * s * cos(a) + Vector3.UP * s * sin(a)
		if p.y >= MURO_ALTO:
			return true
		var q: Vector2 = Vector2(p.x, p.z)
		var dentro: bool = sala.has_point(q) if sala.has_area() else House.plan_in_floor(plano, q)
		if not dentro or House._en_tabique(plano, q):
			return false
		s += 0.15
	return true


func _hud(on: bool) -> void:
	for campo: String in HUD_CASA:
		var n: Variant = _casa.get(campo)
		if n is Control and is_instance_valid(n):
			_hud_antes[campo] =(n as Control).visible
			(n as Control).visible = on




func _levanta() -> void:
	if _casa == null:
		return
	var casa: Node = _casa
	_casa = null
	if _banqueta != null and is_instance_valid(_banqueta):
		_banqueta.queue_free()
	_banqueta = null
	if not is_instance_valid(casa):
		return
	var cam: Camera3D = casa.get("cam")
	if cam != null and is_instance_valid(cam):
		cam.global_transform = _cam_tr
		cam.fov = _cam_fov
	var jug: AnimatedSprite3D = casa.get("player")
	if jug != null and is_instance_valid(jug):
		jug.position = _jug_pos
		jug.speed_scale = 1.0
		jug.visible = _jug_visible
		jug.process_mode = _jug_proc as Node.ProcessMode
		casa.call("walk_play", jug, Vector3.ZERO)
	for campo: String in _hud_antes:
		var n: Variant = casa.get(campo)
		if n is Control and is_instance_valid(n):
			(n as Control).visible = bool(_hud_antes[campo])





func _mueve_manos(delta: float) -> void:
	var jug: AnimatedSprite3D = _jugador()
	if jug == null:
		return
	if _toca_t <= 0.0:
		if jug.frame != 0:
			jug.frame = 0
		return
	_toca_t -= delta
	_toca_reloj += delta
	if _toca_reloj >= 1.0 / TOCA_FPS:
		_toca_reloj -= 1.0 / TOCA_FPS
		_adelanta_mano()



func _adelanta_mano() -> void:
	var jug: AnimatedSprite3D = _jugador()
	if jug == null:
		return
	var n: int = jug.sprite_frames.get_frame_count(LAMINA)
	if n > 1:
		jug.frame = 1 +(maxi(jug.frame, 0) %(n - 1))



func _jugador() -> AnimatedSprite3D:
	if _casa == null or not is_instance_valid(_casa):
		return null
	var jug: AnimatedSprite3D = _casa.get("player") as AnimatedSprite3D
	if jug == null or jug.animation != LAMINA:
		return null
	return jug




static func _carga_muestras() -> void:
	for m in range(MIDI_MIN, MIDI_MAX + 1, PASO_MUESTRA):
		if not _muestras.has(m) and ResourceLoader.exists(MUESTRA_PATH % m):
			_muestras[m] = load(MUESTRA_PATH % m)



static func muestra_de(midi: int) -> int:
	var k: int = roundi(float(midi - MIDI_MIN) / PASO_MUESTRA)
	return clampi(MIDI_MIN + k * PASO_MUESTRA, MIDI_MIN, MIDI_MAX)



func pulsa(midi: int, fuerza: float = 1.0) -> void:
	if midi < MIDI_MIN or midi > MIDI_MAX:
		return
	_pulsadas[midi] = int(_pulsadas.get(midi, 0)) + 1
	_suena(midi, fuerza)
	_lanza_nota(midi)
	_sucio = true
	_tocadas += 1

	_toca_t = TOCA_RESPIRO
	_toca_reloj = 0.0
	_adelanta_mano()
	if _tocadas == 1 and _pista != null:
		_pista.text = ""
	_oye(midi)




static func melodia_de(oido: Array) -> int:
	for i in MELODIAS_OCARINA.size():
		var ns: Array = MELODIAS_OCARINA[i]
		if oido.size() < ns.size():
			continue
		var s: int = oido.size() - ns.size()
		var igual: bool = true
		for k in ns.size():
			if posmod(int(oido[s + k]) - int(oido[s]), 12) != posmod(int(ns[k]) - int(ns[0]), 12):
				igual = false
				break
		if igual:
			return i
	return -1



func _oye(midi: int) -> void:
	_oido.append(midi)
	if _oido.size() > OIDO:
		_oido.pop_front()
	if melodia_de(_oido) >= 0:
		_oido.clear()
		gana_ocarina()







func gana_ocarina() -> bool:
	if _ocarina_avisada or Settings.celeb_desbloqueado(FESTEJO_OCARINA):
		return false
	_ocarina_avisada = true
	Settings.desbloquea_celeb(FESTEJO_OCARINA)
	for m in _pulsadas.keys():
		_apaga(int(m), APAGADOR_TAU)
	_pulsadas.clear()
	_dedos.clear()
	_teclas_fisicas.clear()
	_pad_midi = -1
	var c: Dictionary = Celebs.by_id(FESTEJO_OCARINA)
	_aviso = AVISO.new()
	add_child(_aviso)
	_aviso.call("setup", [{"id": FESTEJO_OCARINA, "name": String(c.get("name", "")),
		"desc": OCARINA_AVISO, "rare": int(c.get("rare", Celebs.RARO_LEGENDARIO)),
		"unlocked": true, "festejo": FESTEJO_OCARINA, "secret": false}])
	_sucio = true
	return true



func _con_aviso() -> bool:
	return is_instance_valid(_aviso)



func suelta(midi: int) -> void:
	var c: int = int(_pulsadas.get(midi, 0)) - 1
	if c > 0:
		_pulsadas[midi] = c
		return
	_pulsadas.erase(midi)
	_apaga(midi, APAGADOR_TAU)
	_sucio = true


func _suena(midi: int, fuerza: float) -> void:
	var base: int = muestra_de(midi)
	var s: AudioStream = _muestras.get(base)
	if s == null:
		return
	_apaga(midi, REGOLPE_TAU)
	var i: int = _voz_libre()
	var v: AudioStreamPlayer = _voces[i]
	v.stop()
	v.stream = s
	v.pitch_scale = pow(2.0, float(midi - base) / 12.0)
	var gain: float = VOL_DB + linear_to_db(clampf(fuerza, 0.05, 1.0))
	_estado[i] = {"midi": midi, "amp": 1.0, "tau": 0.0, "gain": gain,
		"inicio": Time.get_ticks_msec()}
	v.volume_db = gain
	v.play()




func _voz_libre() -> int:
	var vieja: int = 0
	for i in VOCES:
		if not _voces[i].playing:
			return i
		if int(_estado[i]["inicio"]) < int(_estado[vieja]["inicio"]):
			vieja = i
	return vieja



func _apaga(midi: int, tau: float) -> void:
	for i in VOCES:
		var e: Dictionary = _estado[i]
		if int(e["midi"]) == midi and _voces[i].playing and float(e["tau"]) == 0.0:
			e["tau"] = tau



func voces_sonando() -> int:
	var n: int = 0
	for v in _voces:
		if v.playing:
			n += 1
	return n


func _cambia_octava(dir: int) -> void:
	var lista: Array[int] = _octavas()
	var i: int = clampi(lista.find(_octava) + dir, 0, lista.size() - 1)
	if lista[i] == _octava:
		return
	var antes: int = _octava
	_octava = lista[i]
	_cursor += 12 *(_octava - antes)
	_rehace_teclas()
	_construye_controles()
	_sucio = true




func _input(ev: InputEvent) -> void:

	if _cerrando or _con_aviso():
		return
	if ev is InputEventScreenTouch:
		var t: InputEventScreenTouch = ev
		if t.pressed:
			var m: int = tecla_en(t.position)
			if m >= 0:
				_dedos[t.index] = m
				pulsa(m, _fuerza(t.position, m))
				get_viewport().set_input_as_handled()
		elif _dedos.has(t.index):
			var viejo: int = int(_dedos[t.index])
			_dedos.erase(t.index)
			if viejo >= 0:
				suelta(viejo)
			get_viewport().set_input_as_handled()
	elif ev is InputEventScreenDrag and _dedos.has((ev as InputEventScreenDrag).index):


		var d: InputEventScreenDrag = ev
		var m: int = tecla_en(d.position)
		var viejo: int = int(_dedos[d.index])
		if m != viejo:
			if viejo >= 0:
				suelta(viejo)
			_dedos[d.index] = m
			if m >= 0:
				pulsa(m, _fuerza(d.position, m))
		get_viewport().set_input_as_handled()
	elif ev is InputEventKey and not (ev as InputEventKey).echo:
		_tecla_ordenador(ev as InputEventKey)


func _tecla_ordenador(k: InputEventKey) -> void:
	var fisica: Key = k.physical_keycode
	if TECLAS.has(fisica):
		if k.pressed:
			var m: int = _do_ventana() + int(TECLAS[fisica])
			if m <= MIDI_MAX:
				_teclas_fisicas[fisica] = m
				pulsa(m, 0.9)
		elif _teclas_fisicas.has(fisica):
			suelta(int(_teclas_fisicas[fisica]))
			_teclas_fisicas.erase(fisica)
	elif k.pressed and fisica == KEY_Z:
		_cambia_octava(-1)
	elif k.pressed and fisica == KEY_X:
		_cambia_octava(1)
	elif k.pressed and fisica == KEY_ESCAPE:
		_cerrar()
	else:
		return
	get_viewport().set_input_as_handled()





func _sondea_mando() -> void:
	if Input.is_action_just_pressed("ui_left"):
		_mueve_cursor(-1)
	elif Input.is_action_just_pressed("ui_right"):
		_mueve_cursor(1)
	if Input.is_action_just_pressed("ui_up") or Input.is_action_just_pressed("fl_objetivo"):
		_cambia_octava(1)
	elif Input.is_action_just_pressed("ui_down") or Input.is_action_just_pressed("fl_mantener"):
		_cambia_octava(-1)
	if Input.is_action_just_pressed("fl_avanza") and _pad_midi < 0:
		_pad_midi = _cursor
		pulsa(_cursor, 0.9)
	elif not Input.is_action_pressed("fl_avanza") and _pad_midi >= 0:
		suelta(_pad_midi)
		_pad_midi = -1


func _mueve_cursor(dir: int) -> void:
	_cursor = clampi(_cursor + dir, _primera(), _ultima())
	_sucio = true


func _process(delta: float) -> void:
	if _cerrando:
		return
	if Entrada.hay_mando() and not _con_aviso():
		_sondea_mando()
	_mueve_manos(delta)

	for i in VOCES:
		var e: Dictionary = _estado[i]
		var tau: float = float(e["tau"])
		if tau <= 0.0 or not _voces[i].playing:
			continue
		var amp: float = float(e["amp"]) * exp(- delta / tau)
		if amp < 0.003:
			_voces[i].stop()
			e["midi"] = -1
			continue
		e["amp"] = amp
		_voces[i].volume_db = float(e["gain"]) + linear_to_db(amp)
	if not _notas.is_empty():
		for i in range(_notas.size() - 1, -1, -1):
			var n: Dictionary = _notas[i]
			n["vida"] = float(n["vida"]) - delta
			n["pos"] =(n["pos"] as Vector2) +(n["vel"] as Vector2) * delta
			if float(n["vida"]) <= 0.0:
				_notas.remove_at(i)
		_sucio = true
	if _sucio:
		_sucio = false
		_repinta()




func _lanza_nota(midi: int) -> void:
	if _notas.size() >= NOTAS_MAX:
		_notas.pop_front()
	var x: float = _teclado.get_center().x
	for r: Dictionary in _rects_negras + _rects_blancas:
		if int(r["midi"]) == midi:
			x =(r["rect"] as Rect2).get_center().x
			break
	_notas.append({"pos": Vector2(x, _caja.position.y - 10.0),
		"vel": Vector2(randf_range(-30.0, 30.0), randf_range(-260.0, -190.0)),
		"vida": 1.6, "col": Color.from_hsv(float(posmod(midi, 12)) / 12.0, 0.42, 1.0)})




func _draw() -> void:



	var desde: float = _caja.position.y if _casa != null else 0.0
	draw_rect(Rect2(0.0, desde, size.x, size.y - desde), FONDO)




func _s(v: float) -> float:
	return roundf(v / _px) * _px



func _pinta(ci: CanvasItem) -> void:
	if _teclado.size.x <= 0.0:
		return
	var p: float = _px


	var franja: float = _s(size.y * 0.035)
	for i in 4:
		ci.draw_rect(Rect2(0, franja * i, size.x, franja), Color(FONDO, 0.62 - 0.15 * i))

	ci.draw_rect(Rect2(0, _caja.position.y - 2.0 * p, size.x, 2.0 * p), Color(FONDO, 0.45))

	ci.draw_rect(_caja, LACA)
	var tapa: Rect2 = Rect2(_caja.position.x, _caja.position.y, _caja.size.x, _s(52.0))
	ci.draw_rect(tapa, LACA_BRILLO)
	ci.draw_rect(Rect2(tapa.position, Vector2(tapa.size.x, p)), LACA_BRILLO.lightened(0.18))
	ci.draw_rect(Rect2(tapa.position.x + 2.0 * p, tapa.position.y + 3.0 * p,
		tapa.size.x - 4.0 * p, p), FILETE)
	ci.draw_rect(Rect2(_teclado.position.x, _teclado.position.y - p, _teclado.size.x, p), FIELTRO)
	for b: Dictionary in _rects_blancas:
		_dibuja_blanca(ci, int(b["midi"]), b["rect"] as Rect2)
	for n: Dictionary in _rects_negras:
		_dibuja_negra(ci, int(n["midi"]), n["rect"] as Rect2)
	if Entrada.hay_mando():
		_dibuja_cursor(ci)
	for n: Dictionary in _notas:
		_dibuja_nota(ci, n)




func _dibuja_blanca(ci: CanvasItem, midi: int, r: Rect2) -> void:
	var p: float = _px
	var abajo: bool = _pulsadas.has(midi)
	var x0: float = _s(r.position.x - 2.0)
	var t: Rect2 = Rect2(x0, r.position.y, _s(r.end.x + 2.0) - p - x0, r.size.y)
	ci.draw_rect(t, MARFIL_HUNDIDO if abajo else MARFIL)


	var labio: float = p *(1.0 if abajo else 3.0)
	ci.draw_rect(Rect2(t.position.x, t.end.y - labio, t.size.x, labio), MARFIL_LABIO)
	ci.draw_rect(Rect2(t.end.x - p, t.position.y, p, t.size.y - labio), MARFIL_LABIO)

	ci.draw_rect(Rect2(t.position.x, t.position.y, t.size.x, p *(3.0 if abajo else 1.0)),
		Color(0, 0, 0, 0.22))
	if abajo:
		var c: Color = Color.from_hsv(float(posmod(midi, 12)) / 12.0, 0.42, 1.0, 0.35)
		ci.draw_rect(Rect2(t.position.x, t.end.y - labio - 6.0 * p, t.size.x, 6.0 * p), c)


	if posmod(midi, 12) == 0:
		var lado: float = p *(2.0 if midi == 60 else 1.0)
		ci.draw_rect(Rect2(_s(t.get_center().x - lado * 0.5), t.end.y - labio - 4.0 * p - lado,
			lado, lado), ESCUDO_DO)


func _dibuja_negra(ci: CanvasItem, midi: int, r: Rect2) -> void:
	var p: float = _px
	var abajo: bool = _pulsadas.has(midi)
	var t: Rect2 = Rect2(_s(r.position.x), r.position.y, _s(r.end.x) - _s(r.position.x),
		_s(r.end.y) - r.position.y)

	if not abajo:
		ci.draw_rect(Rect2(t.position.x, t.end.y, t.size.x, p), Color(0, 0, 0, 0.25))
	ci.draw_rect(t, EBANO_HUNDIDO if abajo else EBANO)
	var cara: float = p *(1.0 if abajo else 3.0)
	ci.draw_rect(Rect2(t.position.x + p, t.end.y - cara - p, t.size.x - 2.0 * p, cara), EBANO_CARA)

	ci.draw_rect(Rect2(t.position.x + p, t.position.y, p, t.size.y - cara - 2.0 * p),
		Color(EBANO_CARA, 0.7))
	if abajo:
		var c: Color = Color.from_hsv(float(posmod(midi, 12)) / 12.0, 0.42, 1.0, 0.45)
		ci.draw_rect(Rect2(t.position.x + p, t.end.y - cara - 5.0 * p, t.size.x - 2.0 * p, 4.0 * p), c)



func _dibuja_cursor(ci: CanvasItem) -> void:
	for r: Dictionary in _rects_negras + _rects_blancas:
		if int(r["midi"]) == _cursor:
			var rr: Rect2 = r["rect"] as Rect2
			ci.draw_rect(rr.grow(- _px), CareerTheme.NAV_CASA, false, _px)
			return


func _dibuja_nota(ci: CanvasItem, n: Dictionary) -> void:
	var q: Vector2 = n["pos"] as Vector2
	var c: Color = n["col"] as Color
	c.a = clampf(float(n["vida"]) / 0.8, 0.0, 1.0)

	ci.draw_set_transform(q, -0.35, Vector2(1.3, 1.0))
	ci.draw_circle(Vector2.ZERO, 12.0, c)
	ci.draw_set_transform(Vector2.ZERO, 0.0, Vector2.ONE)
	ci.draw_rect(Rect2(q.x + 10.0, q.y - 48.0, _px, 48.0), c)
	ci.draw_line(Vector2(q.x + 10.0 + _px * 0.5, q.y - 48.0), Vector2(q.x + 28.0, q.y - 28.0), c, _px)




func _cerrar() -> void:
	if _cerrando:
		return
	_cerrando = true
	_sube_musica()
	_levanta()
	get_tree().paused = false
	queue_free()


func _sube_musica() -> void:
	if not _musica_baja:
		return
	_musica_baja = false
	Music.duck(-30.0, 0.0, 0.9)





func _exit_tree() -> void:
	_sube_musica()
	_levanta()
	var arbol: SceneTree = get_tree()
	if arbol != null:
		arbol.paused = false
