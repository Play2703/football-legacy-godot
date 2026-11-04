extends Ceremony









































const T_SALE: float = 0.6
const T_LLEGA: float = 3.4
const T_ZOOM: float = 4.3




const KIOSCO: Vector3 = Vector3(1.95, 0.0, 5.6)


const PORTADA: Vector3 = Vector3(1.95, 1.42, 6.24)






const KIOSCO_X: Vector2 = Vector2(0.75, 3.2)
const KIOSCO_Z: Vector2 = Vector2(4.35, 6.65)

const P_INICIO: Vector3 = Vector3(-3.0, 0.0, 6.0)


const P_KIOSCO: Vector3 = Vector3(0.05, 0.0, 6.6)





const CARRIL_Z: float = 4.15
const CARRIL_X: Vector2 = Vector2(-9.0, 9.0)
















const KEYS: Array = [
	{"t": 0.0, "dist": 21.0, "h": 7.0, "yaw": 187.0, "aim_y": 5.0, "fov": 52.0,
		"focus_x": -0.3, "focus_z": 4.2},
	{"t": T_LLEGA, "dist": 15.0, "h": 3.2, "yaw": 182.0, "aim_y": 2.2,
		"fov": 46.0, "focus_x": 0.6, "focus_z": 5.6},



	{"t": T_ZOOM, "dist": 5.0, "h": 2.0, "yaw": 180.0, "aim_y": 1.6,
		"fov": 38.0, "focus_x": PORTADA.x, "focus_z": PORTADA.z},




	{"t": T_ZOOM + 1.5, "dist": 2.0, "h": PORTADA.y - 0.07, "yaw": 180.0,
		"aim_y": PORTADA.y - 0.07, "fov": 26.0,
		"focus_x": PORTADA.x, "focus_z": PORTADA.z},
]



const PAGE_W: int = 132
const PAGE_H: int = 180

const PAGE_M: float = 0.0035
const PAPEL: Color = Color("e6e0cd")
const TINTA: Color = Color("22201c")




const CAB_H: int = 20
const TIT_Y: int = 30
const TIT_SALTO: int = 19
const TIT_LINEAS: int = 2
const GANO_Y: int = 70
const FOTO_Y: int = 82
const FOTO_H: int = 60
const MARC_Y: int = 148

var _walker: AnimatedSprite3D
var _gente: Array[AnimatedSprite3D] = []
var _golpeado: bool = false
var _win: bool = false


var _signing: bool = false
var _rival: Dictionary = {}
var _ganador: Dictionary = {}


var _huecos: Array = []


func _build() -> void:
	_signing = String(data.get("mode", "")) == "signing"

	_win = true if _signing else bool(data.get("win", true))
	_rival = {} if _signing else _rival_team()



	_ganador = team() if _win else _rival
	_mundo()
	_manzana()
	_fans_balcon()
	_kiosco()
	focus = Vector3(0.0, 0.0, 5.4)


	_walker = make_player(KitRecolor.casual_of(GameState.team_custom), "south")
	_add_casual_walk(_walker)
	_place(_walker, P_INICIO)
	if _win:
		_corrillo()
	else:
		_calle_vacia()
	_calle_andando()
	make_camera(KEYS)
	make_chyron(I18n.t("DEADLINE DAY") if _signing else I18n.t("EL DIA DESPUES"),


		CareerTheme.caps(Career.player_name) if _signing \
				else Nations.team_label(_rival).to_upper(), team(), 1.3)
	card_at = 7.8
	make_card()
	_montar_ficha()



	orbit_speed = -0.12




func _rival_team() -> Dictionary:
	var opp: String = String(data.get("opp", ""))
	if opp.is_empty():
		return {}
	if not String(data.get("nation", "")).is_empty():
		return Nations.as_team(opp)
	var club: Dictionary = Teams.by_id(opp)
	return club if not club.is_empty() else Nations.as_team(opp)






func _mundo() -> void:
	var env: WorldEnvironment = WorldEnvironment.new()
	var e: Environment = Environment.new()
	e.background_mode = Environment.BG_COLOR
	e.background_color = Color("a8c0d6") if _win else Color("8e97a2")
	e.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	e.ambient_light_color = Color("f2ecdc") if _win else Color("ccced3")
	e.ambient_light_energy = 1.45 if _win else 1.15
	viewport.add_child(env)
	env.environment = e




	var sol: DirectionalLight3D = DirectionalLight3D.new()
	sol.light_color = Color("fff0d4") if _win else Color("e2e6ec")
	sol.light_energy = 1.5 if _win else 1.0
	sol.rotation_degrees = Vector3(-40.0, 32.0, 0.0)
	viewport.add_child(sol)


	_caja(Vector3(0.0, -0.5, 11.0), Vector3(80.0, 1.0, 10.0), Color("3b3b40"))
	_caja(Vector3(0.0, 0.075, 5.6), Vector3(80.0, 0.15, 4.2),
		Color("9a978e") if _win else Color("8b8985"))
	_caja(Vector3(0.0, 0.1, 7.68), Vector3(80.0, 0.2, 0.16), Color("b3b0a6"))

	for i in 7:
		_caja(Vector3(-4.5 + float(i) * 1.5, 0.02, 10.0),
			Vector3(0.55, 0.04, 3.0), Color("c9c6bb"))







