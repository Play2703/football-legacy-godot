extends Ceremony






















































const KEYS: Array = [
	{"t": 0.0, "dist": 13.4, "h": 4.9, "yaw": 180.0, "aim_y": 3.0, "fov": 44.0},
	{"t": 2.4, "dist": 10.8, "h": 3.8, "yaw": 180.0, "aim_y": 3.0, "fov": 38.0},
	{"t": 6.2, "dist": 9.6, "h": 3.4, "yaw": 180.0, "aim_y": 3.05, "fov": 34.0},
]


const DRIFT: float = -0.55






const BOARD_W: float = 2.6




const BOARD_PX: Vector2i = Vector2i(210, 219)





const BOARD_FOOT: float = 1.7

const BOARD_Z: float = CENTER_Z - 1.2






const YOU_X: float = 1.95
const YOU_DZ: float = 1.4

















const GALA_SHEET: String = "res://assets/sprites/anim/gala_south_"


const STAGE_TOP: float = 0.4
const STAGE_X: float = 4.6
const STAGE_Z0: float = BOARD_Z - 0.7
const STAGE_Z1: float = BOARD_Z + 2.4


const BOMBO_R: float = 0.27
const BOMBO_X: Array = [-1.05, -0.35, 0.35, 1.05]
const BOMBO_Z: float = BOARD_Z + 0.95
const BOMBO_Y: float = 1.3



const BOLA_VUELO: float = 0.6
const BOLA_SUBE: float = 0.38

const HOST_X: float = -1.95


const SALA_X: float = 12.5
const SALA_Z0: float = BOARD_Z - 1.1
const SALA_Z1: float = BOARD_Z + 21.0
const SALA_TECHO: float = 10.5



const ROW_T0: float = 1.5
const ROW_GAP: float = 0.62




const PAD: int = 7
const TITLE_Y: int = 7
const TITLE_H: int = 20
const HEAD_H: int = 11
const ROW_H: int = 19




const CREST_D: int = 15
const CREST_PX: int = 64



const BG: Color = Color(0.055, 0.065, 0.095)
const ROW_BG: Color = Color(0.105, 0.12, 0.165)
const INK: Color = Color(0.93, 0.95, 1.0)
























const NAT_HEAD_H: int = 16
const NAT_ROW_H: int = 40


const NAT_CREST_D: int = 32
const NAT_CREST_PX: int = 96


const NAT_ROW_GAP: float = 0.85



const NAT_GAP: int = 12

var _rows: Array = []
var _orden: Array = []
var _shown: int = 0
var _board_mat: StandardMaterial3D
var _quad: MeshInstance3D
var _crest_sprites: Array = []
var _you_col: Color = Color(0.35, 0.4, 0.5)
var _bombos: Array[Node3D] = []
var _bolas: Array[MeshInstance3D] = []
var _host: AnimatedSprite3D = null




func _nat() -> bool:
	return String(data.get("mode", "")) == "nat"









func _grupo() -> bool:
	return _nat() or String(data.get("mode", "")) == "grupo"






func _accent_for() -> Color:
	return Competitions.accent_of(_fx())







func _fx() -> Dictionary:
	return {"comp": "nat", "round": "grupo"} if _nat() else {"comp": _comp()}








func _comp() -> String:
	var c: String = String(data.get("comp", "ucl"))
	return c if Continental.es_continental(c) else "ucl"




func _comp_id() -> String:
	return Competitions.id_of(_fx())






func _title_text() -> String:
	if _nat():
		var t: String = String(data.get("tour", ""))
		if not t.is_empty():
			return t



	var n: String = Competitions.comp_name(_comp_id())
	return I18n.t(n) if Continental.es_americana(_comp()) else n





func _team_by_id(id: String) -> Dictionary:
	if _nat():
		var n: Dictionary = Nations.as_team(id)
		if not n.is_empty():
			return n
	return Teams.by_id(id)


