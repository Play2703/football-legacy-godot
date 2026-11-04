extends Ceremony





















const FirmaLienzo := preload("res://ui/ceremonies/firma_lienzo.gd")
const RelVivo := preload("res://ui/ceremonies/rel_vivo.gd")




const KEYS: Array = [
	{"t": 0.0, "dist": 5.0, "h": 1.76, "yaw": 182.0, "aim_y": 1.3, "fov": 50.0,
		"focus_x": -1.9, "focus_z": 2.6},
	{"t": 2.4, "dist": 2.6, "h": 1.5, "yaw": 180.0, "aim_y": 1.44, "fov": 46.0,
		"focus_x": LockerRoom.BOARD_X, "focus_z": LockerRoom.BOARD_Z + 0.05},
]
const PLANO_RESPUESTA: Dictionary = {"dist": 4.7, "h": 1.55, "yaw": 184.0, "aim_y": 1.3,
	"fov": 46.0, "focus_x": -2.2, "focus_z": LockerRoom.BOARD_Z + 0.05}
const DRIFT: float = 0.35
const T_CHYRON: float = 1.2

const T_LIENZO: float = 2.9


const COACH_X: float = -1.45
const COACH_Z: float = 3.1
const COACH_H: float = 1.8




const FACE_W: int = 512
const FACE_H: int = 360
const FACE_Z: float = LockerRoom.BOARD_Z + 0.045
const FACE_M: float = 0.94 / float(FACE_W)

const ZONA: Rect2i = Rect2i(14, 14, 484, 332)
const LIENZO_PX: float = 900.0
const LIENZO_ALTO: float = 900.0




const TELA: Color = Color(0.93, 0.94, 0.92)
const CAMPO: Color = Color(0.62, 0.69, 0.78)
const TUYOS: Color = Color(0.2, 0.25, 0.36)
const MISTER: Color = Color(0.16, 0.32, 0.66)



const TU: Vector2 = Vector2(256, 256)
const COMPAS: Array = [Vector2(104, 214), Vector2(408, 210), Vector2(176, 304),
	Vector2(338, 304)]
const RIVALES: Array = [Vector2(196, 144), Vector2(316, 140), Vector2(256, 104),
	Vector2(140, 112)]


const APRUEBA_SI: int = 65
const APRUEBA_NO: int = 40


const PIENSA: float = 1.6
const BORRA: float = 1.4
const DIBUJA: float = 1.4
const FICHA_TRAS: float = 1.3












const MANO_LAMINA: String = "res://assets/sprites/anim/coach_senala_south_"
const MANO_CUADROS: Array[int] = [1, 2, 3, 2]
const MANO_FPS: float = 8.0
const ANDA: float = 1.0



const MANO_PX: float = 28.0


const COACH_Z_PIZARRA: float = LockerRoom.BOARD_Z + 0.17


const FROTA_M: float = 0.035
const FROTA_HZ: float = 4.5

var room: LockerRoom
var _cara: Image = null
var _base: Image = null
var _tex: ImageTexture = null
var _mat: StandardMaterial3D = null
var _lienzo: FirmaLienzo = null
var _lienzo_visto: bool = false
var _aprueba: bool = false

var _fase: String = "espera"
var _fase_t: float = 0.0

var _caja_tuya: Rect2 = Rect2()
var _trazos_mister: Array[PackedVector2Array] = []
var _pintado: float = 0.0

var _dt: AnimatedSprite3D = null
var _dt_casa: Vector3 = Vector3.ZERO
var _dt_mano: bool = false
var _punta: Vector2 = Vector2.ZERO
var _hablas: float = 0.0
var _terminado: bool = false
var _ms_f: int = 0



static func aprueba(tecnico: int, n: int) -> bool:
	if tecnico >= APRUEBA_SI:
		return true
	if tecnico < APRUEBA_NO:
		return false
	return absi(hash("pizarra|%d" % n)) % 2 == 0