func _manzana() -> void:
	var r: RandomNumberGenerator = RandomNumberGenerator.new()
	r.seed = hash("manzana_derbi")
	var dim: float = 0.0 if _win else 0.12


	for fila in 2:
		var z: float = -22.0 + float(fila) * 9.0
		var x: float = -30.0
		while x < 30.0:
			var w: float = r.randf_range(4.0, 7.5)
			var h: float = r.randf_range(14.0, 30.0) - float(fila) * 3.0
			var tono: Color = Color("6c7180").lerp(Color("aeb6c4"),
				r.randf()).darkened(0.28 - float(fila) * 0.12 + dim)
			_caja(Vector3(x + w * 0.5, h * 0.5, z), Vector3(w, h, 6.0), tono)
			x += w + r.randf_range(0.4, 1.6)

	var x2: float = -26.0
	while x2 < 26.0:
		var w2: float = r.randf_range(5.0, 8.0)
		_edificio(r, x2 + w2 * 0.5, w2, dim)
		x2 += w2 + 0.25

	_farola(-4.4)
	_farola(4.4)
	_calle_detalle()







func _calle_detalle() -> void:
	var r: RandomNumberGenerator = RandomNumberGenerator.new()
	r.seed = hash("mobiliario")


	var coches: Array = [-8.5, -6.4, -4.6, 5.2, 7.1, 9.0]
	var tonos: Array = [Color("b5563f"), Color("3a5f8a"), Color("d8d2c2"),
		Color("4a4d52"), Color("6f8a5a"), Color("9a9ea4")]
	for i in coches.size():
		_coche(float(coches[i]), 8.55, tonos[i % tonos.size()],
			float(coches[i]) < 0.0)




	for ax in [-6.8, 6.4, -9.2]:
		_arbol(float(ax), 3.75)
	_papelera(-4.0, 3.75)
	_contenedor(-7.6, 3.8)
	_senal(5.6, 3.75)
	_bolardos()



	if _win:
		_confeti_suelo(r)



func _arbol(x: float, z: float) -> void:
	_caja(Vector3(x, 0.12, z), Vector3(0.7, 0.14, 0.7), Color("6b6560"))
	_caja(Vector3(x, 1.15, z), Vector3(0.18, 2.0, 0.18), Color("4a3626"))
	_caja(Vector3(x, 2.5, z), Vector3(1.5, 1.5, 1.5), Color("3f6b43"))
	_caja(Vector3(x + 0.3, 3.2, z - 0.2), Vector3(1.0, 1.0, 1.0),
		Color("477a4c"))


func _papelera(x: float, z: float) -> void:
	_caja(Vector3(x, 0.5, z), Vector3(0.42, 0.7, 0.42), Color("46484d"))
	_caja(Vector3(x, 0.9, z), Vector3(0.5, 0.08, 0.5), Color("38393d"))


func _contenedor(x: float, z: float) -> void:
	_caja(Vector3(x, 0.55, z), Vector3(1.5, 1.1, 0.9), Color("3f6f52"))
	_caja(Vector3(x, 1.12, z), Vector3(1.6, 0.14, 1.0), Color("335c44"))

	for s in [-1.0, 1.0]:
		_caja(Vector3(x + s * 0.6, 0.06, z), Vector3(0.16, 0.16, 0.16),
			Color("1c1d20"))


func _senal(x: float, z: float) -> void:
	_caja(Vector3(x, 1.3, z), Vector3(0.08, 2.6, 0.08), Color("8a8d92"))
	_caja(Vector3(x, 2.5, z + 0.05), Vector3(0.5, 0.5, 0.05), Color("2f6bb0"))




func _bolardos() -> void:
	for x in [-3.4, -5.0, 4.6, 6.2, 7.8]:
		_caja(Vector3(float(x), 0.32, 7.55), Vector3(0.14, 0.62, 0.14),
			Color("4a4c50"))
		_caja(Vector3(float(x), 0.64, 7.55), Vector3(0.16, 0.06, 0.16),
			Color("caa64a"))