func _build() -> void:
	_rows = data.get("rivals", [])
	_orden = _draw_order()




	var kit: Dictionary = GameState.kit_variant(team(), 0)
	_you_col = Color(kit.get("kit", _you_col))
	_build_sala()
	_build_recinto()
	_build_tarima()
	_build_fondo()



	focus = Vector3(0.0, BOARD_FOOT + _board_h() * 0.5, BOARD_Z)
	make_camera(KEYS)
	orbit_speed = DRIFT

	_build_board()
	_build_crests()



	make_comp_logo(Competitions.logo_type_of(_fx()), accent,
		Vector3(0.0, BOARD_FOOT + _board_h() + 0.8, BOARD_Z), 1.3, true)

	_build_bombos()
	_build_bolas()


	player = _figura(GameState.team_custom.duplicate(), YOU_X)
	_host = _figura(KitRecolor.appearance_for("presentador_sorteo_%s" % _comp_id(), {}),
		HOST_X)



	make_audio(0.35, false)
	flash_pool = [Vector3(-6.5, 1.6, BOARD_Z + 7.0), Vector3(6.5, 1.6, BOARD_Z + 7.0),
		Vector3(-8.5, 2.2, BOARD_Z + 11.0), Vector3(8.5, 2.2, BOARD_Z + 11.0)]
	flash_rate = 5.0
	flash_radius = 2.5


	make_chyron(I18n.t("EL SORTEO"), _title_text(),
		team() if _nat() else {}, -1.0, Competitions.logo_type_of(_fx()))



	make_card(6.6 if _grupo() else -1.0)
	if _grupo():
		card_title(I18n.t("TU GRUPO"), 44)



		if bool(data.get("muerte", false)):
			card_sub(I18n.t("GRUPO DE LA MUERTE"), CareerTheme.DANGER)
		else:
			card_sub(I18n.tf("GRUPO {0}", [String(data.get("group", "A"))]))
	else:
		card_title(I18n.t("TUS RIVALES"), 44)
		card_sub(I18n.tf("{0} EN CASA · {1} FUERA", [_n_home(), _rows.size() - _n_home()]))
	card_note(I18n.t("Los mismos que verás en tu calendario."))
	card_cta(I18n.t("VAMOS"))





func _build_sala() -> void:
	var env: Environment = Environment.new()
	env.background_mode = Environment.BG_COLOR
	env.background_color = Color(0.012, 0.014, 0.024)
	env.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	env.ambient_light_color = Color(0.17, 0.18, 0.25)
	env.ambient_light_energy = 0.6
	env.fog_enabled = true
	env.fog_light_color = accent.darkened(0.88)
	env.fog_density = 0.012
	var we: WorldEnvironment = WorldEnvironment.new()
	we.environment = env
	viewport.add_child(we)
	var suelo: MeshInstance3D = MeshInstance3D.new()
	var plano: PlaneMesh = PlaneMesh.new()
	plano.size = Vector2(SALA_X * 2.0, SALA_Z1 - SALA_Z0)
	suelo.mesh = plano
	suelo.position = Vector3(0.0, 0.0,(SALA_Z0 + SALA_Z1) * 0.5)
	var fm: StandardMaterial3D = StandardMaterial3D.new()
	fm.albedo_color = Color(0.04, 0.044, 0.062)
	fm.roughness = 0.4
	fm.metallic = 0.15
	suelo.material_override = fm
	viewport.add_child(suelo)

	var key: SpotLight3D = SpotLight3D.new()
	key.light_color = Color(1.0, 0.96, 0.88)
	key.light_energy = 2.2
	key.spot_range = 18.0
	key.spot_angle = 34.0
	key.shadow_enabled = false
	key.look_at_from_position(Vector3(0.0, 8.5, BOARD_Z + 7.5),
		Vector3(0.0, 1.0, BOMBO_Z))
	viewport.add_child(key)



	for sx in [-1.0, 1.0]:
		var desde: Vector3 = Vector3(float(sx) * 5.2, 7.2, BOARD_Z + 0.4)



		var hacia: Vector3 = Vector3(float(sx) * 1.95, STAGE_TOP, BOARD_Z + YOU_DZ)
		var rim: SpotLight3D = SpotLight3D.new()
		rim.light_color = accent.lightened(0.35)
		rim.light_energy = 2.0
		rim.spot_range = 14.0
		rim.spot_angle = 26.0
		rim.shadow_enabled = false
		rim.look_at_from_position(desde, hacia)
		viewport.add_child(rim)
		make_beam(desde, hacia, 0.14, 1.5, accent.lightened(0.35), 0.045)







