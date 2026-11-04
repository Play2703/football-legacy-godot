extends Ceremony
































const GenteCalle := preload("res://ui/ceremonies/gente_calle.gd")

const T_LLEGA: float = 3.6

const T_GOLPE: float = 4.4
const OLA: float = 0.9
const T_CHYRON: float = 2.0
const T_CARD: float = 9.2


const DESDE: Vector3 = Vector3(0.0, 0.0, -3.5)
const HASTA: Vector3 = Vector3(0.0, 0.0, -10.5)


const PLAZA_HX: float = 11.0
const CALZADA_HX: float = 17.0
const FACHADA_X: float = 20.0



const ACERA_Y: float = 0.15
const FONDO_Z: float = -86.0

const TORRE_Z: float = -88.0
const TORRE_W: float = 14.0
const TORRE_H: float = 60.0



const BLOQUES_IZQ: Array = [[0.0, -24.0, 34.0, "343845"], [-24.0, -46.0, 50.0, "2b303b"],
	[-46.0, -66.0, 42.0, "3a3632"], [-66.0, -86.0, 56.0, "2e3340"]]
const BLOQUES_DER: Array = [[2.0, -20.0, 30.0, "30343d"], [-20.0, -44.0, 60.0, "282c35"],
	[-44.0, -64.0, 40.0, "3b3833"], [-64.0, -86.0, 48.0, "2c3039"]]


const ANCHA: String = "ancha"
const ALTA: String = "alta"
const CUADRADA: String = "cuadrada"


const BRILLO: float = 1.3

const IDLE_NORTH: String = "res://assets/sprites/anim/idle_north_"
const CLAP_NORTH: String = "res://assets/sprites/anim/clap_player_north_"

const GENTE: int = 26




const PASEOS: Array = [
	[-10.3, 4.0, "north", 48.0], [10.2, -44.0, "south", 48.0],
	[-9.4, -40.0, "south", 44.0], [9.5, 2.0, "north", 44.0],
	[-9.0, -25.0, "east", 18.0], [9.0, -27.5, "west", 18.0],
	[-9.0, -36.0, "east", 18.0], [9.0, -38.0, "west", 18.0],
	[-18.6, 6.0, "north", 60.0], [18.6, -54.0, "south", 60.0],
]
const RUMBOS: Dictionary = {"north": Vector3(0.0, 0.0, -1.0),
	"south": Vector3(0.0, 0.0, 1.0), "east": Vector3(1.0, 0.0, 0.0),
	"west": Vector3(-1.0, 0.0, 0.0)}

var _r: RandomNumberGenerator = RandomNumberGenerator.new()
var _pantallas: Array[Dictionary] = []

var _anuncios: Dictionary = {}
var _turno: Dictionary = {}

var _campana: Dictionary = {}


var _club: Dictionary = {}
var _cinta_mat: StandardMaterial3D = null
var _bola: MeshInstance3D = null
var _golpe: bool = false
var _llego: bool = false
var _fans: Array[AnimatedSprite3D] = []
var _fans_y: Array[float] = []
var _fans_salto: Array[float] = []
var _fans_ritmo: Array[float] = []
var _moviles: Array[MeshInstance3D] = []
var _taxis: Array[Dictionary] = []
var _paseantes: Array[Dictionary] = []
var _vapor: Array[MeshInstance3D] = []
var _humo_textura: ImageTexture = null
var _ventanas: ImageTexture = null


func _marca() -> String:
	return String(data.get("sponsor", ""))


func _nombre_marca() -> String:
	var m: Dictionary = Sponsors.by_id(_marca())


	return CareerTheme.caps(I18n.t(String(m.get("name", _marca()))))



func _accent_for() -> Color:
	return Sponsors.color_of(_marca())


func _build() -> void:
	_r.seed = hash("pantallas_" + _marca())
	var kit: Dictionary = GameState.kit_variant(team(), 0)
	_mundo()
	_suelo()
	_escalinata()
	_edificios()

	_catalogo()
	_campanas()
	_pantallas_de_la_plaza()
	_torre()
	_calle()
	_taxis_de_la_calle()
	_gente(kit)
	_paseantes_de_la_plaza()
	make_camera(_keys(), 58.0)
	orbit_speed = -0.25


	var ropa: Dictionary = KitRecolor.casual_of(GameState.team_custom)
	make_player(ropa, "south")
	add_walk(player, ropa)
	add_idle_views(player, ropa)
	_colocar(DESDE)
	make_audio(0.45, false)

	make_chyron(I18n.t("NUEVA YORK"), CareerTheme.caps(Career.player_name), {}, T_CHYRON)
	make_card(T_CARD)
	card_title(I18n.t("TU CARA EN NUEVA YORK"), 40)
	card_sub(_nombre_marca(), Sponsors.color_of(_marca()))


	var pay: int = int(data.get("pay", 0))
	if pay > 0:
		card_count(pay, I18n.t("FIJO POR PARTIDO"))
	card_note(I18n.t("La marca compró la plaza entera. Todas las pantallas a la vez, y en todas tú."))
	card_cta(I18n.t("SEGUIR"))



func _keys() -> Array:
	return [


		{"t": 0.0, "dist": 80.0, "h": 22.0, "yaw": 180.0, "aim_y": 6.0, "fov": 58.0,
			"focus_x": 0.0, "focus_z": -40.0},

		{"t": 3.2, "dist": 26.0, "h": 3.0, "yaw": 184.0, "aim_y": 9.0, "fov": 60.0,
			"focus_x": 0.0, "focus_z": -30.0},

		{"t": T_GOLPE + 0.05, "dist": 6.5, "h": 1.1, "yaw": 176.0, "aim_y": 2.5,
			"fov": 66.0, "focus_x": 0.0, "focus_z": -12.5},

		{"t": 6.8, "dist": 9.5, "h": 1.5, "yaw": 148.0, "aim_y": 4.0, "fov": 62.0,
			"focus_x": 0.5, "focus_z": -14.0},



		{"t": 8.6, "dist": 46.0, "h": 8.0, "yaw": 180.0, "aim_y": 8.0, "fov": 58.0,
			"focus_x": 0.0, "focus_z": -40.0},
	]