func _confeti_suelo(r: RandomNumberGenerator) -> void:
	var kit: Dictionary = GameState.kit_variant(_ganador, 0)
	var cols: Array = [kit.get("kit", CareerTheme.accent()),
		kit.get("kit2", CareerTheme.MONEY), Color("e8e4d6"), Color("d8c04a")]
	for i in 90:
		var x: float = r.randf_range(-11.0, 11.0)
		var z: float = r.randf_range(5.0, 7.6)
		_caja(Vector3(x, 0.17, z), Vector3(0.12, 0.02, 0.12),
			cols[r.randi() % cols.size()])

	for i in 10:
		_caja(Vector3(r.randf_range(-10.0, 10.0), 0.17,
			r.randf_range(5.0, 7.6)), Vector3(0.6, 0.02, 0.08),
			cols[r.randi() % cols.size()])




func _edificio(r: RandomNumberGenerator, cx: float, w: float, dim: float) -> void:
	var h: float = r.randf_range(11.0, 22.0)
	var muro: Color = [Color("9c8f7e"), Color("8d7f74"), Color("a8998a"),
		Color("7f7d80")][r.randi() % 4].darkened(dim)
	_caja(Vector3(cx, h * 0.5, 0.0), Vector3(w, h, 7.0), muro)

	_caja(Vector3(cx, h + 0.18, 0.2), Vector3(w + 0.5, 0.36, 7.4),
		muro.darkened(0.3))
	_caja(Vector3(cx, 3.2, 0.25), Vector3(w + 0.24, 0.24, 7.5),
		muro.darkened(0.22))


	var pisos: int = int((h - 4.0) / 2.6)
	var cols: int = maxi(int(w / 1.9), 2)
	for p in pisos:
		for c in cols:
			var vx: float = cx - w * 0.5 + w *(float(c) + 0.5) / float(cols)
			var vy: float = 4.4 + float(p) * 2.6
			var on: bool = r.randf() < 0.18
			_caja(Vector3(vx, vy, 3.53), Vector3(0.86, 1.18, 0.08),
				Color("ffdda2") if on else Color("2f3a45").darkened(dim),
				0.9 if on else 0.0)

			_caja(Vector3(vx, vy - 0.66, 3.55), Vector3(1.0, 0.09, 0.14),
				muro.darkened(0.35))



			if p <= 1 and r.randf() < 0.62:
				_balcon(vx, vy - 0.66, muro, dim)
				_huecos.append(Vector3(vx, vy - 0.66, 0.0))

	_caja(Vector3(cx, 1.7, 3.52), Vector3(w - 0.9, 2.2, 0.1),
		Color("2b3138").darkened(dim))
	var toldo: Color = [Color("7d3a34"), Color("2f5b4a"), Color("6b5a2a"),
		Color("3d4a6b")][r.randi() % 4].darkened(dim)
	_caja(Vector3(cx, 3.02, 3.95), Vector3(w - 0.6, 0.16, 0.95), toldo)
	_caja(Vector3(cx, 2.62, 4.4), Vector3(w - 0.6, 0.8, 0.08),
		toldo.darkened(0.18))


	for s in [-1.0, 1.0]:
		_caja(Vector3(cx + s *(w - 0.6) * 0.42, 2.85, 4.18),
			Vector3(0.05, 0.05, 0.5), muro.darkened(0.5))
	_caja(Vector3(cx + w * 0.28, 1.05, 3.56), Vector3(0.9, 2.1, 0.1),
		muro.darkened(0.45))


	var neon: Color = [Color("ff5a52"), Color("ffc34d"), Color("4dd0c0"),
		Color("ff8fb0")][r.randi() % 4]
	_caja(Vector3(cx - w * 0.15, 3.58, 3.6), Vector3(w * 0.5, 0.26, 0.06),
		neon.darkened(dim * 0.5), 0.7 if _win else 0.45)


	var bx: float = cx +(w * 0.5 - 0.18) *(1.0 if r.randf() < 0.5 else -1.0)
	_caja(Vector3(bx,(h - 3.6) * 0.5 + 3.6, 3.62), Vector3(0.14, h - 3.6, 0.14),
		muro.darkened(0.42))


	_caja(Vector3(cx - w * 0.2, 4.0, 3.66), Vector3(0.7, 0.44, 0.28),
		Color("c8ccce").darkened(dim))


	var ay: float = h + 0.36
	_caja(Vector3(cx + w * 0.2, ay + 0.9, 0.0), Vector3(0.06, 1.8, 0.06),
		Color("3a3d42"))
	for i in 3:
		_caja(Vector3(cx + w * 0.2, ay + 0.9 + float(i) * 0.35, 0.0),
			Vector3(0.5 - float(i) * 0.12, 0.05, 0.06), Color("3a3d42"))
	if r.randf() < 0.6:
		_caja(Vector3(cx - w * 0.22, ay + 0.5, 0.4), Vector3(0.5, 0.5, 0.12),
			Color("d8d4c8").darkened(dim))
		_caja(Vector3(cx - w * 0.22, ay + 0.2, 0.2), Vector3(0.08, 0.5, 0.08),
			Color("6a6a6e"))



	if pisos >= 3 and r.randf() < 0.7:
		var ty: float = 4.4 + float(pisos - 1) * 2.6 + 0.4
		_caja(Vector3(cx, ty, 3.7), Vector3(w * 0.7, 0.03, 0.03),
			Color("2a2a2c"))
		var ropa: Array = [Color("d9d2c4"), Color("6f96c4"), Color("c46f7a"),
			Color("8ab08a")]
		for i in 3:
			var px: float = cx - w * 0.22 + float(i) * w * 0.22
			_caja(Vector3(px, ty - 0.34, 3.72), Vector3(0.34, 0.6, 0.03),
				ropa[(r.randi()) % ropa.size()].darkened(dim))