func _build_recinto() -> void:
	var largo: float = SALA_Z1 - SALA_Z0
	var zc: float =(SALA_Z0 + SALA_Z1) * 0.5
	var pared: StandardMaterial3D = StandardMaterial3D.new()
	pared.albedo_texture = _tex_paneles()
	pared.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	pared.uv1_triplanar = true
	pared.uv1_scale = Vector3(0.5, 0.5, 0.5)
	pared.roughness = 0.75
	pared.emission_enabled = true
	pared.emission = accent.darkened(0.84)
	var techo: StandardMaterial3D = StandardMaterial3D.new()
	techo.albedo_color = Color(0.05, 0.05, 0.07)
	techo.emission_enabled = true
	techo.emission = Color(0.03, 0.03, 0.05)
	for m in [
		[Vector3(0.3, SALA_TECHO, largo), Vector3(- SALA_X, SALA_TECHO * 0.5, zc)],
		[Vector3(0.3, SALA_TECHO, largo), Vector3(SALA_X, SALA_TECHO * 0.5, zc)],
		[Vector3(SALA_X * 2.0, SALA_TECHO, 0.3), Vector3(0.0, SALA_TECHO * 0.5, SALA_Z0)],
		[Vector3(SALA_X * 2.0, SALA_TECHO, 0.3), Vector3(0.0, SALA_TECHO * 0.5, SALA_Z1)],
	]:
		_caja(m[0], m[1], pared)
	_caja(Vector3(SALA_X * 2.0, 0.3, largo), Vector3(0.0, SALA_TECHO, zc), techo)


	var led: StandardMaterial3D = _mat_luz(accent.lightened(0.15))
	var tira: BoxMesh = BoxMesh.new()
	tira.size = Vector3(0.06, SALA_TECHO - 1.4, 0.1)
	tira.material = led
	var tr: Array[Transform3D] = []
	var z: float = SALA_Z0 + 2.2
	while z < SALA_Z1 - 1.0:
		for sx in [-1.0, 1.0]:
			tr.append(Transform3D(Basis(), Vector3(float(sx) *(SALA_X - 0.18),
				SALA_TECHO * 0.5 + 0.2, z)))
		z += 3.0
	_multi(tira, tr)
	for sx in [-1.0, 1.0]:
		_caja(Vector3(0.05, 0.06, largo), Vector3(float(sx) *(SALA_X - 0.17), 0.55, zc), led)
	_caja(Vector3(SALA_X * 2.0, 0.06, 0.05), Vector3(0.0, 0.55, SALA_Z1 - 0.17), led)

	var punto: BoxMesh = BoxMesh.new()
	punto.size = Vector3(0.16, 0.04, 0.16)
	punto.material = _mat_luz(Color("ffe2b0"))
	var dots: Array[Transform3D] = []
	var dz: float = SALA_Z0 + 1.4
	while dz < SALA_Z1 - 0.6:
		var dx: float = - SALA_X + 1.4
		while dx < SALA_X - 1.0:
			dots.append(Transform3D(Basis(), Vector3(dx, SALA_TECHO - 0.17, dz)))
			dx += 2.6
		dz += 2.6
	_multi(punto, dots)




func _tex_paneles() -> ImageTexture:
	var img: Image = Image.create(32, 32, false, Image.FORMAT_RGB8)
	var base: Color = Color(0.085, 0.09, 0.12).lerp(accent, 0.1)
	for y in 32:
		for x in 32:
			var c: Color = base
			if x % 16 == 0 or y % 16 == 0:
				c = base.darkened(0.45)
			elif x % 16 == 1 or y % 16 == 1:
				c = base.lightened(0.1)
			img.set_pixel(x, y, c)
	return ImageTexture.create_from_image(img)




func _build_tarima() -> void:
	var madera: StandardMaterial3D = StandardMaterial3D.new()
	madera.albedo_color = Color(0.06, 0.064, 0.085)
	madera.roughness = 0.35
	madera.metallic = 0.2
	var ancho: float = STAGE_X * 2.0
	var fondo: float = STAGE_Z1 - STAGE_Z0
	_caja(Vector3(ancho, STAGE_TOP, fondo),
		Vector3(0.0, STAGE_TOP * 0.5,(STAGE_Z0 + STAGE_Z1) * 0.5), madera)
	var canto: StandardMaterial3D = _mat_luz(accent.lightened(0.2))
	_caja(Vector3(ancho, 0.05, 0.04), Vector3(0.0, STAGE_TOP - 0.03, STAGE_Z1 + 0.01), canto)
	for i in 2:
		var alto: float = STAGE_TOP *(1.0 - float(i + 1) / 3.0)
		_caja(Vector3(2.6 - 0.4 * float(i), alto, 0.32),
			Vector3(0.0, alto * 0.5, STAGE_Z1 + 0.16 + 0.32 * float(i)), madera)