func _mundo() -> void:
	var we: WorldEnvironment = WorldEnvironment.new()
	var e: Environment = Environment.new()


	var cielo: ProceduralSkyMaterial = ProceduralSkyMaterial.new()
	cielo.sky_top_color = Color("06080f")
	cielo.sky_horizon_color = Color("2a2140")
	cielo.ground_bottom_color = Color("05060a")
	cielo.ground_horizon_color = Color("2a2140")
	var sky: Sky = Sky.new()
	sky.sky_material = cielo
	e.background_mode = Environment.BG_SKY
	e.sky = sky
	e.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	e.ambient_light_color = Color("6a6f9c")
	e.ambient_light_energy = 0.55
	e.fog_enabled = true
	e.fog_light_color = Color("261f3b")
	e.fog_density = 0.004
	e.fog_sky_affect = 0.0

	e.glow_enabled = true
	e.glow_intensity = 0.9
	e.glow_bloom = 0.04
	e.glow_hdr_threshold = 0.95
	we.environment = e
	viewport.add_child(we)
	var luna: DirectionalLight3D = DirectionalLight3D.new()
	luna.light_color = Color("8a97c8")
	luna.light_energy = 0.25
	luna.rotation_degrees = Vector3(-50.0, 30.0, 0.0)
	luna.sky_mode = DirectionalLight3D.SKY_MODE_LIGHT_ONLY
	viewport.add_child(luna)

	for l in [[Vector3(0.0, 16.0, -78.0), Color("cfe0ff"), 40.0],
			[Vector3(-15.0, 12.0, -22.0), Color("ff5fb0"), 26.0],
			[Vector3(15.0, 10.0, -36.0), Color("4fe3ff"), 26.0],
			[Vector3(0.0, 7.0, -8.0), Color("ffc27a"), 18.0]]:
		var o: OmniLight3D = OmniLight3D.new()
		o.position = l[0]
		o.light_color = l[1]
		o.light_energy = 2.2
		o.omni_range = float(l[2])
		viewport.add_child(o)




func _suelo() -> void:
	_caja(Vector3(0.0, -0.5, -40.0), Vector3(140.0, 1.0, 220.0), Color("17181c"))
	_caja(Vector3(0.0, 0.01, -40.0), Vector3(PLAZA_HX * 2.0, 0.02, 100.0), Color("34353b"))
	for s in [-1.0, 1.0]:
		var sx: float = float(s)
		_caja(Vector3(sx *(PLAZA_HX + 0.1), 0.08, -40.0), Vector3(0.2, 0.16, 100.0),
			Color("55565c"))
		_caja(Vector3(sx *(CALZADA_HX +(FACHADA_X - CALZADA_HX) * 0.5), ACERA_Y * 0.5, -40.0),
			Vector3(FACHADA_X - CALZADA_HX, ACERA_Y, 100.0), Color("4a4b52"))
		var z: float = 12.0
		while z > FONDO_Z:
			_caja(Vector3(sx * 14.0, 0.012, z), Vector3(0.14, 0.02, 3.0), Color("c9c9c2"))
			z -= 7.0
		for k in 6:
			_caja(Vector3(sx *(PLAZA_HX + 0.7 + float(k) * 1.0), 0.013, -31.0),
				Vector3(0.5, 0.02, 3.2), Color("e4e4de"))




func _escalinata() -> void:
	for i in 7:
		var alto: float = 0.42 * float(i + 1)
		_caja(Vector3(0.0, alto * 0.5, 3.6 + float(i)), Vector3(14.0, alto, 1.0),
			Color("c81d2b"), 1.1)





func _edificios() -> void:
	for lado in [[-1.0, BLOQUES_IZQ], [1.0, BLOQUES_DER]]:
		var s: float = float(lado[0])
		for b in lado[1]:
			var zn: float = float(b[0])
			var zs: float = float(b[1])
			var h: float = float(b[2])
			var col: Color = Color(String(b[3]))
			var hondo: float = 24.0
			_caja(Vector3(s *(FACHADA_X + hondo * 0.5), h * 0.5,(zn + zs) * 0.5),
				Vector3(hondo, h, zn - zs), col)
			_fachada(Vector2(zn - zs, h), Vector3(s *(FACHADA_X - 0.02), h * 0.5,
				(zn + zs) * 0.5), -90.0 * s)
			_caja(Vector3(s *(FACHADA_X + hondo * 0.5 - 0.3), h + 0.25,(zn + zs) * 0.5),
				Vector3(hondo + 0.6, 0.5, zn - zs + 0.2), col.darkened(0.35))
	for b in [[-34.0, 18.0, 96.0], [-16.0, 16.0, 78.0], [16.0, 18.0, 88.0],
			[34.0, 16.0, 104.0], [0.0, 22.0, 112.0]]:
		var x: float = float(b[0])
		var w: float = float(b[1])
		var h: float = float(b[2])
		var z: float = -112.0 if absf(x) > 1.0 else -124.0
		_caja(Vector3(x, h * 0.5, z), Vector3(w, h, 16.0), Color("1c1f27"))
		_fachada(Vector2(w, h), Vector3(x, h * 0.5, z + 8.02), 0.0)




func _fachada(size: Vector2, at: Vector3, giro_y: float) -> void:
	var m: MeshInstance3D = MeshInstance3D.new()
	var q: QuadMesh = QuadMesh.new()
	q.size = size
	m.mesh = q
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.albedo_texture = _ventanas_tex()
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	mat.texture_repeat = true
	mat.uv1_scale = Vector3(size.x / 24.0, size.y / 24.0, 1.0)
	m.material_override = mat
	m.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	m.position = at
	m.rotation_degrees = Vector3(0.0, giro_y, 0.0)
	viewport.add_child(m)