const BAL_Z: float = 3.95
const BAL_FONDO: float = 0.8
const BAL_ANCHO: float = 1.5


func _balcon(x: float, y: float, muro: Color, dim: float) -> void:
	var hierro: Color = Color("3c3f45").darkened(dim)
	_caja(Vector3(x, y, BAL_Z), Vector3(BAL_ANCHO, 0.12, BAL_FONDO),
		muro.darkened(0.28))

	_caja(Vector3(x, y + 0.92, BAL_Z + BAL_FONDO * 0.5),
		Vector3(BAL_ANCHO, 0.07, 0.07), hierro)
	_caja(Vector3(x, y + 0.1, BAL_Z + BAL_FONDO * 0.5),
		Vector3(BAL_ANCHO, 0.06, 0.06), hierro)
	for i in 5:
		_caja(Vector3(x - BAL_ANCHO * 0.42 + float(i) * BAL_ANCHO * 0.21,
			y + 0.5, BAL_Z + BAL_FONDO * 0.5), Vector3(0.05, 0.9, 0.05), hierro)

	for s in [-1.0, 1.0]:
		_caja(Vector3(x + s * BAL_ANCHO * 0.5, y + 0.5, BAL_Z),
			Vector3(0.05, 0.9, BAL_FONDO), hierro)










const BALCON_GENTE: int = 6


func _fans_balcon() -> void:
	var cerca: Array = _huecos.filter(
		func(v: Vector3) -> bool: return absf(v.x) <= 6.0)
	cerca.sort_custom(func(a: Vector3, b: Vector3) -> bool:


		if is_equal_approx(absf(a.x), absf(b.x)):
			return a.y < b.y
		return absf(a.x) < absf(b.x))
	var r: RandomNumberGenerator = RandomNumberGenerator.new()
	r.seed = hash("balcones")
	var puestos: int = 0
	for v in cerca:
		if puestos >= BALCON_GENTE:
			break


		if r.randf() < 0.28:
			continue
		var who: AnimatedSprite3D = _casual_extra("balcon_%d" % puestos,
			"south", true)


		who.position = Vector3(v.x + r.randf_range(-0.28, 0.28),
			v.y + 0.06 + feet_offset(who.pixel_size,
				"res://assets/sprites/anim/casual_idle_south_00.png") - PLAYER_SINK,
			BAL_Z - 0.05)
		_gente.append(who)

		if puestos % 2 == 0:
			_trapo(Vector3(v.x, v.y + 0.52, BAL_Z + BAL_FONDO * 0.5 + 0.04))
		puestos += 1




func _trapo(at: Vector3) -> void:
	var kit: Dictionary = GameState.kit_variant(_ganador, 0)
	var c1: Color = kit.get("kit", CareerTheme.accent())
	var c2: Color = kit.get("kit2", CareerTheme.MONEY)
	_caja(at, Vector3(0.95, 0.42, 0.04), c1)
	_caja(at + Vector3(0.0, -0.4, 0.0), Vector3(0.95, 0.38, 0.04), c2)




func _farola(x: float) -> void:
	var col: Color = Color("55575c")
	_caja(Vector3(x, 1.9, 4.9), Vector3(0.12, 3.8, 0.12), col)
	_caja(Vector3(x, 3.72, 5.25), Vector3(0.12, 0.1, 0.8), col)
	_caja(Vector3(x, 3.62, 5.62), Vector3(0.34, 0.16, 0.34),
		Color("ffe7b8"), 0.5)


	if _win:
		var kit: Dictionary = GameState.kit_variant(_ganador, 0)
		_caja(Vector3(x, 2.7, 5.0), Vector3(0.05, 0.7, 0.28),
			kit.get("kit", CareerTheme.accent()))
		_caja(Vector3(x, 2.0, 5.0), Vector3(0.05, 0.7, 0.28),
			kit.get("kit2", CareerTheme.MONEY))