func _build_fondo() -> void:
	var pz: float = BOARD_Z - 0.3
	var alto: float = SALA_TECHO - 1.0
	var negro: StandardMaterial3D = _mat_luz(Color(0.03, 0.034, 0.055).lerp(accent, 0.12))
	_caja(Vector3(STAGE_X * 2.0 + 2.0, alto, 0.12), Vector3(0.0, alto * 0.5, pz), negro)

	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 20261020
	var estrella: QuadMesh = QuadMesh.new()
	estrella.size = Vector2(0.035, 0.035)
	estrella.material = _mat_luz(accent.lightened(0.55))
	var tr: Array[Transform3D] = []
	var media: float = BOARD_W * 0.5 + 0.25
	for i in 340:
		var x: float = rng.randf_range(- STAGE_X - 1.0, STAGE_X + 1.0)
		var y: float = rng.randf_range(STAGE_TOP + 0.3, alto - 0.2)

		if absf(x) < media and y < BOARD_FOOT + _board_h() + 1.6:
			continue
		var k: float = rng.randf_range(0.6, 1.6)
		tr.append(Transform3D(Basis().scaled(Vector3(k, k, 1.0)), Vector3(x, y, pz + 0.07)))
	_multi(estrella, tr)
	var columna: StandardMaterial3D = _mat_luz(accent.lightened(0.1))
	for sx in [-1.0, 1.0]:
		_caja(Vector3(0.1, alto - STAGE_TOP, 0.06),
			Vector3(float(sx) * 2.75, STAGE_TOP +(alto - STAGE_TOP) * 0.5, pz + 0.08), columna)





func _build_bombos() -> void:
	var peana_m: StandardMaterial3D = StandardMaterial3D.new()
	peana_m.albedo_color = Color(0.11, 0.12, 0.16)
	peana_m.metallic = 0.5
	peana_m.roughness = 0.3
	var cristal: StandardMaterial3D = StandardMaterial3D.new()
	cristal.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	cristal.albedo_color = Color(0.78, 0.88, 1.0, 0.24)
	cristal.metallic = 0.3
	cristal.roughness = 0.05
	cristal.rim_enabled = true
	cristal.rim = 0.8
	cristal.cull_mode = BaseMaterial3D.CULL_DISABLED
	var aro: StandardMaterial3D = _mat_luz(accent.lightened(0.3))
	var oro: StandardMaterial3D = StandardMaterial3D.new()
	oro.albedo_color = Color("d9a52a")
	oro.metallic = 0.8
	oro.roughness = 0.25


	var bola_m: StandardMaterial3D = _mat_luz(Color(0.86, 0.88, 0.95))
	var bola: SphereMesh = SphereMesh.new()
	bola.radius = 0.055
	bola.height = 0.11
	bola.radial_segments = 10
	bola.rings = 5
	bola.material = bola_m
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 3105
	for i in BOMBO_X.size():
		var x: float = float(BOMBO_X[i])
		var peana: MeshInstance3D = MeshInstance3D.new()
		var cil: CylinderMesh = CylinderMesh.new()
		cil.top_radius = 0.07
		cil.bottom_radius = 0.17
		cil.height = BOMBO_Y - BOMBO_R - STAGE_TOP + 0.02
		peana.mesh = cil
		peana.material_override = peana_m
		peana.position = Vector3(x, STAGE_TOP + cil.height * 0.5, BOMBO_Z)
		viewport.add_child(peana)
		var piv: Node3D = Node3D.new()
		piv.position = Vector3(x, BOMBO_Y, BOMBO_Z)
		viewport.add_child(piv)
		var esfera: MeshInstance3D = MeshInstance3D.new()
		var sm: SphereMesh = SphereMesh.new()
		sm.radius = BOMBO_R
		sm.height = BOMBO_R * 2.0
		esfera.mesh = sm
		esfera.material_override = cristal
		esfera.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		piv.add_child(esfera)
		for eje in [Vector3.ZERO, Vector3(PI * 0.5, 0.0, 0.0)]:
			var anillo: MeshInstance3D = MeshInstance3D.new()
			var tor: TorusMesh = TorusMesh.new()
			tor.inner_radius = BOMBO_R - 0.006
			tor.outer_radius = BOMBO_R + 0.016
			anillo.mesh = tor
			anillo.material_override = aro
			anillo.rotation = eje
			piv.add_child(anillo)
		var pomo: MeshInstance3D = MeshInstance3D.new()
		var ps: SphereMesh = SphereMesh.new()
		ps.radius = 0.035
		ps.height = 0.07
		pomo.mesh = ps
		pomo.material_override = oro
		pomo.position = Vector3(0.0, BOMBO_R + 0.02, 0.0)
		piv.add_child(pomo)

		var tr: Array[Transform3D] = []
		for b in 9:
			var dir: Vector3 = Vector3(rng.randf_range(-1, 1), rng.randf_range(-1, 0.25),
				rng.randf_range(-1, 1)).normalized()
			tr.append(Transform3D(Basis(), dir * rng.randf_range(0.05, BOMBO_R - 0.07)))
		var mm: MultiMesh = MultiMesh.new()
		mm.transform_format = MultiMesh.TRANSFORM_3D
		mm.mesh = bola
		mm.instance_count = tr.size()
		for k in tr.size():
			mm.set_instance_transform(k, tr[k])
		var mmi: MultiMeshInstance3D = MultiMeshInstance3D.new()
		mmi.multimesh = mm
		piv.add_child(mmi)
		_bombos.append(piv)