func _ventanas_tex() -> ImageTexture:
	if _ventanas != null:
		return _ventanas
	var img: Image = Image.create(64, 64, false, Image.FORMAT_RGBA8)
	img.fill(Color("20232c"))
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 7
	for fy in 8:
		for fx in 8:
			var luz: float = rng.randf()
			var c: Color = Color("ffd9a0") if luz < 0.2 \
					else (Color("bcd6ff") if luz < 0.3 else Color("2c3444"))
			img.fill_rect(Rect2i(fx * 8 + 2, fy * 8 + 2, 4, 5), c)
	_ventanas = ImageTexture.create_from_image(img)
	return _ventanas







func _pantallas_de_la_plaza() -> void:
	var fx: float = FACHADA_X - 0.3
	for p in [[Vector2(20.0, 9.0), Vector3(- fx, 12.5, -12.0), 90.0],
			[Vector2(18.0, 11.0), Vector3(- fx, 16.0, -35.0), 90.0],
			[Vector2(14.0, 6.0), Vector3(- fx, 30.0, -35.0), 90.0],
			[Vector2(16.0, 9.0), Vector3(- fx, 11.0, -56.0), 90.0],
			[Vector2(16.0, 12.0), Vector3(- fx, 20.0, -76.0), 90.0],
			[Vector2(16.0, 10.0), Vector3(fx, 12.0, -9.0), -90.0],
			[Vector2(20.0, 10.0), Vector3(fx, 28.0, -32.0), -90.0],
			[Vector2(14.0, 12.0), Vector3(fx, 13.0, -54.0), -90.0],
			[Vector2(16.0, 9.0), Vector3(fx, 16.0, -75.0), -90.0]]:
		_pantalla(p[0], p[1], float(p[2]))
	for p in [[Vector2(3.6, 11.0), Vector3(-17.8, 11.0, -22.0)],
			[Vector2(3.6, 13.0), Vector3(17.8, 14.0, -40.0)],
			[Vector2(3.2, 10.0), Vector3(-18.0, 16.0, -60.0)],
			[Vector2(3.2, 12.0), Vector3(18.0, 12.0, -68.0)],
			[Vector2(12.0, 8.0), Vector3(-27.0, 38.5, -23.0)],
			[Vector2(12.0, 7.0), Vector3(27.0, 34.0, -19.0)],
			[Vector2(14.0, 9.0), Vector3(-28.0, 47.0, -65.0)]]:
		_pantalla(p[0], p[1], 0.0)
	_curva(Vector3(FACHADA_X + 0.5, 13.0, -20.0), 4.0, 14.0)






func _pantalla(size: Vector2, at: Vector3, giro_y: float, tex: Texture2D = null) -> void:
	var forma: String = CUADRADA
	if size.x >= size.y * 1.4:
		forma = ANCHA
	elif size.y >= size.x * 1.4:
		forma = ALTA
	var frente: Vector3 = Vector3(sin(deg_to_rad(giro_y)), 0.0, cos(deg_to_rad(giro_y)))
	var marco: MeshInstance3D = _caja(at - frente * 0.2,
		Vector3(size.x + 0.5, size.y + 0.5, 0.4), Color("0b0c10"))
	marco.rotation_degrees = Vector3(0.0, giro_y, 0.0)
	var m: MeshInstance3D = MeshInstance3D.new()
	var q: QuadMesh = QuadMesh.new()
	q.size = size
	m.mesh = q
	var mat: StandardMaterial3D = _mat_pantalla(tex if tex != null else _siguiente(forma))
	m.material_override = mat
	m.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	m.position = at + frente * 0.02
	m.rotation_degrees = Vector3(0.0, giro_y, 0.0)
	viewport.add_child(m)
	_pantallas.append({"mat": mat, "forma": forma, "hecha": false, "flash": -1.0,
		"retraso": OLA * clampf((at.z - TORRE_Z) / - TORRE_Z, 0.0, 1.0)})




func _mat_pantalla(tex: Texture2D) -> StandardMaterial3D:
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.albedo_texture = tex
	mat.albedo_color = Color(BRILLO, BRILLO, BRILLO)
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	if "disable_fog" in mat:
		mat.set("disable_fog", true)
	return mat



func _siguiente(forma: String) -> Texture2D:
	var lista: Array = _anuncios.get(forma, [])
	if lista.is_empty():
		return _campana.get(forma, null)
	var k: int = int(_turno.get(forma, 0))
	_turno[forma] = k + 1
	return lista[k % lista.size()]





func _curva(at: Vector3, r: float, alto: float) -> void:
	var m: MeshInstance3D = MeshInstance3D.new()
	var c: CylinderMesh = CylinderMesh.new()
	c.top_radius = r
	c.bottom_radius = r
	c.height = alto
	c.radial_segments = 32
	c.rings = 1
	c.cap_top = false
	c.cap_bottom = false
	m.mesh = c
	var mat: StandardMaterial3D = _mat_pantalla(_siguiente(ALTA))
	mat.texture_repeat = true
	mat.uv1_scale = Vector3(4.0, 1.0, 1.0)
	m.material_override = mat
	m.position = at
	viewport.add_child(m)
	_pantallas.append({"mat": mat, "forma": ALTA, "hecha": false, "flash": -1.0,
		"retraso": OLA * 0.6})
	for sy in [-1.0, 1.0]:
		_cilindro(at + Vector3(0.0, float(sy) *(alto * 0.5 + 0.2), 0.0), r + 0.2, 0.4,
			Color("0b0c10"))





