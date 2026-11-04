extends Ceremony

























const VALLA: String = "valla"
const MURAL: String = "mural"

const T_LLEGA: float = 3.4

const T_GOLPE: float = 3.9
const T_CHYRON: float = 2.2
const T_CARD: float = 8.6

const FACHADA_Z: float = 3.5
const ACERA_Y: float = 0.15


const VALLA_W: float = 8.0
const VALLA_H: float = 4.0
const VALLA_Y: float = 9.4
const VALLA_PX: Vector2i = Vector2i(400, 200)



const MURAL_W: float = 6.4
const MURAL_H: float = 5.2
const MURAL_Y: float = 3.4
const MURAL_PX: Vector2i = Vector2i(320, 260)


const KID_ALTO: float = 1.3
const BALON_SHEET: String = "res://assets/sprites/anim/balon_south_"
const CASUAL_IDLE: String = "res://assets/sprites/anim/casual_idle_%s_"

var _desde: Vector3
var _hasta: Vector3
var _llego: bool = false
var _golpe: bool = false
var _valla_mat: StandardMaterial3D = null
var _focos: Array[MeshInstance3D] = []
var _r: RandomNumberGenerator = RandomNumberGenerator.new()


func _es_mural() -> bool:
	return String(data.get("mode", VALLA)) == MURAL


func _marca() -> String:
	return String(data.get("sponsor", ""))


func _nacion() -> Dictionary:
	return Nations.as_team(Career.nationality)



func _accent_for() -> Color:
	if _es_mural():
		var nat: Dictionary = _nacion()
		return CareerTheme.accent_of(nat) if not nat.is_empty() else CareerTheme.MONEY
	return Sponsors.color_of(_marca())


func _build() -> void:
	var mural: bool = _es_mural()

	_r.seed = hash("ciudad_" + String(data.get("mode", VALLA)))
	_mundo(mural)
	_calle(mural)
	if mural:
		_barrio()
		_mural()
		_escalera()
		_chavales()
		_desde = Vector3(7.0, 0.0, 5.2)
		_hasta = Vector3(2.4, 0.0, 5.2)
	else:
		_manzana()
		_calle_viva()
		_valla()
		_desde = Vector3(-7.5, 0.0, 5.4)
		_hasta = Vector3(-0.6, 0.0, 5.4)
	_vecinos(mural)
	make_camera(_keys(mural), 46.0)
	orbit_speed = -0.3


	var ropa: Dictionary = KitRecolor.casual_of(GameState.team_custom)
	make_player(ropa, "south")
	add_walk(player, ropa)
	add_idle_views(player, ropa)
	_colocar(player, _desde, player.pixel_size)

	make_card(T_CARD)
	if mural:
		make_chyron(I18n.t("MURAL"), CareerTheme.caps(Career.player_name), _nacion(),
			T_CHYRON)
		card_title(I18n.t("TU CARA EN EL BARRIO"), 40)
		card_sub(CareerTheme.caps(I18n.t(String(data.get("title", "Campeón del Mundo")))))
		card_note(I18n.t("Nadie te pidió permiso para pintarte. Mejor así."))
	else:
		make_chyron(I18n.t("ANUNCIO"), CareerTheme.caps(Career.player_name), {},
			T_CHYRON)
		card_title(I18n.t("TU CARA EN LA CIUDAD"), 40)
		card_sub(_nombre_marca(), Sponsors.color_of(_marca()))


		var pay: int = int(data.get("pay", 0))
		if pay > 0:
			card_count(pay, I18n.t("FIJO POR PARTIDO"))
		card_note(I18n.t("Pasas por debajo y te ves en grande. Los que pasan, también."))
	card_cta(I18n.t("SEGUIR"))


func _nombre_marca() -> String:
	var m: Dictionary = Sponsors.by_id(_marca())


	return CareerTheme.caps(I18n.t(String(m.get("name", _marca()))))