func _build_bolas() -> void:
	var m: StandardMaterial3D = StandardMaterial3D.new()
	m.albedo_color = Color(1.0, 1.0, 1.0)
	m.emission_enabled = true
	m.emission = accent.lightened(0.6)
	m.emission_energy_multiplier = 0.7
	var sm: SphereMesh = SphereMesh.new()
	sm.radius = 0.075
	sm.height = 0.15
	sm.radial_segments = 12
	sm.rings = 6
	sm.material = m
	for i in _orden.size():
		var b: MeshInstance3D = MeshInstance3D.new()
		b.mesh = sm
		b.visible = false
		viewport.add_child(b)
		_bolas.append(b)




func _bombo_de(i: int) -> int:
	var pot: int = int((_orden[i] as Dictionary).get("pot", -1))
	return clampi(pot, 0, BOMBO_X.size() - 1) if pot >= 0 else i % BOMBO_X.size()



func _reveal_t(i: int) -> float:
	return ROW_T0 +(NAT_ROW_GAP if _grupo() else ROW_GAP) * float(i)



func _figura(cfg: Dictionary, x: float) -> AnimatedSprite3D:
	var spr: AnimatedSprite3D = AnimatedSprite3D.new()
	spr.pixel_size = PLAYER_HEIGHT_M / PLAYER_METRICS.x
	spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	spr.sprite_frames = player_frames(cfg, "south", GALA_SHEET, true)
	spr.position = Vector3(x, STAGE_TOP + feet_offset(spr.pixel_size, GALA_SHEET + "00.png"),
		BOARD_Z + YOU_DZ)
	spr.play("idle")
	viewport.add_child(spr)
	CaraViva.pon(spr)
	return spr


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


func _multi(mesh: Mesh, tr: Array[Transform3D]) -> void:
	var mm: MultiMesh = MultiMesh.new()
	mm.transform_format = MultiMesh.TRANSFORM_3D
	mm.mesh = mesh
	mm.instance_count = tr.size()
	for i in tr.size():
		mm.set_instance_transform(i, tr[i])
	var mi: MultiMeshInstance3D = MultiMeshInstance3D.new()
	mi.multimesh = mm
	viewport.add_child(mi)






func _draw_order() -> Array:





	if _grupo():
		return _rows.duplicate()
	var casa: Array = []
	var fuera: Array = []
	for r in _rows:
		if bool((r as Dictionary).get("home", true)):
			casa.append(r)
		else:
			fuera.append(r)
	var por_jornada: Callable = func(a, b): return int(a["round"]) < int(b["round"])
	casa.sort_custom(por_jornada)
	fuera.sort_custom(por_jornada)
	return casa + fuera


func _n_home() -> int:
	var n: int = 0
	for r in _rows:
		if bool((r as Dictionary).get("home", true)):
			n += 1
	return n




func _board_h() -> float:
	return BOARD_W * float(BOARD_PX.y) / float(BOARD_PX.x)


