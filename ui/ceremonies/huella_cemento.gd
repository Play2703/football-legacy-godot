extends "res://ui/ceremonies/estatua.gd"


























const FirmaLienzo := preload("res://ui/ceremonies/firma_lienzo.gd")

const SLAB: int = 384
const CEMENTO: Color = Color("a9a49a")

const ZONA_MANO: Rect2i = Rect2i(24, 20, 336, 256)
const NOMBRE_Y: int = 290
const FIRMA_CAJA: Rect2 = Rect2(70, 314, 200, 52)
const DORSAL_AT: Vector2i = Vector2i(296, 318)


const MANO: Vector2i = Vector2i(150, 190)
const HUNDE: float = 2.4

const MINIMA: float = 0.1


const LOSA_AT: Vector3 = Vector3(0.0, 0.0, -2.0)
const LOSA_M: float = 1.1
const YO_HUELLA: Vector3 = Vector3(1.05, 0.0, -2.1)

const KEYS_HUELLA: Array = [
	{"t": 0.0, "dist": 9.0, "h": 1.6, "yaw": 180.0, "aim_y": 1.8, "fov": 46.0,
		"focus_x": 0.3, "focus_z": -2.4},
	{"t": 2.2, "dist": 4.2, "h": 2.4, "yaw": 186.0, "aim_y": 0.5, "fov": 44.0,
		"focus_x": 0.4, "focus_z": -2.0},
]

const PLANO_FIN: Dictionary = {"dist": 4.0, "h": 2.5, "yaw": 196.0, "aim_y": 0.55,
	"fov": 42.0, "focus_x": 0.25, "focus_z": -2.0}
const T_APRIETA: float = 3.5
const T_CHYRON: float = 0.8

const GRABA_NOMBRE: float = 0.9
const GRABA_FIRMA: float = 1.2
const FICHA_TRAS: float = 2.2


const PASEO_ANCHO: float = 20.0
const PASEO_FONDO: float = 2.3
const LEYENDAS_X: Array[float] = [-7.0, -5.25, -3.5, -1.75, 1.75, 3.5, 5.25, 7.0]
const BRONCE: Color = Color("8a6a3a")

const CORDON_Z: float = -3.3
const LATON: Color = Color("c8a050")
const TERCIOPELO: Color = Color("8c1c24")
const PUBLICO_Z: Array[float] = [-3.85, -4.5]
const PUBLICO_X: Vector2 = Vector2(-9.5, 9.5)
const PUBLICO_PASO: float = 0.62
const PUBLICO_CARAS: int = 6


const MOVIL_HOJA: String = "res://assets/sprites/anim/afi_celular_south_"
const MOVIL_CADA: int = 3


const MOVIL_PUNTO: Vector2 = Vector2(11.5, 28.5)

const PANCARTA_Z: float = -6.4
const PANCARTA: Vector2 = Vector2(4.4, 1.05)
const PANCARTA_Y: float = 3.25


const RODILLA_HOJA: String = "res://assets/sprites/anim/rodillas_west_"
const RODILLA_CUADROS: Vector2i = Vector2i(2, 5)
const RODILLA_FPS: float = 8.0
const T_RODILLA: float = 2.5

const RODILLA_ARRIMA: float = 0.4

const LEVANTA_TRAS: float = 0.8

var _losa: Image = null
var _limpia: Image = null
var _tex: ImageTexture = null
var _mascara: PackedByteArray = PackedByteArray()
var _capa: Control = null
var _vista: TextureRect = null
var _barra: ProgressBar = null
var _pista: Label = null

var _fase: String = "espera"
var _fase_t: float = 0.0
var _apretando: bool = false
var _mano_c: Vector2 = Vector2.ZERO
var hondo: float = 0.0
var _pintado_hondo: float = -1.0
var _repinta: float = 0.0
var _firma: Array[PackedVector2Array] = []
var _firma_hecha: float = 0.0
var _nombre_hecho: int = 0
var _auto: Dictionary = {}
var _terminado: bool = false
var _ms_f: int = 0
var _aplauden: Array[AnimatedSprite3D] = []
var _de_pie: bool = true


