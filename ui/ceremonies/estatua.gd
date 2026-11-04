extends Ceremony












const ADOQUIN: Color = Color("8f8778")
const CIELO: Color = Color("a8d4ee")
const PIEDRA: Color = Color("c9c2b2")
const FACHADA: Color = Color("d9b98c")

const POSE: String = "res://assets/sprites/anim/cielo_south_"



const PELO_UTILLERO: String = "none"
const ESCALA: float = 2.3
const PEANA_H: float = 1.3
const ESTATUA_AT: Vector3 = Vector3(0.0, 0.0, -3.4)

const YO_ART: String = "res://assets/sprites/anim/casual_idle_north_"
const YO: Vector3 = Vector3(1.05, 0.0, -1.3)



const T_PALOMA: Vector2 = Vector2(3.0, 4.6)
const PALOMA_DESDE: Vector3 = Vector3(4.0, 7.5, -2.2)
const T_BOCADILLO: float = 5.3
const T_CHYRON_ESTATUA: float = 0.8
const T_CARD_ESTATUA: float = 8.0
const DRIFT: float = 0.12

const KEYS: Array = [
	{"t": 0.0, "dist": 11.0, "h": 1.8, "yaw": 180.0, "aim_y": 3.4, "fov": 46.0,
		"focus_x": 0.0, "focus_z": -2.4},
	{"t": 4.5, "dist": 10.0, "h": 1.9, "yaw": 182.0, "aim_y": 3.6, "fov": 44.0,
		"focus_x": 0.0, "focus_z": -2.6},
	{"t": 8.5, "dist": 10.4, "h": 1.9, "yaw": 179.0, "aim_y": 3.5, "fov": 45.0,
		"focus_x": 0.0, "focus_z": -2.6},
]

var _estatua: AnimatedSprite3D = null
var _paloma: Node3D = null
var _paloma_hasta: Vector3 = Vector3.ZERO
var _bocadillo: PanelContainer = null
var _zureo: bool = false


func _build() -> void:
	_plaza()
	_peana()
	focus = Vector3(0.0, 0.0, -2.4)
	make_camera(KEYS, 34.0)
	orbit_speed = DRIFT
	_monta_estatua()
	make_player(KitRecolor.casual_of(GameState.team_custom), "north", YO_ART)
	player.position = Vector3(YO.x, feet_offset(player.pixel_size, YO_ART + "00.png")
		- PLAYER_SINK, YO.z)
	_monta_paloma()
	_monta_bocadillo()
	make_chyron(I18n.t("INAUGURACIÓN"), CareerTheme.caps(I18n.t("TU ESTATUA")), {},
		T_CHYRON_ESTATUA)
	make_card(T_CARD_ESTATUA)
	card_title(I18n.t("LA ESTATUA"), 40)
	card_sub(I18n.t("TODA LA COLECCIÓN"), CareerTheme.MONEY)
	card_note(I18n.t("Lo has completado todo. Te han hecho una estatua. El pelo es del utillero."))
	card_cta(I18n.t("SEGUIR"))


func _plaza() -> void:
	var env: WorldEnvironment = WorldEnvironment.new()
	var e: Environment = Environment.new()
	e.background_mode = Environment.BG_COLOR
	e.background_color = CIELO
	e.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	e.ambient_light_color = Color("fff4de")
	e.ambient_light_energy = 1.0
	env.environment = e
	viewport.add_child(env)
	var sol: DirectionalLight3D = DirectionalLight3D.new()
	sol.light_color = Color("fff0c8")
	sol.light_energy = 0.8
	sol.rotation_degrees = Vector3(-50.0, 25.0, 0.0)
	viewport.add_child(sol)









	_caja(Vector3(0.0, -0.5, -4.0), Vector3(46.0, 1.0, 20.0), ADOQUIN)





	for i in range(-5, 12):
		var x: float = -7.5 + i * 2.5
		var alto: float = 5.0 + fmod(absf(float(i)) * 1.7, 1.6)
		_caja(Vector3(x, alto * 0.5, -9.0), Vector3(2.45, alto, 0.4),
			FACHADA.darkened(0.08 * float(absi(i) % 3)))
		for fila in 2:
			_caja(Vector3(x, 1.8 + fila * 1.6, -8.78), Vector3(0.7, 0.9, 0.05), Color("4a5a6a"))
	_plaza_lados()