func _build_board() -> void:
	_quad = MeshInstance3D.new()
	var mesh: QuadMesh = QuadMesh.new()
	mesh.size = Vector2(BOARD_W, _board_h())
	_quad.mesh = mesh
	_board_mat = StandardMaterial3D.new()
	_board_mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST

	_board_mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	_quad.material_override = _board_mat
	_quad.position = Vector3(0.0, BOARD_FOOT + _board_h() * 0.5, BOARD_Z)



	_quad.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	viewport.add_child(_quad)

	var frame: MeshInstance3D = MeshInstance3D.new()
	var fmesh: QuadMesh = QuadMesh.new()
	fmesh.size = mesh.size + Vector2(0.2, 0.2)
	frame.mesh = fmesh
	var fmat: StandardMaterial3D = StandardMaterial3D.new()
	fmat.albedo_color = accent
	fmat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	frame.material_override = fmat
	frame.position = _quad.position + Vector3(0.0, 0.0, -0.03)
	frame.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	viewport.add_child(frame)
	_paint_board()





func _paint_board() -> void:
	var img: Image = Image.create(BOARD_PX.x, BOARD_PX.y, false, Image.FORMAT_RGB8)
	img.fill(BG)
	var inner: int = BOARD_PX.x - PAD * 2


	_rect(img, PAD, TITLE_Y, inner, TITLE_H, accent)
	_centrado(img, _title_text(), PAD, TITLE_Y, inner, TITLE_H,
		Competitions.on_accent_of(_fx()), 2)

	if _grupo():
		_paint_nat(img, inner)
		_board_mat.albedo_texture = ImageTexture.create_from_image(img)
		return

	var y: int = TITLE_Y + TITLE_H + 5
	var casa: int = _n_home()
	for i in _orden.size():


		if i == 0:
			y = _head(img, y, I18n.t("EN CASA"))
		elif i == casa:
			y += 3
			y = _head(img, y, I18n.t("FUERA"))
		_row(img, y, _orden[i], i < _shown)
		y += ROW_H
	_board_mat.albedo_texture = ImageTexture.create_from_image(img)






func _paint_nat(img: Image, inner: int) -> void:
	var y: int = TITLE_Y + TITLE_H + 5
	var muerte: bool = bool(data.get("muerte", false))
	var head: String = I18n.t("GRUPO DE LA MUERTE") if muerte \
			else I18n.tf("GRUPO {0}", [String(data.get("group", "A"))])
	_centrado(img, head, PAD, y, inner, NAT_HEAD_H,
		CareerTheme.DANGER if muerte else Color(accent, 0.95), 2)
	y += NAT_HEAD_H
	var px: int = _nat_name_px()
	for i in _orden.size():
		_row_nat(img, y, _orden[i], i < _shown, px)
		y += NAT_ROW_H










func _nat_name_px() -> int:
	var libre: int = BOARD_PX.x - PAD - PixelText.text_width("J1", 2) - 2 \
			- NAT_GAP - _nat_name_x()
	var px: int = 3
	for r in _orden:
		var nom: String = PixelText.normalize(_nat_name_of(r).to_upper())
		while px > 1 and PixelText.text_width(nom, px) > libre:
			px -= 1
	return px






func _nat_name_x() -> int:



	var con_bombo: bool = false
	for r in _orden:
		if int((r as Dictionary).get("pot", -1)) >= 0 and not bool(r.get("you", false)):
			con_bombo = true
	if not con_bombo:
		return PAD + 2 + NAT_CREST_D + 8
	return PAD + 2 + NAT_CREST_D + 5 + PixelText.text_width("B2", 2) + 6 + 5



func _nat_name_of(row: Variant) -> String:
	var r: Dictionary = row
	var id: String = String(r.get("opp", ""))


	return Nations.team_label(_team_by_id(id), id)