func _build() -> void:
	_plaza()
	focus = Vector3(0.3, 0.0, -2.2)
	make_camera(KEYS_HUELLA, 34.0)
	orbit_speed = DRIFT
	var kit: Dictionary = GameState.kit_variant(team(), 0)
	_monta_paseo()
	_monta_publico(kit)
	_monta_pancarta(kit)


	var look: Dictionary = GameState.team_custom.duplicate()
	look.merge(kit, true)
	make_player(look, "south")
	player.position = Vector3(YO_HUELLA.x, feet_offset(player.pixel_size) - PLAYER_SINK,
		YO_HUELLA.z)
	_monta_rodilla()
	flash_rate = 1.6
	_mascara = mascara_mano()
	_limpia = losa_limpia(int(data.get("club_seed", hash(String(data.get("club", ""))))))
	_losa = _limpia.duplicate()
	_tex = ImageTexture.create_from_image(_losa)
	_monta_losa()
	var firma: Array = data.get("firma", Career.firma_trazo)
	_firma = FirmaLienzo.firma_en_caja(firma if not firma.is_empty() else firma_garabato(),
		FIRMA_CAJA)
	_auto = data.get("huella_auto", {})
	make_chyron(I18n.t("PASEO DE LEYENDAS"), CareerTheme.caps(team_name()), team(), T_CHYRON)
	make_card(40.0)
	if _card_tw != null and _card_tw.is_valid():
		_card_tw.kill()
	card_at = 9999.0
	card_title(I18n.t("TU HUELLA"), 40)
	_nota = card_note("")
	card_cta(I18n.t("SEGUIR"))


var _nota: Label = null




func _monta_losa() -> void:
	var m: MeshInstance3D = MeshInstance3D.new()
	var pm: PlaneMesh = PlaneMesh.new()
	pm.size = Vector2(LOSA_M, LOSA_M)
	m.mesh = pm
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = _tex
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	mat.roughness = 1.0
	m.material_override = mat
	m.position = LOSA_AT + Vector3(0.0, 0.03, 0.0)
	viewport.add_child(m)
	var tabla: float = 0.08
	var largo: float = LOSA_M + 2.0 * tabla
	for lado in [-1.0, 1.0]:
		_caja(LOSA_AT + Vector3(0.0, 0.04, lado *(LOSA_M + tabla) * 0.5),
			Vector3(largo, 0.08, tabla), MADERA)
		_caja(LOSA_AT + Vector3(lado *(LOSA_M + tabla) * 0.5, 0.04, 0.0),
			Vector3(tabla, 0.08, LOSA_M), MADERA)





func _monta_paseo() -> void:
	_caja(LOSA_AT + Vector3(0.0, 0.01, 0.0), Vector3(PASEO_ANCHO, 0.02, PASEO_FONDO), PIEDRA)
	for lado in [-1.0, 1.0]:
		_caja(LOSA_AT + Vector3(0.0, 0.015, lado * PASEO_FONDO * 0.5),
			Vector3(PASEO_ANCHO, 0.03, 0.08), PIEDRA.darkened(0.18))
	var semilla: int = int(data.get("club_seed", hash(String(data.get("club", "")))))
	for i in LEYENDAS_X.size():
		var x: float = LEYENDAS_X[i]
		var img: Image = losa_vieja(semilla + i * 7919, 1958 + i * 7 + absi(semilla + i) % 5,
			[9, 7, 10, 4, 8, 11, 5, 1][i])
		var m: MeshInstance3D = MeshInstance3D.new()
		var pm: PlaneMesh = PlaneMesh.new()
		pm.size = Vector2(LOSA_M, LOSA_M)
		m.mesh = pm
		var mat: StandardMaterial3D = StandardMaterial3D.new()
		mat.albedo_texture = ImageTexture.create_from_image(img)
		mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		mat.roughness = 1.0
		m.material_override = mat
		m.position = Vector3(x, 0.025, LOSA_AT.z)
		viewport.add_child(m)

		var b: float = 0.05
		for lado in [-1.0, 1.0]:
			_caja(Vector3(x, 0.025, LOSA_AT.z + lado *(LOSA_M + b) * 0.5),
				Vector3(LOSA_M + 2.0 * b, 0.03, b), BRONCE)
			_caja(Vector3(x + lado *(LOSA_M + b) * 0.5, 0.025, LOSA_AT.z),
				Vector3(b, 0.03, LOSA_M), BRONCE)