func _peana() -> void:
	_caja(ESTATUA_AT + Vector3(0.0, PEANA_H * 0.5, 0.0), Vector3(1.9, PEANA_H, 1.3), PIEDRA)
	_caja(ESTATUA_AT + Vector3(0.0, PEANA_H + 0.06, 0.0), Vector3(2.1, 0.12, 1.5),
		PIEDRA.darkened(0.12))
	var placa: Label3D = Label3D.new()
	placa.text = "%s\n%s" % [CareerTheme.caps(Career.player_name), I18n.t("LEYENDA ETERNA")]
	placa.font_size = 64
	placa.pixel_size = 0.0022
	placa.modulate = Color("5a3e1c")
	placa.outline_size = 0
	placa.position = ESTATUA_AT + Vector3(0.0, PEANA_H * 0.55, 0.66)
	viewport.add_child(placa)









const FAROLA: Color = Color("3a3f45")
const MADERA: Color = Color("7a5434")
const TOLDO: Color = Color("b0503c")


func _plaza_lados() -> void:
	for lado in [-1.0, 1.0]:

		for fx in [6.5, 13.0]:
			var at: Vector3 = Vector3(lado * fx, 0.0, -6.8)
			_caja(at + Vector3(0.0, 0.15, 0.0), Vector3(0.26, 0.3, 0.26), FAROLA)
			_caja(at + Vector3(0.0, 1.75, 0.0), Vector3(0.1, 3.4, 0.1), FAROLA)
			_caja(at + Vector3(0.0, 3.55, 0.0), Vector3(0.34, 0.42, 0.34), FAROLA)
			_caja(at + Vector3(0.0, 3.52, 0.0), Vector3(0.26, 0.3, 0.36), Color("f2e6b8"))

		var b: Vector3 = Vector3(lado * 9.5, 0.0, -6.2)
		_caja(b + Vector3(0.0, 0.45, 0.0), Vector3(1.6, 0.08, 0.45), MADERA)
		_caja(b + Vector3(0.0, 0.78, -0.2), Vector3(1.6, 0.4, 0.06), MADERA)
		for px in [-0.65, 0.65]:
			_caja(b + Vector3(px, 0.22, 0.0), Vector3(0.08, 0.44, 0.4), FAROLA)


		var c: Vector3 = Vector3(lado * 12.5, 0.0, -8.78)
		_caja(c + Vector3(0.0, 0.55, 0.0), Vector3(0.9, 1.1, 0.05), Color("3b2a20"))
		var toldo: MeshInstance3D = _caja(c + Vector3(0.0, 1.2, 0.45),
			Vector3(2.1, 0.06, 0.95), TOLDO)
		toldo.rotation_degrees.x = 16.0


func _caja(at: Vector3, size: Vector3, col: Color, padre: Node = null) -> MeshInstance3D:
	var m: MeshInstance3D = MeshInstance3D.new()
	var box: BoxMesh = BoxMesh.new()
	box.size = size
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = col
	box.material = mat
	m.mesh = box
	m.position = at
	(padre if padre != null else viewport).add_child(m)
	return m