func _keys(mural: bool) -> Array:
	if mural:
		return [

			{"t": 0.0, "dist": 17.0, "h": 3.2, "yaw": 166.0, "aim_y": 3.0, "fov": 48.0,
				"focus_x": 0.5, "focus_z": 3.5},

			{"t": 3.6, "dist": 13.0, "h": 2.2, "yaw": 178.0, "aim_y": 3.2, "fov": 52.0,
				"focus_x": 0.3, "focus_z": 3.5},

			{"t": 6.4, "dist": 12.0, "h": 1.8, "yaw": 188.0, "aim_y": 3.0, "fov": 56.0,
				"focus_x": 1.0, "focus_z": 4.0},
		]
	return [


		{"t": 0.0, "dist": 11.0, "h": 1.6, "yaw": 196.0, "aim_y": 2.0, "fov": 50.0,
			"focus_x": -4.5, "focus_z": 5.4},

		{"t": T_LLEGA, "dist": 10.0, "h": 1.1, "yaw": 190.0, "aim_y": 4.6, "fov": 58.0,
			"focus_x": -0.6, "focus_z": 5.4},


		{"t": 6.6, "dist": 13.0, "h": 0.9, "yaw": 182.0, "aim_y": 5.6, "fov": 62.0,
			"focus_x": -0.3, "focus_z": 5.4},
	]




func _mundo(mural: bool) -> void:
	var env: WorldEnvironment = WorldEnvironment.new()
	var e: Environment = Environment.new()
	e.background_mode = Environment.BG_COLOR
	e.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR


	e.background_color = Color("e7b58c") if mural else Color("0b0f18")
	e.ambient_light_color = Color("ffe6cc") if mural else Color("9aa3bd")
	e.ambient_light_energy = 1.25 if mural else 0.62
	viewport.add_child(env)
	env.environment = e
	var sol: DirectionalLight3D = DirectionalLight3D.new()
	sol.light_color = Color("ffc98f") if mural else Color("9fb0d8")
	sol.light_energy = 1.35 if mural else 0.35
	sol.rotation_degrees = Vector3(-24.0, 38.0, 0.0) if mural \
			else Vector3(-55.0, -30.0, 0.0)
	viewport.add_child(sol)


func _calle(mural: bool) -> void:
	_caja(Vector3(0.0, -0.5, 12.0), Vector3(90.0, 1.0, 10.0),
		Color("4a4845") if mural else Color("24262c"))
	_caja(Vector3(0.0, ACERA_Y * 0.5, 5.6), Vector3(90.0, ACERA_Y, 4.2),
		Color("a39d92") if mural else Color("6f6d69"))
	_caja(Vector3(0.0, 0.1, 7.68), Vector3(90.0, 0.2, 0.16),
		Color("c4bdb0") if mural else Color("8d8a82"))
	for x in [-9.5, 4.2, 13.0]:
		_farola(float(x), not mural)




func _farola(x: float, encendida: bool) -> void:
	var gris: Color = Color("2f3236")
	_caja(Vector3(x, ACERA_Y + 2.1, 7.3), Vector3(0.12, 4.2, 0.12), gris)
	_caja(Vector3(x, ACERA_Y + 4.15, 6.95), Vector3(0.08, 0.08, 0.7), gris)
	_caja(Vector3(x, ACERA_Y + 4.05, 6.6), Vector3(0.36, 0.14, 0.26),
		Color("ffd9a0") if encendida else Color("8a8578"), 1.6 if encendida else 0.0)
	if encendida:
		var luz: OmniLight3D = OmniLight3D.new()
		luz.light_color = Color("ffcf8f")
		luz.light_energy = 1.4
		luz.omni_range = 7.0
		luz.position = Vector3(x, ACERA_Y + 3.8, 6.4)
		viewport.add_child(luz)




func _manzana() -> void:
	for b in [[-16.8, 8.0, 14.0], [-8.2, 8.4, 12.0], [0.0, 10.4, 17.0],
			[8.8, 8.2, 13.0], [17.0, 8.0, 15.0]]:
		_edificio(float(b[0]), float(b[1]), float(b[2]), true)
	for b in [[-12.0, 12.0, 24.0], [4.0, 14.0, 28.0], [18.0, 10.0, 22.0]]:
		_caja(Vector3(float(b[0]), float(b[2]) * 0.5, -14.0),
			Vector3(float(b[1]), float(b[2]), 7.0), Color("161a22"))




const MANZANA_DELANTE: Array = [[-16.8, 8.0], [-8.2, 8.4], [0.0, 10.4], [8.8, 8.2], [17.0, 8.0]]