func _monta_publico(kit: Dictionary) -> void:
	var x: float = PUBLICO_X.x
	while x <= PUBLICO_X.y + 0.01:
		var at: Vector3 = Vector3(x, 0.0, CORDON_Z)
		_caja(at + Vector3(0.0, 0.03, 0.0), Vector3(0.22, 0.06, 0.22), LATON.darkened(0.2))
		_caja(at + Vector3(0.0, 0.47, 0.0), Vector3(0.05, 0.9, 0.05), LATON)
		_caja(at + Vector3(0.0, 0.94, 0.0), Vector3(0.1, 0.08, 0.1), LATON)
		if x + 1.2 <= PUBLICO_X.y + 0.01:
			_caja(at + Vector3(0.6, 0.8, 0.0), Vector3(1.15, 0.05, 0.05), TERCIOPELO)
		x += 1.2
	var pool: Array[SpriteFrames] = extras_frames_pool(kit, PUBLICO_CARAS,
		"huella_%s" % String(data.get("club", "")), "south")
	if pool.is_empty():
		return
	for frames in pool:
		_arma_movil(frames)
	var n: int = 0
	for fila in PUBLICO_Z.size():
		var fx: float = PUBLICO_X.x +(PUBLICO_PASO * 0.5 if fila == 1 else 0.0)
		while fx <= PUBLICO_X.y:
			var frames: SpriteFrames = pool[n % pool.size()]
			var spr: AnimatedSprite3D = AnimatedSprite3D.new()
			spr.sprite_frames = frames
			spr.pixel_size = PLAYER_HEIGHT_M / PLAYER_METRICS.x
			spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
			spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
			spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
			spr.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
			var z: float = PUBLICO_Z[fila] + rng.randf_range(-0.12, 0.12)
			var px: float = fx + rng.randf_range(-0.12, 0.12)
			spr.position = Vector3(px, feet_offset(spr.pixel_size) - PLAYER_SINK, z)
			viewport.add_child(spr)
			if n % MOVIL_CADA == 1 and frames.has_animation("movil"):

				spr.play("movil")
				spr.frame = rng.randi_range(0, 2)
				flash_pool.append(spr.position + Vector3(MOVIL_PUNTO.x, MOVIL_PUNTO.y, 0.0)
					* spr.pixel_size + Vector3(0.0, 0.0, 0.1))
			else:
				spr.play("idle")
				spr.speed_scale = rng.randf_range(0.8, 1.3)
				add_gesto(spr, "clap", 4, rng.randf_range(7.0, 9.5),
					frames.get_meta("look_cfg", {}))
				_aplauden.append(spr)
			fx += PUBLICO_PASO
			n += 1




func _arma_movil(frames: SpriteFrames) -> void:
	if frames.has_animation("movil"):
		return
	var cfg: Dictionary = frames.get_meta("look_cfg", {})
	var texs: Array[Texture2D] = []
	for i in range(1, 13):
		var ruta: String = "%s%02d.png" % [MOVIL_HOJA, i]
		if not ResourceLoader.exists(ruta):
			break
		texs.append(KitRecolor.apply(load(ruta), cfg))
	if texs.size() < 2:
		return
	frames.add_animation("movil")
	frames.set_animation_loop("movil", false)
	frames.set_animation_speed("movil", 9.0)
	for tx in texs:
		frames.add_frame("movil", tx)




func _monta_pancarta(kit: Dictionary) -> void:
	var col: Color = Color(kit.get("kit", GameState.FALLBACK_KIT))
	var at: Vector3 = Vector3(0.0, PANCARTA_Y, PANCARTA_Z)
	for lado in [-1.0, 1.0]:
		_caja(Vector3(lado *(PANCARTA.x * 0.5 + 0.08),(PANCARTA_Y + 0.8) * 0.5,
			PANCARTA_Z), Vector3(0.1, PANCARTA_Y + 0.8, 0.1), FAROLA)
	_caja(at, Vector3(PANCARTA.x, PANCARTA.y, 0.06), col)
	_caja(at + Vector3(0.0, - PANCARTA.y * 0.5 + 0.05, 0.035),
		Vector3(PANCARTA.x, 0.1, 0.02), col.darkened(0.35))
	var tinta: Color = CareerTheme.BG_DEEP if col.get_luminance() > 0.6 else CareerTheme.TEXT
	var txt: Label3D = Label3D.new()
	txt.text = "%s\n%s" % [CareerTheme.caps(I18n.t("PASEO DE LEYENDAS")),
		CareerTheme.caps(team_name())]
	txt.font_size = 96

	txt.pixel_size = 0.0034
	txt.modulate = tinta
	txt.outline_size = 0
	txt.position = at + Vector3(0.0, 0.0, 0.04)
	viewport.add_child(txt)