func _row_nat(img: Image, y: int, row: Dictionary, shown: bool, px: int) -> void:
	var inner: int = BOARD_PX.x - PAD * 2
	var you: bool = bool(row.get("you", false))
	var alto: int = NAT_ROW_H - 3
	_rect(img, PAD, y, inner, alto, ROW_BG.lerp(_you_col, 0.4) if you else ROW_BG)
	@warning_ignore("integer_division")
	var crest_top: int = y +(alto - NAT_CREST_D) / 2
	if not shown:
		_rect(img, PAD + 2, crest_top, NAT_CREST_D, NAT_CREST_D, Color(0.19, 0.21, 0.27))
	@warning_ignore("integer_division")
	var ty: int = y +(alto - PixelText.GLYPH_H * 2) / 2


	var libre_x: int = BOARD_PX.x - PAD
	if not you:
		var jor: String = "J%d" %(int(row.get("round", 0)) + 1)
		libre_x = BOARD_PX.x - PAD - PixelText.text_width(jor, 2) - 2
		PixelText.draw_text(img, libre_x + 2, ty, jor,
			Color(INK, 0.55 if shown else 0.28), 2)
	if not shown:
		return
	var x: int = _nat_name_x()




	var pot: int = int(row.get("pot", -1))
	var etiqueta: String = ""
	if pot >= 0 and not you:
		etiqueta = "B%d" %(pot + 1)
	if not etiqueta.is_empty():
		var pn: String = PixelText.normalize(etiqueta)
		var pill_w: int = PixelText.text_width(pn, 2) + 6


		var pill_x: int = x - 5 - PixelText.text_width("B2", 2) - 6
		_rect(img, pill_x, y + 4, pill_w, alto - 8, accent)
		PixelText.draw_text(img, pill_x + 3, ty, pn,
			Competitions.on_accent_of(_fx()), 2)
	var nombre: String = _nat_name_of(row).to_upper()


	var libre: int =(libre_x - NAT_GAP) - x
	@warning_ignore("integer_division")
	var ny: int = y +(alto - PixelText.GLYPH_H * px) / 2
	PixelText.draw_text(img, x, ny,
		_recorta(PixelText.normalize(nombre), libre, px), INK, px)



func _head(img: Image, y: int, text: String) -> int:
	PixelText.draw_text(img, PAD + 1, y + 2, PixelText.normalize(text),
		Color(accent, 0.95), 1)
	return y + HEAD_H







func _row(img: Image, y: int, row: Dictionary, shown: bool) -> void:
	var inner: int = BOARD_PX.x - PAD * 2
	_rect(img, PAD, y, inner, ROW_H - 2, ROW_BG)


	@warning_ignore("integer_division")
	var crest_top: int = y +(ROW_H - 2 - CREST_D) / 2
	if not shown:
		_rect(img, PAD, crest_top, CREST_D, CREST_D, Color(0.19, 0.21, 0.27))

	var id: String = String(row.get("opp", ""))
	var club: Dictionary = Teams.by_id(id)


	var jor: String = "J%d" %(int(row.get("round", 0)) + 1)
	var jor_w: int = PixelText.text_width(jor, 1)
	var jor_x: int = BOARD_PX.x - PAD - jor_w
	@warning_ignore("integer_division")
	var jy: int = y +(ROW_H - 2 - PixelText.GLYPH_H) / 2
	PixelText.draw_text(img, jor_x, jy, jor, Color(INK, 0.55 if shown else 0.3), 1)

	if not shown:
		return
	var x: int = PAD + CREST_D + 4


	var pot: int = int(row.get("pot", -1))
	if pot >= 0:
		var pn: String = PixelText.normalize("B%d" %(pot + 1))
		var pnw: int = PixelText.text_width(pn, 1)
		var pill_w: int = pnw + 4
		_rect(img, x, y + 2, pill_w, ROW_H - 6, accent)
		PixelText.draw_text(img, x + 2, jy, pn,
			Competitions.on_accent_of({"comp": _comp()}), 1)
		x += pill_w + 4



	var name: String = Nations.team_label(club, id).to_upper()
	var px: int = 2
	var libre: int =(jor_x - 4) - x


	if PixelText.text_width(PixelText.normalize(name), px) > libre:
		px = 1
	PixelText.draw_text(img, x, y +(ROW_H - 2 - PixelText.GLYPH_H * px) / 2,
		_recorta(PixelText.normalize(name), libre, px), INK, px)






func _build_crests() -> void:
	var d: int = NAT_CREST_D if _grupo() else CREST_D
	var px: int = NAT_CREST_PX if _grupo() else CREST_PX
	var fila: int =(NAT_ROW_H - 3) if _grupo() else (ROW_H - 2)
	var world_w: float = float(d) / float(BOARD_PX.x) * BOARD_W
	for i in _orden.size():
		var id: String = String((_orden[i] as Dictionary).get("opp", ""))
		var spr: Sprite3D = Sprite3D.new()
		spr.texture = crest_texture(_team_by_id(id), px, true)
		spr.pixel_size = world_w / float(px)
		spr.shaded = false
		spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
		var cx: float = float(PAD) +(2.0 if _grupo() else 0.0) + float(d) * 0.5
		var cy: float = float(_row_y(i)) + float(fila) * 0.5
		spr.position = _texel_to_world(cx, cy)
		spr.visible = false
		viewport.add_child(spr)
		_crest_sprites.append(spr)