const TOLDOS: Array = [Color("7a2b2e"), Color("2b3f66"), Color("86642a"), Color("553a66"),
	Color("3d4a57")]







func _calle_viva() -> void:
	var cristal: Color = Color("6b5232")
	var marco: Color = Color("15171b")
	var z: float = FACHADA_Z + 0.08
	for i in MANZANA_DELANTE.size():
		var cx: float = float(MANZANA_DELANTE[i][0])
		var w: float = float(MANZANA_DELANTE[i][1])
		var ancho: float = w - 1.3
		_caja(Vector3(cx, 1.68, z), Vector3(ancho, 1.85, 0.03), cristal, 0.55)

		var tramos: int = maxi(int(ancho / 1.3), 2)
		for k in tramos + 1:
			var x: float = cx - ancho * 0.5 + ancho * float(k) / float(tramos)
			_caja(Vector3(x, 1.68, z + 0.02), Vector3(0.07, 1.9, 0.04), marco)
		_caja(Vector3(cx, 2.63, z + 0.02), Vector3(ancho + 0.07, 0.07, 0.04), marco)

		var px: float = cx + ancho * 0.5 - ancho / float(tramos) * 0.5
		_caja(Vector3(px, ACERA_Y + 1.06, z + 0.03), Vector3(0.9, 2.12, 0.03), Color("2a2118"))
		_caja(Vector3(px, ACERA_Y + 1.35, z + 0.05), Vector3(0.5, 0.9, 0.02), cristal, 0.8)
		_caja(Vector3(px - 0.32, ACERA_Y + 1.0, z + 0.07), Vector3(0.04, 0.3, 0.04), Color("c9ccd2"))

		var tc: Color = TOLDOS[i % TOLDOS.size()]
		var listas: int = int((w - 1.0) / 0.5)
		for k in listas:
			var x: float = cx -(w - 1.0) * 0.5 + 0.25 + 0.5 * float(k)
			_caja(Vector3(x, 2.92, FACHADA_Z + 0.42), Vector3(0.5, 0.06, 0.8),
				tc if k % 2 == 0 else Color("cfc6b4").darkened(0.35))
		_caja(Vector3(cx, 2.8, FACHADA_Z + 0.82), Vector3(w - 1.0, 0.2, 0.03), tc.darkened(0.2))

	var madera: Color = Color("6a4a2e")
	for k in 3:
		_caja(Vector3(3.4, ACERA_Y + 0.45, 3.82 + 0.13 * float(k)),
			Vector3(1.6, 0.04, 0.1), madera)
	for k in 2:
		_caja(Vector3(3.4, ACERA_Y + 0.62 + 0.16 * float(k), 3.68),
			Vector3(1.6, 0.1, 0.04), madera)
	for lado: float in [-0.7, 0.7]:
		_caja(Vector3(3.4 + lado, ACERA_Y + 0.22, 3.95), Vector3(0.06, 0.44, 0.42), marco)
		_caja(Vector3(3.4 + lado, ACERA_Y + 0.6, 3.68), Vector3(0.06, 0.4, 0.04), marco)

	_caja(Vector3(4.75, ACERA_Y + 0.4, 7.3), Vector3(0.42, 0.8, 0.42), Color("3a3f47"))
	_caja(Vector3(4.75, ACERA_Y + 0.82, 7.3), Vector3(0.48, 0.05, 0.48), marco)

	var junta: Color = Color("5b5955")
	for k in 41:
		_caja(Vector3(-24.0 + 1.2 * float(k), ACERA_Y + 0.002, 5.6),
			Vector3(0.025, 0.002, 4.2), junta)
	for zz: float in [4.9, 6.3]:
		_caja(Vector3(0.0, ACERA_Y + 0.002, zz), Vector3(48.0, 0.002, 0.025), junta)




func _barrio() -> void:
	for b in [[-12.5, 8.0, 7.2], [11.4, 8.6, 8.4], [19.5, 7.0, 6.6], [-20.0, 7.0, 9.0]]:
		_edificio(float(b[0]), float(b[1]), float(b[2]), false)

	_caja(Vector3(0.0, 4.2, 0.0), Vector3(9.4, 8.4, 7.0), Color("9a5a44"))
	_caja(Vector3(0.0, 8.55, 0.2), Vector3(9.8, 0.3, 7.4), Color("6e3d2e"))
	_caja(Vector3(0.0, 0.3, 3.55), Vector3(9.4, 0.6, 0.12), Color("5e3528"))