func _monta_rodilla() -> void:
	if player == null or player.sprite_frames == null:
		return
	var cfg: Dictionary = player.sprite_frames.get_meta("look_cfg", {})
	var texs: Array[Texture2D] = []
	for i in range(RODILLA_CUADROS.x, RODILLA_CUADROS.y + 1):
		var ruta: String = "%s%02d.png" % [RODILLA_HOJA, i]
		if not ResourceLoader.exists(ruta):
			return
		texs.append(KitRecolor.apply(load(ruta), cfg))
	player.sprite_frames.add_animation("rodilla")
	player.sprite_frames.set_animation_loop("rodilla", false)
	player.sprite_frames.set_animation_speed("rodilla", RODILLA_FPS)
	for tx in texs:
		player.sprite_frames.add_frame("rodilla", tx)





static func losa_vieja(semilla: int, anio: int, dorsal: int) -> Image:
	var r: RandomNumberGenerator = RandomNumberGenerator.new()
	r.seed = semilla
	var base: Color = CEMENTO.darkened(r.randf_range(0.08, 0.2))
	var img: Image = Image.create(SLAB, SLAB, false, Image.FORMAT_RGBA8)
	img.fill(base)
	for i in 5:
		var c: Vector2 = Vector2(r.randf_range(0, SLAB), r.randf_range(0, SLAB))
		var rad: float = r.randf_range(30.0, 80.0)
		var tono: Color = base.darkened(0.05) if r.randf() < 0.7 else base.lightened(0.04)
		for y in range(maxi(0, int(c.y - rad)), mini(SLAB, int(c.y + rad))):
			for x in range(maxi(0, int(c.x - rad)), mini(SLAB, int(c.x + rad))):
				if Vector2(x, y).distance_to(c) < rad *(0.8 + 0.2 * sin(float(x + y) * 0.1)):
					img.set_pixel(x, y, tono)
	for i in 2400:
		var x: int = r.randi_range(0, SLAB - 1)
		var y: int = r.randi_range(0, SLAB - 1)
		img.set_pixel(x, y, base.lightened(0.09) if r.randf() < 0.5 else base.darkened(0.12))

	for g in 2:
		var p: Vector2 = Vector2(r.randf_range(0, SLAB), 0.0 if r.randf() < 0.5 else SLAB - 1.0)
		var dir: Vector2 = Vector2(r.randf_range(-0.6, 0.6), 1.0 if p.y == 0.0 else -1.0)
		for k in r.randi_range(60, 140):
			dir =(dir + Vector2(r.randf_range(-0.4, 0.4), 0.0)).normalized() * 1.0
			p += dir
			if p.x < 0 or p.y < 0 or p.x >= SLAB or p.y >= SLAB:
				break
			img.set_pixel(int(p.x), int(p.y), base.darkened(0.35))
	img.fill_rect(Rect2i(24, 280, SLAB - 48, 2), base.darkened(0.18))
	var centro: Vector2 = centro_mano(Vector2(r.randf_range(110, 270), r.randf_range(110, 170)))
	hunde(img, mascara_mano(), centro, r.randf_range(0.7, 1.0), base, r.randf() < 0.35)
	var grabado: Color = base.darkened(0.42)
	var canto: Color = base.lightened(0.12)
	var txt: String = str(anio)
	PixelText.draw_text(img, 60 + 1, 312 + 1, txt, canto, 6)
	PixelText.draw_text(img, 60, 312, txt, grabado, 6)
	var num: String = str(dorsal)
	PixelText.draw_text(img, DORSAL_AT.x + 1, DORSAL_AT.y + 1, num, canto, 8)
	PixelText.draw_text(img, DORSAL_AT.x, DORSAL_AT.y, num, grabado, 8)
	return img