func _build() -> void:
	focus = Vector3(-2.0, 0.0, 2.9)
	room = LockerRoom.new()
	room.host_viewport = viewport
	room.force_club = true
	room.show_captain = false

	room.face_x = LockerRoom.BOARD_X
	var yaw: float = deg_to_rad(float(KEYS[0]["yaw"]))
	room.face_z = LockerRoom.BOARD_Z
	room.face_derecha = Vector3(- cos(yaw), 0.0, - sin(yaw))
	room.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(room)


	if not bool(room._style.get("board", false)):
		room._make_board()
	make_camera(KEYS, 40.0)
	orbit_speed = DRIFT
	_dt = coach_sprite(Vector3(COACH_X, 0.0, COACH_Z), COACH_H, Career.coach_look(),
		Career.coach_name(), false, Career.coach_nivel())
	_monta_mano()
	_aprueba = aprueba(int(data.get("tecnico", 50)), int(data.get("n", 1)))
	_base = cara_pizarra(int(data.get("number", 0)))
	_cara = _base.duplicate()
	_tex = ImageTexture.create_from_image(_cara)
	_cuelga_cara()

	make_chyron(I18n.t("LA PIZARRA DEL MÍSTER"), Career.coach_name().to_upper(), team(),
		T_CHYRON)
	make_card(40.0)
	if _card_tw != null and _card_tw.is_valid():
		_card_tw.kill()
	card_at = 9999.0
	card_title(I18n.t("LE GUSTÓ") if _aprueba else I18n.t("A SU MANERA"), 40)
	card_note(I18n.t("El míster deja tu jugada en la pizarra.") if _aprueba
		else I18n.t("El míster borra tus flechas y dibuja las suyas."))
	card_cta(I18n.t("SEGUIR"))




static func cara_pizarra(dorsal: int) -> Image:
	var img: Image = Image.create(FACE_W, FACE_H, false, Image.FORMAT_RGBA8)
	img.fill(TELA)

	_marco(img, Rect2i(22, 22, FACE_W - 44, FACE_H - 44), CAMPO, 2)
	_marco(img, Rect2i(150, 22, 212, 74), CAMPO, 2)
	_marco(img, Rect2i(206, 22, 100, 28), CAMPO, 2)
	_arco(img, Vector2(256, 64), 46.0, 0.25 * PI, 0.75 * PI, CAMPO, 2)
	_arco(img, Vector2(256, FACE_H - 22), 48.0, PI, TAU, CAMPO, 2)
	for p in COMPAS:
		_anillo(img, p, 12.0, TUYOS, 4)
	_anillo(img, TU, 15.0, TUYOS, 4)
	var txt: String = str(maxi(dorsal, 0))
	var w: int = PixelText.text_width(txt, 3)
	PixelText.draw_text(img, int(TU.x) - w / 2, int(TU.y) - 7, txt, TUYOS, 3)
	for p in RIVALES:
		_cruz(img, p, 10.0, CareerTheme.DANGER, 4)
	return img


func _cuelga_cara() -> void:
	var quad: MeshInstance3D = MeshInstance3D.new()
	var qm: QuadMesh = QuadMesh.new()
	qm.size = Vector2(float(FACE_W) * FACE_M, float(FACE_H) * FACE_M)
	quad.mesh = qm
	_mat = StandardMaterial3D.new()
	_mat.albedo_texture = _tex


	_mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	_mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	quad.material_override = _mat
	quad.position = Vector3(LockerRoom.BOARD_X, 1.44, FACE_Z)
	viewport.add_child(quad)




func _abre_lienzo() -> void:
	if _lienzo_visto:
		return
	_lienzo_visto = true



	if _base == null or _mat == null:
		push_warning("pizarra_tecnico: sin pizarra que dibujar; sigue sin dibujo")
		_fin()
		return
	_fase = "dibuja"
	if chyron != null:
		chyron.visible = false
	_lienzo = FirmaLienzo.new()
	add_child(_lienzo)
	_lienzo.rotulo_borrar = "BORRAR"
	if not _lienzo.monta(_base, Rect2i(0, 0, FACE_W, FACE_H), ZONA,
			I18n.t("LA PIZARRA DEL MÍSTER"), I18n.t("Dibuja tu jugada"), "", LIENZO_PX,
			LIENZO_ALTO):
		_lienzo.queue_free()
		_lienzo = null
		if chyron != null:
			chyron.visible = true
		_fin()
		return

	_mat.albedo_texture = _lienzo.tex
	_lienzo.firmada.connect(_on_dibujada)
	CareerUi.normalize_caps(_lienzo)
	if bool(data.get("pizarra_auto", false)):
		_lienzo.trazos_auto = jugada_auto()
		_lienzo.firma_sola(false)