func _torre() -> void:
	var zc: float = TORRE_Z - 6.0
	_caja(Vector3(0.0, TORRE_H * 0.5, zc), Vector3(TORRE_W, TORRE_H, 12.0), Color("23262e"))
	var cara: float = TORRE_Z + 0.35



	for p in [[Vector2(13.0, 7.0), 8.5, null], [Vector2(12.0, 9.0), 19.5, null],
			[Vector2(12.0, 9.0), 29.5, _club.get("escudo")],
			[Vector2(12.0, 8.0), 39.0, _club.get("marca")],
			[Vector2(10.0, 6.0), 48.0, _club.get("patro")]]:
		_pantalla(p[0], Vector3(0.0, float(p[1]), cara), 0.0, p[2])


	var cinta: MeshInstance3D = MeshInstance3D.new()
	var q: QuadMesh = QuadMesh.new()
	q.size = Vector2(TORRE_W, 0.9)
	cinta.mesh = q
	_cinta_mat = _mat_pantalla(_cinta_tex())
	_cinta_mat.texture_repeat = true
	_cinta_mat.uv1_scale = Vector3((TORRE_W / 0.9) /(1024.0 / 24.0), 1.0, 1.0)
	cinta.material_override = _cinta_mat
	cinta.position = Vector3(0.0, 13.9, cara + 0.2)
	viewport.add_child(cinta)
	_caja(Vector3(0.0, TORRE_H + 1.0, zc), Vector3(TORRE_W - 2.0, 2.0, 10.0), Color("2b2f38"))
	_cilindro(Vector3(0.0, TORRE_H + 5.0, zc), 0.25, 8.0, Color("8c93a0"))
	_bola = _esfera(Vector3(0.0, TORRE_H + 7.5, zc), 1.5, Color("fff1c6"), 2.6)








func _catalogo() -> void:
	var anchas: Array = []
	var altas: Array = []
	var cuadradas: Array = []
	var marcas: Array = Stadium.SPONSORS
	for i in marcas.size():
		if i < 5:
			anchas.append(_anuncio_ficticio(marcas[i], ANCHA))
		else:
			altas.append(_anuncio_ficticio(marcas[i], ALTA))
	altas.append(_anuncio_ficticio(marcas[0], ALTA))
	cuadradas.append(_anuncio_ficticio(marcas[3], CUADRADA))




	var club: String = String(team().get("id", ""))
	var acc: Color = CareerTheme.accent_of(team())
	var patro: Texture2D = SponsorLogos.for_team(club) if not club.is_empty() else null
	if patro != null:
		_club["patro_tex"] = patro
		_club["patro"] = _anuncio_logo(patro, acc.darkened(0.5), Color.WHITE, ANCHA)
		anchas.insert(1, _club["patro"])
	var fabrica: Texture2D = KitBrands.for_team(club) if not club.is_empty() else null
	if fabrica != null:
		_club["marca_tex"] = fabrica
		_club["marca"] = _anuncio_logo(fabrica, Color("14181f"), Color.WHITE, ANCHA)
		altas.insert(0, _anuncio_logo(fabrica, Color("14181f"), Color.WHITE, ALTA))
	_club["escudo"] = _anuncio_escudo()


	cuadradas.append(_club["escudo"])
	_anuncios = {ANCHA: anchas, ALTA: altas, CUADRADA: cuadradas}


func _px_anuncio(forma: String) -> Vector2i:
	match forma:
		ANCHA:
			return Vector2i(320, 160)
		ALTA:
			return Vector2i(128, 320)
	return Vector2i(240, 240)




func _anuncio_ficticio(m: Array, forma: String) -> Texture2D:
	var px: Vector2i = _px_anuncio(forma)
	var lz: Array = _lienzo(px)
	var root: Control = lz[1]
	var fondo: Color = m[1]
	var tinta: Color = m[2]
	_rect(root, Rect2(Vector2.ZERO, Vector2(px)), fondo)
	var franja: ColorRect = ColorRect.new()
	franja.color = Color(tinta, 0.8)
	franja.size = Vector2(float(px.x) * 1.8, float(px.y) * 0.14)
	franja.position = Vector2(- float(px.x) * 0.4, float(px.y) * 0.74)
	franja.rotation = -0.2
	root.add_child(franja)
	var nombre: String = String(m[0])
	if forma == ALTA:
		var palabras: PackedStringArray = nombre.split(" ", false)
		var alto: float = float(px.y) * 0.56 / float(maxi(palabras.size(), 1))
		for k in palabras.size():
			_texto(root, palabras[k], Rect2(Vector2(4.0, float(px.y) * 0.1 + alto * float(k)),
				Vector2(float(px.x) - 8.0, alto)), _cuerpo_que_cabe(palabras[k], px.x - 8, 44),
				tinta)
	else:
		_texto(root, nombre, Rect2(Vector2(8.0, float(px.y) * 0.16),
			Vector2(float(px.x) - 16.0, float(px.y) * 0.46)),
			_cuerpo_que_cabe(nombre, px.x - 16, 48), tinta)
	return (lz[0] as SubViewport).get_texture()















func _anuncio_logo(tex: Texture2D, fondo: Color, tinte: Color, forma: String) -> Texture2D:
	var px: Vector2i = _px_anuncio(forma)
	var lz: Array = _lienzo(px)
	var root: Control = lz[1]
	_rect(root, Rect2(Vector2.ZERO, Vector2(px)), fondo)
	var tr: TextureRect = TextureRect.new()
	tr.texture = Pecho.marca_para(tex, {"kit": fondo})
	tr.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	tr.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	tr.position = Vector2(px) * 0.1
	tr.size = Vector2(px) * 0.8
	tr.modulate = tinte
	root.add_child(tr)
	return (lz[0] as SubViewport).get_texture()