static func hunde(img: Image, mascara: PackedByteArray, centro: Vector2, h: float,
		cem: Color, espejo: bool = false) -> void:
	var org: Vector2i = Vector2i(centro - Vector2(MANO) * 0.5)
	var s: int = 1 + int(round(4.0 * h))
	var fondo: Color = cem.darkened(0.1 + 0.26 * h)
	var sombra: Color = cem.darkened(0.36 + 0.24 * h)
	var luz: Color = cem.lightened(0.22)
	var hondo_c: Color = cem.darkened(0.18 + 0.3 * h)
	for y in MANO.y:
		for x in MANO.x:
			var dentro: bool = _en(mascara, x, y, espejo)
			var col: Color
			if dentro:
				if not _en(mascara, x - s, y - s, espejo):
					col = sombra
				elif not _en(mascara, x + s, y + s, espejo):
					col = luz
				elif _en(mascara, x - 3 * s, y - 3 * s, espejo) \
						and _en(mascara, x + 3 * s, y + 3 * s, espejo):

					col = hondo_c
				else:
					col = fondo
			elif h > 0.25 and (_en(mascara, x - 2, y - 2, espejo)
					or _en(mascara, x + 2, y + 2, espejo)):
				col = cem.lightened(0.09 + 0.1 * h)
			else:
				continue
			var px: int = org.x + x
			var py: int = org.y + y
			if px >= 0 and py >= 0 and px < img.get_width() and py < img.get_height():
				img.set_pixel(px, py, col)


static func _en(mascara: PackedByteArray, x: int, y: int, espejo: bool) -> bool:
	if x < 0 or y < 0 or x >= MANO.x or y >= MANO.y:
		return false
	return mascara[y * MANO.x +(MANO.x - 1 - x if espejo else x)] == 1





static func losa_limpia(semilla: int) -> Image:
	var img: Image = Image.create(SLAB, SLAB, false, Image.FORMAT_RGBA8)
	img.fill(CEMENTO)
	var r: RandomNumberGenerator = RandomNumberGenerator.new()
	r.seed = semilla


	for y in SLAB:
		for x in SLAB:
			var borde: int = mini(mini(x, y), mini(SLAB - 1 - x, SLAB - 1 - y))
			if borde < 14:
				img.set_pixel(x, y, CEMENTO.darkened(0.12 *(1.0 - float(borde) / 14.0)))
	for a in 9:
		var c: Vector2 = Vector2(r.randf_range(40, SLAB - 40), r.randf_range(40, SLAB - 40))
		var rad: float = r.randf_range(50.0, 120.0)
		var a0: float = r.randf_range(0.0, TAU)
		for k in int(rad * 1.6):
			var ang: float = a0 + float(k) / rad
			for g in 3:
				var p: Vector2 = c + Vector2(cos(ang), sin(ang)) *(rad + float(g))
				if p.x >= 16 and p.y >= 16 and p.x < SLAB - 16 and p.y < SLAB - 16:
					img.set_pixel(int(p.x), int(p.y), CEMENTO.lightened(0.05))

	for i in 70:
		var x: int = r.randi_range(18, SLAB - 20)
		var y: int = r.randi_range(18, SLAB - 20)
		img.fill_rect(Rect2i(x, y, r.randi_range(2, 3), 2), CEMENTO.darkened(0.22))
		img.set_pixel(x, y, CEMENTO.lightened(0.18))

	for i in 90:
		img.set_pixel(r.randi_range(16, SLAB - 17), r.randi_range(16, SLAB - 17),
			CEMENTO.lightened(0.32))
	for i in 2600:
		var x: int = r.randi_range(0, SLAB - 1)
		var y: int = r.randi_range(0, SLAB - 1)
		img.set_pixel(x, y, CEMENTO.lightened(0.1) if r.randf() < 0.5 else CEMENTO.darkened(0.1))

	img.fill_rect(Rect2i(24, 280, SLAB - 48, 2), CEMENTO.darkened(0.18))
	return img




static func mascara_mano() -> PackedByteArray:
	var out: PackedByteArray = PackedByteArray()
	out.resize(MANO.x * MANO.y)
	var dedos: Array = [
		[Vector2(50, 96), Vector2(40, 30), 11.0],
		[Vector2(75, 90), Vector2(73, 14), 11.5],
		[Vector2(98, 92), Vector2(105, 24), 11.0],
		[Vector2(117, 104), Vector2(130, 52), 9.0],
		[Vector2(38, 134), Vector2(8, 92), 12.0],
	]
	for y in MANO.y:
		for x in MANO.x:
			var p: Vector2 = Vector2(x, y)
			var d: Vector2 =(p - Vector2(78, 128)) / Vector2(48, 50)
			var dentro: bool = d.length_squared() <= 1.0
			if not dentro and x >= 52 and x <= 106 and y >= 150:
				dentro = true
			if not dentro:
				for f in dedos:
					if _a_capsula(p, f[0], f[1]) <= float(f[2]):
						dentro = true
						break
			out[y * MANO.x + x] = 1 if dentro else 0
	return out