func _coche(x: float, z: float, col: Color, mira_der: bool) -> void:
	_caja(Vector3(x, 0.42, z), Vector3(2.6, 0.62, 1.4), col)
	_caja(Vector3(x +(0.15 if mira_der else -0.15), 0.95, z),
		Vector3(1.5, 0.55, 1.28), col.darkened(0.12))

	_caja(Vector3(x +(0.62 if mira_der else -0.62), 0.95, z + 0.66),
		Vector3(0.24, 0.42, 0.04), Color("20242a"))
	_caja(Vector3(x, 0.5, z + 0.72), Vector3(2.5, 0.5, 0.02),
		col.darkened(0.25))
	for s in [-1.0, 1.0]:
		_caja(Vector3(x + s * 0.85, 0.16, z + 0.6), Vector3(0.44, 0.32, 0.2),
			Color("18191c"))






func _kiosco() -> void:
	var cuerpo: Color = Color("2f5d55") if _win else Color("38484a")
	var madera: Color = Color("6a5340")





	_caja(KIOSCO + Vector3(0.0, 1.05, -0.95), Vector3(2.1, 2.1, 0.12), cuerpo)
	_caja(KIOSCO + Vector3(-1.0, 1.05, -0.35), Vector3(0.12, 2.1, 1.3),
		cuerpo.darkened(0.12))
	_caja(KIOSCO + Vector3(1.0, 1.05, -0.35), Vector3(0.12, 2.1, 1.3),
		cuerpo.darkened(0.12))
	_caja(KIOSCO + Vector3(0.0, 2.18, -0.35), Vector3(2.4, 0.16, 1.6),
		cuerpo.darkened(0.35))

	_caja(KIOSCO + Vector3(0.0, 2.05, 0.42), Vector3(2.3, 0.12, 0.95),
		Color("8e3b34") if _win else Color("5b5450"))
	_caja(KIOSCO + Vector3(0.0, 0.98, 0.6), Vector3(2.0, 0.12, 0.7), madera)
	_caja(KIOSCO + Vector3(0.0, 0.49, 0.6), Vector3(1.8, 0.86, 0.12),
		madera.darkened(0.25))


	var r: RandomNumberGenerator = RandomNumberGenerator.new()
	r.seed = hash("revistas")





	for fila in 3:
		for c in 2:
			_caja(KIOSCO + Vector3(-0.8 + float(c) * 0.48,
				1.86 - float(fila) * 0.42, 0.28),
				Vector3(0.42, 0.34, 0.05),
				Color.from_hsv(r.randf(), 0.35, r.randf_range(0.55, 0.85)))






	var hoja: MeshInstance3D = MeshInstance3D.new()
	var q: QuadMesh = QuadMesh.new()
	q.size = Vector2(float(PAGE_W) * PAGE_M, float(PAGE_H) * PAGE_M)
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = _portada_texture()
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	q.material = mat
	hoja.mesh = q
	hoja.position = PORTADA
	viewport.add_child(hoja)





	var escudo: Sprite3D = Sprite3D.new()
	escudo.texture = crest_texture(_ganador, 128)
	escudo.pixel_size = FOTO_H * PAGE_M / 128.0 * 0.86
	escudo.shaded = false
	escudo.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST



	escudo.position = PORTADA + Vector3(0.0,
		(float(PAGE_H) * 0.5 -(float(FOTO_Y) + float(FOTO_H) * 0.5)) * PAGE_M,
		0.012)
	viewport.add_child(escudo)




	var vendedor: AnimatedSprite3D = _casual_extra("kiosquero", "south")
	_place(vendedor, KIOSCO + Vector3(0.62, 0.0, -0.3))
	_gente.append(vendedor)