func _anuncio_escudo() -> Texture2D:
	var lz: Array = _lienzo(Vector2i(240, 240))
	var root: Control = lz[1]
	_rect(root, Rect2(0, 0, 240, 240), CareerTheme.accent_of(team()).darkened(0.3))
	var esc: CrestView = CrestView.new()
	esc.position = Vector2(50, 16)
	esc.size = Vector2(140, 140)
	esc.custom_minimum_size = Vector2(140, 140)
	root.add_child(esc)
	esc.set_team(team())
	var nombre: String = CareerTheme.caps(String(team().get("name", "")))
	_texto(root, nombre, Rect2(8, 170, 224, 56), _cuerpo_que_cabe(nombre, 224, 40),
		Color("f4f1ec"))
	return (lz[0] as SubViewport).get_texture()







func _campanas() -> void:
	var col: Color = Sponsors.color_of(_marca())
	var tinta: Color = Color("f4f1ec")
	var look: Dictionary = GameState.player_look()
	var marca: String = _nombre_marca()
	var ape: String = Career.nombre_espalda()
	var num: String = str(shirt())
	var linea: String = ape + " " + num

	var a: Array = _lienzo(Vector2i(400, 200))
	var ra: Control = a[1]
	_rect(ra, Rect2(0, 0, 400, 200), col.darkened(0.45))
	_rect(ra, Rect2(214, 0, 186, 164), col)
	_cara(ra, look, Rect2(10, 6, 196, 158), 0.5)
	_logo(ra, Rect2(267, 8, 80, 80))
	_texto(ra, marca, Rect2(216, 92, 182, 34), _cuerpo_que_cabe(marca, 182, CareerTheme.T_BODY),
		tinta)
	_texto(ra, linea, Rect2(216, 126, 182, 34), _cuerpo_que_cabe(linea, 182, CareerTheme.T_BODY),
		col.lightened(0.6))
	_franja_club(ra, Rect2(0, 164, 400, 36))

	var b: Array = _lienzo(Vector2i(160, 320))
	var rb: Control = b[1]
	_rect(rb, Rect2(0, 0, 160, 320), col.darkened(0.45))
	_rect(rb, Rect2(0, 0, 160, 148), col)
	_cara(rb, look, Rect2(8, 6, 144, 142), 0.5)
	_logo(rb, Rect2(54, 152, 52, 52))
	_texto(rb, marca, Rect2(4, 206, 152, 26), _cuerpo_que_cabe(marca, 152, CareerTheme.T_DIM),
		tinta)
	_texto(rb, linea, Rect2(4, 232, 152, 30), _cuerpo_que_cabe(linea, 152, CareerTheme.T_BODY),
		col.lightened(0.6))
	_franja_club(rb, Rect2(0, 268, 160, 52))

	var c: Array = _lienzo(Vector2i(256, 256))
	var rc: Control = c[1]
	_rect(rc, Rect2(0, 0, 256, 256), col)
	_cara(rc, look, Rect2(4, 28, 172, 150), 0.55)
	_texto(rc, num, Rect2(176, 40, 78, 64), CareerTheme.T_TITLE, tinta)
	_logo(rc, Rect2(196, 112, 48, 48))
	_rect(rc, Rect2(0, 178, 256, 36), col.darkened(0.5))
	_texto(rc, ape, Rect2(6, 178, 244, 36), _cuerpo_que_cabe(ape, 244, CareerTheme.T_MONEY),
		tinta)
	_texto(rc, marca, Rect2(6, 2, 244, 26), _cuerpo_que_cabe(marca, 244, CareerTheme.T_DIM),
		tinta)
	_franja_club(rc, Rect2(0, 214, 256, 42))
	_campana = {ANCHA:(a[0] as SubViewport).get_texture(),
		ALTA:(b[0] as SubViewport).get_texture(), CUADRADA:(c[0] as SubViewport).get_texture()}





func _franja_club(root: Control, r: Rect2) -> void:
	_rect(root, r, Color("101218"))
	var hueco: float = r.size.x / 3.0
	var alto: float = r.size.y - 8.0
	var esc: CrestView = CrestView.new()
	esc.position = Vector2(r.position.x +(hueco - alto) * 0.5, r.position.y + 4.0)
	esc.size = Vector2(alto, alto)
	esc.custom_minimum_size = Vector2(alto, alto)
	root.add_child(esc)
	esc.set_team(team())
	var k: int = 1
	for tex in [_club.get("patro_tex"), _club.get("marca_tex")]:
		if tex != null:
			var tr: TextureRect = TextureRect.new()
			tr.texture = tex
			tr.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
			tr.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
			tr.position = Vector2(r.position.x + hueco * float(k) + 6.0, r.position.y + 5.0)
			tr.size = Vector2(hueco - 12.0, r.size.y - 10.0)
			root.add_child(tr)
		k += 1


func _cara(root: Control, ropa: Dictionary, r: Rect2, zoom: float) -> void:
	var img: Image = retrato_image(int(r.size.x), int(r.size.y), ropa, zoom)
	if img == null:
		return
	var tr: TextureRect = TextureRect.new()
	tr.texture = ImageTexture.create_from_image(img)
	tr.stretch_mode = TextureRect.STRETCH_SCALE
	tr.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	tr.position = r.position
	tr.size = r.size
	root.add_child(tr)


func _logo(root: Control, r: Rect2) -> void:
	var logo: SponsorLogo = SponsorLogo.new()
	logo.position = r.position
	logo.size = r.size
	root.add_child(logo)
	logo.setup(_marca(), Color("f4f1ec"))