static func _a_capsula(p: Vector2, a: Vector2, b: Vector2) -> float:
	var ab: Vector2 = b - a
	var k: float = clampf((p - a).dot(ab) / ab.length_squared(), 0.0, 1.0)
	return p.distance_to(a + ab * k)




static func centro_mano(toque: Vector2) -> Vector2:
	var medio: Vector2 = Vector2(MANO) * 0.5
	var z: Rect2 = Rect2(ZONA_MANO)
	return Vector2(clampf(toque.x, z.position.x + medio.x, z.end.x - medio.x),
		clampf(toque.y, z.position.y + medio.y, z.end.y - medio.y))




func _pinta_huella(h: float) -> void:
	_losa.blit_rect(_limpia, Rect2i(0, 0, SLAB, ZONA_MANO.end.y + 4), Vector2i.ZERO)
	if h <= 0.0:
		_tex.update(_losa)
		return
	hunde(_losa, _mascara, _mano_c, h, CEMENTO)
	_tex.update(_losa)




func _abre_capa() -> void:
	_fase = "aprieta"
	_fase_t = t
	if chyron != null:
		chyron.visible = false
	_capa = Control.new()
	_capa.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	_capa.mouse_filter = Control.MOUSE_FILTER_STOP
	_capa.add_to_group(Entrada.CAPA_GROUP)
	add_child(_capa)
	var velo: ColorRect = ColorRect.new()
	velo.color = CareerTheme.MODAL_SCRIM
	velo.set_anchors_preset(Control.PRESET_FULL_RECT)
	velo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_capa.add_child(velo)
	var col: VBoxContainer = VBoxContainer.new()
	col.set_anchors_preset(Control.PRESET_FULL_RECT)
	col.offset_left = 34.0 + UiKit.side_safe_inset(get_viewport())
	col.offset_right = -34.0 - UiKit.side_safe_inset(get_viewport())
	col.offset_top = UiKit.top_safe_inset(get_viewport()) + 40.0
	col.offset_bottom = -(UiKit.bottom_safe_inset(get_viewport()) + 40.0)
	CareerUi.columna_centrada(col, get_viewport())
	col.alignment = BoxContainer.ALIGNMENT_CENTER
	col.add_theme_constant_override("separation", 18)
	col.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_capa.add_child(col)
	var tit: Label = CareerUi.plain(CareerTheme.T_TITLE, CareerTheme.TEXT)
	tit.text = I18n.t("DEJA TU HUELLA")
	tit.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	tit.clip_text = true
	col.add_child(tit)
	_pista = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT_DIM)
	_pista.text = I18n.tf("Mantén {0} en el cemento", [Entrada.boton("fl_avanza")]) \
			if Entrada.modo == Entrada.Modo.MANDO else I18n.t("Mantén el dedo en el cemento")
	_pista.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_pista.clip_text = true
	col.add_child(_pista)
	_vista = TextureRect.new()
	_vista.texture = _tex
	_vista.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	_vista.stretch_mode = TextureRect.STRETCH_SCALE
	_vista.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	var lado: float = minf(820.0, SceneFade.rect_visible(self).size.y - 520.0)
	_vista.custom_minimum_size = Vector2(lado, lado)
	_vista.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	_vista.mouse_filter = Control.MOUSE_FILTER_STOP
	_vista.gui_input.connect(_on_vista)


	var marco: PanelContainer = PanelContainer.new()
	var caja: StyleBoxFlat = StyleBoxFlat.new()
	caja.bg_color = MADERA
	caja.border_color = MADERA.darkened(0.35)
	caja.set_border_width_all(4)
	caja.set_corner_radius_all(4)
	caja.set_content_margin_all(18)
	marco.add_theme_stylebox_override("panel", caja)
	marco.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	marco.mouse_filter = Control.MOUSE_FILTER_IGNORE
	marco.add_child(_vista)
	col.add_child(marco)

	var fila: HBoxContainer = HBoxContainer.new()
	fila.alignment = BoxContainer.ALIGNMENT_CENTER
	fila.add_theme_constant_override("separation", 14)
	fila.mouse_filter = Control.MOUSE_FILTER_IGNORE
	col.add_child(fila)
	_barra = ProgressBar.new()
	_barra.show_percentage = false
	_barra.min_value = 0.0
	_barra.max_value = 1.0
	_barra.custom_minimum_size = Vector2(lado * 0.7, 26.0)
	_barra.mouse_filter = Control.MOUSE_FILTER_IGNORE
	fila.add_child(_barra)
	CareerUi.normalize_caps(_capa)