static func jugada_auto() -> Array[PackedVector2Array]:
	var out: Array[PackedVector2Array] = []
	var a: PackedVector2Array = PackedVector2Array()
	var b: Vector2 = COMPAS[0] + Vector2(16, -14)
	for i in 13:
		var k: float = float(i) / 12.0
		a.append(TU.lerp(b, k) + Vector2(0, -28.0 * sin(PI * k)))
	out.append(a)
	out.append_array(_punta_trazos(a[a.size() - 2], a[a.size() - 1], 16.0))
	var c: PackedVector2Array = PackedVector2Array()
	var d: Vector2 = Vector2(232, 52)
	for i in 13:
		var k: float = float(i) / 12.0
		c.append(b.lerp(d, k) + Vector2(24.0 * sin(PI * k), 0))
	out.append(c)
	out.append_array(_punta_trazos(c[c.size() - 2], c[c.size() - 1], 16.0))
	return out



static func _punta_trazos(antes: Vector2, tip: Vector2, largo: float) -> Array[PackedVector2Array]:
	var dir: Vector2 =(tip - antes).normalized()
	var out: Array[PackedVector2Array] = []
	for giro in [2.6, -2.6]:
		out.append(PackedVector2Array([tip, tip + dir.rotated(giro) * largo]))
	return out


func _on_dibujada(_premio: bool) -> void:
	if _lienzo == null:
		return
	_cara = _lienzo.img.duplicate()
	_caja_tuya = _caja_de(_lienzo.trazos if not _lienzo.trazos.is_empty()
		else _lienzo.trazos_auto)
	_tex = ImageTexture.create_from_image(_cara)
	_mat.albedo_texture = _tex
	_lienzo.queue_free()
	_lienzo = null
	_fase = "piensa"
	_fase_t = t
	cam_keys.assign([(KEYS[1] as Dictionary).merged({"t": t}, true),
		PLANO_RESPUESTA.merged({"t": t + 0.9})])


static func _caja_de(trazos: Array[PackedVector2Array]) -> Rect2:
	var caja: Rect2 = Rect2()
	var hay: bool = false
	for tr in trazos:
		for p in tr:
			if not hay:
				caja = Rect2(p, Vector2.ZERO)
				hay = true
			else:
				caja = caja.expand(p)
	return caja if hay else Rect2(TU - Vector2(60, 60), Vector2(120, 120))




func _tick_respuesta() -> void:
	var dt: float = t - _fase_t
	match _fase:
		"piensa":
			if dt >= PIENSA:
				_fase_t = t
				if _aprueba:
					_fase = "rodea"
					_trazos_mister = [_ovalo(_caja_tuya.grow(18.0))]
					if _coach_cara != null and is_instance_valid(_coach_cara):
						_coach_cara.anima("alegria")
				else:
					_fase = "borra"



					_pintado = float(FACE_W)
		"borra":



			var x1: int = int(float(FACE_W) *(1.0 - clampf(dt / BORRA, 0.0, 1.0)))
			var x0: int = int(_pintado)
			if x1 < x0:
				_cara.blit_rect(_base, Rect2i(x1, 0, x0 - x1, FACE_H), Vector2i(x1, 0))
				_tex.update(_cara)
				_pintado = float(x1)
			if dt >= BORRA:
				_fase = "suya"
				_fase_t = t
				_pintado = 0.0
				_trazos_mister = jugada_mister()
		"suya", "rodea":
			_traza_mister(clampf(dt /(DIBUJA if _fase == "suya" else 0.8), 0.0, 1.0))
			if dt >=(DIBUJA if _fase == "suya" else 0.8):
				_fin()
	_tick_tecnico()
	if _fase in ["piensa", "borra", "suya", "rodea"]:
		_hablas -= get_process_delta_time()
		if _hablas <= 0.0:
			coach_talk()
			_hablas = rng.randf_range(0.18, 0.32)