func _monta_estatua() -> void:
	var cfg: Dictionary = GameState.team_custom.duplicate()
	var appearance = load("res://features/match/appearance_catalog.gd")
	if appearance.valid("modular_hair", PELO_UTILLERO):
		cfg["modular_hair"] = PELO_UTILLERO
	var vivo: SpriteFrames = player_frames(cfg, "south", POSE)


	var sf: SpriteFrames = SpriteFrames.new()
	sf.remove_animation("default")
	sf.add_animation("idle")
	for k in vivo.get_frame_count("idle"):
		sf.add_frame("idle", _bronce(vivo.get_frame_texture("idle", k)))
	_estatua = AnimatedSprite3D.new()
	_estatua.sprite_frames = sf
	_estatua.pixel_size = PLAYER_HEIGHT_M / PLAYER_METRICS.x * ESCALA
	_estatua.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	_estatua.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	_estatua.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	_estatua.position = Vector3(ESTATUA_AT.x, PEANA_H + 0.12
		+ feet_offset(_estatua.pixel_size, POSE + "01.png"), ESTATUA_AT.z)
	viewport.add_child(_estatua)
	_estatua.animation = "idle"
	_estatua.frame = maxi(0, sf.get_frame_count("idle") - 1)
	_estatua.pause()





	var img: Image = SceneFade.imagen(load(POSE + "%02d.png" %(_estatua.frame + 1)))
	if img == null:


		_paloma_hasta = _estatua.position + Vector3(0.0, 0.0, 0.05)
		return
	var w: int = img.get_width()
	var arriba: int = img.get_height() / 2
	var dedo_x: float = w * 0.5
	var hallado: bool = false
	for y in img.get_height():
		for x in range(int(w * 0.58), w):
			if img.get_pixel(x, y).a > 0.5:
				arriba = y
				dedo_x = x + 1.0
				hallado = true
				break
		if hallado:
			break
	_paloma_hasta = _estatua.position + Vector3((dedo_x - w * 0.5) * _estatua.pixel_size,
		(img.get_height() * 0.5 - arriba) * _estatua.pixel_size, 0.05)



static func _bronce(tex: Texture2D) -> Texture2D:
	var img: Image = SceneFade.imagen_copia(tex)
	if img == null:
		return tex
	img.decompress()
	img.convert(Image.FORMAT_RGBA8)
	var sombra: Color = Color("4a2c12")
	var brillo: Color = Color("f0c47a")
	for y in img.get_height():
		for x in img.get_width():
			var c: Color = img.get_pixel(x, y)
			if c.a <= 0.0:
				continue
			var b: Color = sombra.lerp(brillo, clampf(c.get_luminance() * 1.25, 0.0, 1.0))
			b.a = c.a
			img.set_pixel(x, y, b)
	return ImageTexture.create_from_image(img)







const PALOMA_COLORES: Dictionary = {
	"K": Color("2a2a33"), "G": Color("9aa0ac"), "D": Color("6c7280"), "L": Color("c8ccd4"),
	"I": Color("4f8f7a"), "O": Color("e0a040"), "R": Color("c04030"), "P": Color("d88a8a"),
}
const PALOMA_POSADA: Array[String] = [
	"................",
	"...KKK..........",
	"..KDDDK.........",
	".OKDRDK.........",
	"..KIIIK.........",
	"...KIIGKKKKK....",
	"...KGGGGGGDDKK..",
	"...KLGGGGDDDDDK.",
	"....KLLGGGDDKKK.",
	".....KKKKKKK....",
	".......P..P.....",
	"......PP.PP.....",
]
const PALOMA_ALAS_ARRIBA: Array[String] = [
	".........KK.....",
	"........KDDK....",
	"...KKK.KDDK.....",
	"..KDDDKDDK......",
	".OKDRDKDK.......",
	"..KIIIKK........",
	"...KIIGKKKKK....",
	"...KGGGGGGDDKK..",
	"...KLGGGGDDDDDK.",
	"....KLLGGGDDKKK.",
	".....KKKKKKK....",
	"................",
]
const PALOMA_ALAS_ABAJO: Array[String] = [
	"................",
	"...KKK..........",
	"..KDDDK.........",
	".OKDRDK.........",
	"..KIIIK.........",
	"...KIIGKKKKK....",
	"...KGGGGGGDDKK..",
	"...KLGGGGDDDDDK.",
	"....KLKDDDKKKK..",
	".....KDDDK......",
	"......KDK.......",
	".......K........",
]
const PALOMA_PIXEL: float = 0.045