func _portada_texture() -> ImageTexture:
	var img: Image = Image.create(PAGE_W, PAGE_H, false, Image.FORMAT_RGBA8)
	img.fill(PAPEL)

	_rect(img, 0, 0, PAGE_W, 2, TINTA)
	_rect(img, 0, PAGE_H - 2, PAGE_W, 2, TINTA)
	_rect(img, 0, 0, 2, PAGE_H, TINTA)
	_rect(img, PAGE_W - 2, 0, 2, PAGE_H, TINTA)
	_rect(img, 2, 2, PAGE_W - 4, CAB_H, TINTA)
	var diario: String = I18n.t("EL DIARIO").to_upper()







	var cab_y: int = 2 +(CAB_H - PixelText.GLYPH_H * 3) / 2
	PixelText.draw_text(img,(PAGE_W - PixelText.text_width(diario, 3)) / 2, cab_y,
		diario, PAPEL, 3)
	_rect(img, 6, CAB_H + 5, PAGE_W - 12, 1, TINTA)
	if _signing:
		_portada_fichaje(img)
		return ImageTexture.create_from_image(img)














	var quien: String = Nations.team_label(_ganador).to_upper()
	var cuerpo: int = 3 if _partir(quien, 3, TIT_LINEAS + 1).size() <= TIT_LINEAS \
			else 2
	if _mia():
		quien = _mi_apellido()






		for c in [5, 4, 3]:
			if PixelText.text_width(quien, c) <= PAGE_W - 12:
				cuerpo = c
				break


	var lineas: Array = _partir(quien, cuerpo, TIT_LINEAS)
	var alto: int =(lineas.size() - 1) * TIT_SALTO + PixelText.GLYPH_H * cuerpo
	var y: int = TIT_Y + maxi((GANO_Y - 4 - TIT_Y - alto) / 2, 0)
	for linea in lineas:
		PixelText.draw_text(img,
			(PAGE_W - PixelText.text_width(linea, cuerpo)) / 2, y, linea,
			TINTA, cuerpo)
		y += TIT_SALTO
	var gano: String = I18n.t("GANO EL DERBI").to_upper()
	PixelText.draw_text(img,(PAGE_W - PixelText.text_width(gano, 2)) / 2, GANO_Y,
		gano, TINTA, 2)


	_rect(img, 12, FOTO_Y, PAGE_W - 24, FOTO_H, PAPEL.darkened(0.1))
	_rect(img, 12, FOTO_Y, PAGE_W - 24, 1, TINTA)
	_rect(img, 12, FOTO_Y + FOTO_H - 1, PAGE_W - 24, 1, TINTA)
	_rect(img, 12, FOTO_Y, 1, FOTO_H, TINTA)
	_rect(img, PAGE_W - 13, FOTO_Y, 1, FOTO_H, TINTA)


	var marcador: String = "%d-%d" % [maxi(int(data.get("gf", 0)),
		int(data.get("ga", 0))), mini(int(data.get("gf", 0)),
		int(data.get("ga", 0)))]
	PixelText.draw_text(img,
		(PAGE_W - PixelText.text_width(marcador, 4)) / 2, MARC_Y, marcador,
		TINTA, 4)



	for i in 4:
		var yy: int = MARC_Y + 2 + i * 5
		_rect(img, 8, yy, 22 -(i % 2) * 5, 2, TINTA.lerp(PAPEL, 0.45))
		_rect(img, PAGE_W - 30, yy, 22 -((i + 1) % 2) * 5, 2,
			TINTA.lerp(PAPEL, 0.45))
	return ImageTexture.create_from_image(img)





func _mia() -> bool:
	return _win and int(data.get("goles", 0)) > 0






func _mi_apellido() -> String:
	var partes: PackedStringArray = Career.player_name.strip_edges().split(" ", false)
	var ape: String =(partes[partes.size() - 1] if partes.size() > 0
		else Career.player_name).to_upper()
	ape = PixelText.normalize(ape).substr(0, 10).strip_edges()


	return ape if not ape.is_empty() else Nations.team_label(_ganador).to_upper()





func _partir(texto: String, px: int, max_lineas: int) -> Array:
	var out: Array = []
	var linea: String = ""
	for palabra in texto.split(" ", false):
		var prueba: String = palabra if linea.is_empty() else linea + " " + palabra
		if PixelText.text_width(prueba, px) <= PAGE_W - 12 or linea.is_empty():
			linea = prueba
		else:
			out.append(linea)
			linea = String(palabra)
		if out.size() >= max_lineas:
			return out
	if not linea.is_empty() and out.size() < max_lineas:
		out.append(linea)
	return out


func _rect(img: Image, x: int, y: int, w: int, h: int, col: Color) -> void:
	for j in h:
		for i in w:
			if x + i >= 0 and x + i < PAGE_W and y + j >= 0 and y + j < PAGE_H:
				img.set_pixel(x + i, y + j, col)







func _corrillo() -> void:



	var spots: Array = [[-1.55, 5.35], [-2.75, 5.85], [3.65, 6.15]]
	for i in spots.size():
		var who: AnimatedSprite3D = _casual_extra("corro_%d" % i,
			"west" if i < 2 else "north", true)
		_place(who, Vector3(float(spots[i][0]), 0.0, float(spots[i][1])))
		_gente.append(who)





func _calle_vacia() -> void:
	var solo: AnimatedSprite3D = _casual_extra("lector", "west", true)
	_place(solo, Vector3(3.7, 0.0, 6.2))
	_gente.append(solo)












const TRANSEUNTES: int = 5
var _paseantes: Array = []