func _a_losa(pos: Vector2) -> Vector2:
	return pos / maxf(_vista.size.x, 1.0) * float(SLAB)


func _on_vista(ev: InputEvent) -> void:
	if _fase != "aprieta":
		return
	if ev is InputEventMouseButton and (ev as InputEventMouseButton).button_index == MOUSE_BUTTON_LEFT:
		if ev.pressed:
			_aprieta(_a_losa((ev as InputEventMouseButton).position))
		else:
			_suelta()
	elif ev is InputEventScreenTouch:
		if ev.pressed:
			_aprieta(_a_losa((ev as InputEventScreenTouch).position))
		else:
			_suelta()


func _aprieta(toque: Vector2) -> void:
	if _apretando:
		return
	_apretando = true
	_mano_c = centro_mano(toque)
	hondo = 0.0
	_pintado_hondo = -1.0
	if _pista != null:
		_pista.visible = false


func _suelta() -> void:
	if not _apretando:
		return
	_apretando = false
	if hondo < MINIMA:

		hondo = 0.0
		_pinta_huella(0.0)
		if _pista != null:
			_pista.visible = true
		return
	_pinta_huella(hondo)
	_fase = "graba"
	_fase_t = t
	flash_burst_at = t
	punch_fov(0.8, 0.25)
	sting("keeper_catch", -10.0)


func _tick_aprieta(delta: float) -> void:

	if Entrada.modo == Entrada.Modo.MANDO:
		if Input.is_action_pressed("fl_avanza") and not _apretando:
			_aprieta(Vector2(ZONA_MANO.get_center()))
		elif not Input.is_action_pressed("fl_avanza") and _apretando:
			_suelta()
	_tick_auto()
	if not _apretando:
		return
	hondo = minf(1.0, hondo + delta / HUNDE)
	if _barra != null:
		_barra.value = hondo
	_repinta -= delta
	if _repinta <= 0.0 and absf(hondo - _pintado_hondo) >= 0.02:
		_repinta = 0.06
		_pintado_hondo = hondo
		_pinta_huella(hondo)
	if hondo >= 1.0:
		_suelta()



func _tick_auto() -> void:
	if _auto.is_empty():
		return
	var dt: float = t - _fase_t
	if not _apretando and dt >= float(_auto.get("en", 0.6)) and hondo == 0.0:
		_aprieta(_auto.get("pos", Vector2(ZONA_MANO.get_center())))
	elif _apretando and dt >= float(_auto.get("en", 0.6)) + float(_auto.get("dura", 1.8)):
		_auto = {}
		_suelta()




func _tick_graba() -> void:
	var dt: float = t - _fase_t
	var grabado: Color = CEMENTO.darkened(0.42)
	var canto: Color = CEMENTO.lightened(0.14)

	var nombre: String = CareerTheme.caps(Career.player_name)
	var n: int = mini(nombre.length(), int(float(nombre.length()) * dt / GRABA_NOMBRE))
	if n > _nombre_hecho:
		var w: int = PixelText.text_width(nombre, 4)
		var x0: int =(SLAB - w) / 2
		var parcial: String = nombre.substr(0, n)
		PixelText.draw_text(_losa, x0 + 1, NOMBRE_Y - 4 + 1, parcial, canto, 4)
		PixelText.draw_text(_losa, x0, NOMBRE_Y - 4, parcial, grabado, 4)
		_nombre_hecho = n
		if n == nombre.length():
			var num: String = str(maxi(int(data.get("number", 0)), 0))
			PixelText.draw_text(_losa, DORSAL_AT.x + 1, DORSAL_AT.y + 1, num, canto, 8)
			PixelText.draw_text(_losa, DORSAL_AT.x, DORSAL_AT.y, num, grabado, 8)
		_tex.update(_losa)

	var k: float = clampf((dt - GRABA_NOMBRE) / GRABA_FIRMA, 0.0, 1.0)
	if k > _firma_hecha:
		_graba_firma(_firma_hecha, k, grabado)
		_firma_hecha = k
		_tex.update(_losa)
	if dt >= GRABA_NOMBRE + GRABA_FIRMA + 0.5:
		_fin()