func _cinta_tex() -> Texture2D:
	var lz: Array = _lienzo(Vector2i(1024, 24))
	var root: Control = lz[1]
	_rect(root, Rect2(0, 0, 1024, 24), Color("0a0b0f"))
	var noticia: String = I18n.tf("{0} FIRMA CON {1}", [Career.nombre_espalda(),
		_nombre_marca()])
	var linea: String = "%s   %s   -   %s   -   " % [I18n.t("ÚLTIMA HORA"), noticia,
		String(team().get("name", ""))]
	var l: Label = Label.new()
	l.text = CareerTheme.caps(linea + linea + linea)
	l.clip_text = true
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	l.add_theme_font_size_override("font_size", 16)
	l.add_theme_color_override("font_color", Color("ffc933"))
	l.size = Vector2(1024, 24)
	root.add_child(l)
	return (lz[0] as SubViewport).get_texture()






func _calle() -> void:
	for s in [-1.0, 1.0]:
		var sx: float = float(s)
		for z in [-4.0, -28.0, -52.0, -76.0]:
			_farola(Vector3(sx *(PLAZA_HX + 0.4), 0.0, float(z)), sx)
		_semaforo(Vector3(sx *(PLAZA_HX + 0.5), 0.0, -33.4))
	_chimenea(Vector3(- PLAZA_HX - 2.5, 0.0, -17.0))


func _farola(at: Vector3, sx: float) -> void:
	var gris: Color = Color("3a3d44")
	_cilindro(at + Vector3(0.0, 3.75, 0.0), 0.1, 7.5, gris)
	_caja(at + Vector3(sx * 0.7, 7.45, 0.0), Vector3(1.4, 0.1, 0.1), gris)
	_caja(at + Vector3(sx * 1.35, 7.3, 0.0), Vector3(0.5, 0.18, 0.3), Color("ffe2b0"), 2.0)


func _semaforo(at: Vector3) -> void:
	_cilindro(at + Vector3(0.0, 2.1, 0.0), 0.08, 4.2, Color("2a2c31"))
	_caja(at + Vector3(0.0, 3.9, 0.0), Vector3(0.36, 1.0, 0.3), Color("22242a"))
	for k in 3:
		var rojo: bool = k == 0
		_esfera(at + Vector3(0.0, 4.22 - float(k) * 0.3, 0.17), 0.09,
			Color("ff3b30") if rojo else Color("3a3d44"), 2.5 if rojo else 0.0)


func _chimenea(at: Vector3) -> void:
	for k in 4:
		_cilindro(at + Vector3(0.0, 0.33 + float(k) * 0.65, 0.0), 0.32, 0.65,
			Color("ff6a13") if k % 2 == 0 else Color("f2f0ea"))
	for j in 5:
		var h: MeshInstance3D = _quad(Vector2(1.6, 1.6), Color(0.86, 0.86, 0.9, 0.0), true)
		(h.material_override as StandardMaterial3D).albedo_texture = _humo_tex()
		h.position = at + Vector3(0.0, 2.8, 0.0)
		_vapor.append(h)




func _taxis_de_la_calle() -> void:
	for i in 7:
		var sx: float = -1.0 if i % 2 == 0 else 1.0
		var carril: float = sx *(12.8 if (i / 2) % 2 == 0 else 15.3)
		var n: Node3D = _taxi(sx)
		n.position = Vector3(carril, 0.0, _r.randf_range(-84.0, 14.0))
		_taxis.append({"n": n, "v": sx * _r.randf_range(6.0, 9.5)})





func _taxi(dir: float) -> Node3D:
	var n: Node3D = Node3D.new()
	viewport.add_child(n)
	var amarillo: Color = Color("f3b91d")
	_caja_en(n, Vector3(0.0, 0.62, 0.0), Vector3(1.8, 0.6, 4.7), amarillo)
	_caja_en(n, Vector3(0.0, 1.15, -0.15 * dir), Vector3(1.64, 0.5, 2.4), amarillo)
	_caja_en(n, Vector3(0.0, 1.17, -0.15 * dir), Vector3(1.68, 0.3, 2.2), Color("1b2129"))
	_caja_en(n, Vector3(0.0, 1.5, -0.15 * dir), Vector3(0.78, 0.2, 0.3), Color("fff3c4"), 1.8)
	for hx in [-0.62, 0.62]:
		_caja_en(n, Vector3(float(hx), 0.66, 2.36 * dir), Vector3(0.36, 0.14, 0.06),
			Color("fff6dc"), 2.4)
		_caja_en(n, Vector3(float(hx), 0.7, -2.36 * dir), Vector3(0.3, 0.12, 0.06),
			Color("ff2a2a"), 2.0)
	for hx in [-0.9, 0.9]:
		for hz in [-1.5, 1.5]:
			_cilindro(Vector3(float(hx), 0.36, float(hz)), 0.36, 0.24, Color("17181b"),
				Vector3(0.0, 0.0, 90.0), 0.0, n)
	return n