func _edificio(cx: float, w: float, h: float, noche: bool) -> void:
	var muros: Array = [Color("5b5566"), Color("4e5461"), Color("635a52"),
		Color("575b5e")] if noche else [Color("d9c7a6"), Color("c9b08f"),
		Color("e0d2b6"), Color("b99f86")]
	var muro: Color = muros[_r.randi() % muros.size()]
	_caja(Vector3(cx, h * 0.5, 0.0), Vector3(w, h, 7.0), muro)
	_caja(Vector3(cx, h + 0.18, 0.2), Vector3(w + 0.5, 0.36, 7.4), muro.darkened(0.3))
	var pisos: int = int((h - 4.0) / 2.6) + 1
	var cols: int = maxi(int(w / 1.9), 2)
	for p in pisos:
		for c in cols:
			var vx: float = cx - w * 0.5 + w *(float(c) + 0.5) / float(cols)
			var vy: float = 4.4 + float(p) * 2.6
			if vy > h - 0.9:
				continue
			var on: bool = _r.randf() <(0.38 if noche else 0.06)
			_caja(Vector3(vx, vy, 3.53), Vector3(0.86, 1.18, 0.08),
				Color("ffd9a0") if on else (Color("1c2430") if noche else Color("59636b")),
				0.9 if on else 0.0)
			_caja(Vector3(vx, vy - 0.66, 3.55), Vector3(1.0, 0.09, 0.14),
				muro.darkened(0.35))

	_caja(Vector3(cx, 1.7, 3.52), Vector3(w - 0.9, 2.2, 0.1),
		Color("1e242b") if noche else Color("3d4650"))
	var neon: Color = [Color("ff5a52"), Color("ffc34d"), Color("4dd0c0"),
		Color("ff8fb0")][_r.randi() % 4]
	_caja(Vector3(cx - w * 0.15, 3.3, 3.6), Vector3(w * 0.5, 0.24, 0.06), neon,
		1.4 if noche else 0.35)




func _valla() -> void:
	var z: float = FACHADA_Z + 0.32

	_caja(Vector3(0.0, VALLA_Y, z - 0.12), Vector3(VALLA_W + 0.36, VALLA_H + 0.36, 0.2),
		Color("1a1c20"))
	var q: MeshInstance3D = MeshInstance3D.new()
	var qm: QuadMesh = QuadMesh.new()
	qm.size = Vector2(VALLA_W, VALLA_H)
	q.mesh = qm
	_valla_mat = StandardMaterial3D.new()


	_valla_mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	_valla_mat.albedo_texture = _cartel_valla()
	_valla_mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST

	_valla_mat.albedo_color = Color(0.2, 0.2, 0.24)
	q.material_override = _valla_mat
	q.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	q.position = Vector3(0.0, VALLA_Y, z)
	viewport.add_child(q)



	for i in 3:
		var fx: float = - VALLA_W * 0.33 + float(i) * VALLA_W * 0.33
		var base: Vector3 = Vector3(fx, VALLA_Y - VALLA_H * 0.5 - 0.55, z + 0.9)
		_caja(base + Vector3(0.0, 0.0, -0.5), Vector3(0.06, 0.06, 0.8), Color("2a2c30"))
		_focos.append(_caja(base, Vector3(0.36, 0.2, 0.3), Color("2a2c30")))