func _graba_firma(k0: float, k1: float, col: Color) -> void:
	var total: float = 0.0
	for tr in _firma:
		for i in range(1, tr.size()):
			total += tr[i - 1].distance_to(tr[i])
	var a: float = k0 * total
	var b: float = k1 * total
	var ya: float = 0.0
	for tr in _firma:
		for i in range(1, tr.size()):
			var l: float = tr[i - 1].distance_to(tr[i])
			var s0: float = ya
			ya += l
			if ya <= a or s0 >= b or l <= 0.0:
				continue
			var p0: Vector2 = tr[i - 1].lerp(tr[i], clampf((a - s0) / l, 0.0, 1.0))
			var p1: Vector2 = tr[i - 1].lerp(tr[i], clampf((b - s0) / l, 0.0, 1.0))
			var pasos: int = maxi(1, int(ceil(p0.distance_to(p1))))
			for j in pasos + 1:
				var p: Vector2 = p0.lerp(p1, float(j) / float(pasos))
				_losa.fill_rect(Rect2i(int(p.x) - 1, int(p.y) - 1, 3, 3), col)




static func firma_garabato() -> Array:
	var tr: Array = []
	for i in 61:
		var u: float = float(i) / 60.0
		tr.append(u)
		tr.append(0.3 + 0.075 * sin(2.2 * TAU * u) + 0.044 * sin(5.3 * TAU * u + 1.0)
			- 0.0625 * u)
	return [tr, [0.07, 0.45, 1.0, 0.41]]



static func nota_hondura(h: float) -> String:
	if h >= 0.8:
		return "Bien honda: ahí se queda para siempre."
	if h >= 0.4:
		return "La plaza ya tiene tu mano."
	return "Apenas se marca: el cemento ya estaba duro."


func _fin() -> void:
	if _terminado:
		return
	_terminado = true
	_fase = "fin"
	if _capa != null:
		_capa.queue_free()
		_capa = null
	if _nota != null:
		_nota.text = I18n.t(nota_hondura(hondo))
	cam_keys.assign([PLANO_FIN.merged({"t": t})])
	applause(true, -10.0)
	flash_rate = 3.0
	flash_burst_at = t
	_ms_f = Time.get_ticks_msec()
	card_at = t + FICHA_TRAS
	_card_tw = create_tween()
	_card_tw.tween_interval(FICHA_TRAS)
	_card_tw.tween_callback(_reveal_card)




func _tick(delta: float) -> void:
	_tick_gente()
	match _fase:
		"espera":
			if t >= T_APRIETA:
				_abre_capa()
		"aprieta":
			_tick_aprieta(delta)
		"graba":
			_tick_graba()




func _tick_gente() -> void:
	if player != null and player.sprite_frames.has_animation("rodilla"):
		if _de_pie and not _terminado and t >= T_RODILLA:
			_de_pie = false
			player.position.x = YO_HUELLA.x - RODILLA_ARRIMA
			player.play("rodilla")
		elif not _de_pie and _terminado and float(Time.get_ticks_msec() - _ms_f) / 1000.0 \
				>= LEVANTA_TRAS:
			_de_pie = true
			player.position.x = YO_HUELLA.x
			player.play("idle")
	if _fase in ["graba", "fin"]:
		for s in _aplauden:
			if not en_gesto(s):
				gesto_play(s, "clap", Vector3(0.0, 0.0, 1.0))




func _on_skip() -> void:
	if _terminado:
		super._on_skip()
		return
	if _fase == "espera":
		t = T_APRIETA
		cam_keys.assign([KEYS_HUELLA[1]])
		_tick_camera()
		_abre_capa()
		return
	if _fase == "aprieta" and not _apretando:
		_aprieta(Vector2(ZONA_MANO.get_center()))
		hondo = 0.6
		_suelta()


func _skipped() -> void:
	pass


func _recuerdo() -> Dictionary:
	return data.duplicate(true)



func _vigia_ficha() -> void:
	if _leaving or ficha_puesta:
		return
	var desde: float = float(Time.get_ticks_msec() - _ms_f) / 1000.0
	if not _terminado or desde < FICHA_TRAS + VIGIA_MARGEN:
		SceneFade.timer(5.0, true, false, true).timeout.connect(_vigia_ficha)
		return
	super._vigia_ficha()