func _calle_andando() -> void:
	var r: RandomNumberGenerator = RandomNumberGenerator.new()
	r.seed = hash("transeuntes")
	for i in TRANSEUNTES:


		var dir: float = 1.0 if i % 2 == 0 else -1.0
		var spr: AnimatedSprite3D = _casual_extra("paseo_%d" % i,
			"east" if dir > 0.0 else "west", true)


		_add_casual_walk(spr, KitRecolor.appearance_for("paseo_%d" % i,
			KitRecolor.team_only(GameState.kit_variant(_ganador, 0))))
		var x0: float = r.randf_range(CARRIL_X.x, CARRIL_X.y)
		_place(spr, Vector3(x0, 0.0, CARRIL_Z + r.randf_range(-0.25, 0.25)))
		_paseantes.append({
			"spr": spr, "dir": dir, "x": x0,

			"vel": r.randf_range(0.8, 1.2),
			"z": spr.position.z,
		})



func _libre(x: float, z: float) -> bool:
	return x < KIOSCO_X.x or x > KIOSCO_X.y or z < KIOSCO_Z.x or z > KIOSCO_Z.y














func _casual_extra(seed_key: String, facing: String,
		del_ganador: bool = false) -> AnimatedSprite3D:



	var base: Dictionary = KitRecolor.team_only(
		GameState.kit_variant(_ganador, 0)) if del_ganador else {}
	var cfg: Dictionary = KitRecolor.appearance_for(seed_key, base)
	var spr: AnimatedSprite3D = AnimatedSprite3D.new()
	spr.sprite_frames = player_frames(cfg, facing,
		"res://assets/sprites/anim/casual_idle_%s_" % facing, not del_ganador)
	spr.pixel_size = PLAYER_HEIGHT_M / PLAYER_METRICS.x
	spr.billboard = BaseMaterial3D.BILLBOARD_ENABLED
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.play("idle")
	viewport.add_child(spr)
	return spr


func _caja(at: Vector3, size: Vector3, col: Color, emis: float = 0.0) -> void:
	var m: MeshInstance3D = MeshInstance3D.new()
	var box: BoxMesh = BoxMesh.new()
	box.size = size
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = col
	if emis > 0.0:
		mat.emission_enabled = true
		mat.emission = col
		mat.emission_energy_multiplier = emis
	box.material = mat
	m.mesh = box
	m.position = at
	viewport.add_child(m)




func _place(spr: AnimatedSprite3D, at: Vector3) -> void:
	spr.position = Vector3(at.x,
		0.15 + feet_offset(spr.pixel_size,
			"res://assets/sprites/anim/casual_idle_south_00.png") - PLAYER_SINK,
		at.z)










func _add_casual_walk(spr: AnimatedSprite3D, kit: Dictionary = {}) -> void:
	var mio: bool = kit.is_empty()
	var cfg: Dictionary = KitRecolor.casual_of(GameState.team_custom) if mio \
			else kit.duplicate()
	var hoja: String = "res://assets/sprites/anim/walk_player_%s_%02d.png" if mio \
			else "res://assets/sprites/anim/casual_walk_%s_%02d.png"
	for d in ["south", "north", "east", "west"]:
		var anim: String = "walk_" + d
		var added: int = 0
		for i in range(1, WALK_FRAMES + 1):
			var path: String = hoja % [d, i]
			if not ResourceLoader.exists(path):
				continue
			if added == 0:
				spr.sprite_frames.add_animation(anim)
				spr.sprite_frames.set_animation_loop(anim, true)
				spr.sprite_frames.set_animation_speed(anim, WALK_FPS)
			spr.sprite_frames.add_frame(anim, KitRecolor.apply(load(path), cfg))
			added += 1








func _montar_ficha() -> void:
	if _signing:
		_ficha_fichaje()
		return




	card_title(I18n.t("LA CIUDAD ES TUYA") if _win
		else I18n.t("HOY MEJOR NO SALIR"))
	var linea: Label = card_sub(
		I18n.t("GANASTE EL DERBI") if _win else I18n.t("PERDISTE EL DERBI"),
		CareerTheme.MONEY if _win else CareerTheme.DANGER)
	linea.clip_text = true
	var nombre: Label = card_sub(Nations.team_label(_rival).to_upper(),
		CareerTheme.TEXT, 22)
	nombre.clip_text = true
	card_stats([{"v": "%d-%d" % [int(data.get("gf", 0)), int(data.get("ga", 0))],
		"k": I18n.t("EL MARCADOR")}])
	var head: Dictionary = Career.derby_headline(String(data.get("opp", "")))
	var key: String = String(head.get("key", ""))
	if not key.is_empty():
		card_note(I18n.tf(key, head.get("args", [])))
	elif _win:



		card_note(I18n.t("Hoy la ciudad amaneció con tu nombre en la portada.")
			if _mia() else I18n.t("Hoy la ciudad amaneció con la portada buena."))
	else:
		card_note(I18n.t("Toda la ciudad amaneció con esa portada."))



	if bool(data.get("tangana", false)):
		card_note(I18n.t("Y en los bares sólo se habla de la tangana."))
	card_cta()