func _monta_mano() -> void:
	if _dt == null or _dt.sprite_frames == null:
		return
	_dt_casa = _dt.position
	var hechos: Dictionary = {}
	var texs: Array[Texture2D] = []
	for i in MANO_CUADROS:
		var ruta: String = "%s%02d.png" % [MANO_LAMINA, i]
		if not ResourceLoader.exists(ruta):
			return
		if not hechos.has(i):
			hechos[i] = KitRecolor.apply(load(ruta), Career.coach_look())
		texs.append(hechos[i])
	_dt.sprite_frames.add_animation("mano")
	_dt.sprite_frames.set_animation_loop("mano", true)
	_dt.sprite_frames.set_animation_speed("mano", MANO_FPS)
	for tx in texs:
		_dt.sprite_frames.add_frame("mano", tx)
	_dt_mano = true



func _x_para_mano(tx: float) -> float:
	return LockerRoom.BOARD_X - float(FACE_W) * FACE_M * 0.5 + tx * FACE_M \
			+ MANO_PX * _dt.pixel_size




func _primer_toque() -> float:
	if _aprueba:
		return _caja_tuya.get_center().x
	return float(FACE_W) - 6.0


func _tick_tecnico() -> void:
	if not _dt_mano or _dt == null or not is_instance_valid(_dt):
		return
	var dt: float = t - _fase_t
	match _fase:
		"piensa":
			var x: float = _x_para_mano(_primer_toque())
			if dt < ANDA:
				var k: float = smoothstep(0.0, 1.0, dt / ANDA)
				_dt.position.x = lerpf(_dt_casa.x, x, k)
				_dt.position.z = lerpf(_dt_casa.z, COACH_Z_PIZARRA, k)
				var anda: String = coach_walk_anim(x - _dt_casa.x)
				if not anda.is_empty() and _dt.animation != anda:
					_dt.play(anda)
				_dt.flip_h = x < _dt_casa.x
			elif _dt.animation != "mano":
				_dt.position.x = x
				_dt.position.z = COACH_Z_PIZARRA
				_dt.flip_h = true
				_dt.play("mano")
		"borra":
			_dt.position.x = _x_para_mano(_pintado) + FROTA_M * sin(TAU * FROTA_HZ * dt)
		"suya", "rodea":


			if _punta != Vector2.ZERO:
				var meta: float = _x_para_mano(_punta.x)
				_dt.position.x = lerpf(_dt.position.x, meta,
					1.0 - exp(-12.0 * get_process_delta_time()))




static func jugada_mister() -> Array[PackedVector2Array]:
	var out: Array[PackedVector2Array] = []
	var a: PackedVector2Array = PackedVector2Array()
	var de: Vector2 = COMPAS[1] + Vector2(-12, -14)
	var a_: Vector2 = Vector2(352, 74)
	for i in 11:
		a.append(de.lerp(a_, float(i) / 10.0))
	out.append(a)
	out.append_array(_punta_trazos(a[a.size() - 2], a[a.size() - 1], 18.0))
	var b: PackedVector2Array = PackedVector2Array()
	var d: Vector2 = Vector2(286, 58)
	for i in 11:
		var k: float = float(i) / 10.0
		b.append((TU + Vector2(10, -18)).lerp(d, k) + Vector2(-30.0 * sin(PI * k), 0))
	out.append(b)
	out.append_array(_punta_trazos(b[b.size() - 2], b[b.size() - 1], 18.0))
	return out




static func _ovalo(caja: Rect2) -> PackedVector2Array:
	var pts: PackedVector2Array = PackedVector2Array()
	var c: Vector2 = caja.get_center()
	var r: Vector2 = caja.size * 0.5
	for i in 41:
		var a: float = -0.5 * PI + TAU * 1.08 * float(i) / 40.0
		pts.append(c + Vector2(cos(a) * r.x, sin(a) * r.y))
	return pts