func _cartel_valla() -> Texture2D:
	var lienzo: Array = _lienzo(VALLA_PX)
	var root: Control = lienzo[1]
	var col: Color = Sponsors.color_of(_marca())
	_rect(root, Rect2(Vector2.ZERO, Vector2(VALLA_PX)), col.darkened(0.45))
	_rect(root, Rect2(Vector2(214, 0), Vector2(186, 200)), col)
	var ropa: Dictionary = KitRecolor.casual_of(GameState.team_custom)
	var cara: Image = retrato_image(200, 192, ropa, 0.52)
	if cara != null:
		var tr: TextureRect = TextureRect.new()
		tr.texture = ImageTexture.create_from_image(cara)
		tr.stretch_mode = TextureRect.STRETCH_SCALE
		tr.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
		tr.position = Vector2(8, 8)
		tr.size = Vector2(200, 192)
		root.add_child(tr)
	var logo: SponsorLogo = SponsorLogo.new()
	logo.position = Vector2(259, 18)
	logo.size = Vector2(96, 96)
	root.add_child(logo)
	logo.setup(_marca(), Color("f4f1ec"))


	var marca: String = _nombre_marca()
	_texto(root, marca, Rect2(Vector2(216, 122), Vector2(182, 36)),
		_cuerpo_que_cabe(marca, 182, CareerTheme.T_BODY), Color("f4f1ec"))
	_texto(root, Career.nombre_espalda(), Rect2(Vector2(216, 158), Vector2(182, 30)),
		_cuerpo_que_cabe(Career.nombre_espalda(), 182, CareerTheme.T_DIM),
		col.lightened(0.55))
	return (lienzo[0] as SubViewport).get_texture()




func _mural() -> void:
	var q: MeshInstance3D = MeshInstance3D.new()
	var qm: QuadMesh = QuadMesh.new()
	qm.size = Vector2(MURAL_W, MURAL_H)
	q.mesh = qm
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = _cartel_mural()
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	mat.roughness = 1.0
	q.material_override = mat
	q.position = Vector3(0.0, MURAL_Y, FACHADA_Z + 0.04)
	viewport.add_child(q)





func _cartel_mural() -> Texture2D:
	var lienzo: Array = _lienzo(MURAL_PX)
	var root: Control = lienzo[1]
	var nat: Dictionary = _nacion()
	var pais: String = Career.nationality
	var fondo: Color = CareerTheme.accent_of(nat) if not nat.is_empty() \
			else Color("2e5cff")
	_rect(root, Rect2(Vector2.ZERO, Vector2(MURAL_PX)), fondo.darkened(0.2))
	if not pais.is_empty() and Flags.has(pais):
		var flag: TextureRect = TextureRect.new()
		flag.texture = Flags.texture(pais)
		flag.stretch_mode = TextureRect.STRETCH_SCALE
		flag.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
		flag.position = Vector2.ZERO
		flag.size = Vector2(MURAL_PX)
		flag.modulate = Color(1.0, 1.0, 1.0, 0.85)
		root.add_child(flag)
	var look: Dictionary = GameState.team_custom.duplicate()
	if not nat.is_empty():
		look.merge(KitRecolor.team_only(GameState.kit_variant(nat, 0)), true)
	var cara: Image = retrato_image(220, 196, look, 0.56)
	if cara != null:
		var tr: TextureRect = TextureRect.new()
		tr.texture = ImageTexture.create_from_image(cara)
		tr.stretch_mode = TextureRect.STRETCH_SCALE
		tr.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
		tr.position = Vector2(50, 64)
		tr.size = Vector2(220, 196)
		root.add_child(tr)




	if not nat.is_empty():
		var esc: CrestView = CrestView.new()
		esc.position = Vector2(186, 212)
		esc.size = Vector2(32, 32)
		esc.custom_minimum_size = Vector2(32, 32)
		root.add_child(esc)
		esc.set_team(nat)



		var fab: Texture2D = KitBrands.for_team(String(nat.get("id", "")))
		if fab != null:
			var fab_tr: TextureRect = TextureRect.new()
			fab_tr.texture = fab
			fab_tr.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
			fab_tr.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
			fab_tr.position = Vector2(102, 216)
			fab_tr.size = Vector2(32, 26)
			root.add_child(fab_tr)
	var copa: TrophyIcon = TrophyIcon.new()
	copa.position = Vector2(236, 8)
	copa.size = Vector2(76, 88)
	root.add_child(copa)
	copa.set_type(String(data.get("icon", "mundial")))



	var num: int = int(data.get("number", shirt()))
	_texto(root, Career.nombre_espalda(), Rect2(Vector2(10, 12), Vector2(222, 40)),
		_cuerpo_que_cabe(Career.nombre_espalda(), 222, CareerTheme.T_MONEY),
		Color("fffaf0"), HORIZONTAL_ALIGNMENT_LEFT)
	_texto(root, str(num), Rect2(Vector2(234, 98), Vector2(80, 56)),
		CareerTheme.T_TITLE, Color("fffaf0"))
	var ladrillo: TextureRect = TextureRect.new()
	ladrillo.texture = ImageTexture.create_from_image(_ladrillo_img(MURAL_PX))
	ladrillo.stretch_mode = TextureRect.STRETCH_SCALE
	ladrillo.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	ladrillo.size = Vector2(MURAL_PX)
	root.add_child(ladrillo)
	return (lienzo[0] as SubViewport).get_texture()