func _accent_for() -> Color:


	return CareerTheme.accent() if _win else CareerTheme.DANGER




func _tick(delta: float) -> void:
	_mover_paseantes(delta)
	var k: float = clampf((t - T_SALE) /(T_LLEGA - T_SALE), 0.0, 1.0)
	var at: Vector3 = P_INICIO.lerp(P_KIOSCO, smoothstep(0.0, 1.0, k))
	_place(_walker, at)
	walk_play(_walker,(P_KIOSCO - P_INICIO) if (k > 0.0 and k < 1.0) \
			else Vector3.ZERO)
	if t >= T_ZOOM and not _golpeado:
		_golpe()




func _mover_paseantes(delta: float) -> void:
	for p in _paseantes:
		var dir: float = float(p["dir"])
		var x: float = float(p["x"]) + dir * float(p["vel"]) * delta
		if x > CARRIL_X.y:
			x = CARRIL_X.x
		elif x < CARRIL_X.x:
			x = CARRIL_X.y
		p["x"] = x
		var spr: AnimatedSprite3D = p["spr"]
		spr.position = Vector3(x, spr.position.y, float(p["z"]))
		walk_play(spr, Vector3(dir, 0.0, 0.0))




func _golpe() -> void:
	_golpeado = true
	if _win:
		sting("crowd_roar", -8.0)
		sting("fanfare", -10.0)
		screen_flash(0.14)
		set_confetti(true)
		confetti_colors = [team().get("kit", CareerTheme.accent()),
			team().get("kit2", CareerTheme.MONEY), Color("f2efe6")]
	else:
		sting("crowd_whistles", -11.0)
		shake(0.015, 0.22)


func _skipped() -> void:
	_place(_walker, P_KIOSCO)
	walk_play(_walker, Vector3.ZERO)
	if not _golpeado:
		_golpe()







func _portada_fichaje(img: Image) -> void:
	var quien: String = Career.player_name.to_upper()
	var cuerpo: int = 3 if _partir(quien, 3, TIT_LINEAS + 1).size() <= TIT_LINEAS else 2
	var y: int = TIT_Y
	for linea in _partir(quien, cuerpo, TIT_LINEAS):
		PixelText.draw_text(img,(PAGE_W - PixelText.text_width(linea, cuerpo)) / 2, y,
			linea, TINTA, cuerpo)
		y += TIT_SALTO
	var sub: String = I18n.t("FICHAJE").to_upper()
	PixelText.draw_text(img,(PAGE_W - PixelText.text_width(sub, 2)) / 2, GANO_Y, sub,
		TINTA, 2)

	_rect(img, 12, FOTO_Y, PAGE_W - 24, FOTO_H, PAPEL.darkened(0.1))
	_rect(img, 12, FOTO_Y, PAGE_W - 24, 1, TINTA)
	_rect(img, 12, FOTO_Y + FOTO_H - 1, PAGE_W - 24, 1, TINTA)
	_rect(img, 12, FOTO_Y, 1, FOTO_H, TINTA)
	_rect(img, PAGE_W - 13, FOTO_Y, 1, FOTO_H, TINTA)


	var cifra: String = _cifra_fichaje()
	var cc: int = 4 if PixelText.text_width(cifra, 4) <= PAGE_W - 8 else 3
	PixelText.draw_text(img,(PAGE_W - PixelText.text_width(cifra, cc)) / 2, MARC_Y,
		cifra, TINTA, cc)



func _cifra_fichaje() -> String:
	match String(data.get("route", "buy")):
		"free": return I18n.t("LIBRE").to_upper()
		"loan": return I18n.t("CEDIDO").to_upper()
		_:
			var fee: int = int(data.get("fee", 0))
			if fee >= 1000000:







				var m: float = float(fee) / 1000000.0
				return I18n.num(m, 0 if m >= 10.0 else 1) + "M"
			if fee >= 1000:
				return I18n.num(float(fee) / 1000.0) + "K"
			return str(fee)



func _ficha_fichaje() -> void:
	card_title(I18n.t("NUEVO CLUB"))
	var linea: Label = card_sub(CareerTheme.caps(team_name()),
		CareerTheme.accent(), 26)
	linea.clip_text = true
	var route: String = String(data.get("route", "buy"))
	var val: String
	var cap: String
	if route == "free":
		val = I18n.t("LIBRE")
		cap = I18n.t("SIN TRASPASO")
	elif route == "loan":
		val = I18n.t("CESION")
		cap = I18n.t("A PRESTAMO")
	else:
		val = "%s$" % thousands(int(data.get("fee", 0)))
		cap = I18n.t("EL TRASPASO")
	card_stats([{"v": val, "k": cap}])
	card_note(I18n.t("Toda la ciudad amaneció con tu fichaje en la portada."))
	card_cta()