func _gente(kit: Dictionary) -> void:


	var ellos: Array[Dictionary] = GenteCalle.ellos(self, kit, 10, [IDLE_NORTH, CLAP_NORTH],
		false)
	var ellas: Array[Dictionary] = GenteCalle.ellas(self, 6)
	var px_base: float = PLAYER_HEIGHT_M / PLAYER_METRICS.x
	var sitios: Array[Vector3] = []
	var intentos: int = 0
	while sitios.size() < GENTE and intentos < 600:
		intentos += 1
		var at: Vector3 = Vector3(_r.randf_range(-9.6, 9.6), 0.02,
			_r.randf_range(-22.0, -6.5))

		if absf(at.x) < 1.7 and at.z > -13.0:
			continue
		var cerca: bool = false
		for o in sitios:
			if Vector2(o.x - at.x, o.z - at.z).length() < 1.1:
				cerca = true
				break
		if not cerca:
			sitios.append(at)



	sitios.sort_custom(func(a: Vector3, b: Vector3) -> bool: return a.x < b.x)
	for k in 6:
		var paso: int = 1 +(k % 3) * 2
		sitios.append(Vector3(-5.0 + float(k) * 2.0 + _r.randf_range(-0.4, 0.4),
			0.42 * float(paso + 1), 3.6 + float(paso)))
	var nh: int = 0
	var nm: int = 0
	for i in sitios.size():

		var p: Dictionary = {}
		if not ellas.is_empty() and (i % 5 == 1 or i % 5 == 3):
			p = ellas[(nm * 3) % ellas.size()]
			nm += 1
		else:
			p = ellos[(nh * 3) % ellos.size()]
			nh += 1
		var s: AnimatedSprite3D = _persona(p["frames"],
			float(p["px"]) * _r.randf_range(0.93, 1.05))
		var y: float = sitios[i].y + feet_offset(s.pixel_size, String(p["hoja"]) + "00.png") \
				- PLAYER_SINK
		s.position = Vector3(sitios[i].x, y, sitios[i].z)
		_fans.append(s)
		_fans_y.append(y)
		_fans_salto.append(_r.randf_range(0.03, 0.1))
		_fans_ritmo.append(_r.randf_range(5.0, 7.2))
		if String(p["hoja"]) == CLAP_NORTH:
			var movil: MeshInstance3D = _quad(Vector2(0.075, 0.13), Color("d8ecff"), false, 2.6)
			viewport.remove_child(movil)
			s.add_child(movil)
			movil.position = Vector3(_r.randf_range(-0.05, 0.05),
				sitios[i].y + 1.86 * s.pixel_size / px_base - y, 0.06)
			movil.visible = false
			_moviles.append(movil)





func _paseantes_de_la_plaza() -> void:
	for i in PASEOS.size():
		var p: Array = PASEOS[i]
		var rumbo: String = String(p[2])
		var c: Dictionary = GenteCalle.caminante(i, i % 2 == 1, rumbo)
		var s: AnimatedSprite3D = _persona(c["frames"],
			float(c["px"]) * _r.randf_range(0.95, 1.04))
		var y: float = feet_offset(s.pixel_size, String(c["pie"])) - PLAYER_SINK \
				+(ACERA_Y if absf(float(p[0])) > CALZADA_HX else 0.0)
		var v: float = _r.randf_range(1.2, 1.45)
		var largo: float = float(p[3])
		var off: float = _r.randf_range(0.0, maxf(largo - v *(T_CARD + 3.0), 0.0))
		var desde: Vector3 = Vector3(float(p[0]), y, float(p[1]))


		s.position = desde +(RUMBOS[rumbo] as Vector3) * off
		_paseantes.append({"spr": s, "desde": desde, "dir": RUMBOS[rumbo], "v": v,
			"largo": largo, "off": off})




func _tick(delta: float) -> void:

	var k: float = clampf((t - 0.3) /(T_LLEGA - 0.3), 0.0, 1.0)
	_colocar(DESDE.lerp(HASTA, smoothstep(0.0, 1.0, k)))
	if k < 1.0:
		walk_play(player, HASTA - DESDE)
	else:
		if not _llego:


			_llego = true
			walk_play(player, Vector3.ZERO)
		idle_play(player, Vector3(0.0, 0.0, -1.0))
	if not _golpe and t >= T_GOLPE:
		_dar_golpe()
	_vive_la_plaza(delta)





func _vive_la_plaza(delta: float) -> void:
	for w in _paseantes:
		var d: float = fmod(float(w["off"]) + t * float(w["v"]), float(w["largo"]))
		(w["spr"] as AnimatedSprite3D).position =(w["desde"] as Vector3) \
				+(w["dir"] as Vector3) * d

	for p in _pantallas:
		if _golpe and not bool(p["hecha"]) and t >= T_GOLPE + float(p["retraso"]):
			_cambia(p)
		var f: float = float(p["flash"])
		if f >= 0.0:
			var a: float = clampf((t - f) / 0.3, 0.0, 1.0)
			var b: float = lerpf(3.2, BRILLO, a)
			(p["mat"] as StandardMaterial3D).albedo_color = Color(b, b, b)
			if a >= 1.0:
				p["flash"] = -1.0
	if _cinta_mat != null:
		_cinta_mat.uv1_offset.x = fmod(t * 0.045, 1.0)

	var mas: float = 1.0 if _golpe else 0.2
	for i in _fans.size():
		_fans[i].position.y = _fans_y[i] \
				+ absf(sin(t * _fans_ritmo[i] + float(i) * 1.7)) * _fans_salto[i] * mas
	for tx in _taxis:
		var n: Node3D = tx["n"]
		n.position.z += float(tx["v"]) * delta
		if n.position.z < FONDO_Z:
			n.position.z += 104.0
		elif n.position.z > 18.0:
			n.position.z -= 104.0
	for j in _vapor.size():
		var h: MeshInstance3D = _vapor[j]
		var ciclo: float = fmod(t * 0.32 + float(j) / float(_vapor.size()), 1.0)
		h.position.y = 2.8 + ciclo * 4.5
		h.position.x = - PLAZA_HX - 2.5 + ciclo * 0.8
		h.scale = Vector3.ONE *(0.5 + ciclo * 1.6)
		(h.material_override as StandardMaterial3D).albedo_color.a = 0.5 *(1.0 - ciclo)
	if _bola != null:
		var bm: StandardMaterial3D =(_bola.mesh as SphereMesh).material as StandardMaterial3D
		bm.emission_energy_multiplier = 2.2 + sin(t * 3.0) * 0.6




func _dar_golpe() -> void:
	_golpe = true
	for m in _moviles:
		m.visible = true
	sting("fanfare", -6.0)
	applause(true, -13.0)
	ovation(2.0)
	punch_fov(2.0, 0.4)


func _cambia(p: Dictionary) -> void:
	p["hecha"] = true
	p["flash"] = t
	(p["mat"] as StandardMaterial3D).albedo_texture = _campana.get(String(p["forma"]))