func _ladrillo_img(px: Vector2i) -> Image:
	var img: Image = Image.create(px.x, px.y, false, Image.FORMAT_RGBA8)
	img.fill(Color(0, 0, 0, 0))
	var junta: Color = Color(0.16, 0.1, 0.08, 0.34)
	for y in range(0, px.y, 12):
		for x in px.x:
			img.set_pixel(x, y, junta)
		var off: int = 12 if (y / 12) % 2 == 1 else 0
		for x in range(off, px.x, 24):
			for dy in range(1, 12):
				if y + dy < px.y:
					img.set_pixel(x, y + dy, junta)
	return img




func _escalera() -> void:
	var piv: Node3D = Node3D.new()
	piv.position = Vector3(4.05, ACERA_Y, FACHADA_Z + 0.75)
	piv.rotation_degrees = Vector3(-11.0, 0.0, 0.0)
	viewport.add_child(piv)
	for sx in [-0.24, 0.24]:
		var rail: MeshInstance3D = _caja_en(piv, Vector3(float(sx), 1.85, 0.0),
			Vector3(0.06, 3.7, 0.06), Color("b8b2a4"))
		rail.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	for i in 9:
		_caja_en(piv, Vector3(0.0, 0.35 + float(i) * 0.38, 0.0),
			Vector3(0.48, 0.04, 0.05), Color("a39c8e"))
	var botes: Array = [[3.3, Color("d9463b")], [3.62, Color("f2c14e")],
		[4.7, Color("3a78c9")]]
	for b in botes:
		var m: MeshInstance3D = MeshInstance3D.new()
		var c: CylinderMesh = CylinderMesh.new()
		c.top_radius = 0.13
		c.bottom_radius = 0.13
		c.height = 0.3
		m.mesh = c
		var mat: StandardMaterial3D = StandardMaterial3D.new()
		mat.albedo_color = b[1]
		m.material_override = mat
		m.position = Vector3(float(b[0]), ACERA_Y + 0.15, FACHADA_Z + 0.45)
		viewport.add_child(m)





func _chavales() -> void:
	var px: float = KID_ALTO / PLAYER_METRICS.x
	var a_cfg: Dictionary = KitRecolor.infantil(KitRecolor.casual_of(KitRecolor.appearance_for("mural_a", {})))
	var a: AnimatedSprite3D = _persona(player_frames(a_cfg, "south", BALON_SHEET), px)
	_colocar(a, Vector3(-2.7, 0.0, 5.0), px)
	var nat: Dictionary = _nacion()
	var base: Dictionary = KitRecolor.team_only(GameState.kit_variant(nat, 0)) \
			if not nat.is_empty() else {}
	var b_cfg: Dictionary = KitRecolor.infantil(KitRecolor.appearance_for("mural_b", base))
	b_cfg["number"] = int(data.get("number", shirt()))
	b_cfg["apellido"] = Career.nombre_espalda()
	var b: AnimatedSprite3D = _persona(player_frames(b_cfg, "north"), px)
	_colocar(b, Vector3(-1.2, 0.0, 4.5), px)
	espalda_registra(b, "idle", player_prefix("north"), 0)
	espalda_vestir(b, b_cfg)