static func _paloma_tex(filas: Array[String]) -> Texture2D:
	var img: Image = Image.create(16, 12, false, Image.FORMAT_RGBA8)
	img.fill(Color(0, 0, 0, 0))
	for y in filas.size():
		for x in filas[y].length():
			var c: String = filas[y][x]
			if PALOMA_COLORES.has(c):
				img.set_pixel(x, y, PALOMA_COLORES[c])
	return ImageTexture.create_from_image(img)


func _monta_paloma() -> void:
	var sf: SpriteFrames = SpriteFrames.new()
	sf.remove_animation("default")
	sf.add_animation("vuela")
	sf.set_animation_speed("vuela", 10.0)
	sf.add_frame("vuela", _paloma_tex(PALOMA_ALAS_ARRIBA))
	sf.add_frame("vuela", _paloma_tex(PALOMA_ALAS_ABAJO))
	sf.add_animation("posada")
	sf.add_frame("posada", _paloma_tex(PALOMA_POSADA))
	var ave: AnimatedSprite3D = AnimatedSprite3D.new()
	ave.sprite_frames = sf
	ave.pixel_size = PALOMA_PIXEL
	ave.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	ave.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	ave.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	ave.play("vuela")
	_paloma = ave
	_paloma.position = PALOMA_DESDE
	_paloma.visible = false
	viewport.add_child(_paloma)


func _monta_bocadillo() -> void:
	_bocadillo = PanelContainer.new()
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CareerTheme.TEXT
	sb.set_corner_radius_all(18)
	sb.set_content_margin_all(18)
	_bocadillo.add_theme_stylebox_override("panel", sb)
	var l: Label = CareerUi.plain(30, CareerTheme.BG_DEEP)
	l.text = I18n.t("¿ESE PELO ES DEL UTILLERO?")
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	l.custom_minimum_size.x = 400
	_bocadillo.add_child(l)
	_bocadillo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_bocadillo.modulate.a = 0.0
	add_child(_bocadillo)


func _tick(_delta: float) -> void:
	_tick_paloma()
	_tick_bocadillo()


func _tick_paloma() -> void:
	if _paloma == null:
		return
	_paloma.visible = t >= T_PALOMA.x
	var k: float = clampf((t - T_PALOMA.x) /(T_PALOMA.y - T_PALOMA.x), 0.0, 1.0)

	var hasta: Vector3 = _paloma_hasta + Vector3(2.0 * PALOMA_PIXEL, 2.0 * PALOMA_PIXEL, 0.0)
	var p: Vector3 = PALOMA_DESDE.lerp(hasta, k)
	var ave: AnimatedSprite3D = _paloma as AnimatedSprite3D
	if k < 1.0:

		p.y += sin(k * PI) * 0.8
		if ave.animation != "vuela":
			ave.play("vuela")
	else:

		if ave.animation != "posada":
			ave.play("posada")
		p.y += PALOMA_PIXEL if fmod(t * 2.5, 1.0) < 0.5 else 0.0
	_paloma.position = p
	if not _zureo and k >= 1.0:
		_zureo = true
		sting("ui_pop")


func _tick_bocadillo() -> void:
	if _bocadillo == null or cam == null or not is_instance_valid(cam) or player == null:
		return
	_bocadillo.modulate.a = clampf((t - T_BOCADILLO) / 0.25, 0.0, 1.0)
	if _bocadillo.modulate.a <= 0.0:
		return
	var vs: Vector2 = Vector2(viewport.size)
	if vs.x <= 0.0 or vs.y <= 0.0:
		return
	var caja: Rect2 = viewport_box.get_global_rect()
	var cabeza: Vector3 = player.position + Vector3(0.0, 1.0, 0.0)
	var p: Vector2 = caja.position +(cam.unproject_position(cabeza) / vs) * caja.size
	p -= Vector2(_bocadillo.size.x * 0.5, _bocadillo.size.y + 12.0)
	p.x = clampf(p.x, 24.0, size.x - _bocadillo.size.x - 24.0)
	_bocadillo.position = p


func _skipped() -> void:
	_zureo = true


func _recuerdo() -> Dictionary:
	return data.duplicate(true)