func _skipped() -> void:
	if not _golpe:
		_dar_golpe()
	for p in _pantallas:
		if not bool(p["hecha"]):
			_cambia(p)
		p["flash"] = -1.0
		(p["mat"] as StandardMaterial3D).albedo_color = Color(BRILLO, BRILLO, BRILLO)
	_colocar(HASTA)
	_llego = true
	walk_play(player, Vector3.ZERO)
	idle_play(player, Vector3(0.0, 0.0, -1.0))


func _colocar(at: Vector3) -> void:
	player.position = Vector3(at.x, at.y + feet_offset(player.pixel_size) - PLAYER_SINK,
		at.z)






func _lienzo(px: Vector2i) -> Array:
	var vp: SubViewport = SubViewport.new()
	vp.size = px
	vp.disable_3d = true
	vp.transparent_bg = false
	vp.render_target_update_mode = SubViewport.UPDATE_ONCE
	add_child(vp)
	var root: Control = Control.new()
	root.size = Vector2(px)
	vp.add_child(root)
	return [vp, root]


func _rect(root: Control, r: Rect2, col: Color) -> void:
	var c: ColorRect = ColorRect.new()
	c.color = col
	c.position = r.position
	c.size = r.size
	root.add_child(c)





func _cuerpo_que_cabe(txt: String, ancho: int, techo: int) -> int:
	var fuente: Font = get_theme_default_font()
	var t: String = CareerTheme.caps(txt)
	var cuerpo: int = techo
	while cuerpo > 8 and fuente.get_string_size(t, HORIZONTAL_ALIGNMENT_LEFT, -1,
			cuerpo).x + 8.0 > float(ancho):
		cuerpo -= 1
	return cuerpo




func _texto(root: Control, txt: String, r: Rect2, size_px: int, col: Color) -> void:
	var l: Label = Label.new()
	l.text = CareerTheme.caps(txt)
	l.clip_text = true
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	l.add_theme_font_size_override("font_size", size_px)
	l.add_theme_color_override("font_color", col)
	l.add_theme_color_override("font_outline_color", Color(0, 0, 0, 0.55))
	l.add_theme_constant_override("outline_size", 4)
	l.position = r.position
	l.size = r.size
	root.add_child(l)


func _persona(frames: SpriteFrames, px: float) -> AnimatedSprite3D:
	var spr: AnimatedSprite3D = AnimatedSprite3D.new()
	spr.sprite_frames = frames
	spr.pixel_size = px
	spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	spr.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	viewport.add_child(spr)
	spr.play("idle")
	spr.frame = _r.randi() % maxi(1, frames.get_frame_count("idle"))
	spr.speed_scale = _r.randf_range(0.8, 1.2)
	return spr



func _humo_tex() -> ImageTexture:
	if _humo_textura != null:
		return _humo_textura
	var n: int = 32
	var img: Image = Image.create(n, n, false, Image.FORMAT_RGBA8)
	for y in n:
		for x in n:
			var d: float = Vector2(float(x) + 0.5 - float(n) * 0.5,
				float(y) + 0.5 - float(n) * 0.5).length() /(float(n) * 0.5)
			var a: float = clampf(1.0 - d, 0.0, 1.0)
			img.set_pixel(x, y, Color(1.0, 1.0, 1.0, a * a))
	_humo_textura = ImageTexture.create_from_image(img)
	return _humo_textura


func _mat(col: Color, emis: float = 0.0) -> StandardMaterial3D:
	var m: StandardMaterial3D = StandardMaterial3D.new()
	m.albedo_color = col
	m.roughness = 0.7
	if emis > 0.0:
		m.emission_enabled = true
		m.emission = col
		m.emission_energy_multiplier = emis
	return m


func _caja(at: Vector3, size: Vector3, col: Color, emis: float = 0.0) -> MeshInstance3D:
	return _caja_en(viewport, at, size, col, emis)


func _caja_en(padre: Node, at: Vector3, size: Vector3, col: Color,
		emis: float = 0.0) -> MeshInstance3D:
	var m: MeshInstance3D = MeshInstance3D.new()
	var box: BoxMesh = BoxMesh.new()
	box.size = size
	box.material = _mat(col, emis)
	m.mesh = box
	m.position = at
	m.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	padre.add_child(m)
	return m


func _cilindro(at: Vector3, r: float, alto: float, col: Color,
		giro: Vector3 = Vector3.ZERO, emis: float = 0.0,
		padre: Node3D = null) -> MeshInstance3D:
	var m: MeshInstance3D = MeshInstance3D.new()
	var c: CylinderMesh = CylinderMesh.new()
	c.top_radius = r
	c.bottom_radius = r
	c.height = alto
	c.radial_segments = 16 if r < 0.5 else 32
	c.rings = 1
	c.material = _mat(col, emis)
	m.mesh = c
	m.rotation_degrees = giro
	m.position = at
	m.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	(padre if padre != null else viewport).add_child(m)
	return m


func _esfera(at: Vector3, r: float, col: Color, emis: float = 0.0) -> MeshInstance3D:
	var m: MeshInstance3D = MeshInstance3D.new()
	var s: SphereMesh = SphereMesh.new()
	s.radius = r
	s.height = r * 2.0
	s.material = _mat(col, emis)
	m.mesh = s
	m.position = at
	m.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	viewport.add_child(m)
	return m




func _quad(size: Vector2, col: Color, cartel: bool = false,
		emis: float = 0.0) -> MeshInstance3D:
	var m: MeshInstance3D = MeshInstance3D.new()
	var q: QuadMesh = QuadMesh.new()
	q.size = size
	m.mesh = q
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.albedo_color = col if emis <= 0.0 \
			else Color(col.r * emis, col.g * emis, col.b * emis, col.a)
	if col.a < 0.999 or cartel:
		mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	if cartel:
		mat.billboard_mode = BaseMaterial3D.BILLBOARD_ENABLED
	m.material_override = mat
	m.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	viewport.add_child(m)
	return m