func _traza_mister(k: float) -> void:
	var total: float = 0.0
	for tr in _trazos_mister:
		for i in range(1, tr.size()):
			total += tr[i - 1].distance_to(tr[i])
	var hasta: float = total * k
	var ya: float = 0.0
	for tr in _trazos_mister:
		for i in range(1, tr.size()):
			var l: float = tr[i - 1].distance_to(tr[i])
			var s0: float = ya
			ya += l
			if ya <= _pintado or s0 >= hasta:
				continue
			var p0: Vector2 = tr[i - 1].lerp(tr[i], clampf((_pintado - s0) / l, 0.0, 1.0))
			var p1: Vector2 = tr[i - 1].lerp(tr[i], clampf((hasta - s0) / l, 0.0, 1.0))
			_linea(_cara, p0, p1, MISTER, 4)
			_punta = p1
	_pintado = hasta
	_tex.update(_cara)


func _fin() -> void:
	if _terminado:
		return
	_terminado = true
	_fase = "fin"

	if _dt != null and is_instance_valid(_dt) and _dt.sprite_frames.has_animation("idle"):
		_dt.play("idle")
		_dt.flip_h = false
	if _aprueba and (embedded or not standalone) and not replay:
		RelVivo.lanza(self, Career.firma_resuelve("pizarra", true, 0))
	_ms_f = Time.get_ticks_msec()
	card_at = t + FICHA_TRAS
	_card_tw = create_tween()
	_card_tw.tween_interval(FICHA_TRAS)
	_card_tw.tween_callback(_reveal_card)




static func _punto(img: Image, c: Vector2, col: Color, w: int) -> void:
	var r: int = maxi(w / 2, 1)
	img.fill_rect(Rect2i(int(c.x) - r, int(c.y) - r, w, w).intersection(
		Rect2i(Vector2i.ZERO, img.get_size())), col)


static func _linea(img: Image, a: Vector2, b: Vector2, col: Color, w: int) -> void:
	var n: int = maxi(1, int(ceil(a.distance_to(b))))
	for i in n + 1:
		_punto(img, a.lerp(b, float(i) / float(n)), col, w)


static func _marco(img: Image, r: Rect2i, col: Color, w: int) -> void:
	img.fill_rect(Rect2i(r.position.x, r.position.y, r.size.x, w), col)
	img.fill_rect(Rect2i(r.position.x, r.end.y - w, r.size.x, w), col)
	img.fill_rect(Rect2i(r.position.x, r.position.y, w, r.size.y), col)
	img.fill_rect(Rect2i(r.end.x - w, r.position.y, w, r.size.y), col)


static func _arco(img: Image, c: Vector2, r: float, a0: float, a1: float, col: Color,
		w: int) -> void:
	var n: int = int(r * absf(a1 - a0))
	for i in n + 1:
		var a: float = lerpf(a0, a1, float(i) / float(n))
		_punto(img, c + Vector2(cos(a), sin(a)) * r, col, w)


static func _anillo(img: Image, c: Vector2, r: float, col: Color, w: int) -> void:
	_arco(img, c, r, 0.0, TAU, col, w)


static func _cruz(img: Image, c: Vector2, r: float, col: Color, w: int) -> void:
	_linea(img, c + Vector2(- r, - r), c + Vector2(r, r), col, w)
	_linea(img, c + Vector2(- r, r), c + Vector2(r, - r), col, w)




func _tick(delta: float) -> void:
	if _fase == "espera" and t >= T_LIENZO:
		_abre_lienzo()
	if _lienzo != null:
		_lienzo.tick(delta)
	_tick_respuesta()




func _on_skip() -> void:
	if _terminado:
		super._on_skip()
		return
	if _fase == "espera":
		t = T_LIENZO
		cam_keys.assign([KEYS[1]])
		_tick_camera()
		_abre_lienzo()
		return
	if _lienzo != null and _lienzo.trazos_auto.is_empty():
		_lienzo.trazos_auto = jugada_auto()
		_lienzo.firma_sola(false)


func _skipped() -> void:
	pass



func _vigia_ficha() -> void:
	if _leaving or ficha_puesta:
		return
	var desde: float = float(Time.get_ticks_msec() - _ms_f) / 1000.0
	if not _terminado or desde < FICHA_TRAS + VIGIA_MARGEN:
		SceneFade.timer(5.0, true, false, true).timeout.connect(_vigia_ficha)
		return
	super._vigia_ficha()