func _row_y(idx: int) -> int:
	if _grupo():
		return TITLE_Y + TITLE_H + 5 + NAT_HEAD_H + idx * NAT_ROW_H
	var y: int = TITLE_Y + TITLE_H + 5
	var casa: int = _n_home()
	for i in _orden.size():
		if i == 0:
			y += HEAD_H
		elif i == casa:
			y += 3 + HEAD_H
		if i == idx:
			return y
		y += ROW_H
	return y






func _texel_to_world(tx: float, ty: float) -> Vector3:
	var center_y: float = BOARD_FOOT + _board_h() * 0.5
	return Vector3(
		(tx / float(BOARD_PX.x) - 0.5) * BOARD_W,
		center_y +(0.5 - ty / float(BOARD_PX.y)) * _board_h(),
		BOARD_Z + 0.03)




func _recorta(text: String, ancho: int, px: int) -> String:
	var cut: String = text
	while cut.length() > 1 and PixelText.text_width(cut, px) > ancho:
		cut = cut.substr(0, cut.length() - 1)
	return cut


func _rect(img: Image, x0: int, y0: int, w: int, h: int, col: Color) -> void:
	for y in range(maxi(y0, 0), mini(y0 + h, BOARD_PX.y)):
		for x in range(maxi(x0, 0), mini(x0 + w, BOARD_PX.x)):
			img.set_pixel(x, y, col)


func _centrado(img: Image, text: String, x0: int, y0: int, w: int, h: int,
		col: Color, px: int) -> void:
	var t2: String = PixelText.normalize(text)
	var tw: int = PixelText.text_width(t2, px)
	if tw > w - 4:
		px = 1
		t2 = _recorta(t2, w - 4, px)
		tw = PixelText.text_width(t2, px)
	PixelText.draw_text(img, x0 +(w - tw) / 2,
		y0 +(h - PixelText.GLYPH_H * px) / 2, t2, col, px)




func _tick(delta: float) -> void:
	_tick_bolas(delta)
	if _shown >= _orden.size():
		return
	if t < _reveal_t(_shown):
		return
	_shown += 1
	_paint_board()

	if _shown - 1 < _crest_sprites.size():
		(_crest_sprites[_shown - 1] as Sprite3D).visible = true


	sting("ui_pop", -13.0)


	punch_fov(0.9, 0.22)
	if _shown == _orden.size():
		ovation(-6.0)






func _tick_bolas(delta: float) -> void:
	var prisa: Array = [0.0, 0.0, 0.0, 0.0]
	for i in _bolas.size():
		var b: MeshInstance3D = _bolas[i]
		var t1: float = _reveal_t(i)
		var p: float =(t -(t1 - BOLA_VUELO)) / BOLA_VUELO
		if p < 0.0 or p >= 1.0 or i < _shown:
			b.visible = false
			continue
		var k: int = _bombo_de(i)
		prisa[k] = 1.0
		var base: Vector3 = Vector3(float(BOMBO_X[k]), BOMBO_Y, BOMBO_Z)
		var alto: Vector3 = base + Vector3(0.0, BOMBO_R + 0.38, 0.12)
		var destino: Vector3 =(_crest_sprites[i] as Sprite3D).position \
				if i < _crest_sprites.size() else Vector3(0.0, BOARD_FOOT + 1.0, BOARD_Z)
		destino.z += 0.05
		b.visible = true
		if p < BOLA_SUBE:
			b.position = base.lerp(alto, ease(p / BOLA_SUBE, 0.4))
			b.scale = Vector3.ONE
		else:
			var q: float =(p - BOLA_SUBE) /(1.0 - BOLA_SUBE)
			var cima: Vector3 = alto.lerp(destino, 0.5) + Vector3(0.0, 0.55, 0.25)

			b.position = alto.lerp(cima, q).lerp(cima.lerp(destino, q), q)
			b.scale = Vector3.ONE * lerpf(1.0, 0.55, q)
	for k in _bombos.size():
		(_bombos[k] as Node3D).rotate_x(delta *(0.7 + 5.5 * float(prisa[k])))
		(_bombos[k] as Node3D).rotate_y(delta * 0.25)





func _skipped() -> void:
	_shown = _orden.size()
	_paint_board()
	for b in _bolas:
		(b as MeshInstance3D).visible = false
	for spr in _crest_sprites:
		(spr as Sprite3D).visible = true