func _vecinos(mural: bool) -> void:
	var sitios: Array = [[-4.6, 6.4, "south"], [5.4, 6.1, "north"]] if mural \
			else [[-3.2, 6.6, "north"], [2.6, 6.2, "north"], [5.8, 6.9, "south"]]
	var i: int = 0
	for s in sitios:
		var cara: Dictionary = KitRecolor.appearance_for("vecino_%s_%d" % [
			String(data.get("mode", VALLA)), i], {})
		var face: String = String(s[2])
		var spr: AnimatedSprite3D = _persona(player_frames(cara, face,
			CASUAL_IDLE % face, true), PLAYER_HEIGHT_M / PLAYER_METRICS.x)
		_colocar(spr, Vector3(float(s[0]), 0.0, float(s[1])), spr.pixel_size)
		i += 1


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
	spr.speed_scale = _r.randf_range(0.8, 1.15)
	return spr




func _colocar(spr: AnimatedSprite3D, at: Vector3, px: float) -> void:
	spr.position = Vector3(at.x, ACERA_Y + feet_offset(px) - PLAYER_SINK, at.z)




func _tick(_delta: float) -> void:
	var k: float = clampf(t / T_LLEGA, 0.0, 1.0)
	_colocar(player, _desde.lerp(_hasta, smoothstep(0.0, 1.0, k)), player.pixel_size)
	if k < 1.0:
		walk_play(player, _hasta - _desde)
	else:
		if not _llego:
			_llego = true




			walk_play(player, Vector3.ZERO)


		idle_play(player, Vector3(0.0, 0.0, -1.0))
	if not _golpe and t >= T_GOLPE:
		_dar_golpe()


func _dar_golpe() -> void:
	_golpe = true
	if _es_mural():

		applause(true, -19.0)
		punch_fov(1.5, 0.35)
		return

	_enciende_focos()
	if _valla_mat != null:
		var tw: Tween = create_tween()
		tw.tween_property(_valla_mat, "albedo_color", Color.WHITE, 0.06)
		tw.tween_property(_valla_mat, "albedo_color", Color(0.35, 0.35, 0.38), 0.08)
		tw.tween_property(_valla_mat, "albedo_color", Color.WHITE, 0.14)
	punch_fov(2.0, 0.35)




func _enciende_focos() -> void:
	for f in _focos:
		var fm: StandardMaterial3D =(f.mesh as BoxMesh).material as StandardMaterial3D
		if fm != null:
			fm.albedo_color = Color("fff3d6")
			fm.emission_enabled = true
			fm.emission = Color("fff3d6")
			fm.emission_energy_multiplier = 2.0


func _skipped() -> void:
	if not _golpe:
		_dar_golpe()
	if _valla_mat != null:
		_valla_mat.albedo_color = Color.WHITE
	_colocar(player, _hasta, player.pixel_size)
	_llego = true
	walk_play(player, Vector3.ZERO)
	idle_play(player, Vector3(0.0, 0.0, -1.0))






func _lienzo(px: Vector2i) -> Array:
	var vp: SubViewport = SubViewport.new()
	vp.size = px
	vp.disable_3d = true
	vp.transparent_bg = false
	vp.render_target_update_mode = SubViewport.UPDATE_ALWAYS
	add_child(vp)
	var root: Control = Control.new()
	root.position = Vector2.ZERO
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
	var n: int = maxi(txt.length(), 1)
	return clampi(int(float(ancho - 10) / float(n)), 10, techo)




func _texto(root: Control, txt: String, r: Rect2, size_px: int, col: Color,
		align: HorizontalAlignment = HORIZONTAL_ALIGNMENT_CENTER) -> void:
	var l: Label = Label.new()
	l.text = CareerTheme.caps(txt)
	l.clip_text = true
	l.horizontal_alignment = align
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	l.add_theme_font_size_override("font_size", size_px)
	l.add_theme_color_override("font_color", col)
	l.add_theme_color_override("font_outline_color", Color(0, 0, 0, 0.55))
	l.add_theme_constant_override("outline_size", 4)
	l.position = r.position
	l.size = r.size
	root.add_child(l)


func _caja(at: Vector3, size: Vector3, col: Color, emis: float = 0.0) -> MeshInstance3D:
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
	return m


func _caja_en(parent: Node3D, at: Vector3, size: Vector3, col: Color) -> MeshInstance3D:
	var m: MeshInstance3D = MeshInstance3D.new()
	var box: BoxMesh = BoxMesh.new()
	box.size = size
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = col
	box.material = mat
	m.mesh = box
	m.position = at
	parent.add_child(m)
	return m
